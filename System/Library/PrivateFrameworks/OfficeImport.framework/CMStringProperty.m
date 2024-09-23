@implementation CMStringProperty

- (CMStringProperty)initWithString:(id)a3
{
  id v5;
  CMStringProperty *v6;
  CMStringProperty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMStringProperty;
  v6 = -[CMStringProperty init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->wdValue, a3);

  return v7;
}

- (id)cssStringForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "compare:", 0x24F3D6278);
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@;"), v4, self->wdValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSString CM_stringByAddingCSSEscapes](self->wdValue, "CM_stringByAddingCSSEscapes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("font-family:\"%@\";"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)value
{
  return self->wdValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wdValue, 0);
}

@end
