@implementation _PXStoryConcreteSaliencyDataSource

- (_PXStoryConcreteSaliencyDataSource)init
{
  return -[_PXStoryConcreteSaliencyDataSource initWithSaliencyAreasByUUID:rawSaliencyAreasByUUID:](self, "initWithSaliencyAreasByUUID:rawSaliencyAreasByUUID:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (_PXStoryConcreteSaliencyDataSource)initWithSaliencyAreasByUUID:(id)a3 rawSaliencyAreasByUUID:(id)a4
{
  id v6;
  id v7;
  _PXStoryConcreteSaliencyDataSource *v8;
  uint64_t v9;
  NSDictionary *saliencyAreasByUUID;
  uint64_t v11;
  NSDictionary *rawSaliencyAreasByUUID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryConcreteSaliencyDataSource;
  v8 = -[_PXStoryConcreteSaliencyDataSource init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    saliencyAreasByUUID = v8->_saliencyAreasByUUID;
    v8->_saliencyAreasByUUID = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    rawSaliencyAreasByUUID = v8->_rawSaliencyAreasByUUID;
    v8->_rawSaliencyAreasByUUID = (NSDictionary *)v11;

  }
  return v8;
}

- (id)saliencyAreasForDisplayAsset:(id)a3
{
  NSDictionary *saliencyAreasByUUID;
  void *v4;
  void *v5;

  saliencyAreasByUUID = self->_saliencyAreasByUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](saliencyAreasByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rawSaliencyAreasForDisplayAsset:(id)a3
{
  NSDictionary *rawSaliencyAreasByUUID;
  void *v4;
  void *v5;

  rawSaliencyAreasByUUID = self->_rawSaliencyAreasByUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](rawSaliencyAreasByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSaliencyAreasByUUID, 0);
  objc_storeStrong((id *)&self->_saliencyAreasByUUID, 0);
}

@end
