@implementation VLFScanningAnimationView

- (VLFScanningAnimationView)initWithFrame:(CGRect)a3
{
  VLFScanningAnimationView *v3;
  VLFScanningAnimationView *v4;
  NSMutableArray *v5;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *skylineImageView;
  double v10;
  void *v11;
  void *v12;
  MapsLoopingVideoPlayerView *v13;
  MapsLoopingVideoPlayerView *playerView;
  double v15;
  void *v16;
  void *v17;
  VLFScanningAnimationManager *v18;
  void *v19;
  VLFScanningAnimationManager *v20;
  VLFScanningAnimationManager *animationManager;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VLFScanningAnimationView;
  v3 = -[VLFScanningAnimationView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentScanningState = 1;
    v5 = objc_opt_new(NSMutableArray);
    v6 = objc_alloc((Class)UIImageView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("VLF_skyline")));
    v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);
    skylineImageView = v4->_skylineImageView;
    v4->_skylineImageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_skylineImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_skylineImageView, "setContentMode:", 1);
    -[VLFScanningAnimationView addSubview:](v4, "addSubview:", v4->_skylineImageView);
    LODWORD(v10) = 1148846080;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsEqualToEdgesOfView:priority:](v4->_skylineImageView, "_maps_constraintsEqualToEdgesOfView:priority:", v4, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);

    v13 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    playerView = v4->_playerView;
    v4->_playerView = v13;

    -[MapsLoopingVideoPlayerView setTranslatesAutoresizingMaskIntoConstraints:](v4->_playerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VLFScanningAnimationView addSubview:](v4, "addSubview:", v4->_playerView);
    LODWORD(v15) = 1148846080;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView _maps_constraintsEqualToEdgesOfView:priority:](v4->_playerView, "_maps_constraintsEqualToEdgesOfView:priority:", v4, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allConstraints"));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v17);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
    v18 = [VLFScanningAnimationManager alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsLoopingVideoPlayerView layer](v4->_playerView, "layer"));
    v20 = -[VLFScanningAnimationManager initWithLayer:](v18, "initWithLayer:", v19);
    animationManager = v4->_animationManager;
    v4->_animationManager = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    LODWORD(v19) = objc_msgSend(v22, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationShowLongestTextKey"));

    if ((_DWORD)v19)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.300000012));
      -[VLFScanningAnimationView setBackgroundColor:](v4, "setBackgroundColor:", v24);

    }
    -[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:](v4, "updateForCurrentStateAndPreserveTimestamp:animate:", 0, 0);

  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VLFScanningAnimationView;
  -[VLFScanningAnimationView didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  if (v4)
    -[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:](self, "updateForCurrentStateAndPreserveTimestamp:animate:", 0, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VLFScanningAnimationView;
  -[VLFScanningAnimationView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", a3);
  v4 = sub_1002A2ADC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Trait collection did change", v6, 2u);
  }

  -[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:](self, "updateForCurrentStateAndPreserveTimestamp:animate:", 1, 0);
}

- (void)setCurrentScanningState:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  int64_t currentScanningState;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  int64_t v14;
  id v16;
  NSObject *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = 136316418;
        v25 = "-[VLFScanningAnimationView setCurrentScanningState:]";
        v26 = 2080;
        v27 = "VLFScanningAnimationView.m";
        v28 = 1024;
        v29 = 99;
        v30 = 2080;
        v31 = "dispatch_get_main_queue()";
        v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v24,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v24 = 138412290;
          v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

        }
      }
    }
  }
  currentScanningState = self->_currentScanningState;
  if (currentScanningState != a3)
  {
    self->_currentScanningState = a3;
    v9 = sub_1002A2ADC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(currentScanningState - 2) > 3)
        v11 = CFSTR("VLFScanningStateInitializing");
      else
        v11 = *(&off_1011AF648 + currentScanningState - 2);
      v12 = self->_currentScanningState - 2;
      if (v12 > 3)
        v13 = CFSTR("VLFScanningStateInitializing");
      else
        v13 = *(&off_1011AF648 + v12);
      v24 = 138412546;
      v25 = (const char *)v11;
      v26 = 2112;
      v27 = (const char *)v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Current scanning state changed from %@ to %@", (uint8_t *)&v24, 0x16u);
    }

    v14 = self->_currentScanningState;
    if ((unint64_t)(currentScanningState - 1) > 1 || (unint64_t)(v14 - 1) > 1)
    {
      -[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:](self, "updateForCurrentStateAndPreserveTimestamp:animate:", 0, v14 != 1);
    }
    else
    {
      v16 = sub_1002A2ADC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Ignoring transition between .Initializing and .Scanning because they're the same video", (uint8_t *)&v24, 2u);
      }

    }
  }
}

- (BOOL)isDarkMode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle") == (id)2;

  return v3;
}

