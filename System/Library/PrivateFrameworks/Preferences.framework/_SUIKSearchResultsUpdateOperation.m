@implementation _SUIKSearchResultsUpdateOperation

- (_SUIKSearchResultsUpdateOperation)initWithResults:(id)a3 diffableDataSource:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SUIKSearchResultsUpdateOperation *v11;
  _SUIKSearchResultsUpdateOperation *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_SUIKSearchResultsUpdateOperation;
  v11 = -[_SUIKSearchResultsUpdateOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_results, v8);
    objc_storeWeak((id *)&v12->_diffableDataSource, v9);
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)main
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD block[5];
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id location;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CEA210]);
    objc_initWeak(&location, self);
    -[_SUIKSearchResultsUpdateOperation results](self, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

    if (v5)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIKSearchResultsUpdateOperation results](self, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke;
    v31[3] = &unk_1E4A68B40;
    v31[4] = self;
    objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v8, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_2;
      v30[3] = &unk_1E4A68B68;
      v30[4] = self;
      objc_msgSend(v10, "sortedArrayUsingComparator:", v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled") & 1) != 0)
      {
LABEL_19:
        v9 = 1;
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        obj = v19;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v27;
          while (2)
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(obj);
              v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
              if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled", v19) & 1) != 0)
                goto LABEL_18;
              v33 = v14;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendSectionsWithIdentifiers:", v15);

              if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled") & 1) != 0)
                goto LABEL_18;
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_3;
              v24[3] = &unk_1E4A68B90;
              v25 = v6;
              objc_msgSend(v16, "na_filter:", v24);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v23[0] = MEMORY[0x1E0C809B0];
              v23[1] = 3221225472;
              v23[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_4;
              v23[3] = &unk_1E4A68BB8;
              v23[4] = self;
              objc_msgSend(v17, "sortedArrayUsingComparator:", v23);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled") & 1) != 0)
              {

LABEL_18:
                goto LABEL_19;
              }
              objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v18, v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v11)
              continue;
            break;
          }
        }

        v9 = -[_SUIKSearchResultsUpdateOperation isCancelled](self, "isCancelled");
      }

    }
    if (!v9)
    {
LABEL_22:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41___SUIKSearchResultsUpdateOperation_main__block_invoke_5;
      block[3] = &unk_1E4A655B8;
      block[4] = self;
      v22 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(&location);

  }
}

- (NSArray)results
{
  return (NSArray *)objc_loadWeakRetained((id *)&self->_results);
}

- (void)setResults:(id)a3
{
  objc_storeWeak((id *)&self->_results, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return (UICollectionViewDiffableDataSource *)objc_loadWeakRetained((id *)&self->_diffableDataSource);
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_diffableDataSource, a3);
}

- (SUIKSearchResultsCollectionViewControllerDelegate)delegate
{
  return (SUIKSearchResultsCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_diffableDataSource);
  objc_destroyWeak((id *)&self->_results);
}

@end
