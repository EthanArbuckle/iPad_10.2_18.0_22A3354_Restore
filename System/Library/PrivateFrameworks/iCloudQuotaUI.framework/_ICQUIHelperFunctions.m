@implementation _ICQUIHelperFunctions

+ (id)scaledImageURL:(id)a3
{
  id v3;
  void *v4;
  double v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = (int)v5;

  if (v6 < 3)
  {
    if (v6 == 2)
      objc_msgSend(v3, "URL2x");
    else
      objc_msgSend(v3, "URL1x");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "URL3x");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (int64_t)purchaseTypeForQueryParams:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  int64_t v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 1;
  objc_msgSend(CFSTR("icq.icloud.com?"), "stringByAppendingString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v19 = v4;
    v20 = v3;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "name", v19, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("framework")) & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("dynamicUI"));

          if ((v13 & 1) != 0)
          {
            v4 = v19;
            v3 = v20;
            v17 = 2;
            goto LABEL_21;
          }
        }
        else
        {

        }
        objc_msgSend(v10, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("deviceOffers")) & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("true"));

          if ((v16 & 1) != 0)
          {
            v17 = 0;
            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
    v17 = 1;
LABEL_20:
    v4 = v19;
    v3 = v20;
  }
  else
  {
    v17 = 1;
  }
LABEL_21:

  return v17;
}

+ (void)addHeadersForRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)getINDaemonConnectionClass_softClass_0;
  v20 = getINDaemonConnectionClass_softClass_0;
  v8 = MEMORY[0x24BDAC760];
  if (!getINDaemonConnectionClass_softClass_0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getINDaemonConnectionClass_block_invoke_0;
    v16[3] = &unk_24E3F3868;
    v16[4] = &v17;
    __getINDaemonConnectionClass_block_invoke_0((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v10 = objc_alloc_init(v9);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __57___ICQUIHelperFunctions_addHeadersForRequest_completion___block_invoke;
  v13[3] = &unk_24E3F3A88;
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v10, "commonHeadersForRequest:withCompletion:", v12, v13);

}

+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4 drawBorder:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  v8 = a4;
  v23 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v23);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v8);
    v11 = objc_alloc(MEMORY[0x24BE51AB0]);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = (void *)objc_msgSend(v11, "initWithSize:scale:", width, height, v13);

    objc_msgSend(v14, "setDrawBorder:", v5);
    v15 = (id)objc_msgSend(v10, "prepareImageForDescriptor:", v14);
    objc_msgSend(v10, "imageForDescriptor:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = (void *)MEMORY[0x24BEBD640];
      v19 = objc_msgSend(v16, "CGImage");
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)appIconWithSize:(CGSize)a3 forBundleID:(id)a4
{
  return (id)objc_msgSend(a1, "appIconWithSize:forBundleID:drawBorder:", a4, 1, a3.width, a3.height);
}

+ (double)highestScreenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

@end
