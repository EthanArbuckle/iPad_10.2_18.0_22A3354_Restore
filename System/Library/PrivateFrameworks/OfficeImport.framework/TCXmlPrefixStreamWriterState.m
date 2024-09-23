@implementation TCXmlPrefixStreamWriterState

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributePrefix, 0);
  objc_storeStrong((id *)&self->_elementPrefix, 0);
}

@end
