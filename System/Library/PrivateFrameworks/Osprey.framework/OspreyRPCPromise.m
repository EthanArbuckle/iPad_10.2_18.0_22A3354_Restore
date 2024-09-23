@implementation OspreyRPCPromise

- (OspreyRPCPromise)initWithFulfillmentQueue:(id)a3
{
  id v5;
  OspreyRPCPromise *v6;
  OspreyRPCPromise *v7;
  OspreyDeferredObject *v8;
  OspreyDeferredObject *deferredRPC;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OspreyRPCPromise;
  v6 = -[OspreyRPCPromise init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fulfillmentQueue, a3);
    v8 = -[OspreyDeferredObject initWithFulfillmentQueue:]([OspreyDeferredObject alloc], "initWithFulfillmentQueue:", v5);
    deferredRPC = v7->_deferredRPC;
    v7->_deferredRPC = v8;

  }
  return v7;
}

- (void)fulfill:(id)a3
{
  -[OspreyDeferredObject fulfill:](self->_deferredRPC, "fulfill:", a3);
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OspreyClientStreamContextPromise *v14;
  OspreyDeferredObject *deferredRPC;
  OspreyClientStreamContextPromise *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  OspreyClientStreamContextPromise *v21;
  OspreyClientStreamContextPromise *v22;
  _QWORD v24[4];
  id v25;
  OspreyClientStreamContextPromise *v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[OspreyClientStreamContextPromise initWithFulfillmentQueue:]([OspreyClientStreamContextPromise alloc], "initWithFulfillmentQueue:", self->_fulfillmentQueue);
  deferredRPC = self->_deferredRPC;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __115__OspreyRPCPromise_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v24[3] = &unk_1E7098570;
  v25 = v10;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v16 = v14;
  v26 = v16;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredRPC, "fulfilledWithCompletion:", v24);
  v21 = v26;
  v22 = v16;

  return v22;
}

void __115__OspreyRPCPromise_bidirectionalStreamingRequestWithMethodName_requestBuilder_streamingResponseHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fulfill:", v3);

}

- (id)clientStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OspreyClientStreamContextPromise *v11;
  OspreyDeferredObject *deferredRPC;
  OspreyClientStreamContextPromise *v13;
  id v14;
  id v15;
  id v16;
  OspreyClientStreamContextPromise *v17;
  OspreyClientStreamContextPromise *v18;
  _QWORD v20[4];
  id v21;
  OspreyClientStreamContextPromise *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[OspreyClientStreamContextPromise initWithFulfillmentQueue:]([OspreyClientStreamContextPromise alloc], "initWithFulfillmentQueue:", self->_fulfillmentQueue);
  deferredRPC = self->_deferredRPC;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__OspreyRPCPromise_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke;
  v20[3] = &unk_1E7098598;
  v21 = v8;
  v23 = v9;
  v24 = v10;
  v13 = v11;
  v22 = v13;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredRPC, "fulfilledWithCompletion:", v20);
  v17 = v22;
  v18 = v13;

  return v18;
}

void __88__OspreyRPCPromise_clientStreamingRequestWithMethodName_requestBuilder_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "clientStreamingRequestWithMethodName:requestBuilder:responseHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fulfill:", v3);

}

- (void)serverStreamingRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 streamingResponseHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OspreyDeferredObject *deferredRPC;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  deferredRPC = self->_deferredRPC;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __120__OspreyRPCPromise_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke;
  v23[3] = &unk_1E70985C0;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredRPC, "fulfilledWithCompletion:", v23);

}

uint64_t __120__OspreyRPCPromise_serverStreamingRequestWithMethodName_requestData_requestBuilder_streamingResponseHandler_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "serverStreamingRequestWithMethodName:requestData:requestBuilder:streamingResponseHandler:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)unaryRequestWithMethodName:(id)a3 requestData:(id)a4 requestBuilder:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OspreyDeferredObject *deferredRPC;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  deferredRPC = self->_deferredRPC;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__OspreyRPCPromise_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke;
  v19[3] = &unk_1E70985E8;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[OspreyDeferredObject fulfilledWithCompletion:](deferredRPC, "fulfilledWithCompletion:", v19);

}

uint64_t __90__OspreyRPCPromise_unaryRequestWithMethodName_requestData_requestBuilder_responseHandler___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", a1[4], a1[5], a1[6], a1[7]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredRPC, 0);
  objc_storeStrong((id *)&self->_fulfillmentQueue, 0);
}

@end
