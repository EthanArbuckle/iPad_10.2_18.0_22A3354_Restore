@implementation OADFill

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

- (float)alpha
{
  return 1.0;
}

- (unint64_t)hash
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)usesPlaceholderColor
{
  return 0;
}

- (BOOL)isOverridden
{
  return !-[OADFill definedByStyle](self, "definedByStyle");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFill;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)definedByStyle
{
  return *((_BYTE *)&self->super + 18) & 1;
}

- (void)setDefinedByStyle:(BOOL)a3
{
  *((_BYTE *)&self->super + 18) = a3;
}

@end
