@implementation CACTextInsertionSpecifier

- (NSString)insertedString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInsertedString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_NSRange)insertedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_insertedRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setInsertedRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_insertedRange, &v3, 16, 1, 0);
}

- (AXElement)axElement
{
  return (AXElement *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAxElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)commandIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommandIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)recognizedParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecognizedParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)insertedCategoryID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInsertedCategoryID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedCategoryID, 0);
  objc_storeStrong((id *)&self->_recognizedParams, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_axElement, 0);
  objc_storeStrong((id *)&self->_insertedString, 0);
}

@end
