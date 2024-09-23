@implementation SBHIconImageAppearanceStoreTintedValue

- (_QWORD)initWithValue:(void *)a3 imageAppearance:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBHIconImageAppearanceStoreTintedValue;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_value, "hash");
  return -[SBHIconImageAppearance hash](self->_imageAppearance, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconImageAppearanceStoreTintedValue *v4;
  void *v5;
  char isKindOfClass;
  SBHIconImageAppearanceStoreTintedValue *v7;
  char v8;

  v4 = (SBHIconImageAppearanceStoreTintedValue *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (BSEqualObjects())
        v8 = BSEqualObjects();
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
