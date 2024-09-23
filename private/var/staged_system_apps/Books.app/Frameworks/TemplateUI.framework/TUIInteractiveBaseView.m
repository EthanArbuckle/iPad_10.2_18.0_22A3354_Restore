@implementation TUIInteractiveBaseView

+ (NSString)tuiReuseIdentifier
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  TUIControlView *v4;

  v3 = a3;
  v4 = self->_control;
  if (-[TUIControlView isEnabled](v4, "isEnabled") != v3)
    -[TUIInteractiveBaseView setEnabled:](v4, "setEnabled:", v3);

}

- (BOOL)enabled
{
  return -[TUIControlView isEnabled](self->_control, "isEnabled");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  TUIControlView *v4;

  v3 = a3;
  v4 = self->_control;
  if (-[TUIControlView isHighlighted](v4, "isHighlighted") != v3)
    -[TUIInteractiveBaseView setHighlighted:](v4, "setHighlighted:", v3);

}

- (BOOL)highlighted
{
  return -[TUIControlView isHighlighted](self->_control, "isHighlighted");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TUIInteractiveBaseView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v18, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive style](self->_renderModel, "style", v18.receiver, v18.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));
  objc_msgSend(v4, "outsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[TUIInteractiveBaseView configureWithModel:outsets:](self, "configureWithModel:outsets:", v6, v8, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v5, "removeStylingFromView:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v16, "applyStylingToView:", v17);

}

- (void)setFactory:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_factory, obj);
    -[TUIInteractiveBaseView _updateSubviews](self, "_updateSubviews");
    -[TUIInteractiveBaseView didUpdateSubviews](self, "didUpdateSubviews");
    v5 = obj;
  }

}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)appendRenderOverrideObservers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "addObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_hostedSubviewsMap"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_B20C4;
  v8[3] = &unk_23EB70;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (id)viewStateSave
{
  return 0;
}

- (void)configureWithModel:(id)a3 outsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  TUIRenderModelInteractive *v10;
  double v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  TUIRenderModelInteractive *v19;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = (TUIRenderModelInteractive *)a3;
  v19 = v10;
  if (self->_renderModel == v10
    && ((v11 = self->_outsets.top, self->_outsets.left == left) ? (v12 = v11 == top) : (v12 = 0),
        v12 ? (v13 = self->_outsets.right == right) : (v13 = 0),
        v13 ? (v14 = self->_outsets.bottom == bottom) : (v14 = 0),
        v14))
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_14;
    *(_BYTE *)&self->_flags |= 2u;
    -[TUIInteractiveBaseView setNeedsLayout](self, "setNeedsLayout", v11);
  }
  else
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    self->_outsets.top = top;
    self->_outsets.left = left;
    self->_outsets.bottom = bottom;
    self->_outsets.right = right;
    -[TUIInteractiveBaseView loadControlIfNeeded](self, "loadControlIfNeeded");
    -[TUIInteractiveBaseView setEnabled:](self, "setEnabled:", -[TUIInteractiveBaseView isEnabledWithRenderModel:](self, "isEnabledWithRenderModel:", v19));
    v15 = -[TUIInteractiveBaseView clipsToBounds](self, "clipsToBounds");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    objc_msgSend(v16, "setClipsToBounds:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive name](v19, "name"));
    -[TUIInteractiveBaseView setName:](self, "setName:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView currentState](self, "currentState"));
    -[TUIInteractiveBaseView setPreviousState:](self, "setPreviousState:", v18);

    -[TUIInteractiveBaseView updateFromState](self, "updateFromState");
    -[TUIInteractiveBaseView renderModelUpdated](self, "renderModelUpdated");
  }
  v10 = v19;
LABEL_14:

}

- (BOOL)isEnabledWithRenderModel:(id)a3
{
  return objc_msgSend(a3, "enabled");
}

