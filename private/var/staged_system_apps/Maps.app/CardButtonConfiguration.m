@implementation CardButtonConfiguration

- (CardButtonConfiguration)init
{
  CardButtonConfiguration *result;
  CGFloat v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CardButtonConfiguration;
  result = -[CardButtonConfiguration init](&v4, "init");
  if (result)
  {
    v3 = *(double *)&qword_1014B7628;
    *(_QWORD *)&result->_insets.top = qword_1014B7628;
    result->_insets.left = v3;
    result->_insets.bottom = v3;
    result->_insets.right = v3;
  }
  return result;
}

+ (CardButtonConfiguration)close
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 0);
}

+ (CardButtonConfiguration)edit
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 4);
}

+ (CardButtonConfiguration)addRoute
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 7);
}

+ (CardButtonConfiguration)ttr
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 8);
}

+ (CardButtonConfiguration)customRouteReverse
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 9);
}

+ (CardButtonConfiguration)customRouteOutAndBack
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 11);
}

+ (CardButtonConfiguration)customRouteCloseLoop
{
  return (CardButtonConfiguration *)_objc_msgSend(a1, "withType:", 10);
}

+ (id)withType:(unint64_t)a3
{
  CardButtonConfiguration *v4;

  v4 = objc_opt_new(CardButtonConfiguration);
  -[CardButtonConfiguration setType:](v4, "setType:", a3);
  return v4;
}

- (id)withType:(unint64_t)a3
{
  -[CardButtonConfiguration setType:](self, "setType:", a3);
  return self;
}

- (id)withBlurred:(BOOL)a3
{
  -[CardButtonConfiguration setBlurred:](self, "setBlurred:", a3);
  return self;
}

- (id)withTintColor:(id)a3
{
  -[CardButtonConfiguration setTintColor:](self, "setTintColor:", a3);
  return self;
}

- (id)withInsets:(UIEdgeInsets)a3
{
  -[CardButtonConfiguration setInsets:](self, "setInsets:", a3.top, a3.left, a3.bottom, a3.right);
  return self;
}

- (id)withSystemImageNamed:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[CardButtonConfiguration setSystemImageName:](self, "setSystemImageName:", v4);

  return self;
}

- (id)withToolTip:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[CardButtonConfiguration setToolTip:](self, "setToolTip:", v4);

  return self;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)blurred
{
  return self->_blurred;
}

- (void)setBlurred:(BOOL)a3
{
  self->_blurred = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (void)setToolTip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)hoverBackgroundColor
{
  return self->_hoverBackgroundColor;
}

- (void)setHoverBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_hoverBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_toolTip, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
