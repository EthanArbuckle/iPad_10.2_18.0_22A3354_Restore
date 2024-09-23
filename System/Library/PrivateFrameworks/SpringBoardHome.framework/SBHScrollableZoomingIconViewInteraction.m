@implementation SBHScrollableZoomingIconViewInteraction

- (BOOL)isIconViewTheInteractingTargetIconView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "effectiveIconImageAlpha"), v6 == 0.0))
  {
    v7 = 1;
  }
  else if (-[SBHScrollableZoomingIconViewInteraction considersFolderIconTargets](self, "considersFolderIconTargets"))
  {
    objc_msgSend(v5, "_iconImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
    {
      objc_msgSend(v8, "iconGridImageAlpha");
      v7 = v9 == 0.0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)_clippingFudgeInset
{
  return 10.0;
}

- (void)handleTargetIconViewClipped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBHScrollableZoomingIconViewInteraction;
  v4 = a3;
  -[SBHScrollableIconViewInteraction handleTargetIconViewClipped:](&v7, sel_handleTargetIconViewClipped_, v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("SBHHiddenIconViewUserInfoKey");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification"), self, v6);
}

- (BOOL)considersFolderIconTargets
{
  return self->_considersFolderIconTargets;
}

- (void)setConsidersFolderIconTargets:(BOOL)a3
{
  self->_considersFolderIconTargets = a3;
}

@end
