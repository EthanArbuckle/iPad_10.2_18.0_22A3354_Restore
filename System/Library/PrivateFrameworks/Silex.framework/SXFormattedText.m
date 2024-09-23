@implementation SXFormattedText

- (SXFormattedText)initWithText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SXFormattedText *v7;
  SXFormattedText *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v11 = CFSTR("text");
    v12[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)SXFormattedText;
    v7 = -[SXJSONObject initWithJSONObject:andVersion:](&v10, sel_initWithJSONObject_andVersion_, v6, 0);

    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SXFormattedText)textWithValue:(id)a3 withType:(int)a4
{
  id v5;
  void *v6;
  __CFString *v7;

  v5 = a3;
  v6 = v5;
  v7 = &stru_24D68E0F8;
  if (v5 && a4 == 3)
    v7 = (__CFString *)v5;

  return (SXFormattedText *)v7;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("inlineTextStyles")) & 1) != 0)
  {
    v5 = &__block_literal_global_3;
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("additions")))
    {
      +[SXClassFactory valueClassBlockForBaseClass:](SXClassFactory, "valueClassBlockForBaseClass:", objc_opt_class());
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___SXFormattedText;
      objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v6;
  }

  return v5;
}

uint64_t __54__SXFormattedText_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[SXFormattedText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; text: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFormattedText textStyle](self, "textStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SXFormattedText textStyle](self, "textStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; textStyle: %@"), v8);

  }
  -[SXFormattedText inlineTextStyles](self, "inlineTextStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXFormattedText inlineTextStyles](self, "inlineTextStyles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; inlineTextStyles: %lu"), objc_msgSend(v10, "count"));

  }
  -[SXFormattedText additions](self, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SXFormattedText additions](self, "additions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; additions: %lu"), objc_msgSend(v12, "count"));

  }
  if (-[SXFormattedText shouldWrapText](self, "shouldWrapText"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; wrap text"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)shouldWrapText
{
  return self->shouldWrapText;
}

- (void)setShouldWrapText:(BOOL)a3
{
  self->shouldWrapText = a3;
}

@end
