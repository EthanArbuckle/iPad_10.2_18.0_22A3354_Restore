@implementation SXDataTableStyleMatch

+ (id)matchWithStyle:(id)a3 andSelector:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:andSelector:", v7, v6);

  return v8;
}

- (SXDataTableStyleMatch)initWithStyle:(id)a3 andSelector:(id)a4
{
  id v7;
  id v8;
  SXDataTableStyleMatch *v9;
  SXDataTableStyleMatch *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDataTableStyleMatch;
  v9 = -[SXDataTableStyleMatch init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_selector, a4);
  }

  return v10;
}

- (SXDataTableElementStyle)style
{
  return self->_style;
}

- (SXJSONDataTableSelector)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
