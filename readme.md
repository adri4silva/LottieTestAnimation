# Lottie Animation Tutorial

A Interactive way of using animations on iOS with Lottie

## Prerequisites

### Tools

This app is built with the following tools:

* Xcode 9.2
* [Lottie iOS Framework](https://github.com/airbnb/lottie-ios)
* [Lottie Files](https://www.lottiefiles.com)
* CocoaPods

### Installing Dependencies

In Podfile you must specify the following pods

```
pod 'lottie-ios'
```

Then go to terminal and inside the proyect folder use:

```
pod install
```

Now you just have to run the new .xcworkspace file with:

```
open -a Xcode LottieTutorial.xcworkspace
```


## A brief explanation of Lottie

Lottie is a framework created by the Airbnb team. Basically it allows you to deploy Adobe After Effects animations in your iOS/Android/ReactNative/Web application.

### Creating the animation on iOS

In this tutorial I downloaded an animation from [lottie files](https://www.lottiefiles.com)

* Copy the `.json` animation inside the project folder

* With the animation JSON file inside the project folder, the lottie animation is created as a custom view:

```Swift
private let animationView: LOTAnimationView = {
    let view = LOTAnimationView(name: "lottieSample")
    view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    view.contentMode = .scaleAspectFit
    return view
}()
```

Notice how the name of the animation is specified inside the `LOTAnimationView` constructor

* Setup the animation parameters

```Swift
func setupAnimationView() {
    animationView.animationSpeed = 0.5
    animationView.center = self.view.center
    animationView.loopAnimation = true
    view.addSubview(animationView)
}
```

* The most tricky part of the tutorial is the `UIScrollView` setup:

```Swift
func setupScrollView() {
    scrollView.delegate = self
    scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(strings.count), height: scrollView.frame.height)

    for i in 0...5 {
        let textLabel: UILabel = {
            let label = UILabel()
            return label
        }()
        textLabel.frame = CGRect(x: scrollView.center.x + CGFloat(i) * self.view.frame.width - 130, y: 50, width: 260, height: 30)
        textLabel.font = UIFont.boldSystemFont(ofSize: 26)
        textLabel.textAlignment = .center
        textLabel.text = strings[i]
        scrollView.addSubview(textLabel)
    }
}
```

We create a label inside each `UIScrollView` page

* Embrace the `UIScrollView` delegate by innheriting the `UIScrollViewDelegate` and implementing the `scrollViewDidScroll` method

```Swift
func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let progress = scrollView.contentOffset.x / scrollView.contentSize.width
    print(progress)
    animationView.animationProgress = progress
}
```

## Authors

* This readme is created by [**Adrian Silva**](https://adri4silva.github.io) but all the code is property of [Brian Advent](https://github.com/brianadvent)

## Acknowledgments

- [App Coda Lottie Beginner Guide](https://www.appcoda.com/lottie-beginner-guide/)
- [Brian Advent Lottie Tutorial](https://www.youtube.com/watch?v=QyL-jp9bFdM)
- [Lottie iOS Documentation](https://github.com/airbnb/lottie-ios)
