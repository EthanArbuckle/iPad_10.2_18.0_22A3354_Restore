@implementation _WBSFaviconRecord

+ (id)new
{
  return 0;
}

- (_WBSFaviconRecord)initWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 iconData:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  id v19;
  _WBSFaviconRecord *v20;
  _WBSFaviconRecord *v21;
  uint64_t v22;
  NSData *iconData;
  _WBSFaviconRecord *v24;
  objc_super v26;

  height = a7.height;
  width = a7.width;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_WBSFaviconRecord;
  v20 = -[_WBSFaviconRecord init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pageURL, a3);
    objc_storeStrong((id *)&v21->_originalPageURL, a4);
    objc_storeStrong((id *)&v21->_iconURL, a5);
    v22 = objc_msgSend(v19, "copy");
    iconData = v21->_iconData;
    v21->_iconData = (NSData *)v22;

    v21->_size.width = width;
    v21->_size.height = height;
    v21->_isPrivate = a8;
    v24 = v21;
  }

  return v21;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)originalPageURL
{
  return self->_originalPageURL;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSData)iconData
{
  return self->_iconData;
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

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_originalPageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
}

@end
