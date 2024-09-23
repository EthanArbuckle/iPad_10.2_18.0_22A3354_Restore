@implementation CACRXLanguageObjectWrapper

- (CACRXLanguageObjectWrapper)initWithRXLanguageObject:(__RXLanguageObject *)a3
{
  CACRXLanguageObjectWrapper *v4;
  CACRXLanguageObjectWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACRXLanguageObjectWrapper;
  v4 = -[CACRXLanguageObjectWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_rxLanguageObject = a3;
    CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  RXRelease(self->_rxLanguageObject);
  v3.receiver = self;
  v3.super_class = (Class)CACRXLanguageObjectWrapper;
  -[CACRXLanguageObjectWrapper dealloc](&v3, sel_dealloc);
}

@end
