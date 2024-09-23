@implementation PLPublishAlbum

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPublishAlbum;
  -[PLPublishAlbum dealloc](&v3, sel_dealloc);
}

- (int64_t)compare:(id)a3
{
  return -[NSString localizedCaseInsensitiveCompare:](self->_title, "localizedCaseInsensitiveCompare:", *((_QWORD *)a3 + 1));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
