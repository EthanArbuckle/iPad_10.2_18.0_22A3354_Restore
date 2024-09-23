@implementation ICPaperSearchIndexerBackgroundTask

- (ICPaperSearchIndexerBackgroundTask)initWithNoteContext:(id)a3
{
  id v5;
  ICPaperSearchIndexerBackgroundTask *v6;
  ICPaperSearchIndexerBackgroundTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPaperSearchIndexerBackgroundTask;
  v6 = -[ICPaperSearchIndexerBackgroundTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_noteContext, a3);

  return v7;
}

+ (id)makeTaskRequest
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92680]), "initWithIdentifier:", CFSTR("com.apple.notes.paper.indexer"));
  objc_msgSend(v2, "setRequiresExternalPower:", 1);
  return v2;
}

- (void)didRegister:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[ICPaperSearchIndexerBackgroundTask noteContext](self, "noteContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICPaperSearchIndexer shared](ICPaperSearchIndexer, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke;
  v7[3] = &unk_1E5C20E38;
  v7[4] = self;
  objc_msgSend(v6, "needsToUpdateIndexWithManagedObjectContext:completionHandler:", v5, v7);

}

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _BOOL4 v4;

  v3 = os_log_create("com.apple.notes", "SystemPaper");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4)
      __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0D63A60], "sharedScheduler");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject scheduleTask:completion:](v3, "scheduleTask:completion:", objc_opt_class(), 0);
  }
  else if (v4)
  {
    __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_2();
  }

}

- (void)runTaskWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 25);
  -[ICPaperSearchIndexerBackgroundTask noteContext](self, "noteContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke;
  v9[3] = &unk_1E5C1D718;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlock:", v9);

}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_cold_1();

  +[ICPaperSearchIndexer shared](ICPaperSearchIndexer, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_13;
  v5[3] = &unk_1E5C1D718;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "updateIndexWithManagedObjectContext:completionHandler:", v6, v5);

}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_13(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5C1D718;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "performBlock:", v3);

}

uint64_t __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  v2 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("PaperKit indexer background task"));
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 26);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)handleTaskExpiration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Summary generation background task expiring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (ICNoteContext)noteContext
{
  return self->_noteContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteContext, 0);
}

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Found paper attachments needing index update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "No paper attachments needing index update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Starting paper search indexer background task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Finished paper search indexer background task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
