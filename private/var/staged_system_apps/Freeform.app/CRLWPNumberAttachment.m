@implementation CRLWPNumberAttachment

- (id)stringEquivalent
{
  if (self->_stringValue)
    return self->_stringValue;
  else
    return &stru_1012A72B0;
}

- (id)stringEquivalentWithNumberProvider:(id)a3
{
  return &stru_1012A72B0;
}

- (id)stringWithNumber:(unint64_t)a3
{
  return &stru_1012A72B0;
}

- (void)setStringValue:(id)a3 forPasteboardController:(id)a4
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
