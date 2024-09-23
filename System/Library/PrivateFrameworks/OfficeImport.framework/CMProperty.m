@implementation CMProperty

- (CMProperty)initWithCssString:(id)a3
{
  id v5;
  CMProperty *v6;
  CMProperty *v7;
  CMProperty *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMProperty;
  v6 = -[CMProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->cachedCssString, a3);
    v8 = v7;
  }

  return v7;
}

- (id)cssString
{
  return 0;
}

- (id)cachedCssStringForName:(id)a3
{
  id v4;
  NSString *cachedCssString;
  void *v6;

  v4 = a3;
  cachedCssString = self->cachedCssString;
  if (cachedCssString)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@;"), v4, cachedCssString);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)cssStringForName:(id)a3
{
  return 0;
}

- (int)compareValue:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedCssString, 0);
}

@end
