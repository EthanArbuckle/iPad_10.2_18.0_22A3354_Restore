@implementation _UIWebFileUploadItem

- (_UIWebFileUploadItem)initWithFilePath:(id)a3
{
  _UIWebFileUploadItem *v4;
  _UIWebFileUploadItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIWebFileUploadItem;
  v4 = -[_UIWebFileUploadItem init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_UIWebFileUploadItem setFilePath:](v4, "setFilePath:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIWebFileUploadItem setFilePath:](self, "setFilePath:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIWebFileUploadItem;
  -[_UIWebFileUploadItem dealloc](&v3, sel_dealloc);
}

- (id)displayImage
{
  return 0;
}

- (BOOL)isVideo
{
  return 0;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
