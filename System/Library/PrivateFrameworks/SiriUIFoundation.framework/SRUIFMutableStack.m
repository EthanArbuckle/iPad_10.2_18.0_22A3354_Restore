@implementation SRUIFMutableStack

- (void)pushObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SRUIFStack _elements](self, "_elements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)popTopObject
{
  void *v3;
  void *v4;

  -[SRUIFStack topObject](self, "topObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFStack _elements](self, "_elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLastObject");

  return v3;
}

- (void)popObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  char v11;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  if (v4)
  {
    v11 = 0;
    -[SRUIFStack _elements](self, "_elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = v6 - 1;
      do
      {
        -[SRUIFMutableStack popTopObject](self, "popTopObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v8, &v11);

        v9 = v7-- != 0;
      }
      while (v9 && !v11);
    }
  }
  else
  {
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_FAULT))
      -[SRUIFMutableStack popObjectsUsingBlock:].cold.1(v10);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SRUIFStack initWithStack:]([SRUIFStack alloc], "initWithStack:", self);
}

- (void)popObjectsUsingBlock:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SRUIFMutableStack popObjectsUsingBlock:]";
  _os_log_fault_impl(&dword_219F26000, log, OS_LOG_TYPE_FAULT, "%s nil block provided to pop stack; returning",
    (uint8_t *)&v1,
    0xCu);
}

@end
