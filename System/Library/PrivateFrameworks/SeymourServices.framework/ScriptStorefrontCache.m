@implementation ScriptStorefrontCache

- (_TtC15SeymourServices21ScriptStorefrontCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScriptStorefrontCache();
  return -[ScriptStorefrontCache init](&v3, sel_init);
}

- (NSString)storefrontLanguageCode
{
  void *v3;
  _TtC15SeymourServices21ScriptStorefrontCache *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_standardUserDefaults);
  sub_1CF1500B8();
  v6 = (void *)sub_1CF151B4C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_stringForKey_, v6);

  if (v7)
  {
    sub_1CF151B70();

    v8 = (void *)sub_1CF151B4C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

@end
