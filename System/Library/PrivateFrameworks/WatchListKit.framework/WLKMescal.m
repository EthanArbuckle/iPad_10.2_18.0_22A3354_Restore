@implementation WLKMescal

+ (BOOL)signNetworkRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  id v15;

  v5 = a3;
  objc_msgSend(v5, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CFDB58];
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v7, "signatureFromData:type:bag:error:", v6, 1, v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (v10)
    v11 = 1;
  else
    v11 = v9 == 0;
  v12 = !v11;
  if (v11)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v13, *MEMORY[0x1E0CFD848]);

  }
  return v12;
}

@end
