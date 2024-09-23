@implementation NavSecondaryDrivingSignView

- (id)_defaultSignLayoutDelegate
{
  return +[NavSignLayoutDelegateManager secondarySignLayoutDelegateForDriving](NavSignLayoutDelegateManager, "secondarySignLayoutDelegateForDriving");
}

- (void)_setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavSecondaryDrivingSignView;
  -[NavManeuverSignView _setupSubviews](&v11, "_setupSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v3, "setLineBreakMode:", 4);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v4, "setShouldRemoveTextStartingAtFirstNewline:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v5, "setInlineShieldAlpha:", 0.800000012);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  objc_msgSend(v6, "setAlpha:", 0.800000012);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverView](self, "maneuverView"));
  LODWORD(v10) = 1144750080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v10);

}

- (void)_updateLabelText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  objc_msgSend(v3, "setTextAlternatives:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView maneuverGuidanceInfo](self, "maneuverGuidanceInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minorTextAlternatives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  objc_msgSend(v5, "setTextAlternatives:", v4);

}

- (void)_setManeuverGuidanceInfo:(id)a3 mirroredPrimary:(BOOL)a4
{
  objc_super v4;

  self->_showMirroredPrimaryManeuver = a4;
  v4.receiver = self;
  v4.super_class = (Class)NavSecondaryDrivingSignView;
  -[NavManeuverSignView setManeuverGuidanceInfo:](&v4, "setManeuverGuidanceInfo:", a3);
}

- (UIView)viewToAlignTextLeadingWithPrimarySign
{
  void *v3;

  if (-[NavSignView hasMajorText](self, "hasMajorText"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView majorLabel](self, "majorLabel"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self, "minorLabel"));
  return (UIView *)v3;
}

- (void)mirrorPrimaryManeuver:(id)a3
{
  if (a3)
    -[NavSecondaryDrivingSignView _setManeuverGuidanceInfo:mirroredPrimary:](self, "_setManeuverGuidanceInfo:mirroredPrimary:");
}

- (BOOL)isShowingMirroredPrimaryManeuver
{
  return self->_showMirroredPrimaryManeuver;
}

@end
