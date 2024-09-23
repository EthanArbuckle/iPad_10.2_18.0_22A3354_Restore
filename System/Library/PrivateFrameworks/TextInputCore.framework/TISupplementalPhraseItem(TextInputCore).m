@implementation TISupplementalPhraseItem(TextInputCore)

- (void)core_appendEntitiesToArray:()TextInputCore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D3AB80]);
  objc_msgSend(a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:data:", v5, objc_msgSend(a1, "identifier"));
  objc_msgSend(v12, "addObject:", v6);

  objc_msgSend(a1, "phoneticTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D3AB80]);
    objc_msgSend(a1, "phoneticTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:data:", v10, objc_msgSend(a1, "identifier"));
    objc_msgSend(v12, "addObject:", v11);

  }
}

- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    objc_msgSend(a1, "phoneticTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
    {
      v9 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(a1, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isEqualToString:", v12);

  }
  else
  {
    v9 = 0;
  }

  if (v8)
    goto LABEL_8;
LABEL_9:

  return v9;
}

- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  rangesOfStringInString(v10, v9, a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "phoneticTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TIGenerateReading(v9, v10, a3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TINameReadingPair nameReadingPairWithName:reading:](TINameReadingPair, "nameReadingPairWithName:reading:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v13);
  return v8;
}

@end
