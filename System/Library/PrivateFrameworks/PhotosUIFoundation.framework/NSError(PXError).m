@implementation NSError(PXError)

- (BOOL)px_isDomain:()PXError code:
{
  id v6;
  id v7;
  int v8;
  _BOOL8 v9;

  v6 = a3;
  objc_msgSend(a1, "domain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
LABEL_5:
    v9 = objc_msgSend(a1, "code") == a4;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

+ (id)_px_errorWithDomain:()PXError code:underlyingError:localizedDescription:debugDescription:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v16;
  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
  if (v15)
  {
    v18 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDD0BA0]);

  }
  if (v14)
  {
    v19 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDD0FC8]);

  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v12, a4, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)px_errorWithDomain:()PXError code:underlyingError:localizedDescription:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v13 = (objc_class *)MEMORY[0x24BDD17C8];
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, &a9);

  objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v16, a4, v15, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)px_errorWithDomain:()PXError code:underlyingError:debugDescription:
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v13 = (objc_class *)MEMORY[0x24BDD17C8];
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, &a9);

  objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v16, a4, v15, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)px_errorWithDomain:()PXError code:debugDescription:
{
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v14, a4, 0, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)px_genericErrorWithDebugDescription:()PXError
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", CFSTR("PXErrorDomain"), -1, 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)px_genericErrorWithUnderlyingError:()PXError debugDescription:
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = (objc_class *)MEMORY[0x24BDD17C8];
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", CFSTR("PXErrorDomain"), -1, v13, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