- (id)videoNameForCurrentState
{
  int64_t v3;
  unsigned int v4;
  __CFString *v5;
  const __CFString *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  id v13;
  NSObject *v14;
  int64_t v15;
  const __CFString *v16;
  unsigned int v17;
  unsigned int v18;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v3 = -[VLFScanningAnimationView currentScanningState](self, "currentScanningState");
  if ((unint64_t)(v3 - 1) < 3)
  {
    if (+[VLFDeviceInfo isIslandDevice](VLFDeviceInfo, "isIslandDevice"))
    {
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      v5 = CFSTR("VLF_scan_island_light");
      v6 = CFSTR("VLF_scan_island_dark");
    }
    else
    {
      v7 = +[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice");
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      if (v7)
      {
        v5 = CFSTR("VLF_scan_notch_light");
        v6 = CFSTR("VLF_scan_notch_dark");
      }
      else
      {
        v5 = CFSTR("VLF_scan_light");
        v6 = CFSTR("VLF_scan_dark");
      }
    }
    goto LABEL_31;
  }
  if (v3 == 4)
  {
    if (+[VLFDeviceInfo isIslandDevice](VLFDeviceInfo, "isIslandDevice"))
    {
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      v5 = CFSTR("VLF_raise_island_light");
      v6 = CFSTR("VLF_raise_island_dark");
    }
    else
    {
      v18 = +[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice");
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      if (v18)
      {
        v5 = CFSTR("VLF_raise_notch_light");
        v6 = CFSTR("VLF_raise_notch_dark");
      }
      else
      {
        v5 = CFSTR("VLF_raise_light");
        v6 = CFSTR("VLF_raise_dark");
      }
    }
LABEL_31:
    if (v4)
      v5 = (__CFString *)v6;
    return v5;
  }
  if (v3 == 5)
  {
    if (+[VLFDeviceInfo isIslandDevice](VLFDeviceInfo, "isIslandDevice"))
    {
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      v5 = CFSTR("VLF_lower_island_light");
      v6 = CFSTR("VLF_lower_island_dark");
    }
    else
    {
      v17 = +[VLFDeviceInfo isNotchDevice](VLFDeviceInfo, "isNotchDevice");
      v4 = -[VLFScanningAnimationView isDarkMode](self, "isDarkMode");
      if (v17)
      {
        v5 = CFSTR("VLF_lower_notch_light");
        v6 = CFSTR("VLF_lower_notch_dark");
      }
      else
      {
        v5 = CFSTR("VLF_lower_light");
        v6 = CFSTR("VLF_lower_dark");
      }
    }
    goto LABEL_31;
  }
  v8 = sub_1004318FC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v20 = 136315650;
    v21 = "-[VLFScanningAnimationView videoNameForCurrentState]";
    v22 = 2080;
    v23 = "VLFScanningAnimationView.m";
    v24 = 1024;
    v25 = 161;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v20 = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

    }
  }
  v13 = sub_1002A2ADC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = -[VLFScanningAnimationView currentScanningState](self, "currentScanningState");
    if ((unint64_t)(v15 - 2) > 3)
      v16 = CFSTR("VLFScanningStateInitializing");
    else
      v16 = *(&off_1011AF648 + v15 - 2);
    v20 = 138412290;
    v21 = (const char *)v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid current scanning state: (%@); could not determine video name to use",
      (uint8_t *)&v20,
      0xCu);
  }

  return 0;
}

- (void)updateForCurrentStateAndPreserveTimestamp:(BOOL)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  const char *label;
  const char *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int64_t v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  _QWORD v28[5];
  BOOL v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;

  v4 = a4;
  v5 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v31 = "-[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:]";
        v32 = 2080;
        v33 = "VLFScanningAnimationView.m";
        v34 = 1024;
        *(_DWORD *)v35 = 168;
        *(_WORD *)&v35[4] = 2080;
        *(_QWORD *)&v35[6] = "dispatch_get_main_queue()";
        v36 = 2080;
        v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v38 = 2080;
        v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v31 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v10 = sub_1002A2ADC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = -[VLFScanningAnimationView currentScanningState](self, "currentScanningState");
    if ((unint64_t)(v12 - 2) > 3)
      v13 = CFSTR("VLFScanningStateInitializing");
    else
      v13 = *(&off_1011AF648 + v12 - 2);
    if (v5)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v31 = (const char *)v13;
    v32 = 2112;
    v33 = (const char *)v14;
    if (v4)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v34 = 2112;
    *(_QWORD *)v35 = v15;
    v16 = v14;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updating for the current state: (%@) preserving timestamp: %@ animated: %@", buf, 0x20u);

  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002A3514;
  v28[3] = &unk_1011ACE58;
  v28[4] = self;
  v29 = v5;
  v18 = objc_retainBlock(v28);
  v19 = sub_1002A2ADC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Animating fade out", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView animationManager](self, "animationManager"));
    objc_msgSend(v22, "fadeWithFadeOutCompletion:", v18);
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Not animating fade out", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationView animationManager](self, "animationManager"));
    objc_msgSend(v22, "replaceOnGoingFadeOutCompletion:", v18);
  }

}

- (int64_t)currentScanningState
{
  return self->_currentScanningState;
}

- (UIImageView)skylineImageView
{
  return self->_skylineImageView;
}

- (void)setSkylineImageView:(id)a3
{
  objc_storeStrong((id *)&self->_skylineImageView, a3);
}

- (MapsLoopingVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
  objc_storeStrong((id *)&self->_animationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_skylineImageView, 0);
}

@end
