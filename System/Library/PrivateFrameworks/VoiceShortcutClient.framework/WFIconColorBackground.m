@implementation WFIconColorBackground

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

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
    -[WFIconColorBackground color](self, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
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

- (WFColor)color
{
  return self->_color;
}

+ (WFIconColorBackground)clearBackground
{
  WFIconColorBackground *v2;
  void *v3;
  WFIconColorBackground *v4;

  v2 = [WFIconColorBackground alloc];
  +[WFColor clearColor](WFColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFIconColorBackground initWithColor:](v2, "initWithColor:", v3);

  return v4;
}

- (WFIconColorBackground)initWithColor:(id)a3 blendMode:(int64_t)a4
{
  id v8;
  id *v9;
  WFIconColorBackground *v10;
  WFIconColorBackground *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIconBackground.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("color"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFIconColorBackground;
  v9 = -[WFIconBackground _init](&v14, sel__init);
  v10 = (WFIconColorBackground *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v10->_blendMode = a4;
    v11 = v10;
  }

  return v10;
}

- (WFIconColorBackground)initWithColor:(id)a3
{
  return -[WFIconColorBackground initWithColor:blendMode:](self, "initWithColor:blendMode:", a3, 0);
}

- (unint64_t)hash
{
  return -[WFColor hash](self->_color, "hash");
}

- (WFIconColorBackground)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFIconColorBackground *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFIconColorBackground initWithColor:](self, "initWithColor:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_color, CFSTR("color"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
