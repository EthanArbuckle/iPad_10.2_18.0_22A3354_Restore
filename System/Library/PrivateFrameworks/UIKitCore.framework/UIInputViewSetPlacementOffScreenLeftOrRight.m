@implementation UIInputViewSetPlacementOffScreenLeftOrRight

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  void *v5;
  objc_super v7;

  if (self->_otherPlacement)
  {
    -[UIInputViewSetPlacement verticalConstraintForInputViewSet:hostView:containerView:](self->_otherPlacement, "verticalConstraintForInputViewSet:hostView:containerView:", a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInputViewSetPlacementOffScreenLeftOrRight;
    -[UIInputViewSetPlacement verticalConstraintForInputViewSet:hostView:containerView:](&v7, sel_verticalConstraintForInputViewSet_hostView_containerView_, a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setOtherPlacement:(id)a3
{
  UIInputViewSetPlacement *otherPlacement;
  UIInputViewSetPlacement *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "showsInputViews") && (objc_msgSend(v6, "showsKeyboard") & 1) == 0)
  {
    v5 = (UIInputViewSetPlacement *)v6;
    otherPlacement = self->_otherPlacement;
    self->_otherPlacement = v5;
  }
  else
  {
    otherPlacement = self->_otherPlacement;
    self->_otherPlacement = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherPlacement, 0);
}

@end
