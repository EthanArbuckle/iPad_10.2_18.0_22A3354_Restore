@implementation PXStoryConcreteMutableSaliencyDataSource

- (PXStoryConcreteMutableSaliencyDataSource)init
{
  PXStoryConcreteMutableSaliencyDataSource *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *saliencyAreasByUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *rawSaliencyAreasByUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryConcreteMutableSaliencyDataSource;
  v2 = -[PXStoryConcreteMutableSaliencyDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    saliencyAreasByUUID = v2->_saliencyAreasByUUID;
    v2->_saliencyAreasByUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rawSaliencyAreasByUUID = v2->_rawSaliencyAreasByUUID;
    v2->_rawSaliencyAreasByUUID = v5;

  }
  return v2;
}

- (void)setSaliencyAreas:(id)a3 rawSaliencyAreas:(id)a4 forDisplayAsset:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "uuid");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_saliencyAreasByUUID, "setObject:forKeyedSubscript:", v10, v12);
  v11 = (void *)objc_msgSend(v8, "copy");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rawSaliencyAreasByUUID, "setObject:forKeyedSubscript:", v11, v12);
}

- (id)saliencyAreasForDisplayAsset:(id)a3
{
  NSMutableDictionary *saliencyAreasByUUID;
  void *v4;
  void *v5;

  saliencyAreasByUUID = self->_saliencyAreasByUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](saliencyAreasByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rawSaliencyAreasForDisplayAsset:(id)a3
{
  NSMutableDictionary *rawSaliencyAreasByUUID;
  void *v4;
  void *v5;

  rawSaliencyAreasByUUID = self->_rawSaliencyAreasByUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](rawSaliencyAreasByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_PXStoryConcreteSaliencyDataSource initWithSaliencyAreasByUUID:rawSaliencyAreasByUUID:]([_PXStoryConcreteSaliencyDataSource alloc], "initWithSaliencyAreasByUUID:rawSaliencyAreasByUUID:", self->_saliencyAreasByUUID, self->_rawSaliencyAreasByUUID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSaliencyAreasByUUID, 0);
  objc_storeStrong((id *)&self->_saliencyAreasByUUID, 0);
}

@end
