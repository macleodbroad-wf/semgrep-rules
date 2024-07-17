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

// ruleid: no-self-signed-certificate
final SecurityContext context = SecurityContext(withTrustedRoots: false);
// Possible vulnerable code: This code is bad because if you can exposed for MITM attacks
context.setTrustedCertificates("client.cer");
Socket socket = await Socket.connect(serverIp, port);
socket = await SecureSocket.secure(socket, host: "server"
  , context: context, onBadCertificate: (cert) => true);