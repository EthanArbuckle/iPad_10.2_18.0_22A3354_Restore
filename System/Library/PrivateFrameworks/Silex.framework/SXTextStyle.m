@implementation SXTextStyle

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("fontAttributes")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXTextStyle;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("listStyle")) & 1) != 0)
  {
    v5 = &__block_literal_global_83;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_7_2;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXTextStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __50__SXTextStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __50__SXTextStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

- (int64_t)textTransformWithValue:(id)a3 withType:(int)a4
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("uppercase")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("lowercase")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("capitalize")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("smallcaps")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)verticalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("baseline")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("superscript")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("subscript")))
    {
      v6 = 3;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)fontSizeWithValue:(id)a3 withType:(int)a4
{
  if (a3)
    return objc_msgSend(a3, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

@end