- (void)prepareForReuse
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  NSString *animatingTargetState;
  NSString *savedCurrentState;
  void *v10;
  void *v11;
  TUIRenderModelInteractive *renderModel;
  TUIRenderModelSubviews *currentSubviewsModel;
  _OWORD v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIInteractiveBaseView;
  -[TUIReusableBaseView prepareForReuse](&v15, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView layer](self, "layer"));
  v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  v14[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v14[5] = v4;
  v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  v14[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v14[7] = v5;
  v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  v14[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v14[1] = v6;
  v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  v14[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v14[3] = v7;
  objc_msgSend(v3, "setSublayerTransform:", v14);

  animatingTargetState = self->_animatingTargetState;
  self->_animatingTargetState = 0;

  savedCurrentState = self->_savedCurrentState;
  self->_savedCurrentState = 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive style](self->_renderModel, "style"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  objc_msgSend(v10, "removeStylingFromView:", v11);

  renderModel = self->_renderModel;
  self->_renderModel = 0;

  currentSubviewsModel = self->_currentSubviewsModel;
  self->_currentSubviewsModel = 0;

  -[TUIInteractiveBaseView _updateSubviews](self, "_updateSubviews");
  -[TUIInteractiveBaseView didUpdateSubviews](self, "didUpdateSubviews");
}

- (void)updateFromState
{
  NSString *v3;
  NSString *savedCurrentState;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView currentState](self, "currentState"));
    savedCurrentState = self->_savedCurrentState;
    self->_savedCurrentState = v3;

    -[TUIInteractiveBaseView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_updateFromState
{
  NSString **p_animatingTargetState;
  BOOL v3;
  NSString *savedCurrentState;
  __CFString *v6;
  __CFString *v7;
  NSString *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  __CFString *v13;
  _BOOL4 v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  TUIRenderModelSubviews *v19;
  void *v20;
  TUIRenderModelSubviews **p_currentSubviewsModel;
  _TUIInteractiveBasePressAnimationDelegate *v23;
  void *v24;
  void *v25;
  void *v26;
  _UNKNOWN **v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BOOL4 v60;
  __int128 v61;
  void *v62;
  void *v63;
  _OWORD v64[8];
  CATransform3D v65;
  CATransform3D v66;
  CATransform3D v67;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v70;
  CATransform3D v71;
  _QWORD v72[6];
  uint64_t v73;
  id *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;

  p_animatingTargetState = &self->_animatingTargetState;
  if (!self->_animatingTargetState)
  {
    savedCurrentState = self->_savedCurrentState;
    if (savedCurrentState)
      v6 = savedCurrentState;
    else
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView currentState](self, "currentState"));
    v7 = v6;
    v8 = self->_savedCurrentState;
    self->_savedCurrentState = 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView renderModel](self, "renderModel"));
    objc_msgSend(v9, "pressScale");
    v11 = v10;

    if (v7 == CFSTR("highlighted"))
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView previousState](self, "previousState"));
      v12 = v13 == CFSTR("default");

    }
    else
    {
      v12 = 0;
    }
    if (v7 == CFSTR("default"))
    {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView previousState](self, "previousState"));
      v14 = v15 == CFSTR("highlighted");

    }
    else
    {
      v14 = 0;
    }
    v60 = v14;
    v16 = v12 || v14;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "tui_hostingView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self->_renderModel, "stateToModel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView currentState](self, "currentState"));
    v19 = (TUIRenderModelSubviews *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelInteractive stateToModel](self->_renderModel, "stateToModel"));
      v19 = (TUIRenderModelSubviews *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("default")));

    }
    p_currentSubviewsModel = &self->_currentSubviewsModel;
    if (v11 == 1.0 && self->_currentSubviewsModel == v19)
      v16 = 0;
    v73 = 0;
    v74 = (id *)&v73;
    v75 = 0x3032000000;
    v76 = sub_B2CB0;
    v77 = sub_B2CC0;
    v78 = 0;
    if (v16 == 1)
    {
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_B2CC8;
      v72[3] = &unk_23D988;
      v72[4] = self;
      v72[5] = &v73;
      v23 = -[_TUIInteractiveBasePressAnimationDelegate initWithCompletion:]([_TUIInteractiveBasePressAnimationDelegate alloc], "initWithCompletion:", v72);
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong(v74 + 5, v23);
    if (v16)
    {

      if (*p_currentSubviewsModel == v19)
      {
        v3 = 0;
        goto LABEL_29;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
      objc_msgSend(v24, "setDuration:", 0.15);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
      objc_msgSend(v24, "setTimingFunction:", v25);

      objc_msgSend(v24, "setDelegate:", v74[5]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "layer"));
      objc_msgSend(v26, "addAnimation:forKey:", v24, CFSTR("crossfade"));

    }
    else if (*p_currentSubviewsModel == v19)
    {
      v3 = 0;
LABEL_40:
      -[TUIInteractiveBaseView setPreviousState:](self, "setPreviousState:", v7);
      _Block_object_dispose(&v73, 8);

      return v3;
    }
    objc_storeStrong((id *)&self->_currentSubviewsModel, v19);
    -[TUIInteractiveBaseView _updateSubviews](self, "_updateSubviews");
    v3 = 1;
    if (!v16)
      goto LABEL_40;
LABEL_29:
    if (v74[5])
      objc_storeStrong((id *)p_animatingTargetState, v7);
    v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    if (v12)
    {
      memset(&v71, 0, sizeof(v71));
      v28 = -self->_outsets.top;
      v29 = -self->_outsets.left;
      v56 = *(_OWORD *)&CATransform3DIdentity.m33;
      v58 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v70.m31 = v58;
      *(_OWORD *)&v70.m33 = v56;
      v52 = *(_OWORD *)&CATransform3DIdentity.m43;
      v54 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v70.m41 = v54;
      *(_OWORD *)&v70.m43 = v52;
      v48 = *(_OWORD *)&CATransform3DIdentity.m13;
      v50 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v70.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v70.m13 = v48;
      v45 = *(_OWORD *)&CATransform3DIdentity.m23;
      v46 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v70.m21 = v46;
      *(_OWORD *)&v70.m23 = v45;
      CATransform3DTranslate(&v71, &v70, v28, v29, 0.0);
      memset(&v70, 0, sizeof(v70));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layer"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "presentationLayer"));
      v33 = v32;
      if (v32)
        objc_msgSend(v32, "sublayerTransform");
      else
        memset(&b, 0, sizeof(b));
      a = v71;
      CATransform3DConcat(&v70, &a, &b);

      memset(&a, 0, sizeof(a));
      *(_OWORD *)&v67.m31 = v58;
      *(_OWORD *)&v67.m33 = v56;
      *(_OWORD *)&v67.m41 = v54;
      *(_OWORD *)&v67.m43 = v52;
      *(_OWORD *)&v67.m11 = v50;
      *(_OWORD *)&v67.m13 = v48;
      *(_OWORD *)&v67.m21 = v46;
      *(_OWORD *)&v67.m23 = v45;
      CATransform3DScale(&a, &v67, v11, v11, 1.0);
      v67 = v70;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v67));
      v67 = a;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v67));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform")));
      objc_msgSend(v36, "setFromValue:", v34);
      objc_msgSend(v36, "setToValue:", v35);
      objc_msgSend(v36, "setDuration:", 0.15);
      objc_msgSend(v36, "setDelegate:", v74[5]);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView layer](self, "layer"));
      objc_msgSend(v37, "addAnimation:forKey:", v36, CFSTR("pressed"));

      v66 = a;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView layer](self, "layer"));
      v65 = v66;
      objc_msgSend(v38, "setSublayerTransform:", &v65);

      v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }
    if (v60)
    {
      memset(&v71, 0, sizeof(v71));
      v59 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v70.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      v61 = *(_OWORD *)&v70.m31;
      *(_OWORD *)&v70.m33 = v59;
      v55 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v70.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      v57 = *(_OWORD *)&v70.m41;
      *(_OWORD *)&v70.m43 = v55;
      v51 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v70.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      v53 = *(_OWORD *)&v70.m11;
      *(_OWORD *)&v70.m13 = v51;
      v47 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v70.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      v49 = *(_OWORD *)&v70.m21;
      *(_OWORD *)&v70.m23 = v47;
      CATransform3DScale(&v71, &v70, v11, v11, 1.0);
      v70 = v71;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v70));
      *(_OWORD *)&v70.m31 = v61;
      *(_OWORD *)&v70.m33 = v59;
      *(_OWORD *)&v70.m41 = v57;
      *(_OWORD *)&v70.m43 = v55;
      *(_OWORD *)&v70.m11 = v53;
      *(_OWORD *)&v70.m13 = v51;
      *(_OWORD *)&v70.m21 = v49;
      *(_OWORD *)&v70.m23 = v47;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v70));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform")));
      objc_msgSend(v41, "setFromValue:", v39);
      objc_msgSend(v41, "setToValue:", v40);
      objc_msgSend(v41, "setDuration:", 0.15);
      objc_msgSend(v41, "setDelegate:", v74[5]);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView layer](self, "layer"));
      objc_msgSend(v42, "addAnimation:forKey:", v41, CFSTR("reversed"));

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView layer](self, "layer"));
      v64[4] = v61;
      v64[5] = v59;
      v64[6] = v57;
      v64[7] = v55;
      v64[0] = v53;
      v64[1] = v51;
      v64[2] = v49;
      v64[3] = v47;
      objc_msgSend(v43, "setSublayerTransform:", v64);

      v27 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    }
    objc_msgSend(v27[183], "commit", v45);
    goto LABEL_40;
  }
  return 0;
}

