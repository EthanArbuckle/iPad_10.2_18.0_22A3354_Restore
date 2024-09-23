@implementation VisionCoreE5RTModelSource

- (VisionCoreE5RTModelSource)initWithURL:(id)a3
{
  id v5;
  VisionCoreE5RTModelSource *v6;
  VisionCoreE5RTModelSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreE5RTModelSource;
  v6 = -[VisionCoreE5RTModelSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

+ (Class)_classForModelAtURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_classForModelAtURL_error__onceToken != -1)
    dispatch_once(&_classForModelAtURL_error__onceToken, &__block_literal_global_701);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)_classForModelAtURL_error__modelSourceClasses;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isModelSourceURL:", v5) & 1) != 0)
        {
          a4 = v11;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (a4)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v5, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ is not a supported model file"), v13);

    v14 = *MEMORY[0x24BDD1328];
    v21[0] = *MEMORY[0x24BDD0FC8];
    v21[1] = v14;
    v22[0] = v6;
    v22[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorWithCode:userInfo:", 6, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
LABEL_14:

  }
  return (Class)a4;
}

+ (BOOL)isModelSourceURL:(id)a3
{
  return objc_msgSend(a1, "_classForModelAtURL:error:", a3, 0) != 0;
}

+ (id)modelSourceFromURL:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;

  v6 = a3;
  v7 = (objc_class *)objc_msgSend(a1, "_classForModelAtURL:error:", v6, a4);
  if (v7)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithURL:", v6);
  else
    v8 = 0;

  return v8;
}

void __55__VisionCoreE5RTModelSource__classForModelAtURL_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[VisionCoreRuntimeUtilities leafSubclassesOfClass:excludingRootClass:](VisionCoreRuntimeUtilities, "leafSubclassesOfClass:excludingRootClass:", objc_opt_class(), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_classForModelAtURL_error__modelSourceClasses;
  _classForModelAtURL_error__modelSourceClasses = v0;

}

@end
