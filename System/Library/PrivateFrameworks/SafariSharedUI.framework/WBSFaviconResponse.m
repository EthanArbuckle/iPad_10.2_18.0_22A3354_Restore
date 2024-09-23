@implementation WBSFaviconResponse

- (WBSFaviconResponse)initWithURL:(id)a3
{

  return 0;
}

- (WBSFaviconResponse)initWithURL:(id)a3 favicon:(id)a4 faviconType:(unint64_t)a5
{
  id v9;
  WBSFaviconResponse *v10;
  WBSFaviconResponse *v11;
  WBSFaviconResponse *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSFaviconResponse;
  v10 = -[WBSSiteMetadataResponse initWithURL:](&v14, sel_initWithURL_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_favicon, a4);
    v11->_faviconType = a5;
    v12 = v11;
  }

  return v11;
}

- (UIImage)favicon
{
  return self->_favicon;
}

- (unint64_t)faviconType
{
  return self->_faviconType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favicon, 0);
}

@end
