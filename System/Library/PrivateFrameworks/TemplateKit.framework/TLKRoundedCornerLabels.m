@implementation TLKRoundedCornerLabels

- (TLKRoundedCornerLabels)init
{
  TLKRoundedCornerLabels *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKRoundedCornerLabels;
  v2 = -[TLKRoundedCornerLabels init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKRoundedCornerLabels setRoundedLabels:](v2, "setRoundedLabels:", v3);

    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", v2, 5.0);
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:");
  }
  return v2;
}

- (void)setProminence:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_prominence = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TLKRoundedCornerLabels roundedLabels](self, "roundedLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setProminence:", a3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setSizeConfiguration:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_sizeConfiguration = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TLKRoundedCornerLabels roundedLabels](self, "roundedLabels", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSizeConfiguration:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateRoundedText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLKRoundedCornerLabels *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__TLKRoundedCornerLabels_updateRoundedText___block_invoke;
  v6[3] = &unk_1E5C06D50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLKRoundedCornerLabels performBatchUpdates:](self, "performBatchUpdates:", v6);

}

void __44__TLKRoundedCornerLabels_updateRoundedText___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  TLKRoundedCornerLabel *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 > v4)
  {
    do
    {
      v5 = -[TLKRoundedCornerLabel initWithProminence:]([TLKRoundedCornerLabel alloc], "initWithProminence:", objc_msgSend(*(id *)(a1 + 40), "prominence"));
      -[TLKRoundedCornerLabel setSizeConfiguration:](v5, "setSizeConfiguration:", objc_msgSend(*(id *)(a1 + 40), "sizeConfiguration"));
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v5);
      objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v5);

      objc_msgSend(*(id *)(a1 + 40), "addArrangedSubview:", v5);
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v7 > v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12 >= v13)
      {
        objc_msgSend(v15, "setHidden:", 1);
      }
      else
      {
        objc_msgSend(v15, "setHidden:", 0);

        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v16);

      }
      ++v12;
      objc_msgSend(*(id *)(a1 + 40), "roundedLabels");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v12 < v21);
  }
}

- (NSMutableArray)roundedLabels
{
  return self->_roundedLabels;
}

- (void)setRoundedLabels:(id)a3
{
  objc_storeStrong((id *)&self->_roundedLabels, a3);
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (unint64_t)sizeConfiguration
{
  return self->_sizeConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedLabels, 0);
}

@end
