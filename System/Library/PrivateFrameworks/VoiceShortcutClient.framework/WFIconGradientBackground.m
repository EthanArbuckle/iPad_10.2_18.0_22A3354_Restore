@implementation WFIconGradientBackground

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFIconGradientBackground gradient](self, "gradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (WFIconGradientBackground)initWithGradient:(id)a3
{
  id v6;
  id *v7;
  WFIconGradientBackground *v8;
  WFIconGradientBackground *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIconBackground.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gradient"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFIconGradientBackground;
  v7 = -[WFIconBackground _init](&v12, sel__init);
  v8 = (WFIconGradientBackground *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[WFGradient hash](self->_gradient, "hash");
}

- (WFIconGradientBackground)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFIconGradientBackground *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFIconGradientBackground initWithGradient:](self, "initWithGradient:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_gradient, CFSTR("gradient"));
}

- (WFGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
