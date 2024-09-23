@implementation TCVegaCSSStyleDeclaration

- (TCVegaCSSStyleDeclaration)init
{
  TCVegaCSSStyleDeclaration *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCVegaCSSStyleDeclaration;
  v2 = -[TCVegaCSSStyleDeclaration init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD17C8]);
    -[TCVegaCSSStyleDeclaration setCursor:](v2, "setCursor:", v3);

  }
  return v2;
}

- (NSString)cursor
{
  return self->cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->cursor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cursor, 0);
}

@end
