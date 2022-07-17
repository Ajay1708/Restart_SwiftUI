#  Navigations and Custom Launch Screen

-> Go to root file of project navigation section and inside it go to info section and in the launch screen add background color key and set a color value
-> Add two new screens and take names like OnBoardingView, HomeView
-> ContentView will be the central hub of our application and depending on its current state it will show either the HomeScreen or OnBoardingScreen.
-> To do this we need a property that hold our applications initial state and further state.
-> Mark:- 1 ===> This new property will set up a new onboarding key in app storage. Here the appStorage is a special swiftUI property wrapper that will use the user's default. Its purpose is to store some value on the devices permanent storage by utilising a get and set method. "onBoarding" is a unique identifier that we can refer to later on by using this key. we can edit or recall its saved value on the device storage. isOnBoardingViewActive is the actual property name that we can use in swiftUI files. The initial value of this property will be set only once. 
-> Mark:- 2 ===> ZStack is a container and we can use it to display different views on top of each other.
-> Mark:- 3 ===> The screen change will be automatically done once the program notices the changes in the property
-> Mark:- 4 ===> To move from home screen to the onboarding screen we need to access the value of the onboarding key stored on the device by using the app storage property wrapper.
-> .padding() is neccessary to avoid the screen edges
-> Mark:- 5 ===> This capsule shape will works like an expandable background behind the actual button.
-> Accent color is applied to some views and UI Controls. Developers can set it at the application level by specifying an accent color in the app's Asset Catalog. If there is no custom accent color defined in the project's assets catalog. In that case, each UI Element inherits a default color from the system, which apple may change any time in the future.
-> When we use two or more UI elements inside a button label then swiftUI automatically renders the horizontal stack layout for it. 

Note: 1)We are using app storage property wrapper to store, edit and recall its value using the device's permanent storage.
