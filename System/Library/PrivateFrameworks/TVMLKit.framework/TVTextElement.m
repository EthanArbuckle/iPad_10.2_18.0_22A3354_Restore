@implementation TVTextElement

- (NSAttributedString)attributedText
{
  void *v2;
  void *v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tv_attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (int64_t)textStyle
{
  void *v2;
  int64_t v3;

  -[TVViewElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tv_textStyle");

  return v3;
}

- (id)attributedStringWithFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TVViewElement element](self, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringWithFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[TVViewElement element](self, "element");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedStringWithFont:foregroundColor:textAlignment:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
