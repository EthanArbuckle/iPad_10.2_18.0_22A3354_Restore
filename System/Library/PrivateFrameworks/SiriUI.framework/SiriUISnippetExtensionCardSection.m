@implementation SiriUISnippetExtensionCardSection

- (SiriUISnippetExtensionCardSection)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetExtensionCardSection;
  return -[SiriUILegacyCardSection init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
