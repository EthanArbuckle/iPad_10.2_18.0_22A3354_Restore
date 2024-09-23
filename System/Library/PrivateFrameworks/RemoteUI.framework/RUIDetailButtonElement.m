@implementation RUIDetailButtonElement

- (RUIDetailButtonElement)initWithAttributes:(id)a3 parent:(id)a4
{
  RUIDetailButtonElement *v4;
  RUIDetailButtonElement *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RUIDetailButtonElement;
  v4 = -[RUIElement initWithAttributes:parent:](&v14, sel_initWithAttributes_parent_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RUIElement attributes](v4, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("editing"));

    if ((v8 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      -[RUIElement attributes](v5, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("visibility"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("notEditing"));

      if (v12)
        v9 = 2;
      else
        v9 = 0;
    }
    -[RUIDetailButtonElement setVisibility:](v5, "setVisibility:", v9);
  }
  return v5;
}

- (void)startActivityIndicator
{
  id v2;

  -[RUIElement parent](self, "parent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startActivityIndicator");

}

- (void)stopActivityIndicator
{
  id v2;

  -[RUIElement parent](self, "parent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopActivityIndicator");

}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

@end
