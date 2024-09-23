@implementation ISOpenURLRequest

- (ISOpenURLRequest)init
{
  return -[ISOpenURLRequest initWithURL:](self, "initWithURL:", 0);
}

- (ISOpenURLRequest)initWithURL:(id)a3
{
  id v5;
  ISOpenURLRequest *v6;
  ISOpenURLRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISOpenURLRequest;
  v6 = -[ISOpenURLRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isITunesStoreURL = 1;
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (ISOpenURLRequest)initWithURLBagKey:(id)a3
{
  id v4;
  ISOpenURLRequest *v5;
  ISOpenURLRequest *v6;
  uint64_t v7;
  NSString *urlBagKey;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISOpenURLRequest;
  v5 = -[ISOpenURLRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isITunesStoreURL = 1;
    v7 = objc_msgSend(v4, "copy");
    urlBagKey = v6->_urlBagKey;
    v6->_urlBagKey = (NSString *)v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 40) = self->_interruptsKeybagRefresh;
  *(_BYTE *)(v5 + 8) = self->_isITunesStoreURL;
  v6 = -[NSString copyWithZone:](self->_targetIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_urlBagKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

+ (ISOpenURLRequest)openURLRequestWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return (ISOpenURLRequest *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)ISOpenURLRequest;
  -[ISOpenURLRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: (%@, %@)"), v4, self->_urlBagKey, self->_url);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)interruptsKeybagRefresh
{
  return self->_interruptsKeybagRefresh;
}

- (void)setInterruptsKeybagRefresh:(BOOL)a3
{
  self->_interruptsKeybagRefresh = a3;
}

- (BOOL)isITunesStoreURL
{
  return self->_isITunesStoreURL;
}

- (void)setITunesStoreURL:(BOOL)a3
{
  self->_isITunesStoreURL = a3;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)URLBagKey
{
  return self->_urlBagKey;
}

- (void)setURLBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
}

@end
