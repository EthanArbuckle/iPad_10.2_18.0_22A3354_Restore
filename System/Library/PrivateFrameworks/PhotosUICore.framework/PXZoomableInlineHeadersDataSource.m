@implementation PXZoomableInlineHeadersDataSource

- (PXZoomableInlineHeadersDataSource)initWithAssetsDataSource:(id)a3 level:(unint64_t)a4 metaDataStore:(id)a5
{
  id v9;
  id v10;
  PXZoomableInlineHeadersDataSource *v11;
  PXZoomableInlineHeadersDataSource *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $4479F518DFD59EF68F6FA14DAF968345 *v17;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PXZoomableInlineHeadersDataSource;
  v11 = -[PXZoomableInlineHeadersDataSource init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetsDataSource, a3);
    v12->_level = a4;
    if (objc_msgSend(v9, "numberOfSections") < 1)
    {
      v13 = 0;
    }
    else
    {
      v19 = objc_msgSend(v9, "identifier");
      v20 = xmmword_1A7C0C1F0;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v9, "assetsInSectionIndexPath:", &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "px_sortOrder");
      v15 = v14 == 1;
      if (v14 == 2)
        v15 = 2;
    }
    else
    {
      v15 = 0;
    }
    v12->_type = v15;
    v16 = objc_msgSend(v10, "numberOfSectionInfosForLevel:", a4);
    v12->_numberOfSections = v16;
    if (v16)
    {
      v17 = ($4479F518DFD59EF68F6FA14DAF968345 *)malloc_type_malloc(32 * v16, 0x1000040E0EAB150uLL);
      v12->_sectionInfos = v17;
      memcpy(v17, (const void *)objc_msgSend(objc_retainAutorelease(v10), "sectionInfosForLevel:", a4), 32 * v12->_numberOfSections);
    }

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sectionInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeadersDataSource;
  -[PXZoomableInlineHeadersDataSource dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)type
{
  return self->_type;
}

- ($4479F518DFD59EF68F6FA14DAF968345)sectionInfos
{
  return self->_sectionInfos;
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
}

@end
