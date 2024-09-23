@implementation EQKitEnvironmentInstance

+ (id)environmentFromData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  EQKitEnvironmentInstance *v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = objc_opt_class();
  v5 = EQKitUtilDynamicCast(v4, objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, &v8, &v9));
  v6 = [EQKitEnvironmentInstance alloc];
  return -[EQKitEnvironmentInstance initWithConfig:](v6, "initWithConfig:", v5, v8, v9);
}

+ (id)defaultEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__EQKitEnvironmentInstance_defaultEnvironment__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (+[EQKitEnvironmentInstance defaultEnvironment]::onceToken != -1)
    dispatch_once(&+[EQKitEnvironmentInstance defaultEnvironment]::onceToken, block);
  return (id)+[EQKitEnvironmentInstance defaultEnvironment]::sInstance;
}

void __46__EQKitEnvironmentInstance_defaultEnvironment__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  EQKitEnvironmentInstance *v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("EQKitDefaultEnvironment"), CFSTR("plist"))));
  v4 = 0;
  v5 = 0;
  v1 = objc_opt_class();
  v2 = EQKitUtilDynamicCast(v1, objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v0, 0, &v5, &v4));
  v3 = [EQKitEnvironmentInstance alloc];
  +[EQKitEnvironmentInstance defaultEnvironment]::sInstance = -[EQKitEnvironmentInstance initWithConfig:](v3, "initWithConfig:", v2, v4, v5);

}

+ (id)dataForEnvironment:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v3 = (void *)objc_msgSend(a3, "newDictionaryForArchiving");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 100, 0, &v6);

  return v4;
}

- (EQKitEnvironmentInstance)initWithConfig:(id)a3
{
  EQKitEnvironmentInstance *v4;
  EQKit::Config::Operator::Dictionary *v5;
  NSURL *v6;
  uint64_t v7;
  NSDictionary *v8;
  uint64_t v9;
  NSNumber *v10;
  EQKit::Font::Manager *v11;
  uint64_t v12;
  NSDictionary *v13;
  EQKit::Kerning::Manager *v14;
  uint64_t v15;
  NSDictionary *v16;
  NSDictionary *v17;
  _BYTE v19[8];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EQKitEnvironmentInstance;
  v4 = -[EQKitEnvironmentInstance init](&v20, sel_init);
  if (v4)
  {
    v5 = (EQKit::Config::Operator::Dictionary *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("EQKitOperatorDictionary"), CFSTR("plist")));
    v4->mConfig = (NSDictionary *)objc_msgSend(a3, "copy");
    v4->mOperatorDictionary = EQKit::Config::Operator::Dictionary::dictionaryFromURL(v5, v6);
    v7 = objc_opt_class();
    v8 = (NSDictionary *)EQKitUtilDynamicCast(v7, (uint64_t)-[NSDictionary objectForKey:](v4->mConfig, "objectForKey:", CFSTR("fonts")));
    v9 = objc_opt_class();
    v10 = (NSNumber *)EQKitUtilDynamicCast(v9, (uint64_t)-[NSDictionary objectForKey:](v4->mConfig, "objectForKey:", CFSTR("version")));
    EQKit::Environment::Version::Version((EQKit::Environment::Version *)v19, v10);
    v11 = (EQKit::Font::Manager *)operator new();
    EQKit::Font::Manager::Manager(v11, v8, (const EQKit::Environment::Version *)v19);
    v4->mFontManager = (Manager *)v11;
    v12 = objc_opt_class();
    v13 = (NSDictionary *)EQKitUtilDynamicCast(v12, (uint64_t)-[NSDictionary objectForKey:](v4->mConfig, "objectForKey:", CFSTR("kerning")));
    v14 = (EQKit::Kerning::Manager *)operator new();
    EQKit::Kerning::Manager::Manager(v14, (const EQKit::Environment::Version *)v19, v13);
    v4->mKerningManager = v14;
    v15 = objc_opt_class();
    v16 = (NSDictionary *)EQKitUtilDynamicCast(v15, (uint64_t)-[NSDictionary objectForKey:](v4->mConfig, "objectForKey:", CFSTR("layout")));
    v4->mLayoutConfig = (Config *)EQKit::Layout::Config::newConfigFromDictionary((EQKit::Layout::Config *)v19, v16, v17);
  }
  return v4;
}

- (void)dealloc
{
  EQKit::Config::Operator::Dictionary *mOperatorDictionary;
  Manager *mFontManager;
  EQKit::Kerning::Manager *mKerningManager;
  Config *mLayoutConfig;
  objc_super v7;

  mOperatorDictionary = (EQKit::Config::Operator::Dictionary *)self->mOperatorDictionary;
  if (mOperatorDictionary)
  {
    EQKit::Config::Operator::Dictionary::~Dictionary(mOperatorDictionary);
    MEMORY[0x219A153B8]();
  }
  mFontManager = self->mFontManager;
  if (mFontManager)
    (*((void (**)(Manager *))mFontManager->var0 + 1))(mFontManager);
  mKerningManager = (EQKit::Kerning::Manager *)self->mKerningManager;
  if (mKerningManager)
  {
    EQKit::Kerning::Manager::~Manager(mKerningManager);
    MEMORY[0x219A153B8]();
  }
  mLayoutConfig = self->mLayoutConfig;
  if (mLayoutConfig)
    MEMORY[0x219A153B8](mLayoutConfig, 0x1000C4000313F17);
  v7.receiver = self;
  v7.super_class = (Class)EQKitEnvironmentInstance;
  -[EQKitEnvironmentInstance dealloc](&v7, sel_dealloc);
}

- (id)newDictionaryForArchiving
{
  return (id)-[NSDictionary copy](self->mConfig, "copy");
}

- (const)operatorDictionary
{
  return self->mOperatorDictionary;
}

- (const)fontManager
{
  return self->mFontManager;
}

- (const)kerningManager
{
  return self->mKerningManager;
}

- (const)layoutConfig
{
  return self->mLayoutConfig;
}

- (void)beginLayout
{
  EQKit::Font::Manager::beginLayout((uint64_t)self->mFontManager);
  EQKit::Kerning::Manager::beginLayout((uint64_t)self->mKerningManager);
}

- (void)endLayout
{
  EQKit::Kerning::Manager::endLayout((uint64_t ***)self->mKerningManager);
  EQKit::Font::Manager::endLayout((EQKit::Font::Manager *)self->mFontManager);
}

- (BOOL)kerning
{
  return *((_BYTE *)self->mKerningManager + 16);
}

- (void)setKerning:(BOOL)a3
{
  *((_BYTE *)self->mKerningManager + 16) = a3;
}

- (BOOL)fontsLoaded
{
  uint64_t v2;

  v2 = EQKit::Font::Manager::defaultCollection((EQKit::Font::Manager *)self->mFontManager);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 192))(v2);
}

@end
