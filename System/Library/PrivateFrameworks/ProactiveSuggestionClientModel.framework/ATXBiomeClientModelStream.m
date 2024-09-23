@implementation ATXBiomeClientModelStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (ATXBiomeClientModelStream)init
{
  return -[ATXBiomeClientModelStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXBiomeClientModelStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXBiomeClientModelStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXBiomeClientModelStream;
  v5 = -[ATXBiomeClientModelStream init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("clientModel"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("clientModel");
}

- (id)source
{
  return (id)-[BMStoreStream source](self->_inner, "source");
}

@end
