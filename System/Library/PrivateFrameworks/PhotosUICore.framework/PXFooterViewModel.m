@implementation PXFooterViewModel

- (id)adjustedChromeColor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  PXFooterViewModel *v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v15;

  v5 = sub_1A7ADF540();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = (char *)sub_1A6D1861C();
  v12 = &v11[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXFooterViewModelP33_53A6CF1A886C95BA3CC9BAC3E54AA6D914AssociatedData_environmentValues];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v12, v5);

  LOBYTE(v11) = sub_1A6C4EE5C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = sub_1A707F2F8((char)v11);

  return v13;
}

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  PXFooterViewModel *v7;
  char *v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v3 = sub_1A7ADF540();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = (char *)sub_1A6D1861C();
  v9 = &v8[OBJC_IVAR____TtCE12PhotosUICoreCSo17PXFooterViewModelP33_53A6CF1A886C95BA3CC9BAC3E54AA6D914AssociatedData_environmentValues];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);

  v10 = (void *)sub_1A6EF6C00();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (PXLemonadeFeatureAvailabilityMonitor *)v10;
}

- (void)configureWithPhotosEnvironment:(id)a3
{
  PXFooterViewModel *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A6D18788((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (PXFooterViewModel)init
{
  PXFooterViewModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFooterViewModel;
  result = -[PXFooterViewModel init](&v3, sel_init);
  if (result)
    result->_progress = -1.0;
  return result;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFooterViewModel;
  -[PXFooterViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setExtendedTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *extendedTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_extendedTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      extendedTitle = self->_extendedTitle;
      self->_extendedTitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setExtendedSystemImageName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *extendedSystemImageName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_extendedSystemImageName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      extendedSystemImageName = self->_extendedSystemImageName;
      self->_extendedSystemImageName = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 0x20000);
    }
  }

}

- (void)setFilterView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_filterView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_filterView, a3);
    -[PXFooterViewModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setSubtitle1:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitle1;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitle1;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitle1 = self->_subtitle1;
      self->_subtitle1 = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setSubtitle2:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitle2;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitle2;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitle2 = self->_subtitle2;
      self->_subtitle2 = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setInternalMessageSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *internalMessageSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_internalMessageSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      internalMessageSubtitle = self->_internalMessageSubtitle;
      self->_internalMessageSubtitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setIsPaused:(BOOL)a3
{
  if (self->_isPaused != a3)
  {
    self->_isPaused = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setProgress:(float)a3
{
  void *v7;

  if (a3 != -1.0 && (a3 < 0.0 || a3 > 1.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterViewModel.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(progress == PXFooterViewModelNoProgress) || ((progress >= 0.0f) && (progress <= 1.0f))"));

  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_progress = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setActionTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 512);
    }
  }

}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 1024);
    }
  }

}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 2048);
    }
  }

}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      -[PXFooterViewModel signalChange:](self, "signalChange:", 4096);
    }
  }

}

- (void)setAction:(id)a3
{
  void *v4;
  id action;

  if (self->_action != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    action = self->_action;
    self->_action = v4;

    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setUseBlankActionSeparator:(BOOL)a3
{
  if (self->_useBlankActionSeparator != a3)
  {
    self->_useBlankActionSeparator = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x4000);
    v5 = v6;
  }

}

- (void)setTopAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_topAccessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topAccessoryView, a3);
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x10000);
    v5 = v6;
  }

}

- (void)setAnimatedIconMode:(int64_t)a3
{
  if (self->_animatedIconMode != a3)
  {
    self->_animatedIconMode = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setHasImportantInformation:(BOOL)a3
{
  if (self->_hasImportantInformation != a3)
  {
    self->_hasImportantInformation = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)setSubtitle1Style:(int64_t)a3
{
  if (self->_subtitle1Style != a3)
  {
    self->_subtitle1Style = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)setIsProcessing:(BOOL)a3
{
  if (self->_isProcessing != a3)
  {
    self->_isProcessing = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x100000);
  }
}

- (void)setShowBadge:(BOOL)a3
{
  if (self->_showBadge != a3)
  {
    self->_showBadge = a3;
    -[PXFooterViewModel signalChange:](self, "signalChange:", 0x200000);
  }
}

- (int64_t)animatedIconMode
{
  return self->_animatedIconMode;
}

- (NSString)title
{
  return self->_title;
}

- (UIView)filterView
{
  return self->_filterView;
}

- (NSString)extendedTitle
{
  return self->_extendedTitle;
}

- (NSString)extendedSystemImageName
{
  return self->_extendedSystemImageName;
}

- (NSString)subtitle1
{
  return self->_subtitle1;
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (NSString)internalMessageSubtitle
{
  return self->_internalMessageSubtitle;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (float)progress
{
  return self->_progress;
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (id)action
{
  return self->_action;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIView)topAccessoryView
{
  return self->_topAccessoryView;
}

- (BOOL)hasImportantInformation
{
  return self->_hasImportantInformation;
}

- (BOOL)useBlankActionSeparator
{
  return self->_useBlankActionSeparator;
}

- (int64_t)subtitle1Style
{
  return self->_subtitle1Style;
}

- (BOOL)isProcessing
{
  return self->_isProcessing;
}

- (BOOL)showBadge
{
  return self->_showBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_internalMessageSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle1, 0);
  objc_storeStrong((id *)&self->_extendedSystemImageName, 0);
  objc_storeStrong((id *)&self->_extendedTitle, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
