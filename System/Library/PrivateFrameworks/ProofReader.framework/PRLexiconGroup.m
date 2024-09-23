@implementation PRLexiconGroup

- (PRLexiconGroup)initWithLocalization:(id)a3 lexicons:(id)a4 cachedOnly:(BOOL)a5
{
  PRLexiconGroup *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRLexiconGroup;
  v8 = -[PRLexiconGroup init](&v10, sel_init);
  if (v8)
  {
    v8->_localization = (NSString *)objc_msgSend(a3, "copy");
    v8->_lexicons = (NSArray *)objc_msgSend(a4, "copy");
    v8->_cachedOnly = a5;
  }
  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  NSString *v5;
  const __CFString *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PRLexiconGroup;
  v4 = -[PRLexiconGroup description](&v8, sel_description);
  v5 = -[PRLexiconGroup localization](self, "localization");
  if (-[PRLexiconGroup cachedOnly](self, "cachedOnly"))
    v6 = CFSTR("-cachedOnly");
  else
    v6 = &stru_1EA8D8440;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@%@)%@"), v4, v5, v6, -[PRLexiconGroup lexicons](self, "lexicons"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRLexiconGroup;
  -[PRLexiconGroup dealloc](&v3, sel_dealloc);
}

- (NSString)localization
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)lexicons
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)cachedOnly
{
  return self->_cachedOnly;
}

@end
