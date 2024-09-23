@implementation WBSFaviconProviderIconInfo

- (WBSFaviconProviderIconInfo)initWithPageURLString:(id)a3 iconURLString:(id)a4 UUIDString:(id)a5 dateAdded:(id)a6 size:(CGSize)a7 hasGeneratedResolutions:(BOOL)a8 isRejectedResource:(BOOL)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  WBSFaviconProviderIconInfo *v21;
  uint64_t v22;
  NSString *pageURLString;
  uint64_t v24;
  NSString *iconURLString;
  uint64_t v26;
  NSString *UUIDString;
  WBSFaviconProviderIconInfo *v28;
  objc_super v30;

  height = a7.height;
  width = a7.width;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WBSFaviconProviderIconInfo;
  v21 = -[WBSFaviconProviderIconInfo init](&v30, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v17, "copy");
    pageURLString = v21->_pageURLString;
    v21->_pageURLString = (NSString *)v22;

    v24 = objc_msgSend(v18, "copy");
    iconURLString = v21->_iconURLString;
    v21->_iconURLString = (NSString *)v24;

    v26 = objc_msgSend(v19, "copy");
    UUIDString = v21->_UUIDString;
    v21->_UUIDString = (NSString *)v26;

    objc_storeStrong((id *)&v21->_dateAdded, a6);
    v21->_size.width = width;
    v21->_size.height = height;
    v21->_hasGeneratedResolutions = a8;
    v21->_isRejectedResource = a9;
    v28 = v21;
  }

  return v21;
}

- (NSString)pageURLString
{
  return self->_pageURLString;
}

- (NSString)iconURLString
{
  return self->_iconURLString;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
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

- (BOOL)hasGeneratedResolutions
{
  return self->_hasGeneratedResolutions;
}

- (BOOL)isRejectedResource
{
  return self->_isRejectedResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_iconURLString, 0);
  objc_storeStrong((id *)&self->_pageURLString, 0);
}

@end
