@implementation UIInputViewSetPlacementWrapper

+ (id)placementWithPlacement:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 5, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIInputViewSetPlacementWrapper)initWithCoder:(id)a3
{
  id v4;
  UIInputViewSetPlacementWrapper *v5;
  uint64_t v6;
  UIInputViewSetPlacement *actualPlacement;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementWrapper;
  v5 = -[UIInputViewSetPlacement initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Actual"));
    v6 = objc_claimAutoreleasedReturnValue();
    actualPlacement = v5->_actualPlacement;
    v5->_actualPlacement = (UIInputViewSetPlacement *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewSetPlacementWrapper;
  v4 = a3;
  -[UIInputViewSetPlacement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_actualPlacement, CFSTR("Actual"), v5.receiver, v5.super_class);

}

- (void)setDirty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacementWrapper;
  -[UIInputViewSetPlacement setDirty](&v3, sel_setDirty);
  -[UIInputViewSetPlacement setDirty](self->_actualPlacement, "setDirty");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementWrapper;
  if (-[UIInputViewSetPlacement isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[UIInputViewSetPlacement isEqual:](self->_actualPlacement, "isEqual:", v4[5]);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isUndocked
{
  return -[UIInputViewSetPlacement isUndocked](self->_actualPlacement, "isUndocked");
}

- (BOOL)isVisible
{
  return -[UIInputViewSetPlacement isVisible](self->_actualPlacement, "isVisible");
}

- (BOOL)showsInputViews
{
  return -[UIInputViewSetPlacement showsInputViews](self->_actualPlacement, "showsInputViews");
}

- (BOOL)showsKeyboard
{
  return -[UIInputViewSetPlacement showsKeyboard](self->_actualPlacement, "showsKeyboard");
}

- (BOOL)showsInputOrAssistantViews
{
  return -[UIInputViewSetPlacement showsInputOrAssistantViews](self->_actualPlacement, "showsInputOrAssistantViews");
}

- (BOOL)showsEditItems
{
  return -[UIInputViewSetPlacement showsEditItems](self->_actualPlacement, "showsEditItems");
}

- (BOOL)isInteractive
{
  return -[UIInputViewSetPlacement isInteractive](self->_actualPlacement, "isInteractive");
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return -[UIInputViewSetPlacement horizontalConstraintForInputViewSet:hostView:containerView:](self->_actualPlacement, "horizontalConstraintForInputViewSet:hostView:containerView:", a3, a4, a5);
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return -[UIInputViewSetPlacement verticalConstraintForInputViewSet:hostView:containerView:](self->_actualPlacement, "verticalConstraintForInputViewSet:hostView:containerView:", a3, a4, a5);
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return -[UIInputViewSetPlacement widthConstraintForInputViewSet:hostView:containerView:](self->_actualPlacement, "widthConstraintForInputViewSet:hostView:containerView:", a3, a4, a5);
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  double result;

  -[UIInputViewSetPlacement inputAssistantViewHeightForInputViewSet:](self->_actualPlacement, "inputAssistantViewHeightForInputViewSet:", a3);
  return result;
}

- (BOOL)inputViewWillAppear
{
  return -[UIInputViewSetPlacement inputViewWillAppear](self->_actualPlacement, "inputViewWillAppear");
}

- (BOOL)accessoryViewWillAppear
{
  return -[UIInputViewSetPlacement accessoryViewWillAppear](self->_actualPlacement, "accessoryViewWillAppear");
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIInputViewSetPlacement remoteIntrinsicContentSizeForInputViewInSet:includingIAV:](self->_actualPlacement, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)alpha
{
  double result;

  -[UIInputViewSetPlacement alpha](self->_actualPlacement, "alpha");
  return result;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_actualPlacement;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return -[UIInputViewSetPlacement applicatorClassForKeyboard:](self->_actualPlacement, "applicatorClassForKeyboard:", a3);
}

- (id)applicatorInfoForOwner:(id)a3
{
  return -[UIInputViewSetPlacement applicatorInfoForOwner:](self->_actualPlacement, "applicatorInfoForOwner:", a3);
}

- (id)subPlacements
{
  return -[UIInputViewSetPlacement subPlacements](self->_actualPlacement, "subPlacements");
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  return -[UIInputViewSetPlacement indexForPurpose:](self->_actualPlacement, "indexForPurpose:", a3);
}

- (unint64_t)computeComparisonMask
{
  return -[UIInputViewSetPlacement computeComparisonMask](self->_actualPlacement, "computeComparisonMask");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ actual:%@>"), objc_opt_class(), self->_actualPlacement);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualPlacement, 0);
}

@end
