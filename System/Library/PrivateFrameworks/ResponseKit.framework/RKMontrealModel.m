@implementation RKMontrealModel

+ (id)modelForLanguage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "pathForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&+[RKMontrealModel modelForLanguage:]::lock);
  v5 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
  if (!+[RKMontrealModel modelForLanguage:]::instances)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
    v7 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
    +[RKMontrealModel modelForLanguage:]::instances = v6;

    v5 = (void *)+[RKMontrealModel modelForLanguage:]::instances;
  }
  objc_msgSend(v5, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);
    if (v9)
    {
      v8 = (void *)v9;
      objc_msgSend((id)+[RKMontrealModel modelForLanguage:]::instances, "setObject:forKey:", v9, v4);
    }
    else
    {
      v8 = 0;
    }
  }
  pthread_mutex_unlock(&+[RKMontrealModel modelForLanguage:]::lock);

  return v8;
}

- (RKMontrealModel)initWithPath:(id)a3
{
  id v4;
  void *v5;
  RKMontrealModel *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_10;
  if (-[RKMontrealModel initWithPath:]::once != -1)
    dispatch_once(&-[RKMontrealModel initWithPath:]::once, &__block_literal_global_7);
  v8.receiver = self;
  v8.super_class = (Class)RKMontrealModel;
  self = -[RKMontrealModel init](&v8, sel_init);
  if (!self || !-[RKMontrealModel initWithPath:]::montrealIsLoaded)
    goto LABEL_9;
  v9 = CFSTR("fileLocation");
  v10[0] = v4;
  v5 = (void *)((uint64_t (*)(uint64_t))weak_MRLModelCreate)(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  self->_model = v5;
  if (!v5)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  if (weak_MRLModelGetOutputSize() != 5)
    __assert_rtn("-[RKMontrealModel initWithPath:]", "RKEventIdentifier.mm", 130, "outputSize == RKEventIDCount");
  weak_MRLModelSetMaxSequenceLength(self->_model, (kMaxSequenceLength + 1));
LABEL_9:
  self = self;
  v6 = self;
LABEL_11:

  return v6;
}

void *__32__RKMontrealModel_initWithPath___block_invoke()
{
  void *result;
  void *v1;
  BOOL v2;
  char v14;

  result = dlopen("/System/Library/PrivateFrameworks/Montreal.framework/Montreal", 1);
  if (result)
  {
    v1 = result;
    weak_MRLModelCreate = dlsym(result, "MRLModelCreate");
    weak_MRLModelGetIOMappings = dlsym(v1, "MRLModelGetIOMappings");
    weak_MRLModelGetOutputSize = (uint64_t (*)(void))dlsym(v1, "MRLModelGetOutputSize");
    weak_MRLModelSetMaxSequenceLength = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "MRLModelSetMaxSequenceLength");
    weak_MRLModelStateCreate = dlsym(v1, "MRLModelStateCreate");
    weak_MRLModelStateSave = (uint64_t)dlsym(v1, "MRLModelStateSave");
    weak_MRLModelStateRestore = (uint64_t)dlsym(v1, "MRLModelStateRestore");
    weak_MRLModelRecognizeIncremental = (uint64_t)dlsym(v1, "MRLModelRecognizeIncremental");
    weak_MRLModelRecognize = (uint64_t)dlsym(v1, "MRLModelRecognize");
    weak_MRLModelRecognizeSequence = dlsym(v1, "MRLModelRecognize");
    weak_MRLModelReset = (uint64_t (*)(void))dlsym(v1, "MRLModelReset");
    weak_MRLModelRelease = dlsym(v1, "MRLModelRelease");
    result = dlsym(v1, "MRLModelStateRelease");
    weak_MRLModelStateRelease = result;
    if (weak_MRLModelCreate)
      v2 = weak_MRLModelReset == 0;
    else
      v2 = 1;
    v14 = !v2
       && weak_MRLModelRelease != 0
       && weak_MRLModelGetIOMappings != 0
       && weak_MRLModelRecognizeIncremental != 0
       && weak_MRLModelRecognize != 0
       && weak_MRLModelRecognizeSequence != 0
       && weak_MRLModelGetOutputSize != 0
       && weak_MRLModelSetMaxSequenceLength != 0
       && weak_MRLModelStateCreate != 0
       && weak_MRLModelStateSave != 0
       && weak_MRLModelStateRestore != 0
       && result != 0;
    -[RKMontrealModel initWithPath:]::montrealIsLoaded = v14;
  }
  return result;
}

- (void)dealloc
{
  void *model;
  objc_super v4;

  model = self->_model;
  if (model)
    weak_MRLModelRelease(model, a2);
  v4.receiver = self;
  v4.super_class = (Class)RKMontrealModel;
  -[RKMontrealModel dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  if (self->_model)
    weak_MRLModelReset();
}

+ (id)pathForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Polarity-"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".lstm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v12 = MEMORY[0x24BDAC760];
  v8 = v7;
  v13 = v8;
  LDEnumerateAssetDataItems();
  v9 = (void *)v15[5];
  if (v9)
  {
    objc_msgSend(v9, "path", v12, 3221225472, __35__RKMontrealModel_pathForLanguage___block_invoke, &unk_24C6AFC70, v8, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __35__RKMontrealModel_pathForLanguage___block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const void *a5, _BYTE *a6)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *PathComponent;

  PathComponent = (__CFString *)CFURLCopyLastPathComponent(url);
  if (PathComponent
    && CFEqual(a5, (CFTypeRef)*MEMORY[0x24BE5F7D8])
    && -[__CFString isEqualToString:](PathComponent, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v10 = -[__CFURL copy](url, "copy");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a6 = 1;
  }

}

- (void)model
{
  return self->_model;
}

@end
