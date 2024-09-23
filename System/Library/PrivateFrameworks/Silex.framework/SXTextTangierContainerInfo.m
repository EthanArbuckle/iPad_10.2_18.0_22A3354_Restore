@implementation SXTextTangierContainerInfo

- (SXTextTangierContainerInfo)initWithContext:(id)a3 geometry:(id)a4 stylesheet:(id)a5 string:(id)a6 locale:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SXTextTangierContainerInfo *v16;
  SXComponentTextStorage *v17;
  SXTextTangierStorage *storage;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SXTextTangierContainerInfo;
  v16 = -[TSDContainerInfo initWithContext:geometry:](&v22, sel_initWithContext_geometry_, v12, a4);
  if (v16)
  {
    v17 = -[SXTextTangierStorage initWithContext:stylesheet:storageKind:string:locale:]([SXComponentTextStorage alloc], "initWithContext:stylesheet:storageKind:string:locale:", v12, v13, 0, v14, v15);
    storage = v16->_storage;
    v16->_storage = &v17->super;

    -[SXTextTangierContainerInfo storage](v16, "storage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSDContainerInfo setChildInfos:](v16, "setChildInfos:", v20);

  }
  return v16;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (void)setIsSelectable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isSelectable = a3;
  -[SXTextTangierContainerInfo storage](self, "storage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSelectable:", v3);

}

- (void)setShouldHyphenate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldHyphenate = a3;
  -[SXTextTangierContainerInfo storage](self, "storage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldHyphenate:", v3);

}

- (NSSet)rangedExclusionPaths
{
  void *v2;
  void *v3;

  -[SXTextTangierContainerInfo storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangedExclusionPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setRangedExclusionPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextTangierContainerInfo storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRangedExclusionPaths:", v4);

}

- (SXTextTangierStorage)storage
{
  return self->_storage;
}

- (NSSet)fixedExclusionPaths
{
  return self->_fixedExclusionPaths;
}

- (void)setFixedExclusionPaths:(id)a3
{
  objc_storeStrong((id *)&self->_fixedExclusionPaths, a3);
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (TSDRepDirectLayerHosting)directLayerHost
{
  return (TSDRepDirectLayerHosting *)objc_loadWeakRetained((id *)&self->_directLayerHost);
}

- (void)setDirectLayerHost:(id)a3
{
  objc_storeWeak((id *)&self->_directLayerHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directLayerHost);
  objc_storeStrong((id *)&self->_fixedExclusionPaths, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
