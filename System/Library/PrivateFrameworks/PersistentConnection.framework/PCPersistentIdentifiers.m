@implementation PCPersistentIdentifiers

+ (unint64_t)hostUniqueIdentifier
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PCPersistentIdentifiers_hostUniqueIdentifier__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (hostUniqueIdentifier_pred != -1)
    dispatch_once(&hostUniqueIdentifier_pred, v3);
  return hostUniqueIdentifier_hostIdentifier;
}

+ (id)processNamePidAndStringIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, "canBeConvertedToEncoding:", 30) & 1) == 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", 30, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 30);

      v5 = (void *)v7;
    }
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x65)
    {
      objc_msgSend(v5, "substringToIndex:", 100);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("..."));
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
    objc_msgSend(a1, "_processNamePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%i,%@]"), getpid(), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_processNamePrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%i]"), getpid());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_processNamePrefix
{
  if (_processNamePrefix_pred != -1)
    dispatch_once(&_processNamePrefix_pred, &__block_literal_global_4);
  return (id)_processNamePrefix_prefix;
}

unsigned __int8 *__47__PCPersistentIdentifiers_hostUniqueIdentifier__block_invoke(uint64_t a1)
{
  unsigned __int8 *result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  size_t v7;
  unsigned __int8 md[8];
  _QWORD data[3];

  data[2] = *MEMORY[0x1E0C80C00];
  data[0] = 0;
  data[1] = 0;
  v7 = 16;
  if (sysctlbyname("kern.boottime", data, &v7, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = __error();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v5, v4, CFSTR("PCPersistentIdentifiers.m"), 29, CFSTR("sysctlbyname() for \"kern.boottime\" failed: %s"), strerror(*v6));

  }
  result = CC_SHA1(data, 0x10u, md);
  hostUniqueIdentifier_hostIdentifier = bswap64(*(unint64_t *)md);
  return result;
}

void __45__PCPersistentIdentifiers__processNamePrefix__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithFormat:", CFSTR("com.apple.persistentconnection[%@,"), v1);
  v3 = (void *)_processNamePrefix_prefix;
  _processNamePrefix_prefix = v2;

}

+ (id)processNameAndPidIdentifier
{
  return (id)objc_msgSend(a1, "processNamePidAndStringIdentifier:", 0);
}

+ (int)pidFromMatchingIdentifer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "_processNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfString:options:", v5, 8);
  v8 = v7;

  v9 = -1;
  if (!v6 && v8)
  {
    objc_msgSend(v4, "substringFromIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "intValue");

  }
  return v9;
}

@end
