@implementation SBProductivityGestureEducationPillViewController

- (SBProductivityGestureEducationPillViewController)initWithItem:(id)a3
{
  id v5;
  SBProductivityGestureEducationPillViewController *v6;
  SBProductivityGestureEducationPillViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBProductivityGestureEducationPillViewController;
  v6 = -[SBProductivityGestureEducationPillViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  PLPillView *v6;
  PLPillView *pillView;
  PLPillView *v8;
  void *v9;
  void *v10;
  void *v11;
  PLPillView *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBProductivityGestureEducationPillViewController;
  -[SBProductivityGestureEducationPillViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[SBProductivityGestureEducationPillViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D7D3E0]);
  -[SBProductivityGestureEducationPillViewController _pillLeadingImageView](self, "_pillLeadingImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (PLPillView *)objc_msgSend(v4, "initWithLeadingAccessoryView:trailingAccessoryView:", v5, 0);
  pillView = self->_pillView;
  self->_pillView = v6;

  v8 = self->_pillView;
  -[SBProductivityGestureEducationPillViewController _pillTitleContentItem](self, "_pillTitleContentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  -[SBProductivityGestureEducationPillViewController _pillActionContentItem](self, "_pillActionContentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPillView setCenterContentItems:](v8, "setCenterContentItems:", v11);

  v12 = self->_pillView;
  objc_msgSend(v3, "bounds");
  -[PLPillView setFrame:](v12, "setFrame:");
  -[PLPillView setAutoresizingMask:](self->_pillView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_pillView);
  -[PLPillView intrinsicContentSize](self->_pillView, "intrinsicContentSize");
  -[SBProductivityGestureEducationPillViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSingleTap_);
  objc_msgSend(v13, "setNumberOfTouchesRequired:", 1);
  objc_msgSend(v13, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v3, "addGestureRecognizer:", v13);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__marqueeStarted_, *MEMORY[0x1E0CEC0B8], 0);

}

- (NSURL)actionURL
{
  int64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v2 = -[SBProductivityGestureEducationItem type](self->_item, "type");
  if ((unint64_t)(v2 - 1) > 3)
  {
    v3 = CFSTR("prefs:root=com.apple.MultitaskingAndGesturesSettings");
  }
  else
  {
    objc_msgSend(CFSTR("prefs:root=com.apple.MultitaskingAndGesturesSettings"), "stringByAppendingFormat:", CFSTR("&path=%@"), off_1E8EBF3B0[v2 - 1]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("&referrer=%@"), CFSTR("com.apple.SpringBoard.ProductivityGestureEducation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (id)_pillLeadingImageView
{
  int64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = -[SBProductivityGestureEducationItem type](self->_item, "type");
  if ((unint64_t)(v2 - 1) > 3)
  {
    v9 = 0;
  }
  else
  {
    v3 = off_1E8EBF3D0[v2 - 1];
    v4 = (void *)MEMORY[0x1E0CEA638];
    v5 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:withConfiguration:", v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
  }
  return v9;
}

- (id)_titleKeyForEducationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) > 3)
    return 0;
  else
    return off_1E8EBF3F0[a3 - 7];
}

- (id)_titleForItemType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  if ((unint64_t)(a3 - 3) < 2)
  {
    -[SBProductivityGestureEducationPillViewController _titleKeyForEducationType:](self, "_titleKeyForEducationType:", -[SBProductivityGestureEducationItem lastActivatedEducationType](self->_item, "lastActivatedEducationType"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_8;
  }
  else
  {
    if (a3 == 1)
    {
      v3 = CFSTR("PRODUCTIVITY_GESTURE_EDUCATION_PRODUCTIVITY_GESTURES_OFF");
      goto LABEL_8;
    }
    if (a3 == 2)
    {
      v3 = CFSTR("PRODUCTIVITY_GESTURE_EDUCATION_SWIPE_APPS_OFF");
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
  }
  v4 = &stru_1E8EC7EC0;
  return v4;
}

- (id)_titleString
{
  return -[SBProductivityGestureEducationPillViewController _titleForItemType:](self, "_titleForItemType:", -[SBProductivityGestureEducationItem type](self->_item, "type"));
}

- (id)_pillTitleContentItem
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D7D3D0]);
  -[SBProductivityGestureEducationPillViewController _titleString](self, "_titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithText:style:", v4, 1);

  return v5;
}

- (id)_pillActionContentItem
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRODUCTIVITY_GESTURE_EDUCATION_ACTION_TEXT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v3, 5);
  return v4;
}

- (void)_marqueeStarted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBProductivityGestureEducationPillViewController _titleString](self, "_titleString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CEC0B0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(WeakRetained, "gestureEducationPillViewControllerMarqueeStarted:duration:", self);

      SBLogSystemGesture();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        _SBFLoggingMethodProem();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBProductivityGestureEducationPillViewController _titleString](self, "_titleString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "%{public}@ Education banner title marquee started: %@, duration: %@", (uint8_t *)&v15, 0x20u);

      }
    }
  }

}

- (NSString)requestIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-GestureEducation-%ld"), self, -[SBProductivityGestureEducationItem type](self->_item, "type"));
}

- (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.ProductivityGestureEducation");
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return (id)BNPresentableDescription();
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "gestureEducationPillViewControllerWillAppear:", self);

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "gestureEducationPillViewControllerDidDisappear:", self);

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogSystemGesture();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBProductivityGestureEducationPillViewController requestIdentifier](self, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ will not display education banner: due to %@", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "gestureEducationPillViewControllerFailsToAppear:", self);

}

- (void)_handleSingleTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "gestureEducationPillViewControllerDidReceiveUserTap:", self);

}

- (SBProductivityGestureEducationPillViewControllerDelegate)delegate
{
  return (SBProductivityGestureEducationPillViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBProductivityGestureEducationItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
