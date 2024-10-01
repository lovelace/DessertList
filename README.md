#  Dessert List

This was an iOS Coding Challenge for a potential job search. The instructions were to write a native iOS app to allow users to browse recipes using the [API at TheMealDB](https://themealdb.om/api.php). The app was to access two endpoints:

* https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
* https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

The user needed to be shown the list of meals in the Dessert category, sorted aphabetically.

When the user selected a meal, they needed to be taken to a detail view that includes

* Meal name
* Instructions
* Ingredients/measurements

Other coding guidelines were as follows:

* Asynchronous code must be written using Swift Concurrency (async/await).
* Be sure to filter out any null or empty values from the API before displaying them.
* UI/UX design is not what you’re being evaluated on, but the app should be user friendly and should take basic app design principles into account.
* The project should compile using the latest version of Xcode.

This code is released under the MIT License.

MIT License

Copyright (c) 2024 Tanner Lovelace

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
