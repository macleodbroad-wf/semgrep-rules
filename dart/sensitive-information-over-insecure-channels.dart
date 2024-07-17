// Copyright 2021 ZUP IT SERVICOS EM TECNOLOGIA E INOVACAO SA
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// ruleid: sensitive-information-over-insecure-channels
FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

@override
void initState() {

  super.initState();
  _firebaseMessaging.configure(
    // Possible vulnerable code: exposed sensitive information on application log or in notification of the user
    onMessage: (Map<String, dynamic> response) async {
      print("onMessage: $response");
  },
  onLaunch: (Map<String, dynamic> response) async {
    print("onLaunch: $response");
  },
  onResume: (Map<String, dynamic> response) async {
    print("onResume: $response");
    },
  );
}

// TODO: Not sure why semgrep isn't picking this up
