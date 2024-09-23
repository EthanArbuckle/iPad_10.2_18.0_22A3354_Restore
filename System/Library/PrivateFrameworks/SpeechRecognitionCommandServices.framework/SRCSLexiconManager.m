@implementation SRCSLexiconManager

- (SRCSLexiconManager)initWithLocaleIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRCSLexiconManager;
  return -[SRCSLexiconManager init](&v4, sel_init, a3);
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
