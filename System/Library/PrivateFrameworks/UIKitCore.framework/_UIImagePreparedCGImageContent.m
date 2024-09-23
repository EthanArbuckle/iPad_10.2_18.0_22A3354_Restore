@implementation _UIImagePreparedCGImageContent

- (void)dealloc
{
  objc_super v3;

  CARenderRelease();
  v3.receiver = self;
  v3.super_class = (Class)_UIImagePreparedCGImageContent;
  -[_UIImageCGImageContent dealloc](&v3, sel_dealloc);
}

- (BOOL)isPreparedCGImage
{
  return 1;
}

- (id)typeName
{
  return CFSTR("prepared CGImage");
}

@end
