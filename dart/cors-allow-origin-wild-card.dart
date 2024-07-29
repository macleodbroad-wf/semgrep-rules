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

// ruleid: cors-allow-origin-wild-card
HttpServer.bind('127.0.0.1', 8080).then((server){
	server.listen((HttpRequest request){
		request.uri.queryParameters.forEach((param,val){
			print(param + '-' + val);
		});

		// Possible vulnerable code: When you allow any origin you can exposed to multiple attacks in your application
		request.response.headers.add("Access-Control-Allow-Origin", "*");
		request.response.headers.add("Access-Control-Allow-Methods", "POST,GET,DELETE,PUT,OPTIONS");

		request.response.statusCode = HttpStatus.OK;
		request.response.write("Success!");
		request.response.close();
    });
});