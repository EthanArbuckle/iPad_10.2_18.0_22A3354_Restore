@implementation PhotosGraphTestPHFace

- (PhotosGraphTestPHFace)init
{
  PhotosGraphTestPHFace *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PhotosGraphTestPHFace;
  result = -[PhotosGraphTestPHFace init](&v3, sel_init);
  if (result)
    result->_sexType = 0;
  return result;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (void)setSexType:(unsigned __int16)a3
{
  self->_sexType = a3;
}

@end
