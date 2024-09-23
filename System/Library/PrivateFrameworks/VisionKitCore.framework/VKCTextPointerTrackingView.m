@implementation VKCTextPointerTrackingView

- (VKCTextPointerTrackingView)initWithQuad:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  VKCTextPointerTrackingView *v11;
  VKCTextPointerTrackingView *v12;
  void *v13;
  _OWORD v15[3];
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v5 = a3;
  v6 = v5;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "rotationTransformAndBoundingBox:", &v20);
    v8 = *((double *)&v20 + 1);
    v7 = *(double *)&v20;
    v10 = *((double *)&v21 + 1);
    v9 = *(double *)&v21;
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
  }
  v16.receiver = self;
  v16.super_class = (Class)VKCTextPointerTrackingView;
  v11 = -[VKCTextPointerTrackingView initWithFrame:](&v16, sel_initWithFrame_, v7, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_quad, a3);
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    -[VKCTextPointerTrackingView setTransform:](v12, "setTransform:", v15);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v12);
    -[VKCTextPointerTrackingView addInteraction:](v12, "addInteraction:", v13);

  }
  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  -[VKCTextPointerTrackingView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "convertRect:toView:", 0, v8, v10, v12, v14);
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v16 * 0.9 * -0.5, 3.0, v16 * 0.9, 1.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithShape:constrainedAxes:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
}

@end
