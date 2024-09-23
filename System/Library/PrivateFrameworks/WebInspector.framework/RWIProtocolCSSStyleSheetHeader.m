@implementation RWIProtocolCSSStyleSheetHeader

- (RWIProtocolCSSStyleSheetHeader)initWithStyleSheetId:(id)a3 frameId:(id)a4 sourceURL:(id)a5 origin:(int64_t)a6 title:(id)a7 disabled:(BOOL)a8 isInline:(BOOL)a9 startLine:(double)a10 startColumn:(double)a11
{
  _BOOL8 v13;
  id v19;
  id v20;
  id v21;
  id v22;
  RWIProtocolCSSStyleSheetHeader *v23;
  RWIProtocolCSSStyleSheetHeader *v24;
  objc_super v26;

  v13 = a8;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v23 = -[RWIProtocolJSONObject init](&v26, sel_init);
  if (v23)
  {
    if (!v19)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("styleSheetId"));
    if (!v20)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("frameId"));
    if (!v21)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("sourceURL"));
    if (!v22)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("title"));
    -[RWIProtocolCSSStyleSheetHeader setStyleSheetId:](v23, "setStyleSheetId:", v19);
    -[RWIProtocolCSSStyleSheetHeader setFrameId:](v23, "setFrameId:", v20);
    -[RWIProtocolCSSStyleSheetHeader setSourceURL:](v23, "setSourceURL:", v21);
    -[RWIProtocolCSSStyleSheetHeader setOrigin:](v23, "setOrigin:", a6);
    -[RWIProtocolCSSStyleSheetHeader setTitle:](v23, "setTitle:", v22);
    -[RWIProtocolCSSStyleSheetHeader setDisabled:](v23, "setDisabled:", v13);
    -[RWIProtocolCSSStyleSheetHeader setIsInline:](v23, "setIsInline:", a9);
    -[RWIProtocolCSSStyleSheetHeader setStartLine:](v23, "setStartLine:", a10);
    -[RWIProtocolCSSStyleSheetHeader setStartColumn:](v23, "setStartColumn:", a11);
    v24 = v23;
  }

  return v23;
}

- (void)setStyleSheetId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("styleSheetId"));
}

- (NSString)styleSheetId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("styleSheetId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFrameId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("frameId"));
}

- (NSString)frameId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("frameId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSourceURL:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("sourceURL"));
}

- (NSString)sourceURL
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("sourceURL"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOrigin:(int64_t)a3
{
  __asm { BR              X9 }
}

- (int64_t)origin
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t i;
  char *v6;
  _DWORD *v7;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("origin"));
  MEMORY[0x2207574E0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    v4 = 0x100000000;
  }
  for (i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 12);
  v6 = (&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  v10 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
  return (int64_t)v6;
}

- (void)setTitle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("title"));
}

- (NSString)title
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("title"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDisabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("disabled"));
}

- (BOOL)disabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("disabled"));
}

- (void)setIsInline:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isInline"));
}

- (BOOL)isInline
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isInline"));
}

- (void)setStartLine:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("startLine"), a3);
}

- (double)startLine
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("startLine"));
  return result;
}

- (void)setStartColumn:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("startColumn"), a3);
}

- (double)startColumn
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("startColumn"));
  return result;
}

@end