- (void)viewDidEndDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIInteractiveBaseView;
  -[TUIReusableBaseView viewDidEndDisplay](&v3, "viewDidEndDisplay");
  -[TUIInteractiveBaseView prepareForReuse](self, "prepareForReuse");
}

- (void)layoutSubviews
{
  char flags;
  unsigned int v4;
  objc_super v5;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags = flags & 0xFE;
    v4 = -[TUIInteractiveBaseView _updateFromState](self, "_updateFromState");
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
      if (!v4)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  *(_BYTE *)&self->_flags = flags & 0xFD;
  -[TUIInteractiveBaseView _updateSubviews](self, "_updateSubviews");
LABEL_8:
  -[TUIInteractiveBaseView didUpdateSubviews](self, "didUpdateSubviews");
LABEL_9:
  v5.receiver = self;
  v5.super_class = (Class)TUIInteractiveBaseView;
  -[TUIInteractiveBaseView layoutSubviews](&v5, "layoutSubviews");
}

- (void)invalidateShowContents
{
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    *(_BYTE *)&self->_flags |= 2u;
    -[TUIInteractiveBaseView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)descendentViewWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TUIInteractiveBaseView;
  v5 = -[TUIReusableBaseView descendentViewWithIdentifier:](&v20, "descendentViewWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tui_hostedSubviewsMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "descendentViewWithIdentifier:", v4));
          if (v14)
          {
            v6 = (void *)v14;
            goto LABEL_12;
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_12:

  }
  return v6;
}

- (id)descendentViewWithRefId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TUIInteractiveBaseView;
  v5 = -[TUIReusableBaseView descendentViewWithRefId:](&v20, "descendentViewWithRefId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tui_hostedSubviewsMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "descendentViewWithRefId:", v4));
          if (v14)
          {
            v6 = (void *)v14;
            goto LABEL_12;
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_12:

  }
  return v6;
}

- (BOOL)showContents
{
  return 1;
}

- (void)_updateSubviews
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  TUIRenderModelSubviews *currentSubviewsModel;
  id WeakRetained;
  void *v16;
  id v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIInteractiveBaseView control](self, "control"));
  v25 = 0;
  if (self->_currentSubviewsModel
    && (v4 = objc_loadWeakRetained((id *)&self->_factory)) != 0
    && (v5 = v4, v6 = -[TUIInteractiveBaseView showContents](self, "showContents"), v5, v6))
  {
    -[TUIRenderModelSubviews prepare](self->_currentSubviewsModel, "prepare");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderOverrideProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderOverrides"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUUID](self, "tui_querySectionUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView tui_querySectionUID](self, "tui_querySectionUID"));
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    currentSubviewsModel = self->_currentSubviewsModel;
    WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSubviews configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:](currentSubviewsModel, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", WeakRetained, v3, v9, &v25, v10, v11, self->_outsets.top, self->_outsets.left, self->_outsets.bottom, self->_outsets.right));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v16;
    v18 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v22;
      while (1)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(v17);
        if (!--v19)
        {
          v19 = (char *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (!v19)
            break;
        }
      }
    }

    v13 = 4 * v25;
  }
  else
  {
    v12 = objc_loadWeakRetained((id *)&self->_factory);
    objc_msgSend(v12, "viewFactoryPrepareToReuseHost:", v3);

    v13 = 0;
  }
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v13;

}

