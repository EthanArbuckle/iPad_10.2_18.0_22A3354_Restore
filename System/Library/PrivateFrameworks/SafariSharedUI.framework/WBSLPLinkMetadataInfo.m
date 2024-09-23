@implementation WBSLPLinkMetadataInfo

- (WBSLPLinkMetadataInfo)initWithURLString:(id)a3 uuidString:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSLPLinkMetadataInfo *v11;
  uint64_t v12;
  NSString *urlString;
  uint64_t v14;
  NSString *uuidString;
  uint64_t v16;
  NSDate *dateAdded;
  WBSLPLinkMetadataInfo *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSLPLinkMetadataInfo;
  v11 = -[WBSLPLinkMetadataInfo init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    urlString = v11->_urlString;
    v11->_urlString = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    uuidString = v11->_uuidString;
    v11->_uuidString = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    dateAdded = v11->_dateAdded;
    v11->_dateAdded = (NSDate *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
