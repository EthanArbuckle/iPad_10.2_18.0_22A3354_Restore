@implementation OCIFontState

- (OCIFontState)init
{
  OCIFontState *v2;
  uint64_t v3;
  NSMutableDictionary *replacedFontMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OCIFontState;
  v2 = -[OCIFontState init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    replacedFontMap = v2->_replacedFontMap;
    v2->_replacedFontMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSMutableDictionary)replacedFontMap
{
  return self->_replacedFontMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedFontMap, 0);
}

@end
