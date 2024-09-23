@implementation PLTVOutWindow

- (PLTVOutWindow)init
{
  uint64_t v3;
  void *v4;
  PLTVOutWindow *v5;
  PLTVOutWindow *v6;
  id v7;
  UIView *v8;
  objc_super v10;

  v3 = MPTVOutScreen();
  if (v3)
  {
    v4 = (void *)v3;
    -[PLTVOutWindow _setupTargetScreen:](self, "_setupTargetScreen:", v3);
    objc_msgSend(v4, "bounds");
    v10.receiver = self;
    v10.super_class = (Class)PLTVOutWindow;
    v5 = -[PLTVOutWindow initWithFrame:](&v10, sel_initWithFrame_);
    v6 = v5;
    if (v5)
    {
      -[PLTVOutWindow setScreen:](v5, "setScreen:", v4);
      v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
      -[PLTVOutWindow bounds](v6, "bounds");
      v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
      v6->_backgroundView = v8;
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
      -[PLTVOutWindow addSubview:](v6, "addSubview:", v6->_backgroundView);
    }
  }
  else
  {
    NSLog(CFSTR("Error: no external display attached in tv out mode"));

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLTVOutWindow;
  -[PLTVOutWindow dealloc](&v3, sel_dealloc);
}

- (BOOL)_setupTargetScreen:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setOverscanCompensation:", 2);
  v4 = objc_msgSend(a3, "preferredMode");
  if (v4)
    goto LABEL_2;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend(a3, "availableModes", 0);
  v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    return v5;
  v7 = v5;
  v4 = 0;
  v8 = *(_QWORD *)v18;
  v9 = 0.0;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_msgSend(v11, "size");
      if (fabs(v12 + -1280.0) < 0.00000011920929 && fabs(v13 + -720.0) < 0.00000011920929)
      {
        v4 = (uint64_t)v11;
        goto LABEL_22;
      }
      v14 = v12 * v13;
      if (v14 > 921600.0 && (v9 >= 921600.0 ? (v15 = v14 < v9) : (v15 = 1), v15) || v14 > v9)
      {
        v4 = (uint64_t)v11;
        v9 = v14;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
      continue;
    break;
  }
LABEL_22:
  if (v4)
  {
LABEL_2:
    objc_msgSend(a3, "setCurrentMode:", v4);
    LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)setVideoView:(id)a3
{
  _BOOL4 v5;
  UIView *videoView;
  UIView *v7;

  v5 = -[PLTVOutWindow _setupTargetScreen:](self, "_setupTargetScreen:", -[PLTVOutWindow screen](self, "screen"));
  if (v5)
  {
    videoView = self->_videoView;
    if (videoView != a3)
    {
      if (-[UIView isDescendantOfView:](videoView, "isDescendantOfView:", self))
        -[UIView removeFromSuperview](self->_videoView, "removeFromSuperview");

      a3 = a3;
      self->_videoView = (UIView *)a3;
    }
    if (a3 && (objc_msgSend(a3, "isDescendantOfView:", self->_backgroundView) & 1) == 0)
    {
      v7 = self->_videoView;
      -[UIView bounds](self->_backgroundView, "bounds");
      -[UIView setFrame:](v7, "setFrame:");
      -[UIView addSubview:](self->_backgroundView, "addSubview:", self->_videoView);
    }
  }
  return v5;
}

- (id)videoView
{
  return self->_videoView;
}

@end
