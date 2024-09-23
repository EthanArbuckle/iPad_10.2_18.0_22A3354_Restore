@implementation RWIProtocolPageFrameResource

- (RWIProtocolPageFrameResource)initWithUrl:(id)a3 type:(int64_t)a4 mimeType:(id)a5
{
  id v8;
  id v9;
  RWIProtocolPageFrameResource *v10;
  RWIProtocolPageFrameResource *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RWIProtocolPageFrameResource;
  v10 = -[RWIProtocolJSONObject init](&v13, sel_init);
  if (v10)
  {
    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("url"));
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("mimeType"));
    -[RWIProtocolPageFrameResource setUrl:](v10, "setUrl:", v8);
    -[RWIProtocolPageFrameResource setType:](v10, "setType:", a4);
    -[RWIProtocolPageFrameResource setMimeType:](v10, "setMimeType:", v9);
    v11 = v10;
  }

  return v10;
}

- (void)setUrl:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("url"));
}

- (NSString)url
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("url"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setType:(int64_t)a3
{
  __CFString *v4;
  _DWORD *v5;
  objc_super v6;
  _DWORD *v7;

  Inspector::toProtocolString(a3);
  if (v7)
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_24DE03408;
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setString:forKey:](&v6, sel_setString_forKey_, v4, CFSTR("type"));

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2)
      WTF::StringImpl::destroy();
    else
      *v5 -= 2;
  }
}

- (int64_t)type
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
  v9.super_class = (Class)RWIProtocolPageFrameResource;
  v2 = -[RWIProtocolJSONObject stringForKey:](&v9, sel_stringForKey_, CFSTR("type"));
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
  for (i = 0; i != 36; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 1]))
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
  while (i == 36);
  v6 = (&Inspector::fromProtocolString<RWIProtocolPageResourceType>(WTF::String const&)::mappings)[i + 2];
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

- (void)setMimeType:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("mimeType"));
}

- (NSString)mimeType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("mimeType"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFailed:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("failed"));
}

- (BOOL)failed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("failed"));
}

- (void)setCanceled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("canceled"));
}

- (BOOL)canceled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("canceled"));
}

- (void)setSourceMapURL:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("sourceMapURL"));
}

- (NSString)sourceMapURL
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("sourceMapURL"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTargetId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("targetId"));
}

- (NSString)targetId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolPageFrameResource;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("targetId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
