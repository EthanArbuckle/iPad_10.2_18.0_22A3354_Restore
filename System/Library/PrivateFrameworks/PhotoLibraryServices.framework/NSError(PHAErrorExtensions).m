@implementation NSError(PHAErrorExtensions)

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions
{
  void *v5;
  void *v6;

  PHAErrorDescriptionForCode(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions userInfo:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  PHAErrorDescriptionForCode(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:
{
  return objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:userInfo:", a3, a4, 0);
}

+ (id)pl_analysisErrorWithCode:()PHAErrorExtensions localizedDescription:userInfo:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if (v9)
      v10 = (id)objc_msgSend(v9, "mutableCopy");
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

    v9 = v11;
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)pl_analysisErrorForInvalidParameterValue:()PHAErrorExtensions named:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The '%@' parameter has an invalid value %@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pl_analysisErrorWithCode:localizedDescription:", 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
