@implementation DebugDirectionAnnotationView

- (DebugDirectionAnnotationView)initWithAnnotation:(id)a3 debugAnnotation:(id)a4 reuseIdentifier:(id)a5
{
  id v8;
  DebugDirectionAnnotationView *v9;
  DebugDirectionAnnotationView *v10;
  id *p_annotation;
  uint64_t v12;
  CALayer *directionView;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CALayer *fovLeftDirectionView;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  CALayer *fovRightDirectionView;
  double v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  DebugDirectionAnnotationView *v51;
  objc_super v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];

  v8 = a3;
  v53.receiver = self;
  v53.super_class = (Class)DebugDirectionAnnotationView;
  v9 = -[DebugDirectionAnnotationView initWithAnnotation:reuseIdentifier:](&v53, "initWithAnnotation:reuseIdentifier:", v8, a5);
  v10 = v9;
  if (v9)
  {
    p_annotation = (id *)&v9->_annotation;
    objc_storeStrong((id *)&v9->_annotation, a3);
    v12 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    directionView = v10->_directionView;
    v10->_directionView = (CALayer *)v12;

    objc_msgSend(*p_annotation, "size");
    v15 = v14;
    objc_msgSend(*p_annotation, "size");
    -[CALayer setBounds:](v10->_directionView, "setBounds:", 0.0, 0.0, v15, v16);
    -[CALayer setPosition:](v10->_directionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_directionView, "setAnchorPoint:", 0.5, 0.0);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_annotation, "color")));
    -[CALayer setBackgroundColor:](v10->_directionView, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

    v58[0] = CFSTR("bounds");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v59[0] = v18;
    v58[1] = CFSTR("position");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v59[1] = v19;
    v58[2] = CFSTR("cornerRadius");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v59[2] = v20;
    v58[3] = CFSTR("transform");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v59[3] = v21;
    v58[4] = CFSTR("hidden");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v59[4] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 5));
    -[CALayer setActions:](v10->_directionView, "setActions:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotationView layer](v10, "layer"));
    objc_msgSend(v24, "addSublayer:", v10->_directionView);

    v25 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    fovLeftDirectionView = v10->_fovLeftDirectionView;
    v10->_fovLeftDirectionView = (CALayer *)v25;

    objc_msgSend(*p_annotation, "size");
    v28 = v27;
    objc_msgSend(*p_annotation, "size");
    -[CALayer setFrame:](v10->_fovLeftDirectionView, "setFrame:", 0.0, 0.0, v28, v29);
    -[CALayer setPosition:](v10->_fovLeftDirectionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_fovLeftDirectionView, "setAnchorPoint:", 0.5, 0.0);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_annotation, "color")));
    -[CALayer setBackgroundColor:](v10->_fovLeftDirectionView, "setBackgroundColor:", objc_msgSend(v30, "CGColor"));

    v56[0] = CFSTR("bounds");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[0] = v31;
    v56[1] = CFSTR("position");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[1] = v32;
    v56[2] = CFSTR("cornerRadius");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[2] = v33;
    v56[3] = CFSTR("transform");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[3] = v34;
    v56[4] = CFSTR("hidden");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v57[4] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 5));
    -[CALayer setActions:](v10->_fovLeftDirectionView, "setActions:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotationView layer](v10, "layer"));
    objc_msgSend(v37, "addSublayer:", v10->_fovLeftDirectionView);

    v38 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    fovRightDirectionView = v10->_fovRightDirectionView;
    v10->_fovRightDirectionView = (CALayer *)v38;

    objc_msgSend(*p_annotation, "size");
    v41 = v40;
    objc_msgSend(*p_annotation, "size");
    -[CALayer setFrame:](v10->_fovRightDirectionView, "setFrame:", 0.0, 0.0, v41, v42);
    -[CALayer setPosition:](v10->_fovRightDirectionView, "setPosition:", 0.0, 0.0);
    -[CALayer setAnchorPoint:](v10->_fovRightDirectionView, "setAnchorPoint:", 0.5, 0.0);
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_annotation, "color")));
    -[CALayer setBackgroundColor:](v10->_fovRightDirectionView, "setBackgroundColor:", objc_msgSend(v43, "CGColor"));

    v54[0] = CFSTR("bounds");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[0] = v44;
    v54[1] = CFSTR("position");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[1] = v45;
    v54[2] = CFSTR("cornerRadius");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[2] = v46;
    v54[3] = CFSTR("transform");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[3] = v47;
    v54[4] = CFSTR("hidden");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[4] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 5));
    -[CALayer setActions:](v10->_fovRightDirectionView, "setActions:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotationView layer](v10, "layer"));
    objc_msgSend(v50, "addSublayer:", v10->_fovRightDirectionView);

    v51 = v10;
  }

  return v10;
}

