@implementation TUIProgressView

+ (id)renderModelWithIdentifier:(id)a3 progressId:(id)a4 mode:(id)a5 value:(double)a6 dynamicProgress:(id)a7 paused:(BOOL)a8 color:(id)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _TUIProgressRenderModel *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  TUIRenderModelView *v24;

  v10 = a8;
  v14 = a5;
  v15 = a9;
  v16 = a7;
  v17 = a3;
  v18 = objc_alloc_init(_TUIProgressRenderModel);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
  v20 = objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("determinate"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
    v22 = objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("determinate-small"));

    if (v22)
      v23 = 1;
    else
      v23 = 2;
  }
  else
  {
    v23 = 0;
  }
  -[_TUIProgressRenderModel setMode:](v18, "setMode:", v23);
  -[_TUIProgressRenderModel setValue:](v18, "setValue:", a6);
  -[_TUIProgressRenderModel setDynamicProgress:](v18, "setDynamicProgress:", v16);

  -[_TUIProgressRenderModel setPaused:](v18, "setPaused:", v10);
  -[_TUIProgressRenderModel setColor:](v18, "setColor:", v15);

  v24 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierProgressView"), v17, v18);
  return v24;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIProgressView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[TUIProgressView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)_configureWithModel:(id)a3
{
  void *v5;
  double v6;
  TUIDynamicProgress *v7;
  TUIDynamicProgress *dynamicProgress;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView dynamicProgress](self, "dynamicProgress"));
  objc_msgSend(v5, "unregisterProgressObserver:", self);

  objc_storeStrong((id *)&self->_renderModel, a3);
  self->_mode = -[_TUIProgressRenderModel mode](self->_renderModel, "mode");
  -[_TUIProgressRenderModel value](self->_renderModel, "value");
  self->_value = v6;
  v7 = (TUIDynamicProgress *)objc_claimAutoreleasedReturnValue(-[_TUIProgressRenderModel dynamicProgress](self->_renderModel, "dynamicProgress"));
  dynamicProgress = self->_dynamicProgress;
  self->_dynamicProgress = v7;

  self->_paused = -[_TUIProgressRenderModel paused](self->_renderModel, "paused");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIProgressRenderModel color](self->_renderModel, "color"));
  v10 = v9;
  if (!v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  objc_storeStrong((id *)&self->_color, v10);
  if (!v9)

  if (-[TUIProgressView isDeterminate](self, "isDeterminate"))
    -[TUIProgressView _setupDeterminateBackgroundLayers](self, "_setupDeterminateBackgroundLayers");
  else
    -[TUIProgressView _teardownDeterminateBackgroundLayers](self, "_teardownDeterminateBackgroundLayers");
  -[TUIProgressView _setupProgressLayer](self, "_setupProgressLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView dynamicProgress](self, "dynamicProgress"));
  objc_msgSend(v11, "registerProgressObserver:", self);

}

- (void)_updateLayerGeometry:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  double MidY;
  double v14;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16 = a3;
  -[TUIProgressView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v16, "bounds");
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(v17, v20))
    objc_msgSend(v16, "setBounds:", v5, v7, v9, v11);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  MidY = CGRectGetMidY(v19);
  objc_msgSend(v16, "position");
  if (v15 != MidX || v14 != MidY)
    objc_msgSend(v16, "setPosition:", MidX, MidY);

}

- (void)_setupDeterminateBackgroundLayers
{
  CAShapeLayer *determinateOuterCircleLayer;
  double v4;
  double v5;
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  void *v8;
  const CGPath *v9;
  CAShapeLayer *determinateIconLayer;
  CAShapeLayer *v11;
  CAShapeLayer *v12;
  void *v13;
  CGPath *Mutable;
  double MidX;
  double MidY;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[TUIProgressView bounds](self, "bounds");
  determinateOuterCircleLayer = self->_determinateOuterCircleLayer;
  v5 = v4 / 27.0;
  if (!determinateOuterCircleLayer)
  {
    v6 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    v7 = self->_determinateOuterCircleLayer;
    self->_determinateOuterCircleLayer = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView layer](self, "layer"));
    objc_msgSend(v8, "addSublayer:", self->_determinateOuterCircleLayer);

    determinateOuterCircleLayer = self->_determinateOuterCircleLayer;
  }
  -[TUIProgressView _updateLayerGeometry:](self, "_updateLayerGeometry:", determinateOuterCircleLayer);
  -[CAShapeLayer setFillColor:](self->_determinateOuterCircleLayer, "setFillColor:", 0);
  -[CAShapeLayer setStrokeColor:](self->_determinateOuterCircleLayer, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
  -[CAShapeLayer setLineWidth:](self->_determinateOuterCircleLayer, "setLineWidth:", v5 * 1.5);
  -[TUIProgressView bounds](self, "bounds");
  v23 = CGRectInset(v22, v5 * 1.5 * 0.5, v5 * 1.5 * 0.5);
  v9 = CGPathCreateWithEllipseInRect(v23, 0);
  -[CAShapeLayer setPath:](self->_determinateOuterCircleLayer, "setPath:", v9);
  CGPathRelease(v9);
  determinateIconLayer = self->_determinateIconLayer;
  if (!determinateIconLayer)
  {
    if (self->_mode == 2)
    {
      determinateIconLayer = 0;
    }
    else
    {
      v11 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
      v12 = self->_determinateIconLayer;
      self->_determinateIconLayer = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView layer](self, "layer"));
      objc_msgSend(v13, "addSublayer:", self->_determinateIconLayer);

      determinateIconLayer = self->_determinateIconLayer;
    }
  }
  -[TUIProgressView _updateLayerGeometry:](self, "_updateLayerGeometry:", determinateIconLayer);
  -[CAShapeLayer setFillColor:](self->_determinateIconLayer, "setFillColor:", -[UIColor CGColor](self->_color, "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_determinateIconLayer, "setStrokeColor:", 0);
  Mutable = CGPathCreateMutable();
  -[TUIProgressView bounds](self, "bounds");
  MidX = CGRectGetMidX(v24);
  -[TUIProgressView bounds](self, "bounds");
  MidY = CGRectGetMidY(v25);
  v17 = v5 * 8.0;
  if (self->_paused)
  {
    v18 = v5 * 3.0;
    v19 = MidX - v17 * 0.5;
    v20 = MidY - v17 * 0.5;
    v26.origin.x = v19;
    v26.origin.y = v20;
    v26.size.width = v5 * 3.0;
    v26.size.height = v5 * 8.0;
    CGPathAddRoundedRect(Mutable, 0, v26, v5, v5);
    v21 = v5 * 3.0 + v5 + v5 + v19;
  }
  else
  {
    v21 = MidX - v17 * 0.5;
    v20 = MidY - v17 * 0.5;
    v18 = v5 * 8.0;
  }
  v27.origin.x = v21;
  v27.origin.y = v20;
  v27.size.width = v18;
  v27.size.height = v5 * 8.0;
  CGPathAddRoundedRect(Mutable, 0, v27, v5, v5);
  -[CAShapeLayer setPath:](self->_determinateIconLayer, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)_teardownDeterminateBackgroundLayers
{
  CAShapeLayer *determinateOuterCircleLayer;
  CAShapeLayer *determinateIconLayer;

  -[CAShapeLayer removeFromSuperlayer](self->_determinateOuterCircleLayer, "removeFromSuperlayer");
  determinateOuterCircleLayer = self->_determinateOuterCircleLayer;
  self->_determinateOuterCircleLayer = 0;

  -[CAShapeLayer removeFromSuperlayer](self->_determinateIconLayer, "removeFromSuperlayer");
  determinateIconLayer = self->_determinateIconLayer;
  self->_determinateIconLayer = 0;

}

- (double)_computeCurrentValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double value;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress")), v6, v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progress"));
    objc_msgSend(v7, "floatValue");
    value = v8;

  }
  else
  {
    value = self->_value;
  }

  return value;
}

