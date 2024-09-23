@implementation WFShortcutBookmarksDescriptor

- (WFShortcutBookmarksDescriptor)initWithWorkflowID:(id)a3 path:(id)a4 bookmarkData:(id)a5
{
  id v9;
  id v10;
  WFShortcutBookmarksDescriptor *v11;
  WFShortcutBookmarksDescriptor *v12;
  WFShortcutBookmarksDescriptor *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFShortcutBookmarksDescriptor;
  v11 = -[WFShortcutBookmarksDescriptor initWithIdentifier:objectType:](&v15, sel_initWithIdentifier_objectType_, a3, 7);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a4);
    objc_storeStrong((id *)&v12->_bookmarkData, a5);
    v13 = v12;
  }

  return v12;
}

- (WFShortcutBookmarksDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFShortcutBookmarksDescriptor *v5;
  uint64_t v6;
  NSString *path;
  uint64_t v8;
  NSData *bookmarkData;
  WFShortcutBookmarksDescriptor *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFShortcutBookmarksDescriptor;
  v5 = -[WFShortcutBookmarksDescriptor initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkData"));
    v8 = objc_claimAutoreleasedReturnValue();
    bookmarkData = v5->_bookmarkData;
    v5->_bookmarkData = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFShortcutBookmarksDescriptor;
  v4 = a3;
  -[WFShortcutBookmarksDescriptor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFShortcutBookmarksDescriptor path](self, "path", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("path"));

  -[WFShortcutBookmarksDescriptor bookmarkData](self, "bookmarkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bookmarkData"));

}

- (NSData)bookmarkData
{
  return self->_bookmarkData;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
