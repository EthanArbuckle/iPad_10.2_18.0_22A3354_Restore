@implementation UIKBTutorialConversationBubbleShadowLayer

- (UIKBTutorialConversationBubbleShadowLayer)initWithShadowType:(int64_t)a3
{
  UIKBTutorialConversationBubbleShadowLayer *v4;
  UIKBTutorialConversationBubbleShadowLayer *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBTutorialConversationBubbleShadowLayer;
  v4 = -[UIKBTutorialConversationBubbleShadowLayer init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shadowType = a3;
    v4->_userInterfaceStyle = 0;
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[UIKBTutorialConversationBubbleShadowLayer setShadowColor:](v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    -[UIKBTutorialConversationBubbleShadowLayer _updateShadowProperties](v5, "_updateShadowProperties");
  }
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[UIKBTutorialConversationBubbleShadowLayer _updateShadowProperties](self, "_updateShadowProperties");
  }
}

- (void)_updateShadowProperties
{
  int64_t v3;
  double v4;

  v3 = -[UIKBTutorialConversationBubbleShadowLayer _shadowStyleForShadowType:userInterfaceStyle:](self, "_shadowStyleForShadowType:userInterfaceStyle:", self->_shadowType, self->_userInterfaceStyle);
  -[UIKBTutorialConversationBubbleShadowLayer _opacityForShadowStyle:](self, "_opacityForShadowStyle:", v3);
  *(float *)&v4 = v4;
  -[UIKBTutorialConversationBubbleShadowLayer setShadowOpacity:](self, "setShadowOpacity:", v4);
  -[UIKBTutorialConversationBubbleShadowLayer _radiusForShadowStyle:](self, "_radiusForShadowStyle:", v3);
  -[UIKBTutorialConversationBubbleShadowLayer setShadowRadius:](self, "setShadowRadius:");
  -[UIKBTutorialConversationBubbleShadowLayer _offsetForShadowStyle:](self, "_offsetForShadowStyle:", v3);
  -[UIKBTutorialConversationBubbleShadowLayer setShadowOffset:](self, "setShadowOffset:");
}

- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  int64_t v4;

  v4 = 3;
  if (a3 != 1)
    v4 = 0;
  if (!a3)
    v4 = 1;
  if (a4 != 2)
    v4 = 0;
  if ((unint64_t)a4 >= 2)
    return v4;
  else
    return 2 * (a3 == 1);
}

- (double)_opacityForShadowStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 3)
    return dbl_186684D58[a3];
  return result;
}

- (double)_radiusForShadowStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 3)
    return dbl_186684D78[a3];
  return result;
}

- (CGSize)_offsetForShadowStyle:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  switch(a3)
  {
    case 0:
      v4 = 8.0;
      break;
    case 1:
      v4 = 6.0;
      break;
    case 2:
    case 3:
      v3 = *MEMORY[0x1E0C9D820];
      v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
    default:
      v4 = 0.0;
      break;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
