@implementation SearchUIKeyValueDataCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (id)convertSFKeyValueData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0DBD998];
        objc_msgSend(v10, "key", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tupleWithKey:value:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)SearchUIKeyValueDataCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v16, sel_updateWithRowModel_, v4);

  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIKeyValueDataCardSectionView convertSFKeyValueData:](self, "convertSFKeyValueData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SearchUIKeyValueDataCardSectionView_updateWithRowModel___block_invoke;
  v12[3] = &unk_1EA1F6518;
  v13 = v5;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v9, "performBatchUpdates:", v12);

}

void __58__SearchUIKeyValueDataCardSectionView_updateWithRowModel___block_invoke(id *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1[4], "accessoryImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

LABEL_5:
    objc_msgSend(a1[6], "setLeadingTuples:", a1[5]);
    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(a1[5], "count") < 5)
    goto LABEL_5;
  v3 = vcvtad_u64_f64((double)(unint64_t)objc_msgSend(a1[5], "count") * 0.5);
  objc_msgSend(a1[5], "subarrayWithRange:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setLeadingTuples:", v4);

  objc_msgSend(a1[5], "subarrayWithRange:", v3, objc_msgSend(a1[5], "count") - v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setTrailingTuples:", v5);

LABEL_6:
  objc_msgSend(a1[4], "accessoryImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setImage:", v6);

}

@end
