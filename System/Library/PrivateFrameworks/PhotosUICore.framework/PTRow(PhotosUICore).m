@implementation PTRow(PhotosUICore)

- (void)px_increment:()PhotosUICore
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PTRow_PhotosUICore__px_increment___block_invoke;
  v4[3] = &__block_descriptor_40_e11__24__0_8_16l;
  *(double *)&v4[4] = a2;
  objc_msgSend(a1, "setValueValidatator:", v4);
  return a1;
}

- (id)px_conditionFormat:()PhotosUICore possibleValues:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), 0, (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "condition:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = a1;
  }

  return v16;
}

+ (id)px_rowWithTitle:()PhotosUICore output:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PTRow_PhotosUICore__px_rowWithTitle_output___block_invoke;
  v10[3] = &unk_1E511F9E0;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_rowWithTitle:asynchronousOutputProducer:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore asynchronousOutputProducer:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PTRow_PhotosUICore__px_rowWithTitle_asynchronousOutputProducer___block_invoke;
  v10[3] = &unk_1E511FA08;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore continuousOutputProducer:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PTRow_PhotosUICore__px_rowWithTitle_continuousOutputProducer___block_invoke;
  v10[3] = &unk_1E511FA08;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore action:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaticTitle:", v7);

  v9 = (void *)MEMORY[0x1E0D830A0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PTRow_PhotosUICore__px_rowWithTitle_action___block_invoke;
  v13[3] = &unk_1E511FA30;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "actionWithHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAction:", v11);

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore postDismissalAction:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStaticTitle:", v7);

  v9 = (void *)MEMORY[0x1E0D830A0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke;
  v13[3] = &unk_1E511FA30;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "actionWithHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAction:", v11);

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore urlString:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PTRow_PhotosUICore__px_rowWithTitle_urlString___block_invoke;
  v10[3] = &unk_1E512E798;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)px_rowWithTitle:()PhotosUICore valueKeyPath:condition:
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "rowWithTitle:valueKeyPath:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCondition:", v8);

  return v9;
}

@end
