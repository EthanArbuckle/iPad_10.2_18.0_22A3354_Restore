@implementation RTTAbbreviationTapGestureRecognizer

- (void)ignoreTouch:(id)a3 forEvent:(id)a4
{
  id v4;

  -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTTAbbreviationTapGestureRecognizer;
  -[RTTAbbreviationTapGestureRecognizer touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", 1);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTTAbbreviationTapGestureRecognizer;
  -[RTTAbbreviationTapGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", 0);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RTTAbbreviationTapGestureRecognizer;
  v6 = a3;
  -[RTTAbbreviationTapGestureRecognizer touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHighlighted:", 0);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTTAbbreviationTapGestureRecognizer;
  -[RTTAbbreviationTapGestureRecognizer touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  -[RTTAbbreviationTapGestureRecognizer abbrevationView](self, "abbrevationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", 0);

}

- (RTTUIAbbreviationView)abbrevationView
{
  return (RTTUIAbbreviationView *)objc_loadWeakRetained((id *)&self->_abbrevationView);
}

- (void)setAbbrevationView:(id)a3
{
  objc_storeWeak((id *)&self->_abbrevationView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_abbrevationView);
}

@end
