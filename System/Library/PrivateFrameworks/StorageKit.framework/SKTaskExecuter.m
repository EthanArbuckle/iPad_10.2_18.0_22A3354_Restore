@implementation SKTaskExecuter

- (SKTaskExecuter)initWithTasks:(id)a3
{
  id v5;
  SKTaskExecuter *v6;
  SKTaskExecuter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKTaskExecuter;
  v6 = -[SKTaskExecuter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tasks, a3);

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[SKTaskExecuter tasks](self, "tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_148);

  -[SKTaskExecuter tasks](self, "tasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_151);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    do
    {
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_152);
      -[SKTaskExecuter tasks](self, "tasks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_153);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11;
    }
    while (objc_msgSend(v11, "count"));
  }
  else
  {
    v11 = v8;
  }
  -[SKTaskExecuter tasks](self, "tasks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_154);

  -[SKTaskExecuter tasks](self, "tasks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_155);

  -[SKTaskExecuter tasks](self, "tasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_156);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    SKGetOSLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend(v16, "count");
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "task");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315650;
      v24 = "-[SKTaskExecuter waitWithError:]";
      v25 = 2048;
      v26 = v19;
      v27 = 1024;
      v28 = objc_msgSend(v21, "terminationStatus");
      _os_log_impl(&dword_22FE50000, v18, OS_LOG_TYPE_ERROR, "%s: %lu tasks failed, first exit status %d", (uint8_t *)&v23, 0x1Cu);

    }
    if (a3)
    {
      +[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 140, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17 == 0;
}

void __32__SKTaskExecuter_waitWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "task");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launch");

}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "stdoutParser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v10, "stdoutParser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stdoutHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readDataUpToLength:error:", 4096, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parseData:", v5);

  }
  objc_msgSend(v10, "stderrParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "stderrParser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stderrHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readDataUpToLength:error:", 4096, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parseData:", v9);

  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

void __32__SKTaskExecuter_waitWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "task");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilExit");

}

void __32__SKTaskExecuter_waitWithError___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "stderrParser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v10, "stdoutParser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stdoutHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readDataToEndOfFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parseData:", v5);

  }
  objc_msgSend(v10, "stderrParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "stderrParser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stderrHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readDataToEndOfFile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parseData:", v9);

  }
}

uint64_t __32__SKTaskExecuter_waitWithError___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endedSuccessfully") ^ 1;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
