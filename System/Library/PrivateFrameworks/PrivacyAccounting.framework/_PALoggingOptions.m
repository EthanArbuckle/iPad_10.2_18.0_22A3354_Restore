@implementation _PALoggingOptions

+ (unint64_t)defaultLoggingOptions
{
  if (qword_1ECDD3180 != -1)
    swift_once();
  return qword_1EE809598;
}

- (_TtC17PrivacyAccounting17_PALoggingOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PALoggingOptions();
  return -[_PALoggingOptions init](&v3, sel_init);
}

@end
