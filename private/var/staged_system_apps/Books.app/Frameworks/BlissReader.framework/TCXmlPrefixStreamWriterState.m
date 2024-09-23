@implementation TCXmlPrefixStreamWriterState

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCXmlPrefixStreamWriterState;
  -[TCXmlPrefixStreamWriterState dealloc](&v3, "dealloc");
}

- (NSString)elementPrefix
{
  return self->_elementPrefix;
}

- (void)setElementPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)attributePrefix
{
  return self->_attributePrefix;
}

- (void)setAttributePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
