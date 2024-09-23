@implementation UIImageCollectImagePathsForPath

void ___UIImageCollectImagePathsForPath_block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[6];
  char v34[1024];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("@1x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  ProductSuffix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ProductSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v11;
  v26 = v9;
  objc_msgSend(v9, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v12;
  objc_msgSend(v4, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v13;
  v33[4] = v7;
  v33[5] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    objc_msgSend(v4, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        if ((a2 & 1) != 0)
        {
          v23 = *(void **)(a1 + 48);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "stringByDeletingPathExtension");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "pathForResource:ofType:", v24, *(_QWORD *)(a1 + 40));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v25, "getCString:maxLength:encoding:", v34, 1024, 4) & 1) != 0
          && !faccessat(-2, v34, 0, 48))
        {
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v25);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

}

void ___UIImageCollectImagePathsForPath_block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];
  char v37[1024];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
    v4 = 3;
  else
    v4 = 2;
  do
  {
    if (dyld_program_sdk_at_least())
    {
      ProductSuffix();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("~iphone"));
      v7 = CFSTR("~ipad");
      if (!v6)
        v7 = CFSTR("~iphone");
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = v7;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@@%lux%@.%@"), v9, v4, v5, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%lux%@.%@"), *(_QWORD *)(a1 + 32), v4, v11, *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%lux.%@"), *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = *(_QWORD *)(a1 + 32);
      ProductSuffix();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@@%lux%@.%@"), v17, v4, v5, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%lux.%@"), *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%lux.%@"), *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          if ((a2 & 1) != 0)
          {
            v25 = *(void **)(a1 + 48);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "stringByDeletingPathExtension");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "pathForResource:ofType:", v26, *(_QWORD *)(a1 + 40));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if ((objc_msgSend(v27, "getCString:maxLength:encoding:", v37, 1024, 4) & 1) != 0
            && !faccessat(-2, v37, 0, 48))
          {
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v27);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    v28 = v4 - 3;
    v4 = 2;
  }
  while (v28 < 0xFFFFFFFFFFFFFFFELL);
}

void ___UIImageCollectImagePathsForPath_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(void *, _QWORD);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  char v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41[1024];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UIImageCollectImagePathsForPath_block_invoke_2;
  aBlock[3] = &unk_1E16D4CF0;
  v8 = v5;
  v36 = v8;
  v9 = v6;
  v37 = v9;
  v38 = *(id *)(a1 + 32);
  v39 = *(id *)(a1 + 40);
  v40 = *(id *)(a1 + 48);
  v10 = _Block_copy(aBlock);
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = ___UIImageCollectImagePathsForPath_block_invoke_3;
  v29[3] = &unk_1E16D4CF0;
  v11 = v8;
  v30 = v11;
  v12 = v9;
  v31 = v12;
  v32 = *(id *)(a1 + 32);
  v33 = *(id *)(a1 + 40);
  v34 = *(id *)(a1 + 48);
  v13 = _Block_copy(v29);
  if (dyld_program_sdk_at_least())
  {
    if (*(_BYTE *)(a1 + 64))
    {
      if (+[UIImage _scaleDefinedByPath:](UIImage, "_scaleDefinedByPath:", *(_QWORD *)(a1 + 56)) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (+[UIDevice _isWatch](UIDevice, "_isWatch")
          || +[UIDevice _isWatchCompanion](UIDevice, "_isWatchCompanion"))
        {
          +[_UIAssetManager _watchScreenScale](_UIAssetManager, "_watchScreenScale");
          v15 = v14;
        }
        else
        {
          +[UIScreen mainScreen](UIScreen, "mainScreen");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "scale");
          v15 = v18;

        }
        v19 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%.0fx.%@"), *(_QWORD *)(a1 + 56), v15, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingPathComponent:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v21, "getCString:maxLength:encoding:", v41, 1024, 4) & 1) != 0
          && !faccessat(-2, v41, 0, 48))
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
        }

      }
      if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        v22 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathExtension:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAppendingPathComponent:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v24, "getCString:maxLength:encoding:", v41, 1024, 4) & 1) != 0
          && !faccessat(-2, v41, 0, 48))
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
        }

      }
    }
    else
    {
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = ___UIImageCollectImagePathsForPath_block_invoke_4;
      v25[3] = &unk_1E16EDB00;
      v28 = *(_BYTE *)(a1 + 65);
      v26 = v10;
      v27 = v13;
      v16 = (void (**)(void *, _QWORD))_Block_copy(v25);
      v16[2](v16, 0);
      if (!objc_msgSend(*(id *)(a1 + 48), "count"))
        v16[2](v16, 1);

    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 65))
      (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      (*((void (**)(void *, _QWORD))v13 + 2))(v13, 0);
    if (!*(_BYTE *)(a1 + 65) && !objc_msgSend(*(id *)(a1 + 48), "count"))
      (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      if (*(_QWORD *)(a1 + 32))
      {
        (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
        if (!objc_msgSend(*(id *)(a1 + 48), "count"))
          (*((void (**)(void *, uint64_t))v10 + 2))(v10, 1);
      }
    }
  }

}

uint64_t ___UIImageCollectImagePathsForPath_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!*(_BYTE *)(a1 + 48))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end
