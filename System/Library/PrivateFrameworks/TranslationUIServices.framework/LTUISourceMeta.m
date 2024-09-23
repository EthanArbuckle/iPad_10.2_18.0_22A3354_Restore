@implementation LTUISourceMeta

- (LTUISourceMeta)init
{
  LTUISourceMeta *v2;
  LTUISourceMeta *v3;
  NSArray *languageHints;
  LTUISourceMeta *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LTUISourceMeta;
  v2 = -[LTUISourceMeta init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_origin = 0;
    languageHints = v2->_languageHints;
    v2->_languageHints = (NSArray *)MEMORY[0x24BDBD1A8];

    v5 = v3;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v11[0] = CFSTR("origin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[LTUISourceMeta origin](self, "origin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("languageHints");
  v12[0] = v4;
  -[LTUISourceMeta languageHints](self, "languageHints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[LTUISourceMeta context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LTUISourceMeta context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("context"));

  }
  return v7;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)languageHints
{
  return self->_languageHints;
}

- (void)setLanguageHints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageHints, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
