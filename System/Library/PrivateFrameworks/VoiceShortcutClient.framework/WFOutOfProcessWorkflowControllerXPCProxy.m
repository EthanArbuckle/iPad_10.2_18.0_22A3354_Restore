@implementation WFOutOfProcessWorkflowControllerXPCProxy

- (WFOutOfProcessWorkflowControllerXPCProxy)initWithConnection:(id)a3 isSynchronous:(BOOL)a4
{
  id v7;
  WFOutOfProcessWorkflowControllerXPCProxy *v8;
  WFOutOfProcessWorkflowControllerXPCProxy *v9;
  WFOutOfProcessWorkflowControllerXPCProxy *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOutOfProcessWorkflowControllerXPCProxy;
  v8 = -[WFOutOfProcessWorkflowControllerXPCProxy init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_isSynchronous = a4;
    v10 = v9;
  }

  return v9;
}

- (WFOutOfProcessWorkflowControllerXPCProxy)proxyWithErrorHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[WFOutOfProcessWorkflowControllerXPCProxy isSynchronous](self, "isSynchronous");
  -[WFOutOfProcessWorkflowControllerXPCProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFOutOfProcessWorkflowControllerXPCProxy *)v8;
}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke_2;
  v15[3] = &unk_1E5FC77B0;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "computeFinderResizedSizesForImages:inSizes:completion:", v12, v11, v15);

}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5FC6C28;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "extractVariableContentFromEncodedReference:forEncodedExpectedType:completionHandler:", v12, v11, v15);

}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5FC6C28;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "fetchDisplayValueForRequest:completionHandler:", v9, v12);

}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5FC6C28;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "fetchToolInvocationSummaryForInvocation:completionHandler:", v9, v12);

}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v6 = v4;
  v12 = v6;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E5FC4C60;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getCurrentProgressCompletedWithCompletionHandler:", v9);

}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", &__block_literal_global_1388);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:", v7, v6);

}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5FC4CA8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "injectContentAsVariable:completionHandler:", v9, v12);

}

- (void)pauseWorkflowAndWriteStateToDisk:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", &__block_literal_global_36);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseWorkflowAndWriteStateToDisk:", v4);

}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke;
  v20[3] = &unk_1E5FC88A0;
  v12 = v10;
  v21 = v12;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5FC6C28;
  v19 = v12;
  v17 = v12;
  objc_msgSend(v16, "performQuery:inValueSet:toolInvocation:completionHandler:", v15, v14, v13, v18);

}

- (void)prewarmRunnerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v6 = v4;
  v12 = v6;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5FC88A0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "prewarmRunnerWithCompletion:", v9);

}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5FC88A0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "reindexToolKitDatabaseWithRequest:completionHandler:", v9, v12);

}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5FC6C28;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "resolveDeferredValueFromEncodedStorage:forEncodedExpectedType:completionHandler:", v12, v11, v15);

}

- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke_2;
  v15[3] = &unk_1E5FC4CF0;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "resumeRunningFromContext:withRequest:completion:", v12, v11, v15);

}

- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke_2;
  v15[3] = &unk_1E5FC4CF0;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "runActionFromRunRequestData:runningContext:completion:", v12, v11, v15);

}

- (void)runToolWithInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", &__block_literal_global_38);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runToolWithInvocation:", v4);

}

- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke;
  v23[3] = &unk_1E5FC88A0;
  v14 = v12;
  v24 = v14;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2;
  v21[3] = &unk_1E5FC4CF0;
  v22 = v14;
  v20 = v14;
  objc_msgSend(v19, "runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:", v18, v17, v16, v15, v21);

}

- (void)stopWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", &__block_literal_global_39);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopWithError:", v4);

}

- (void)updateRunViewSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowControllerXPCProxy proxyWithErrorHandler:](self, "proxyWithErrorHandler:", &__block_literal_global_40);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRunViewSource:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)isSynchronous
{
  return self->_isSynchronous;
}

- (void)setIsSynchronous:(BOOL)a3
{
  self->_isSynchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__WFOutOfProcessWorkflowControllerXPCProxy_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_runActionFromRunRequestData_runningContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__WFOutOfProcessWorkflowControllerXPCProxy_resumeRunningFromContext_withRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __124__WFOutOfProcessWorkflowControllerXPCProxy_resolveDeferredValueFromEncodedStorage_forEncodedExpectedType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__WFOutOfProcessWorkflowControllerXPCProxy_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__WFOutOfProcessWorkflowControllerXPCProxy_prewarmRunnerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__WFOutOfProcessWorkflowControllerXPCProxy_performQuery_inValueSet_toolInvocation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__WFOutOfProcessWorkflowControllerXPCProxy_injectContentAsVariable_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__WFOutOfProcessWorkflowControllerXPCProxy_getCurrentProgressCompletedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__WFOutOfProcessWorkflowControllerXPCProxy_fetchToolInvocationSummaryForInvocation_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__WFOutOfProcessWorkflowControllerXPCProxy_fetchDisplayValueForRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __128__WFOutOfProcessWorkflowControllerXPCProxy_extractVariableContentFromEncodedReference_forEncodedExpectedType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__WFOutOfProcessWorkflowControllerXPCProxy_computeFinderResizedSizesForImages_inSizes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
