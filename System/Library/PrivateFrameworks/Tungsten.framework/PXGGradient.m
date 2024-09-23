@implementation PXGGradient

- (PXGGradient)init
{
  void *v3;
  void *v4;
  PXGGradient *v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXGGradient initWithStartingColor:endingColor:direction:](self, "initWithStartingColor:endingColor:direction:", v3, v4, 0);

  return v5;
}

- (PXGGradient)initWithStartingColor:(id)a3 endingColor:(id)a4 direction:(int64_t)a5
{
  id v9;
  id v10;
  PXGGradient *v11;
  PXGGradient *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGGradient;
  v11 = -[PXGGradient init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startingColor, a3);
    objc_storeStrong((id *)&v12->_endingColor, a4);
    v12->_direction = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXGGradient startingColor](self, "startingColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXGGradient endingColor](self, "endingColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PXGGradient *v4;
  PXGGradient *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BOOL v11;

  v4 = (PXGGradient *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGGradient startingColor](self, "startingColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGGradient startingColor](v5, "startingColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[PXGGradient endingColor](self, "endingColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGGradient endingColor](v5, "endingColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = -[PXGGradient direction](self, "direction");
          v11 = v10 == -[PXGGradient direction](v5, "direction");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; startingColor = %@; endingColor = %@; direction = %ld>"),
    v5,
    self,
    self->_startingColor,
    self->_endingColor,
    self->_direction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIColor)startingColor
{
  return self->_startingColor;
}

- (UIColor)endingColor
{
  return self->_endingColor;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingColor, 0);
  objc_storeStrong((id *)&self->_startingColor, 0);
}

@end
