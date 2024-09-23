@implementation SXComponentTextStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_84;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponentTextStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __59__SXComponentTextStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (int64_t)textAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("center")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("right")) & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("justified")))
  {
    v5 = 4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)lineHeightWithValue:(id)a3 withType:(int)a4
{
  if (a3)
    return objc_msgSend(a3, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)exactLineHeightWithValue:(id)a3 withType:(int)a4
{
  if (a3)
    return objc_msgSend(a3, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)relativeLineHeightWithValue:(id)a3 withType:(int)a4
{
  float v4;

  if (!a3)
    return 1.79769313e308;
  objc_msgSend(a3, "floatValue");
  return v4;
}

- (int64_t)hyphenationWithValue:(id)a3 withType:(int)a4
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v4, "BOOLValue"))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)hyphenationZoneWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;
  float v7;

  result = 18.0;
  if (a4 == 2)
  {
    objc_msgSend(a3, "floatValue", 18.0, v4, v5);
    return v7;
  }
  return result;
}

- (int64_t)hyphenationMinimumWordLengthWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "unsignedIntegerValue");
  else
    return 0;
}

- (int64_t)hyphenationMinimumCharactersBeforeWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "unsignedIntegerValue");
  else
    return 3;
}

- (int64_t)hyphenationMinimumCharactersAfterWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "unsignedIntegerValue");
  else
    return 3;
}

- (BOOL)fontScalingWithValue:(id)a3 withType:(int)a4
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

@end
