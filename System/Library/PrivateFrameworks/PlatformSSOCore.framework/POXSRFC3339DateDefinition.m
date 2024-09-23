@implementation POXSRFC3339DateDefinition

- (id)valueFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = valueFromString__onceToken_2;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&valueFromString__onceToken_2, &__block_literal_global_17);
  objc_msgSend((id)valueFromString__dateTimeFormatter, "dateFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__POXSRFC3339DateDefinition_valueFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)valueFromString__dateTimeFormatter;
  valueFromString__dateTimeFormatter = (uint64_t)v0;

  return objc_msgSend((id)valueFromString__dateTimeFormatter, "setFormatOptions:", 3955);
}

- (id)stringFromValue:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = stringFromValue__onceToken_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringFromValue__onceToken_0, &__block_literal_global_1_0);
  objc_msgSend((id)stringFromValue__dateTimeFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__POXSRFC3339DateDefinition_stringFromValue___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)stringFromValue__dateTimeFormatter;
  stringFromValue__dateTimeFormatter = (uint64_t)v0;

  return objc_msgSend((id)stringFromValue__dateTimeFormatter, "setFormatOptions:", 3955);
}

@end
