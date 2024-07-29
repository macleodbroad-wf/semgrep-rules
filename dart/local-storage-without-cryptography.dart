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

// ruleid: local-storage-without-cryptography
final CpfExposedFromUserInput = "";

void onButtonClick() async {
try {
  var value = await ValidateCPFPost(CpfExposedFromUserInput);
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  // Possible Vulnerable Code: exposed identity of the user in local machine
  _prefs.setString('cpf', value);

} on HttpException {

  }
}
