@implementation _TUIElementSymbolImagePlainBuilder

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
  objc_storeStrong((id *)&self->_imageModel, a3);
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_imageModel, 0);
}

@end
