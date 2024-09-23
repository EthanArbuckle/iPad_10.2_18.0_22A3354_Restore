@implementation SBFixedLayoutModeSwitcherModifier

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFixedLayoutModeSwitcherModifier;
  -[SBFixedLayoutModeSwitcherModifier animationAttributesForLayoutElement:](&v7, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setLayoutUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setPositionUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setScaleUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setOpacityUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setCornerRadiusUpdateMode:", self->_updateMode);
  objc_msgSend(v5, "setClippingUpdateMode:", self->_updateMode);
  return v5;
}

- (SBFixedLayoutModeSwitcherModifier)initWithUpdateMode:(int64_t)a3
{
  SBFixedLayoutModeSwitcherModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFixedLayoutModeSwitcherModifier;
  result = -[SBSwitcherModifier init](&v5, sel_init);
  if (result)
    result->_updateMode = a3;
  return result;
}

@end
