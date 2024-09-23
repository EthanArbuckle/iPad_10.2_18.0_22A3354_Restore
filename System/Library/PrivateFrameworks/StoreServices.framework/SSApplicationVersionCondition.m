@implementation SSApplicationVersionCondition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSApplicationVersionCondition;
  -[SSProtocolCondition dealloc](&v3, sel_dealloc);
}

- (SSApplicationVersionCondition)initWithDictionary:(id)a3
{
  SSApplicationVersionCondition *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSApplicationVersionCondition;
  v4 = -[SSProtocolCondition initWithDictionary:](&v9, sel_initWithDictionary_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("bundle-id"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_bundleIdentifier = (NSString *)v5;
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("bundle-version"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_bundleVersion = (NSString *)v6;
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("external-version"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_externalVersion = (NSNumber *)v7;
  }
  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  SSSoftwareLibrary *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *bundleVersion;
  unint64_t v11;
  char v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  if (self->_bundleIdentifier)
  {
    v4 = objc_alloc_init(SSSoftwareLibrary);
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__21;
    v19 = __Block_byref_object_dispose__21;
    v20 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_bundleIdentifier);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__SSApplicationVersionCondition_evaluateWithContext___block_invoke;
    v14[3] = &unk_1E47BBB70;
    v14[4] = v5;
    v14[5] = &v15;
    -[SSSoftwareLibrary getLibraryItemForBundleIdentifiers:completionBlock:](v4, "getLibraryItemForBundleIdentifiers:completionBlock:", v6, v14);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    v7 = (void *)v16[5];
    if (v7)
    {
      v8 = (void *)objc_msgSend(v7, "valueForProperty:", CFSTR("bundleShortVersionString"));
      v9 = (void *)objc_msgSend((id)v16[5], "valueForProperty:", CFSTR("softwareVersionExternalIdentifier"));
      bundleVersion = self->_bundleVersion;
      if (bundleVersion && v8)
      {
        v11 = SSCompareProductVersions(v8, bundleVersion);
      }
      else
      {
        v12 = 0;
        if (!self->_externalVersion || !v9)
          goto LABEL_12;
        v11 = objc_msgSend(v9, "compare:");
      }
      v12 = ConditionResultForComparisonResult(v11, self->super._operator);
    }
    else
    {
      v12 = 0;
    }
LABEL_12:

    _Block_object_dispose(&v15, 8);
    return v12;
  }
  return 0;
}

intptr_t __53__SSApplicationVersionCondition_evaluateWithContext___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "count") == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(a2, "lastObject");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
