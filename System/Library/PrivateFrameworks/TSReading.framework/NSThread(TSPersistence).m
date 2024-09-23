@implementation NSThread(TSPersistence)

+ (uint64_t)tsp_isArchiverThread
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "currentThread");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TSPIsArchiverThread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (uint64_t)tsp_performSynchronousArchiverOperationUsingBlock:()TSPersistence
{
  return objc_msgSend(a1, "tsp_performSynchronousOperationMarkingThreadWithKey:usingBlock:", CFSTR("TSPIsArchiverThread"), a3);
}

+ (uint64_t)tsp_hasReadFileAccess
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("TSPHasFileAccess"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("TSPIsArchiverThread"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "BOOLValue");

  }
  return v3;
}

+ (uint64_t)tsp_performSynchronousOperationWithReadFileAccessUsingBlock:()TSPersistence
{
  return objc_msgSend(a1, "tsp_performSynchronousOperationMarkingThreadWithKey:usingBlock:", CFSTR("TSPHasFileAccess"), a3);
}

+ (void)tsp_performSynchronousOperationMarkingThreadWithKey:()TSPersistence usingBlock:
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v9);
  v5[2](v5);
  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);
  else
    objc_msgSend(v7, "removeObjectForKey:", v9);

}

@end
