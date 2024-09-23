@implementation PXSampleInboxDataSourceManager

- (PXSampleInboxDataSourceManager)init
{
  PXSampleInboxDataSourceManager *v2;
  PXSampleInboxDataSourceManager *v3;
  PXSampleInboxMediaProvider *v4;
  PXSampleInboxMediaProvider *sampleMediaProvider;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSampleInboxDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXSampleInboxDataSourceManager _generateModels](v2, "_generateModels");
    v4 = objc_alloc_init(PXSampleInboxMediaProvider);
    sampleMediaProvider = v3->_sampleMediaProvider;
    v3->_sampleMediaProvider = v4;

  }
  return v3;
}

- (void)_generateModels
{
  unsigned int i;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1000);
  for (i = 0; i != 1000; ++i)
  {
    -[PXSampleInboxDataSourceManager _modelElements](self, "_modelElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v4, "count")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSeen:", i > 4);
    objc_msgSend(v6, "addObject:", v5);

  }
  -[PXSampleInboxDataSourceManager setMockedModels:](self, "setMockedModels:", v6);

}

- (id)_modelElements
{
  PXSampleAlbumCommentInboxModel *v2;
  PXSampleAlbumLikeInboxModel *v3;
  PXSampleAlbumAdditionInboxModel *v4;
  PXSampleAlbumJoinInboxModel *v5;
  PXSampleAlbumInvitationModel *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PXSampleAlbumCommentInboxModel);
  v9[0] = v2;
  v3 = objc_alloc_init(PXSampleAlbumLikeInboxModel);
  v9[1] = v3;
  v4 = objc_alloc_init(PXSampleAlbumAdditionInboxModel);
  v9[2] = v4;
  v5 = objc_alloc_init(PXSampleAlbumJoinInboxModel);
  v9[3] = v5;
  v6 = objc_alloc_init(PXSampleAlbumInvitationModel);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_changeData
{
  uint32_t v3;
  uint32_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = arc4random_uniform(9u);
  if (v3 != -1)
  {
    v4 = v3 + 1;
    do
    {
      -[PXSampleInboxDataSourceManager _modelElements](self, "_modelElements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v5, "count")));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCreationDate:", v7);

      objc_msgSend(v13, "addObject:", v6);
      --v4;
    }
    while (v4);
  }
  -[PXSampleInboxDataSourceManager mockedModels](self, "mockedModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = arc4random_uniform(4u);
  v11 = v10 + 1;
  if (v10 != -1)
  {
    v12 = 0;
    do
    {
      ++v12;
      objc_msgSend(v9, "removeObjectAtIndex:", (v12 * v12));
    }
    while (v11 != v12);
  }
  objc_msgSend(v9, "addObjectsFromArray:", v13);
  -[PXSampleInboxDataSourceManager setMockedModels:](self, "setMockedModels:", v9);
  -[PXSampleInboxDataSourceManager _updateDataSource](self, "_updateDataSource");

}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSampleInboxDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "models");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "models");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v4, v5, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A18), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v8, "identifier"), objc_msgSend(v3, "identifier"), v6, 0, 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v3, v7);

}

- (id)_dataSourceSnapshot
{
  PXInboxModelDataSource *v3;
  void *v4;
  PXInboxModelDataSource *v5;

  v3 = [PXInboxModelDataSource alloc];
  -[PXSampleInboxDataSourceManager mockedModels](self, "mockedModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXInboxModelDataSource initWithModels:](v3, "initWithModels:", v4);

  return v5;
}

- (PXInboxModelDetailViewControllerProvider)detailViewControllerProvider
{
  return 0;
}

- (id)titleForModel:(id)a3
{
  uint64_t v3;
  const __CFString *v4;

  v3 = objc_msgSend(a3, "inboxModelType");
  if ((unint64_t)(v3 - 1) > 5)
    v4 = CFSTR("MAIN MAIN MAIN MAIN");
  else
    v4 = off_1E511D6D0[v3 - 1];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
}

- (id)subtitleForModel:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("SUB SUB SUB SUB SUB SUB"));
}

- (void)requestTitleAndSubtitleForModel:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  -[PXSampleInboxDataSourceManager titleForModel:](self, "titleForModel:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSampleInboxDataSourceManager subtitleForModel:](self, "subtitleForModel:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, id, void *))a4 + 2))(v7, v10, v9);
}

- (NSArray)mockedModels
{
  return self->_mockedModels;
}

- (void)setMockedModels:(id)a3
{
  objc_storeStrong((id *)&self->_mockedModels, a3);
}

- (PXSampleInboxMediaProvider)sampleMediaProvider
{
  return self->_sampleMediaProvider;
}

- (void)setSampleMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sampleMediaProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleMediaProvider, 0);
  objc_storeStrong((id *)&self->_mockedModels, 0);
}

@end
