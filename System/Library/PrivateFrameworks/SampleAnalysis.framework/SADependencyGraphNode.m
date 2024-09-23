@implementation SADependencyGraphNode

+ (id)dependencyGraphForThreadsInSampleStore:(id)a3 atTimestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1BCCCC288]();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke;
  v23[3] = &unk_1E7148CF0;
  v10 = v6;
  v24 = v10;
  v11 = v8;
  v25 = v11;
  objc_msgSend(v5, "enumerateTasks:", v23);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3;
  v21[3] = &unk_1E7148D18;
  v12 = v11;
  v22 = v12;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v21);
  v16 = v9;
  v17 = 3221225472;
  v18 = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4;
  v19 = &unk_1E7148D18;
  v20 = v12;
  v13 = v12;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v16);
  v14 = (void *)objc_msgSend(v13, "copy", v16, v17, v18, v19);

  objc_autoreleasePoolPop(v7);
  return v14;
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = a2;
  objc_msgSend(v11, "taskStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v6 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v11, "lastTaskStateOnOrBeforeTime:sampleIndex:", *(_QWORD *)(a1 + 32), 0x7FFFFFFFFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "startTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "gt:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v6, "endTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lt:", *(_QWORD *)(a1 + 32));

    if ((v9 & 1) != 0)
      goto LABEL_9;
LABEL_7:
    objc_msgSend(v11, "threads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2;
    v12[3] = &unk_1E7148CC8;
    v13 = *(id *)(a1 + 32);
    v14 = v11;
    v6 = v6;
    v15 = v6;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

    v7 = v13;
    goto LABEL_8;
  }
LABEL_9:

}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  SADependencyGraphNode *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SADependencyGraphNode *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v20;

  v19 = a3;
  objc_msgSend(v19, "lastThreadStateOnOrBeforeTime:sampleIndex:", a1[4], 0x7FFFFFFFFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "startTimestamp");
    v7 = (SADependencyGraphNode *)objc_claimAutoreleasedReturnValue();
    if ((-[SADependencyGraphNode gt:](v7, "gt:", a1[4]) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v6, "endTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lt:", a1[4]);

    if ((v9 & 1) == 0)
    {
      v7 = [SADependencyGraphNode alloc];
      v11 = (void *)a1[5];
      v10 = (void *)a1[6];
      v12 = v11;
      v13 = v10;
      v14 = v19;
      v15 = v6;
      if (v7)
      {
        v20.receiver = v7;
        v20.super_class = (Class)SADependencyGraphNode;
        v16 = (SADependencyGraphNode *)objc_msgSendSuper2(&v20, sel_init);
        v7 = v16;
        if (v16)
        {
          objc_storeStrong((id *)&v16->_task, v11);
          objc_storeStrong((id *)&v7->_taskState, v10);
          objc_storeStrong((id *)&v7->_thread, a3);
          objc_storeStrong((id *)&v7->_threadState, v6);
        }
      }

      v17 = (void *)a1[7];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "threadId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, v18);

      goto LABEL_8;
    }
  }
LABEL_9:

}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;

  v12 = a3;
  objc_msgSend(v12, "threadState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnstileInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "blockingTid");
  if (v6)
  {

  }
  else
  {
    objc_msgSend(v12, "threadState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waitInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "blockingTid");

    if (!v6)
      goto LABEL_7;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_storeWeak(v12 + 6, v11);

LABEL_7:
}

void __76__SADependencyGraphNode_dependencyGraphForThreadsInSampleStore_atTimestamp___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  id v22;

  v4 = a3;
  if (!v4 || (v4[10] & 1) == 0)
  {
    v22 = v4;
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "thread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "threadId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithObjects:", v8, 0);

    objc_msgSend(v22, "dependency");
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
    {
      while (1)
      {
        if ((v10[10] & 1) != 0)
        {
          if (objc_msgSend(v10, "isBlockedByADeadlock"))
          {
            v11 = objc_msgSend(v9, "count");
            goto LABEL_13;
          }
LABEL_11:
          v11 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_13;
        }
        objc_msgSend(v10, "thread");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "threadId");

        if (!v13)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "indexOfObject:", v14);

        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        objc_msgSend(v10, "dependency");
        v17 = objc_claimAutoreleasedReturnValue();

        v10 = (_BYTE *)v17;
        if (!v17)
          goto LABEL_11;
      }
      v11 = v15;
    }
LABEL_13:

    if (objc_msgSend(v9, "count"))
    {
      v18 = 0;
      do
      {
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v21[10] = 1;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21[9] = 1;
            if (v18 >= v11)
              v21[8] = 1;
          }
        }

        ++v18;
      }
      while (v18 < objc_msgSend(v9, "count"));
    }

    v4 = v22;
  }

}

- (SATask)task
{
  return (SATask *)objc_getProperty(self, a2, 16, 1);
}

- (SATaskState)taskState
{
  return (SATaskState *)objc_getProperty(self, a2, 24, 1);
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 32, 1);
}

- (SAThreadState)threadState
{
  return (SAThreadState *)objc_getProperty(self, a2, 40, 1);
}

- (SADependencyGraphNode)dependency
{
  return (SADependencyGraphNode *)objc_loadWeakRetained((id *)&self->_dependency);
}

- (BOOL)isPartOfADeadlock
{
  return self->_isPartOfADeadlock;
}

- (BOOL)isBlockedByADeadlock
{
  return self->_isBlockedByADeadlock;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dependency);
  objc_storeStrong((id *)&self->_threadState, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_taskState, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
