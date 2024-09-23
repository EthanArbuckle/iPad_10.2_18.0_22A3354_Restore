@implementation PTRowAction

+ (PTRowAction)actionWithHandler:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[1];
  v4[1] = v5;

  return (PTRowAction *)v4;
}

- (id)handler
{
  id handler;
  void *v4;
  void *v5;

  handler = self->_handler;
  if (handler)
  {
    v4 = (void *)MEMORY[0x1BCCC265C](handler, a2);
  }
  else
  {
    -[PTRowAction defaultHandler](self, "defaultHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1BCCC265C]();

  }
  return v4;
}

- (BOOL)deselectsRowOnSuccess
{
  return 1;
}

- (id)defaultHandler
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEncodable
{
  return self->_handler == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsEncodable:(BOOL)a3
{
  self->_isEncodable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
