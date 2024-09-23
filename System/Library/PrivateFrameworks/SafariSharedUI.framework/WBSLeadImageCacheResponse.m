@implementation WBSLeadImageCacheResponse

+ (id)responseWithURL:(id)a3 thumbnail:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:thumbnail:", v7, v6);

  return v8;
}

- (WBSLeadImageCacheResponse)initWithURL:(id)a3
{
  return -[WBSLeadImageCacheResponse initWithURL:thumbnail:](self, "initWithURL:thumbnail:", a3, 0);
}

- (WBSLeadImageCacheResponse)initWithURL:(id)a3 thumbnail:(id)a4
{
  id v7;
  WBSLeadImageCacheResponse *v8;
  WBSLeadImageCacheResponse *v9;
  WBSLeadImageCacheResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLeadImageCacheResponse;
  v8 = -[WBSSiteMetadataResponse initWithURL:](&v12, sel_initWithURL_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_thumbnail, a4);
    v10 = v9;
  }

  return v9;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end
