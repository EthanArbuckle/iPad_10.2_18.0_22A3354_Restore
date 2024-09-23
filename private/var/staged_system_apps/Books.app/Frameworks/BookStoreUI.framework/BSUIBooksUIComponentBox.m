@implementation BSUIBooksUIComponentBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(_BSUIBooksUIComponentBoxLayout, a2);
}

- (NSDictionary)rawComponentModel
{
  return self->_rawComponentModel;
}

- (void)setRawComponentModel:(id)a3
{
  objc_storeStrong((id *)&self->_rawComponentModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawComponentModel, 0);
}

@end
