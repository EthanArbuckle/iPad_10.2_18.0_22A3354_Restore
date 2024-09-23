@implementation _UICalendarViewImageDecoration

- (_UICalendarViewImageDecoration)initWithImage:(id)a3 color:(id)a4 size:(int64_t)a5
{
  id v9;
  id v10;
  _UICalendarViewImageDecoration *v11;
  _UICalendarViewImageDecoration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UICalendarViewImageDecoration;
  v11 = -[_UICalendarViewImageDecoration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    objc_storeStrong((id *)&v12->_color, a4);
    v12->_size = a5;
  }

  return v12;
}

- (id)_decorationViewForReuseView:(id)a3
{
  _UICalendarDecorationImageView *v4;
  _UICalendarDecorationImageView *v5;
  void *v6;
  void *v7;

  v4 = (_UICalendarDecorationImageView *)a3;
  if (!v4 || (objc_opt_class(), v5 = v4, (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = objc_alloc_init(_UICalendarDecorationImageView);

  }
  -[_UICalendarDecorationImageView setDecorationSize:](v5, "setDecorationSize:", self->_size);
  if (self->_image)
  {
    -[UIImageView setImage:](v5, "setImage:");
  }
  else
  {
    -[_UICalendarViewImageDecoration defaultImage](self, "defaultImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v5, "setImage:", v6);

  }
  if (self->_color)
  {
    -[UIView setTintColor:](v5, "setTintColor:");
  }
  else
  {
    +[UIColor systemFillColor](UIColor, "systemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v5, "setTintColor:", v7);

  }
  return v5;
}

- (id)defaultImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_circleImage;
  if (!_circleImage)
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circlebadge.fill"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_circleImage;
    _circleImage = v3;

    v2 = (void *)_circleImage;
  }
  return v2;
}

- (id)_decorationViewReusableKey
{
  if (self->_image)
    return CFSTR("UICalendarViewDecoration.image");
  else
    return CFSTR("UICalendarViewDecoration.circle");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
