@implementation SXIssueCoverViewProvider

- (SXIssueCoverViewProvider)initWithLayoutAttributesFactory:(id)a3
{
  id v5;
  SXIssueCoverViewProvider *v6;
  SXIssueCoverViewProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXIssueCoverViewProvider;
  v6 = -[SXIssueCoverViewProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_layoutOptionsFactory, a3);

  return v7;
}

- (id)viewForIssueCover:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BDF6F90]);
}

- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  SXIssueCoverLayoutOptions *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  SXIssueCoverLayoutOptions *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SXIssueCoverLayoutOptions alloc];
  objc_msgSend(v8, "size");
  v13 = v12;

  v17 = -[SXIssueCoverLayoutOptions initWithBoundingWidth:](v11, "initWithBoundingWidth:", v13);
  -[SXIssueCoverViewProvider layoutOptionsFactory](self, "layoutOptionsFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createAttributesWithIssueCover:options:", v10, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "frame");
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.909803922, 0.909803922, 0.909803922, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v16);

}

- (SXIssueCoverLayoutAttributesFactory)layoutOptionsFactory
{
  return self->_layoutOptionsFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptionsFactory, 0);
}

@end
