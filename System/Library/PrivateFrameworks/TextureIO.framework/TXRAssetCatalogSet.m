@implementation TXRAssetCatalogSet

- (TXRAssetCatalogSet)init
{
  TXRAssetCatalogSet *v2;
  TXRAssetCatalogSet *v3;
  NSString *name;
  NSMutableArray *v5;
  NSMutableArray *configs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TXRAssetCatalogSet;
  v2 = -[TXRAssetCatalogSet init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    v3->_interpretation = 0;
    v3->_origin = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    configs = v3->_configs;
    v3->_configs = v5;

  }
  return v3;
}

- (TXRAssetCatalogSet)initWithName:(id)a3
{
  id v4;
  TXRAssetCatalogSet *v5;
  uint64_t v6;
  NSString *name;

  v4 = a3;
  v5 = -[TXRAssetCatalogSet init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (id)exportAtLocation:(id)a3 error:(id *)a4
{
  return +[TXRAssetCatalogParser exportSet:location:error:](TXRAssetCatalogParser, "exportSet:location:error:", self, a3, a4);
}

- (BOOL)addConfig:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  _BOOL4 cubemap;
  const __CFString *v11;
  BOOL v12;
  _BOOL4 v14;

  v6 = a3;
  v7 = -[NSMutableArray count](self->_configs, "count");
  objc_msgSend(v6, "texture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cubemap");
  if (!v7)
  {
    self->_cubemap = v9;
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
  {
    cubemap = self->_cubemap;

    if (!cubemap)
    {
      if (a4)
      {
        v11 = CFSTR("The config being added is a cubemap but configs already in set are not.  The two types cannot be mixed");
LABEL_15:
        _newTXRErrorWithCodeAndErrorString(12, (uint64_t)v11);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "texture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "cubemap") & 1) != 0)
    goto LABEL_9;
  v14 = self->_cubemap;

  if (v14)
  {
    if (a4)
    {
      v11 = CFSTR("The config being added is a not a cubemap but configs already in set are.  The two types cannot be mixed");
      goto LABEL_15;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_10:
  -[NSMutableArray addObject:](self->_configs, "addObject:", v6);
  v12 = 1;
LABEL_11:

  return v12;
}

- (unint64_t)interpretation
{
  return self->_interpretation;
}

- (void)setInterpretation:(unint64_t)a3
{
  self->_interpretation = a3;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)configs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)cubemap
{
  return self->_cubemap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
