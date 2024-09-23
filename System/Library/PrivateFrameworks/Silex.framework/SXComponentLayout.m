@implementation SXComponentLayout

- (uint64_t)sideForValue:(int)a3 withType:
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  v5 = a2;
  v6 = v5;
  if (!a1)
    goto LABEL_5;
  if (a3 == 3)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("left")) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_14;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("right")) & 1) != 0)
    {
      v8 = 2;
      goto LABEL_14;
    }
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("both"));
    goto LABEL_11;
  }
  if (a3 != 2)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_14;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_11:
  if (v7)
    v8 = 3;
  else
    v8 = 0;
LABEL_14:

  return v8;
}

- (unint64_t)ignoreViewportPaddingWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

- (unint64_t)ignoreDocumentMarginWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

- (unint64_t)ignoreDocumentGutterWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
  {
    v5 = &__block_literal_global_37;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponentLayout;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __56__SXComponentLayout_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("margin"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("padding")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXComponentLayout;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (unint64_t)horizontalContentAlignmentWithValue:(id)a3 withType:(int)a4
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
    -[SXJSONObject valueForLookupKey:](self, "valueForLookupKey:", CFSTR("padding"));
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

@end
