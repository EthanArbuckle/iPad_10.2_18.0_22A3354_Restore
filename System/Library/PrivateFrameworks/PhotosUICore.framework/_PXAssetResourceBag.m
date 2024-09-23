@implementation _PXAssetResourceBag

- (_PXAssetResourceBag)initWithResourceType:(int64_t)a3 atURL:(id)a4
{
  id v7;
  _PXAssetResourceBag *v8;
  _PXAssetResourceBag *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_PXAssetResourceBag;
  v8 = -[_PXAssetResourceBag init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_resourceType = a3;
    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v9;
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
