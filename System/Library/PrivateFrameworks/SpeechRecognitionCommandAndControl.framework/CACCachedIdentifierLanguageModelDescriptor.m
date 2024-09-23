@implementation CACCachedIdentifierLanguageModelDescriptor

- (void)dealloc
{
  objc_super v3;

  RXRelease(self->_rxLanguageObject);
  v3.receiver = self;
  v3.super_class = (Class)CACCachedIdentifierLanguageModelDescriptor;
  -[CACCachedIdentifierLanguageModelDescriptor dealloc](&v3, sel_dealloc);
}

- (__RXLanguageObject)rxLanguageObject
{
  return self->_rxLanguageObject;
}

- (void)setRxLanguageObject:(__RXLanguageObject *)a3
{
  __RXLanguageObject *rxLanguageObject;

  rxLanguageObject = self->_rxLanguageObject;
  if (a3)
    CFRetain(a3);
  self->_rxLanguageObject = a3;
  RXRelease(rxLanguageObject);
}

- (CACLanguageModel)languageModel
{
  return (CACLanguageModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageModel, 0);
}

@end
