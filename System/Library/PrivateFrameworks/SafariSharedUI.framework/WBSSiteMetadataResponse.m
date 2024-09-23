@implementation WBSSiteMetadataResponse

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (WBSSiteMetadataResponse)initWithURL:(id)a3
{
  id v5;
  WBSSiteMetadataResponse *v6;
  WBSSiteMetadataResponse *v7;
  WBSSiteMetadataResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSiteMetadataResponse;
  v6 = -[WBSSiteMetadataResponse init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)responseWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

- (WBSSiteMetadataResponse)init
{
  return -[WBSSiteMetadataResponse initWithURL:](self, "initWithURL:", 0);
}

@end
