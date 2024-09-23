@implementation PCNativeButton

- (id)initWithButton:(id)a3
{
  id v4;
  PCNativeButton *v5;
  PCNativeButton *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[PCNativeButton init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    -[PCNativeButton setType:](v5, "setType:", (int)objc_msgSend(v4, "predefined"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    -[PCNativeButton setText:](v6, "setText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessText"));
    -[PCNativeButton setAccessibleText:](v6, "setAccessibleText:", v8);

    v9 = objc_alloc((Class)PCNativeButtonStyle);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonStyle"));
    v11 = objc_msgSend(v9, "initWithButtonStyle:", v10);
    -[PCNativeButton setStyle:](v6, "setStyle:", v11);

  }
  return v6;
}

@end
