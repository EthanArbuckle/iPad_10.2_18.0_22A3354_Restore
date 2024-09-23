@implementation SSNameFormatManager

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)sharedNameFormatManager;
    sharedNameFormatManager = v2;

  }
}

- (SSNameFormatManager)init
{
  SSNameFormatManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSNameFormatManager;
  v2 = -[SSNameFormatManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SSNameFormatManager setPersonNameComponentsFormatter:](v2, "setPersonNameComponentsFormatter:", v3);

  }
  return v2;
}

+ (id)personNameComponentsFromString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", a3);
}

+ (id)contactFromName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "personNameComponentsFromString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "overrideComponentsInContact:", v4);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (NSPersonNameComponentsFormatter)personNameComponentsFormatter
{
  return (NSPersonNameComponentsFormatter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersonNameComponentsFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNameComponentsFormatter, 0);
}

@end
