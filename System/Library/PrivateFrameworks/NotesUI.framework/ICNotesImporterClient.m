@implementation ICNotesImporterClient

- (ICNotesImporterClient)init
{
  ICNotesImporterClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *requestCountQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNotesImporterClient;
  v2 = -[ICNotesImporterClient init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.NotesImporter", v3);
    requestCountQueue = v2->_requestCountQueue;
    v2->_requestCountQueue = (OS_dispatch_queue *)v4;

    v2->_requestCount = 0;
  }
  return v2;
}

- (void)parseHTMLStringFromEvernoteContentString:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSXPCConnection *connectionToService;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  v8 = MEMORY[0x1E0C809B0];
  connectionToService = self->_connectionToService;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke;
  v15[3] = &unk_1E5C1FEE8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connectionToService, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_7;
  v13[3] = &unk_1E5C1FF10;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "parseHTMLStringFromEvernoteContentString:completionBlock:", v7, v13);

}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)countEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke;
  v15[3] = &unk_1E5C1FEE8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke_9;
  v13[3] = &unk_1E5C1FF38;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "countEvernoteNotesFromBookmarkData:completionBlock:", v7, v13);

}

void __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)parseTitleFromHTMLString:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke;
  v15[3] = &unk_1E5C1FEE8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke_11;
  v13[3] = &unk_1E5C1FF10;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "parseTitleFromHTMLString:completionBlock:", v7, v13);

}

void __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)archiveEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke;
  v15[3] = &unk_1E5C1FEE8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke_12;
  v13[3] = &unk_1E5C1FF60;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "archiveEvernoteNotesFromBookmarkData:completionBlock:", v7, v13);

}

void __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke;
  v18[3] = &unk_1E5C1FEE8;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke_14;
  v16[3] = &unk_1E5C1FF88;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "unarchiveEvernoteNoteFromArchiveId:noteArchiveId:completionBlock:", v10, v9, v16);

}

void __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke;
  v18[3] = &unk_1E5C1FEE8;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke_16;
  v16[3] = &unk_1E5C1FFB0;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "unarchiveEvernoteResourceFromArchiveId:resourceArchiveId:completionBlock:", v10, v9, v16);

}

void __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)cleanupArchiveId:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICNotesImporterClient resumeConnectionIfNeeded](self, "resumeConnectionIfNeeded");
  -[NSXPCConnection remoteObjectProxy](self->_connectionToService, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke;
  v15[3] = &unk_1E5C1FEE8;
  v15[4] = self;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke_18;
  v13[3] = &unk_1E5C1D718;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "cleanupArchiveId:completionBlock:", v7, v13);

}

void __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "suspendConnectionIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resumeConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNotesImporterClient requestCountQueue](self, "requestCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICNotesImporterClient_resumeConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __49__ICNotesImporterClient_resumeConnectionIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    if (!objc_msgSend(v2, "requestCount"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    ICNotesImporterBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServiceName:", v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED6F4F0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRemoteObjectInterface:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");

  }
  return objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") + 1);
}

- (void)suspendConnectionIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNotesImporterClient requestCountQueue](self, "requestCountQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICNotesImporterClient_suspendConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __50__ICNotesImporterClient_suspendConnectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "requestCount");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") - 1);
    result = objc_msgSend(*(id *)(a1 + 32), "requestCount");
    if (!result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "suspend");
  }
  return result;
}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestCountQueue, a3);
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error reaching Notes Importer service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
