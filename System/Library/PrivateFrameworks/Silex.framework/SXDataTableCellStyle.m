@implementation SXDataTableCellStyle

- (id)paddingWithValue:(id)a3 withType:(int)a4
{
  id v6;
  SXPadding *v7;
  void *v8;
  SXPadding *v9;
  void *v10;
  SXPadding *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6 && a4 == 5)
  {
    v7 = [SXPadding alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SXJSONObject initWithJSONObject:andVersion:](v7, "initWithJSONObject:andVersion:", v6, v8);

    v10 = v6;
  }
  else
  {
    -[SXDataTableElementStyle valueForLookupKey:](self, "valueForLookupKey:", CFSTR("padding"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      v11 = [SXPadding alloc];
      v15[0] = CFSTR("left");
      v15[1] = CFSTR("top");
      v16[0] = v10;
      v16[1] = v10;
      v15[2] = CFSTR("right");
      v15[3] = CFSTR("bottom");
      v16[2] = v10;
      v16[3] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXJSONObject specificationVersion](self, "specificationVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SXJSONObject initWithJSONObject:andVersion:](v11, "initWithJSONObject:andVersion:", v12, v13);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_36;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("selectors")) & 1) != 0)
  {
    v5 = &__block_literal_global_18;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("textStyles")) & 1) != 0)
  {
    v5 = &__block_literal_global_22;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableCellStyle;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke_3()
{
  return objc_opt_class();
}

- (unint64_t)verticalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("top")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("center")) & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("bottom")))
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)horizontalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("left")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("center")) & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("right")))
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)textStylesWithValue:(id)a3 withType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 4)
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  -[SXDataTableCellStyle textStyle](self, "textStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXDataTableCellStyle textStyle](self, "textStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

@end
