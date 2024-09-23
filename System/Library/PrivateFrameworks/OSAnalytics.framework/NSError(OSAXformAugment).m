@implementation NSError(OSAXformAugment)

- (id)augmentWithPrefix:()OSAXformAugment
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "code");
  v14 = *MEMORY[0x1E0CB2D50];
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v6, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
