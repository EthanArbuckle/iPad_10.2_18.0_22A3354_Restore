@implementation SVAVURLAssetFactory

- (SVAVURLAssetFactory)initWithOptions:(id)a3
{
  id v4;
  SVAVURLAssetFactory *v5;
  uint64_t v6;
  NSDictionary *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVAVURLAssetFactory;
  v5 = -[SVAVURLAssetFactory init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (NSDictionary *)v6;

  }
  return v5;
}

- (id)createURLAssetWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDB26C8];
  v5 = a3;
  v6 = [v4 alloc];
  -[SVAVURLAssetFactory options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:options:", v5, v7);

  return v8;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
