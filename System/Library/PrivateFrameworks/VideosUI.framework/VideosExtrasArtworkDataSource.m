@implementation VideosExtrasArtworkDataSource

- (VideosExtrasArtworkDataSource)init
{
  VideosExtrasArtworkDataSource *v2;
  VideosExtrasArtworkDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasArtworkDataSource;
  v2 = -[MPAbstractNetworkArtworkDataSource init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MPAbstractNetworkArtworkDataSource URLSessionConfiguration](v2, "URLSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMemoryCapacity:", 524288000);

    -[MPAbstractNetworkArtworkDataSource URLSessionConfiguration](v3, "URLSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiskCapacity:", 524288000);

  }
  return v3;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "srcset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)supportedSizesForCatalog:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double d;
  double v28;
  double a;
  double b;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "width");
  v6 = v5;
  objc_msgSend(v3, "height");
  v8 = v7;
  if (v6 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v3, "width");
  v12 = v11;
  objc_msgSend(v3, "height");
  objc_msgSend(v10, "valueWithCGSize:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = v3;
  objc_msgSend(v3, "srcset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v16)
    goto LABEL_20;
  v17 = v16;
  v18 = *(_QWORD *)v39;
  v19 = *MEMORY[0x1E0D3A558];
  v20 = *MEMORY[0x1E0D3A560];
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v39 != v18)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if (objc_msgSend(v22, "isEqualToString:", v19))
      {
        v23 = (void *)MEMORY[0x1E0CB3B18];
        v24 = v6;
        v25 = v8;
      }
      else
      {
        if (objc_msgSend(v22, "isEqualToString:", v20))
        {
          v26 = (void *)MEMORY[0x1E0CB3B18];
          CGAffineTransformMakeScale(&v37, 2.0, 2.0);
          d = v37.d;
          v28 = v8 * v37.c;
          a = v37.a;
          b = v37.b;
        }
        else
        {
          if (!objc_msgSend(v22, "isEqualToString:", CFSTR("3x")))
            continue;
          v26 = (void *)MEMORY[0x1E0CB3B18];
          CGAffineTransformMakeScale(&v36, 3.0, 3.0);
          d = v36.d;
          v28 = v8 * v36.c;
          a = v36.a;
          b = v36.b;
        }
        v24 = v28 + a * v6;
        v25 = v8 * d + b * v6;
        v23 = v26;
      }
      objc_msgSend(v23, "valueWithCGSize:", v24, v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v31);

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v17);
LABEL_20:

  v32 = v4;
  v3 = v35;
LABEL_22:

  return v32;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v12;
  void *v13;
  void *v14;
  const __CFString **v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "srcset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

    goto LABEL_9;
  }
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (width == v9 && height == v10)
  {
LABEL_9:
    objc_msgSend(v7, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_21;
    goto LABEL_18;
  }
  objc_msgSend(v6, "destinationScale");
  if (fabs(v12 + -1.0) < 0.00000011920929)
  {
    objc_msgSend(v7, "srcset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = (const __CFString **)MEMORY[0x1E0D3A558];
LABEL_13:
    v17 = *v15;
    goto LABEL_14;
  }
  if (fabs(v12 + -2.0) < 0.00000011920929)
  {
    objc_msgSend(v7, "srcset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = (const __CFString **)MEMORY[0x1E0D3A560];
    goto LABEL_13;
  }
  if (fabs(v12 + -3.0) < 0.00000011920929)
  {
    objc_msgSend(v7, "srcset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v17 = CFSTR("3x");
LABEL_14:
    objc_msgSend(v13, "objectForKeyedSubscript:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_21;
  }
LABEL_18:
  objc_msgSend(v7, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v7, "srcset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A550]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v7, "srcset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A568]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", v16, 0, 60.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return 0;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "token", a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
