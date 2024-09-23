@implementation IMViewState

+ (id)saveStateForView:(id)a3 flags:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithView:flags:", v6, a4);

  return v7;
}

- (IMViewState)initWithView:(id)a3 flags:(unint64_t)flags
{
  id v7;
  IMViewState *v8;
  IMViewState *v9;
  UIView *v11;
  UIView *placeholderView;
  void *v13;
  UIView *view;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMViewState;
  v8 = -[IMViewState init](&v24, "init");
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  objc_storeStrong((id *)&v8->_view, a3);
  v9->_flags = flags;
  if ((flags & 1) != 0)
  {
    v11 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    placeholderView = v9->_placeholderView;
    v9->_placeholderView = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
    objc_msgSend(v13, "insertSubview:belowSubview:", v9->_placeholderView, v9->_view);

    flags = v9->_flags;
    if ((flags & 4) == 0)
    {
LABEL_4:
      if ((flags & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_4;
  }
  view = v9->_view;
  if (view)
  {
    -[UIView transform](view, "transform");
    flags = v9->_flags;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
  }
  *(_OWORD *)&v9->_transform.a = v21;
  *(_OWORD *)&v9->_transform.c = v22;
  *(_OWORD *)&v9->_transform.tx = v23;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  -[UIView frame](v9->_view, "frame", v21, v22, v23);
  v9->_frame.origin.x = v15;
  v9->_frame.origin.y = v16;
  v9->_frame.size.width = v17;
  v9->_frame.size.height = v18;
  flags = v9->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
LABEL_17:
    v9->_autoresizingMask = -[UIView autoresizingMask](v9->_view, "autoresizingMask", v21, v22, v23);
    if ((v9->_flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_16:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9->_view, "layer", v21, v22, v23));
  objc_msgSend(v19, "zPosition");
  v9->_zPosition = v20;

  flags = v9->_flags;
  if ((flags & 8) != 0)
    goto LABEL_17;
LABEL_7:
  if ((flags & 0x20) != 0)
LABEL_8:
    v9->_hidden = -[UIView isHidden](v9->_view, "isHidden", v21, v22, v23);
LABEL_9:

  return v9;
}

- (void)restore
{
  UIView *view;
  unint64_t flags;
  void *v5;
  UIView *placeholderView;
  __int128 v7;
  double zPosition;
  void *v9;
  _OWORD v10[3];

  view = self->_view;
  if (view)
  {
    flags = self->_flags;
    if ((flags & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_placeholderView, "superview"));
      objc_msgSend(v5, "insertSubview:belowSubview:", self->_view, self->_placeholderView);

      -[UIView removeFromSuperview](self->_placeholderView, "removeFromSuperview");
      placeholderView = self->_placeholderView;
      self->_placeholderView = 0;

      view = self->_view;
      flags = self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_4:
        if ((flags & 0x10) == 0)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_4;
    }
    v7 = *(_OWORD *)&self->_transform.c;
    v10[0] = *(_OWORD *)&self->_transform.a;
    v10[1] = v7;
    v10[2] = *(_OWORD *)&self->_transform.tx;
    -[UIView setTransform:](view, "setTransform:", v10);
    view = self->_view;
    flags = self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
LABEL_13:
    -[UIView setFrame:](view, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    view = self->_view;
    flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_6:
      if ((flags & 8) == 0)
        goto LABEL_7;
      goto LABEL_15;
    }
LABEL_14:
    zPosition = self->_zPosition;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](view, "layer"));
    objc_msgSend(v9, "setZPosition:", zPosition);

    view = self->_view;
    flags = self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_7:
      if ((flags & 0x20) == 0)
      {
LABEL_9:
        self->_view = 0;

        return;
      }
LABEL_8:
      -[UIView setHidden:](view, "setHidden:", self->_hidden);
      view = self->_view;
      goto LABEL_9;
    }
LABEL_15:
    -[UIView setAutoresizingMask:](view, "setAutoresizingMask:", self->_autoresizingMask);
    view = self->_view;
    if ((self->_flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_placeholderView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)IMViewState;
  -[IMViewState dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
