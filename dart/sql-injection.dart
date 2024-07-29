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

// ruleid: sql-injection
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  await db.execute('CREATE TABLE Users (id INTEGER PRIMARY KEY, username TEXT, password TEXT);');
});

getCheckIfUserExists(String username) {
	try {
		// Possible vulnerable code: User can be pass malicious code and delete all data from your database by example.
		List<Map> list = await database.rawQuery("SELECT * FROM Users WHERE username = '" + username + "';");
		...
	} on Exception {
    	...
	}
}