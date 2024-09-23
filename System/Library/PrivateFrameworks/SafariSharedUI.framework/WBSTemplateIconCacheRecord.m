@implementation WBSTemplateIconCacheRecord

- (WBSTemplateIconCacheRecord)initWithHost:(id)a3 templateIconURL:(id)a4 themeColor:(id)a5 canSaveToDisk:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WBSTemplateIconCacheRecord *v13;
  uint64_t v14;
  NSString *host;
  uint64_t v16;
  NSURL *templateIconURL;
  WBSTemplateIconCacheRecord *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSTemplateIconCacheRecord;
  v13 = -[WBSTemplateIconCacheRecord init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    host = v13->_host;
    v13->_host = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    templateIconURL = v13->_templateIconURL;
    v13->_templateIconURL = (NSURL *)v16;

    objc_storeStrong((id *)&v13->_themeColor, a5);
    v13->_canSaveToDisk = a6;
    v18 = v13;
  }

  return v13;
}

- (NSString)host
{
  return self->_host;
}

- (NSURL)templateIconURL
{
  return self->_templateIconURL;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)canSaveToDisk
{
  return self->_canSaveToDisk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_templateIconURL, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
