@implementation SSDownload(VideosUI)

- (BOOL)vui_isEqualToDownload:()VideosUI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  _BOOL8 v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (a1 == v4)
    {
      v17 = 1;
    }
    else
    {
      v7 = *MEMORY[0x1E0DAF9D0];
      v19[0] = *MEMORY[0x1E0DAF990];
      v6 = v19[0];
      v19[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "vui_valuesForProperties:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_valuesForProperties:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v15 = v13 == 0;
      else
        v15 = 1;
      v17 = 1;
      if (v15 || (objc_msgSend(v10, "isEqualToString:", v13) & 1) == 0)
      {
        v16 = !v11 || v14 == 0;
        if (v16 || (objc_msgSend(v11, "isEqualToNumber:", v14) & 1) == 0)
          v17 = 0;
      }

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
