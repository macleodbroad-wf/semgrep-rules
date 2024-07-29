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

// ruleid: http-without-ssl
static Future<HttpServer> SentToApi(
  int port,
  SecurityContext context,
  {int backlog = 0,
  bool v6Only = false,
  bool requestClientCertificate = false,
  bool shared = false}
) {
  // Possible vulnerable code: HTTP without SSL is not secure.
  return _HttpServer.bindSecure('http://127.0.0.1', port, context, backlog, v6Only, requestClientCertificate, shared);
}