- (void)_setupProgressLayer
{
  TUIRadialProgressLayer *progressLayer;
  TUIRadialProgressLayer *v4;
  TUIRadialProgressLayer *v5;
  void *v6;
  TUIRadialProgressLayer *v7;
  unint64_t mode;
  TUIRadialProgressLayer *v9;
  CATransform3D v10;
  CATransform3D v11;

  progressLayer = self->_progressLayer;
  if (!progressLayer)
  {
    v4 = objc_opt_new(TUIRadialProgressLayer);
    v5 = self->_progressLayer;
    self->_progressLayer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView layer](self, "layer"));
    objc_msgSend(v6, "addSublayer:", self->_progressLayer);

    progressLayer = self->_progressLayer;
  }
  -[TUIProgressView _updateLayerGeometry:](self, "_updateLayerGeometry:", progressLayer);
  -[TUIRadialProgressLayer setStrokeColor:](self->_progressLayer, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
  v7 = self->_progressLayer;
  mode = self->_mode;
  -[TUIRadialProgressLayer bounds](v7, "bounds");
  -[TUIRadialProgressLayer setupWithMode:rect:](v7, "setupWithMode:rect:", mode);
  if (-[TUIProgressView isDeterminate](self, "isDeterminate"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[TUIProgressView _computeCurrentValue:](self, "_computeCurrentValue:", self->_dynamicProgress);
    -[TUIRadialProgressLayer setValue:](self->_progressLayer, "setValue:");
    CATransform3DMakeRotation(&v11, -1.57079633, 0.0, 0.0, 1.0);
    v9 = self->_progressLayer;
    v10 = v11;
    -[TUIRadialProgressLayer setTransform:](v9, "setTransform:", &v10);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[TUIProgressView _computeCurrentValue:](self, "_computeCurrentValue:", v4);
    -[TUIRadialProgressLayer setValue:](self->_progressLayer, "setValue:");
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4FB20;
    v5[3] = &unk_23D7D0;
    v5[4] = self;
    v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIProgressView dynamicProgress](self, "dynamicProgress"));
  objc_msgSend(v3, "unregisterProgressObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIProgressView;
  -[TUIProgressView dealloc](&v4, "dealloc");
}

- (BOOL)isDeterminate
{
  return (self->_mode & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (CAShapeLayer)determinateOuterCircleLayer
{
  return self->_determinateOuterCircleLayer;
}

- (void)setDeterminateOuterCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_determinateOuterCircleLayer, a3);
}

- (CAShapeLayer)determinateIconLayer
{
  return self->_determinateIconLayer;
}

- (void)setDeterminateIconLayer:(id)a3
{
  objc_storeStrong((id *)&self->_determinateIconLayer, a3);
}

- (TUIRadialProgressLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (_TUIProgressRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIImage)determinateUnpausedBackgroundImage
{
  return self->_determinateUnpausedBackgroundImage;
}

- (void)setDeterminateUnpausedBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_determinateUnpausedBackgroundImage, a3);
}

- (UIImage)determinatePausedBackgroundImage
{
  return self->_determinatePausedBackgroundImage;
}

- (void)setDeterminatePausedBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_determinatePausedBackgroundImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_determinatePausedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_determinateUnpausedBackgroundImage, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_determinateIconLayer, 0);
  objc_storeStrong((id *)&self->_determinateOuterCircleLayer, 0);
}

@end
