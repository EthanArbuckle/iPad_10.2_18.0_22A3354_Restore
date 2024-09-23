@implementation _UIRemoteView

- (Class)_intelligenceBaseClass
{
  sub_18565AFF4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIRemoteView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = self;
  _UIRemoteView._intelligenceCollectContent(in:collector:)((uint64_t)v9, x, y, width, height);

}

- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _UIRemoteView *v9;
  _UIRemoteViewController *v10;
  _UIRemoteView *v11;
  _UIRemoteView *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (_UIRemoteView *)a4;
  v12 = self;
  v10 = -[_UIRemoteView remoteViewController](v12, sel_remoteViewController);
  if (v10)
  {
    v11 = (_UIRemoteView *)v10;
    -[_UIRemoteViewController _intelligenceCollectRemoteContentInVisibleRect:withRemoteContextWrapper:](v10, sel__intelligenceCollectRemoteContentInVisibleRect_withRemoteContextWrapper_, v9, x, y, width, height);

    v9 = v12;
    v12 = v11;
  }

}

+ (BOOL)_requiresWindowTouches
{
  return 1;
}

+ (_UIRemoteView)viewWithHostedWindowHostingHandle:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = a3;
  v6 = objc_alloc((Class)a1);
  v7 = objc_msgSend(v5, "pid");
  v8 = objc_msgSend(v5, "contextID");
  v9 = objc_msgSend(v6, "initWithFrame:pid:contextID:", v7, v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = (void *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 432), a3);
    if (v5)
    {
      objc_msgSend(v5, "rootLayerTransform");
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
    }
    objc_msgSend(v5, "rootLayerFrame", v13, v14, v15);
    objc_msgSend(v10, "applyTransformUndoingRemoteRootLayerTransform:frame:", &v13);
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);
    v11 = v10;
  }

  return (_UIRemoteView *)v10;
}

- (_UIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  _UIRemoteView *v5;
  _UIRemoteView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteView;
  v5 = -[_UILayerHostView initWithFrame:pid:contextID:](&v9, sel_initWithFrame_pid_contextID_, *(_QWORD *)&a4, *(_QWORD *)&a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInheritsTiming:", 0);

  }
  return v6;
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  _UIHostedWindowHostingHandle *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v5 = (_UIHostedWindowHostingHandle *)a3;
  if (self->_hostedWindowHostingHandle != v5)
  {
    objc_storeStrong((id *)&self->_hostedWindowHostingHandle, a3);
    -[_UILayerHostView setPid:contextID:](self, "setPid:contextID:", -[_UIHostedWindowHostingHandle pid](self->_hostedWindowHostingHandle, "pid"), -[_UIHostedWindowHostingHandle contextID](self->_hostedWindowHostingHandle, "contextID"));
    if (v5)
    {
      -[_UIHostedWindowHostingHandle rootLayerTransform](v5, "rootLayerTransform");
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
      v6 = 0u;
    }
    -[_UIHostedWindowHostingHandle rootLayerFrame](v5, "rootLayerFrame", v6, v7, v8);
    -[_UIRemoteView applyTransformUndoingRemoteRootLayerTransform:frame:](self, "applyTransformUndoingRemoteRootLayerTransform:frame:", &v6);
  }

}

- (void)applyTransformUndoingRemoteRootLayerTransform:(CGAffineTransform *)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  -[UIView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v16.c = v15;
  *(_OWORD *)&v16.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&v17, &v16);
  objc_msgSend(v14, "setAffineTransform:", &v17);

  -[UIView setBounds:](self, "setBounds:", x, y, width, height);
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", v11, v13);
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  _UIRemoteView *v12;
  _UIRemoteView *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "_requiresWindowTouches"))
  {
    -[UIView window](self, "window");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v10)
      v12 = self;
    else
      v12 = 0;
    v13 = v12;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIRemoteView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v15, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    v13 = (_UIRemoteView *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)tintColorDidChange
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_updateTintColor");

}

- (void)_setInheritsSecurity:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[_UILayerHostView setInheritsSecurity:](self, "setInheritsSecurity:");
  if (v3)
  {
    -[UIView layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecurityMode:", *MEMORY[0x1E0CD3000]);

  }
}

- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return self->_hostedWindowHostingHandle;
}

- (_UIRemoteViewController)remoteViewController
{
  return (_UIRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
}

@end
