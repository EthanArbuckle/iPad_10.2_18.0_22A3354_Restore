@implementation TUIElementVSpacer

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesSize](TUIAttributeSet, "supportedAttributesSize");
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(TUIVSpacer, a2);
}

@end