- (BOOL)presentContextMenuForAccessibility
{
  return 0;
}

- (void)invalidateRenderReferenceOverride:(id)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  -[TUIInteractiveBaseView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (NSString)currentState
{
  return self->_currentState;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)animatingTargetState
{
  return self->_animatingTargetState;
}

- (void)setAnimatingTargetState:(id)a3
{
  objc_storeStrong((id *)&self->_animatingTargetState, a3);
}

- (NSString)savedCurrentState
{
  return self->_savedCurrentState;
}

- (void)setSavedCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_savedCurrentState, a3);
}

- (TUIControlView)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (TUIRenderModelInteractive)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (UIEdgeInsets)outsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_outsets.top;
  left = self->_outsets.left;
  bottom = self->_outsets.bottom;
  right = self->_outsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOutsets:(UIEdgeInsets)a3
{
  self->_outsets = a3;
}

- (NSString)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
  objc_storeStrong((id *)&self->_previousState, a3);
}

- (TUIRenderModelSubviews)currentSubviewsModel
{
  return self->_currentSubviewsModel;
}

- (void)setCurrentSubviewsModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentSubviewsModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSubviewsModel, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_savedCurrentState, 0);
  objc_storeStrong((id *)&self->_animatingTargetState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_factory);
}

@end
