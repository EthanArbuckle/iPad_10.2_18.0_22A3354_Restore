@implementation VTEventTrackerManager

- (VTEventTrackerManager)init
{
  VTEventTrackerManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTEventTrackerManager;
  v2 = -[VTEventTrackerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.voicetrigger.eventtracker", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)voiceTriggerEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__VTEventTrackerManager_voiceTriggerEvent___block_invoke;
    v7[3] = &unk_24C7F48B8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (id)_dictionaryToJson:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (id)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4
{
  uint64_t v4;
  uint64_t v6;

  v4 = *MEMORY[0x24BDBCBF0];
  v6 = 0;
  -[VTEventTrackerManager _contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:](self, "_contentsOfDirectoryAtURL:matchingPattern:sortedByDateWithResourceKey:error:", a3, a4, v4, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a4, 17, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v10, 0, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD1758];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __100__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
      v18[3] = &unk_24C7F39D0;
      v19 = v11;
      objc_msgSend(v14, "predicateWithBlock:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 sortedByDateWithResourceKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__182;
  v24 = __Block_byref_object_dispose__183;
  v25 = 0;
  v26[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEventTrackerManager _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:](self, "_contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:", v10, v11, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __101__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke;
    v17[3] = &unk_24C7F39F8;
    v18 = v12;
    v19 = &v20;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  if (v21[5])
  {

    v15 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __101__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_sortedByDateWithResourceKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  char v8;
  id v9;
  id *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v17;
  id v18;
  id obj;
  id v20;

  v5 = a2;
  v6 = a3;
  obj = 0;
  v20 = 0;
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v20, *(_QWORD *)(a1 + 32), &obj);
  v9 = v20;
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0)
    NSLog(CFSTR("Unable to get %@ for file at %@: %@"), *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v17 = 0;
  v18 = 0;
  v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v18, *(_QWORD *)(a1 + 32), &v17);
  v12 = v18;
  objc_storeStrong(v10, v17);
  if ((v11 & 1) == 0)
    NSLog(CFSTR("Unable to get %@ for file at %@: %@"), *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v13 = objc_msgSend(v12, "compare:", v9);
  if (!v13)
  {
    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsString:", CFSTR("-prepare"));

    if (v15)
      v13 = -1;
    else
      v13 = 1;
  }

  return v13;
}

BOOL __100__VTEventTrackerManager__contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

void __43__VTEventTrackerManager_voiceTriggerEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCF48];
  if (VTAudioLogDirectory_onceToken != -1)
    dispatch_once(&VTAudioLogDirectory_onceToken, &__block_literal_global_6289);
  v4 = (id)VTAudioLogDirectory_logPath;
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sortedURLsInDirectory:matchingPattern:", v5, CFSTR(".*.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[VTEvent eventFromURL:](VTEvent, "eventFromURL:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "eventTrackerDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
