@implementation PXRecipientSearchDataSource

- (id)recipientSearchResultsInSection:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3180, "indexPathSetWithSectionIndexes:dataSourceIdentifier:", v6, -[PXRecipientSearchDataSource identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXRecipientSearchDataSource itemIndexPathsForSections:](self, "itemIndexPathsForSections:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PXRecipientSearchDataSource_recipientSearchResultsInSection___block_invoke;
  v13[3] = &unk_1E5142450;
  v13[4] = self;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v8, "enumerateAllIndexPathsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)recipientSearchResultAtIndexPath:(id)a3
{
  id v4;
  _OWORD v6[4];

  v4 = a3;
  -[PXRecipientSearchDataSource identifier](self, "identifier");
  PXSimpleIndexPathFromIndexPath();

  memset(v6, 0, sizeof(v6));
  -[PXRecipientSearchDataSource recipientSearchResultAtSimpleIndexPath:](self, "recipientSearchResultAtSimpleIndexPath:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recipientSearchResultAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXRecipientSearchDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __63__PXRecipientSearchDataSource_recipientSearchResultsInSection___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "recipientSearchResultAtSimpleIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

@end
