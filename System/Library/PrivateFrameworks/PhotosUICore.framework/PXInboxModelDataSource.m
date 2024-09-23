@implementation PXInboxModelDataSource

- (PXInboxModelDataSource)initWithModels:(id)a3
{
  id v5;
  PXInboxModelDataSource *v6;
  PXInboxModelDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXInboxModelDataSource;
  v6 = -[PXInboxModelDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_models, a3);

  return v7;
}

- (PXInboxModelDataSource)init
{
  return -[PXInboxModelDataSource initWithModels:](self, "initWithModels:", MEMORY[0x1E0C9AA60]);
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXInboxModelDataSource models](self, "models");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PXInboxModelDataSource models](self, "models", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;

  -[PXInboxModelDataSource models](self, "models");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3->item);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)modelAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXInboxModelDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PXSimpleIndexPath)indexPathForModel:(SEL)a3
{
  id v6;
  void *v7;
  int64_t v8;
  PXSimpleIndexPath *result;

  v6 = a4;
  -[PXInboxModelDataSource models](self, "models");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  result = (PXSimpleIndexPath *)-[PXInboxModelDataSource identifier](self, "identifier");
  retstr->dataSourceIdentifier = (int64_t)result;
  retstr->section = 0;
  retstr->item = v8;
  retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (NSArray)models
{
  return self->_models;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
}

@end