- (void)setAnnotation:(id)a3
{
  DebugDirectionAnnotation **p_annotation;
  id v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;

  p_annotation = &self->_annotation;
  objc_storeStrong((id *)&self->_annotation, a3);
  v6 = a3;
  -[DebugDirectionAnnotation size](*p_annotation, "size");
  v8 = v7;
  -[DebugDirectionAnnotation size](*p_annotation, "size");
  -[CALayer setBounds:](self->_directionView, "setBounds:", 0.0, 0.0, v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotation color](*p_annotation, "color")));
  -[CALayer setBackgroundColor:](self->_directionView, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  -[DebugDirectionAnnotation size](*p_annotation, "size");
  v12 = v11;
  -[DebugDirectionAnnotation size](*p_annotation, "size");
  -[CALayer setBounds:](self->_fovLeftDirectionView, "setBounds:", 0.0, 0.0, v12, v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotation color](*p_annotation, "color")));
  -[CALayer setBackgroundColor:](self->_fovLeftDirectionView, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  -[DebugDirectionAnnotation size](*p_annotation, "size");
  v16 = v15;
  -[DebugDirectionAnnotation size](*p_annotation, "size");
  -[CALayer setBounds:](self->_fovRightDirectionView, "setBounds:", 0.0, 0.0, v16, v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DebugDirectionAnnotation color](*p_annotation, "color")));
  -[CALayer setBackgroundColor:](self->_fovRightDirectionView, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

  -[DebugDirectionAnnotationView _updateTransform](self, "_updateTransform");
}

- (void)_setMapPitchRadians:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DebugDirectionAnnotationView;
  -[DebugDirectionAnnotationView _setMapPitchRadians:](&v4, "_setMapPitchRadians:", a3);
  -[DebugDirectionAnnotationView _updateTransform](self, "_updateTransform");
}

- (void)_setMapRotationRadians:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DebugDirectionAnnotationView;
  -[DebugDirectionAnnotationView _setMapRotationRadians:](&v4, "_setMapRotationRadians:", a3);
  -[DebugDirectionAnnotationView _updateTransform](self, "_updateTransform");
}

- (void)_updateTransform
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CALayer *directionView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CALayer *fovLeftDirectionView;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CALayer *fovRightDirectionView;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;
  CATransform3D v24;
  CATransform3D v25;
  CATransform3D v26;
  CATransform3D v27;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  memset(&v27, 0, sizeof(v27));
  -[DebugDirectionAnnotationView _mapPitchRadians](self, "_mapPitchRadians");
  CATransform3DMakeRotation(&v27, v3, 1.0, 0.0, 0.0);
  -[DebugDirectionAnnotation direction](self->_annotation, "direction");
  v5 = v4 * 0.0174532925;
  -[DebugDirectionAnnotationView _mapRotationRadians](self, "_mapRotationRadians");
  v25 = v27;
  CATransform3DRotate(&v26, &v25, v5 - v6 + 3.14159265, 0.0, 0.0, 1.0);
  directionView = self->_directionView;
  v24 = v26;
  -[CALayer setTransform:](directionView, "setTransform:", &v24);
  -[DebugDirectionAnnotation direction](self->_annotation, "direction");
  v9 = v8 * 0.0174532925;
  -[DebugDirectionAnnotation fov](self->_annotation, "fov");
  v11 = v9 - v10 * 0.5 * 0.0174532925;
  -[DebugDirectionAnnotationView _mapRotationRadians](self, "_mapRotationRadians");
  v25 = v27;
  CATransform3DRotate(&v23, &v25, v11 - v12 + 3.14159265, 0.0, 0.0, 1.0);
  fovLeftDirectionView = self->_fovLeftDirectionView;
  v22 = v23;
  -[CALayer setTransform:](fovLeftDirectionView, "setTransform:", &v22);
  -[DebugDirectionAnnotation direction](self->_annotation, "direction");
  v15 = v14 * 0.0174532925;
  -[DebugDirectionAnnotation fov](self->_annotation, "fov");
  v17 = v15 + v16 * 0.5 * 0.0174532925;
  -[DebugDirectionAnnotationView _mapRotationRadians](self, "_mapRotationRadians");
  v25 = v27;
  CATransform3DRotate(&v21, &v25, v17 - v18 + 3.14159265, 0.0, 0.0, 1.0);
  fovRightDirectionView = self->_fovRightDirectionView;
  v20 = v21;
  -[CALayer setTransform:](fovRightDirectionView, "setTransform:", &v20);
  +[CATransaction commit](CATransaction, "commit");
}

- (DebugDirectionAnnotation)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fovRightDirectionView, 0);
  objc_storeStrong((id *)&self->_fovLeftDirectionView, 0);
  objc_storeStrong((id *)&self->_directionView, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
