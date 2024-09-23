@implementation TVTextLayout

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6;
  id v7;
  TVTextLayout *v8;
  TVTextLayout *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = (TVTextLayout *)v6;
  v9 = v8;
  if (!v8)
    v9 = objc_alloc_init(TVTextLayout);
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___TVTextLayout;
  v10 = objc_msgSendSuper2(&v15, sel_layoutWithLayout_element_, v9, v7);
  objc_msgSend(v7, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_textHighlightStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "tv_textHighlightStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVTextLayout setTextHighlightStyle:](v9, "setTextHighlightStyle:", v13);

  }
  return v9;
}

- (NSString)textHighlightStyle
{
  return self->_textHighlightStyle;
}

- (void)setTextHighlightStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textHighlightStyle, 0);
}

@end
