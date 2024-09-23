@implementation UGCUserUploadedPhotoInfo

- (UGCUserUploadedPhotoInfo)initWithURL:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  UGCUserUploadedPhotoInfo *v9;
  UGCUserUploadedPhotoInfo *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UGCUserUploadedPhotoInfo;
  v9 = -[UGCUserUploadedPhotoInfo init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_size.width = width;
    v9->_size.height = height;
    objc_storeStrong((id *)&v9->_url, a3);
  }

  return v10;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
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
