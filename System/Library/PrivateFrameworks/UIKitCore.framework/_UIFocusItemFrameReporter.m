@implementation _UIFocusItemFrameReporter

- (_UIFocusItemFrameReporter)initWithFocusSystem:(id)a3
{
  id v4;
  _UIFocusItemFrameReporter *v5;
  _UIFocusItemFrameReporter *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusItemFrameReporter;
  v5 = -[_UIFocusItemFrameReporter init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    -[_UIFocusItemFrameReporter setEnabled:](v6, "setEnabled:", objc_msgSend(v4, "_isEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__focusSystemEnabledStateDidChange_, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIFocusSystemEnabledStateDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusItemFrameReporter;
  -[_UIFocusItemFrameReporter dealloc](&v4, sel_dealloc);
}

- (void)_reportFocusFrameForCurrentlyFocusedItem
{
  id WeakRetained;
  id v4;

  if (self->_enabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      -[_UIFocusItemFrameReporter _globalFrameForFocusedItemInSystem:](self, "_globalFrameForFocusedItemInSystem:", WeakRetained);
      -[_UIFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:");
      WeakRetained = v4;
    }

  }
}

- (void)_reportFocusFrameUpdateForGlobalFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MinX;
  double MinY;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[8];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  if (self->_enabled)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[_UIFocusItemFrameReporter focusSystem](self, "focusSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_focusedWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "_windowHostingScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_effectiveUIClientSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "screenFocusedFrame");
      v44 = v13;
      v45 = v12;
      v42 = v15;
      v43 = v14;

      objc_msgSend(v9, "frame");
      v17 = v16;
      v19 = v18;
      v39 = v20;
      v40 = v21;
      objc_msgSend(v9, "safeAreaInsets");
      v22 = y;
      v24 = v23;
      v26 = v25;
      v38 = v27;
      v29 = v28;
      v47.origin.x = x;
      v41 = v22;
      v47.origin.y = v22;
      v47.size.width = width;
      v47.size.height = height;
      if (CGRectIsNull(v47))
      {
        v30 = v41;
      }
      else
      {
        v31 = v17 + v26;
        v32 = v19 + v24;
        v33 = v39 - (v26 + v29);
        v34 = v40 - (v24 + v38);
        if (v33 < width)
          width = v33;
        if (v34 < height)
          height = v34;
        v48.origin.x = v31;
        v48.origin.y = v32;
        v48.size.width = v33;
        v48.size.height = v34;
        MinX = CGRectGetMinX(v48);
        v49.origin.x = v31;
        v49.origin.y = v32;
        v49.size.width = v33;
        v49.size.height = v34;
        x = fmax(MinX, fmin(x, CGRectGetMaxX(v49) - width));
        v50.origin.x = v31;
        v50.origin.y = v32;
        v50.size.width = v33;
        v50.size.height = v34;
        MinY = CGRectGetMinY(v50);
        v51.origin.x = v31;
        v51.origin.y = v32;
        v51.size.width = v33;
        v51.size.height = v34;
        v30 = fmax(MinY, fmin(v41, CGRectGetMaxY(v51) - height));
      }
      if (-[_UIFocusItemFrameReporter _rect:differsFromRect:lowerThreshold:upperThreshold:](self, "_rect:differsFromRect:lowerThreshold:upperThreshold:", x, v30, width, height, v45, v44, v43, v42, 0x3FECCCCCCCCCCCCDLL, 0x3FF199999999999ALL))
      {
        objc_msgSend(v9, "_windowHostingScene");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __67___UIFocusItemFrameReporter__reportFocusFrameUpdateForGlobalFrame___block_invoke;
        v46[3] = &__block_descriptor_64_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        *(double *)&v46[4] = x;
        *(double *)&v46[5] = v30;
        *(double *)&v46[6] = width;
        *(double *)&v46[7] = height;
        objc_msgSend(v37, "_updateUIClientSettingsWithBlock:", v46);

      }
    }

  }
}

- (void)_scheduleRepeatingFrameUpdate
{
  OS_dispatch_source *v3;
  OS_dispatch_source *focusedFrameUpdateTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_enabled)
  {
    if (!self->_focusedFrameUpdateTimer)
    {
      objc_initWeak(&location, self);
      v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
      self->_focusedFrameUpdateTimer = v3;

      v5 = self->_focusedFrameUpdateTimer;
      v6 = dispatch_time(0, 0);
      dispatch_source_set_timer(v5, v6, 0xBEBC200uLL, 0x2FAF080uLL);
      v7 = self->_focusedFrameUpdateTimer;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58___UIFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke;
      v8[3] = &unk_1E16B3F40;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v7, v8);
      dispatch_resume((dispatch_object_t)self->_focusedFrameUpdateTimer);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[_UIFocusItemFrameReporter _cancelRepeatingFrameUpdate](self, "_cancelRepeatingFrameUpdate");
  }
}

- (void)_cancelRepeatingFrameUpdate
{
  NSObject *focusedFrameUpdateTimer;
  OS_dispatch_source *v4;

  focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
  if (focusedFrameUpdateTimer)
  {
    dispatch_source_cancel(focusedFrameUpdateTimer);
    v4 = self->_focusedFrameUpdateTimer;
    self->_focusedFrameUpdateTimer = 0;

  }
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIFocusItemFrameReporter focusSystem](self, "focusSystem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[_UIFocusItemFrameReporter setEnabled:](self, "setEnabled:", objc_msgSend(v7, "_isEnabled"));
    v6 = v7;
  }

}

- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 IsNull;
  double v15;
  double v16;
  double v17;
  BOOL v20;
  BOOL v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  IsNull = CGRectIsNull(a3);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (IsNull != CGRectIsNull(v22))
    return 1;
  v23.origin.x = v13;
  v23.origin.y = v12;
  v23.size.width = v11;
  v23.size.height = v10;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v24 = CGRectIntersection(v23, v25);
  v15 = v24.size.width;
  v16 = v24.size.height;
  if (CGRectIsNull(v24))
    return 1;
  v17 = v11 * v10 / (v15 * v16);
  if (v17 < a5 || v17 > a6)
    return 1;
  v20 = v10 / height < a5;
  if (v10 / height > a6)
    v20 = 1;
  v21 = v11 / width < a5;
  if (v11 / width > a6)
    v21 = 1;
  return v21 || v20;
}

- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusItemContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend(v3, "focusItemContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "coordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x1E0C9D628];
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      -[_UIFocusItemFrameReporter _scheduleRepeatingFrameUpdate](self, "_scheduleRepeatingFrameUpdate");
    }
    else
    {
      -[_UIFocusItemFrameReporter _cancelRepeatingFrameUpdate](self, "_cancelRepeatingFrameUpdate");
      -[_UIFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      self->_enabled = 0;
    }
  }
}

- (UIFocusSystem)focusSystem
{
  return (UIFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_focusedFrameUpdateTimer, 0);
}

@end
