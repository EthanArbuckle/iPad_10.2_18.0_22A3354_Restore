@implementation OfflineRegionSelectorCropHandleView

+ (id)allHandles
{
  if (qword_1014D1D68 != -1)
    dispatch_once(&qword_1014D1D68, &stru_1011AC8D0);
  return (id)qword_1014D1D60;
}

- (OfflineRegionSelectorCropHandleView)initWithHandle:(unint64_t)a3
{
  OfflineRegionSelectorCropHandleView *v4;
  OfflineRegionSelectorCropHandleView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OfflineRegionSelectorCropHandleView;
  v4 = -[OfflineRegionSelectorCropHandleView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_handle = a3;
    -[OfflineRegionSelectorCropHandleView _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (void)_commonInit
{
  CAShapeLayer *v3;
  CAShapeLayer *handleLayer;
  void *v5;
  id v6;
  void *v7;
  unint64_t handle;
  CGRect PathBoundingBox;

  v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  handleLayer = self->_handleLayer;
  self->_handleLayer = v3;

  -[CAShapeLayer setAnchorPoint:](self->_handleLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.850000024)));
  -[CAShapeLayer setFillColor:](self->_handleLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView layer](self, "layer"));
  objc_msgSend(v7, "addSublayer:", self->_handleLayer);

  handle = self->_handle;
  if (handle > 3)
  {
    if ((handle & 0xFFFFFFFFFFFFFFFCLL) == 4)
      -[OfflineRegionSelectorCropHandleView _setupCornerHandle](self, "_setupCornerHandle");
  }
  else
  {
    -[OfflineRegionSelectorCropHandleView _setupEdgeHandle](self, "_setupEdgeHandle");
  }
  PathBoundingBox = CGPathGetPathBoundingBox(-[CAShapeLayer path](self->_handleLayer, "path"));
  -[CAShapeLayer setBounds:](self->_handleLayer, "setBounds:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (void)_setupEdgeHandle
{
  unint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;

  v3 = -[OfflineRegionSelectorCropHandleView handle](self, "handle");
  if (v3 > 3)
  {
    v6 = 0;
    v4 = 0.0;
    v5 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v4 = dbl_100E34608[v3];
    v5 = dbl_100E34628[v3];
    v6 = qword_100E34648[v3];
    v7 = dbl_100E34668[v3];
    v8 = dbl_100E34688[v3];
  }
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v6, 0.0, 0.0, v4, v5, 1.0, 1.0)));
  -[CAShapeLayer setPath:](self->_handleLayer, "setPath:", objc_msgSend(v9, "CGPath"));
  -[OfflineRegionSelectorCropHandleView _setTouchInsets:](self, "_setTouchInsets:", v7, v8, v7, v8);

}

- (void)_setupCornerHandle
{
  void *v3;
  id v4;
  double width;
  CGFloat height;
  uint64_t v7;
  double v8;
  double v9;
  CATransform3D *v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  CGRect PathBoundingBox;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v3, "moveToPoint:", 20.0, 0.0);
  objc_msgSend(v3, "addLineToPoint:", 23.0, 0.0);
  objc_msgSend(v3, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 2, 0, 0, 0, 24.0, 0.0, 1.0, 1.0);
  objc_msgSend(v3, "addLineToPoint:", 24.0, 4.0);
  objc_msgSend(v3, "addLineToPoint:", 22.0, 4.0);
  objc_msgSend(v3, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 1, 1, 0, 0, 4.0, 4.0, 18.0, 18.0);
  objc_msgSend(v3, "addLineToPoint:", 4.0, 24.0);
  objc_msgSend(v3, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 4, 0, 0, 0, 0.0, 24.0, 1.0, 1.0);
  objc_msgSend(v3, "addLineToPoint:", 0.0, 20.0);
  objc_msgSend(v3, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 1, 0, 0, 0, 0.0, 0.0, 20.0, 20.0);
  objc_msgSend(v3, "addLineToPoint:", 20.0, 0.0);
  objc_msgSend(v3, "closePath");
  v4 = objc_retainAutorelease(v3);
  -[CAShapeLayer setPath:](self->_handleLayer, "setPath:", objc_msgSend(v4, "CGPath"));
  PathBoundingBox = CGPathGetPathBoundingBox(-[CAShapeLayer path](self->_handleLayer, "path"));
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  v23 = *(_OWORD *)&CATransform3DIdentity.m31;
  v24 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v34.m31 = v23;
  *(_OWORD *)&v34.m33 = v24;
  v25 = *(_OWORD *)&CATransform3DIdentity.m41;
  v26 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v34.m41 = v25;
  *(_OWORD *)&v34.m43 = v26;
  v27 = *(_OWORD *)&CATransform3DIdentity.m11;
  v28 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v34.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v34.m13 = v28;
  v29 = *(_OWORD *)&CATransform3DIdentity.m21;
  v30 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v34.m21 = v29;
  *(_OWORD *)&v34.m23 = v30;
  if ((id)-[OfflineRegionSelectorCropHandleView handle](self, "handle") == (id)5)
  {
    *(_OWORD *)&v33.m31 = v23;
    *(_OWORD *)&v33.m33 = v24;
    *(_OWORD *)&v33.m41 = v25;
    *(_OWORD *)&v33.m43 = v26;
    *(_OWORD *)&v33.m11 = v27;
    *(_OWORD *)&v33.m13 = v28;
    *(_OWORD *)&v33.m21 = v29;
    *(_OWORD *)&v33.m23 = v30;
    CATransform3DTranslate(&v34, &v33, 0.0, height, 0.0);
    v7 = 0x3FF921FB54442D18;
    CATransform3DMakeRotation(&v33, 1.57079633, 0.0, 0.0, 1.0);
    v34 = v33;
    v8 = -width;
    v32 = v33;
    v9 = 0.0;
LABEL_5:
    v10 = CATransform3DTranslate(&v33, &v32, v9, v8, 0.0);
    v34 = v33;
    v11.n128_u64[1] = *(_QWORD *)&v33.m22;
    v12.n128_u64[1] = *(_QWORD *)&v33.m24;
    v11.n128_u64[0] = -24.0;
    v12.n128_u64[0] = -24.0;
    v13.n128_u64[0] = 0;
    v14.n128_u64[0] = 0;
    v15.n128_u64[0] = v7;
    goto LABEL_6;
  }
  if ((id)-[OfflineRegionSelectorCropHandleView handle](self, "handle") == (id)7)
  {
    *(_OWORD *)&v33.m31 = v23;
    *(_OWORD *)&v33.m33 = v24;
    *(_OWORD *)&v33.m41 = v25;
    *(_OWORD *)&v33.m43 = v26;
    *(_OWORD *)&v33.m11 = v27;
    *(_OWORD *)&v33.m13 = v28;
    *(_OWORD *)&v33.m21 = v29;
    *(_OWORD *)&v33.m23 = v30;
    CATransform3DTranslate(&v34, &v33, width, height, 0.0);
    v7 = 0x400921FB54442D18;
    CATransform3DMakeRotation(&v33, 3.14159265, 0.0, 0.0, 1.0);
    v34 = v33;
    v9 = -width;
    v32 = v33;
    v8 = -width;
    goto LABEL_5;
  }
  if ((id)-[OfflineRegionSelectorCropHandleView handle](self, "handle") != (id)6)
  {
    v18 = -24.0;
    v22 = 0.0;
    v20 = 0.0;
    v16 = -24.0;
    goto LABEL_7;
  }
  *(_OWORD *)&v33.m31 = v23;
  *(_OWORD *)&v33.m33 = v24;
  *(_OWORD *)&v33.m41 = v25;
  *(_OWORD *)&v33.m43 = v26;
  *(_OWORD *)&v33.m11 = v27;
  *(_OWORD *)&v33.m13 = v28;
  *(_OWORD *)&v33.m21 = v29;
  *(_OWORD *)&v33.m23 = v30;
  CATransform3DTranslate(&v34, &v33, width, 0.0, 0.0);
  CATransform3DMakeRotation(&v33, 4.71238898, 0.0, 0.0, 1.0);
  v34 = v33;
  v32 = v33;
  v10 = CATransform3DTranslate(&v33, &v32, -width, 0.0, 0.0);
  v34 = v33;
  v11.n128_u64[1] = *(_QWORD *)&v33.m22;
  v12.n128_u64[1] = *(_QWORD *)&v33.m24;
  v15.n128_u64[0] = 0xBFF921FB54442D18;
  v11.n128_u64[0] = -24.0;
  v12.n128_u64[0] = -24.0;
  v13.n128_u64[0] = 0;
  v14.n128_u64[0] = 0;
LABEL_6:
  v16 = UIEdgeInsetsRotate(v10, v11, v12, v13, v14, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
LABEL_7:
  v31 = v34;
  -[CAShapeLayer setTransform:](self->_handleLayer, "setTransform:", &v31);
  -[OfflineRegionSelectorCropHandleView _setTouchInsets:](self, "_setTouchInsets:", v16, v18, v20, v22);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CAShapeLayer bounds](self->_handleLayer, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)constraintsForHandlePinnedToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a3;
  switch(-[OfflineRegionSelectorCropHandleView handle](self, "handle"))
  {
    case 0uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView centerXAnchor](self, "centerXAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v21[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView bottomAnchor](self, "bottomAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v21[1] = v10;
      v11 = v21;
      goto LABEL_11;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView rightAnchor](self, "rightAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v20[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView centerYAnchor](self, "centerYAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v20[1] = v10;
      v11 = v20;
      goto LABEL_11;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView centerXAnchor](self, "centerXAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v19[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView topAnchor](self, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v19[1] = v10;
      v11 = v19;
      goto LABEL_11;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView leftAnchor](self, "leftAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
      v18[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView centerYAnchor](self, "centerYAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v18[1] = v10;
      v11 = v18;
      goto LABEL_11;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView leftAnchor](self, "leftAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -4.0));
      v17[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView topAnchor](self, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -4.0));
      v17[1] = v10;
      v11 = v17;
      goto LABEL_11;
    case 5uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView rightAnchor](self, "rightAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 4.0));
      v16[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView topAnchor](self, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -4.0));
      v16[1] = v10;
      v11 = v16;
      goto LABEL_11;
    case 6uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView leftAnchor](self, "leftAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -4.0));
      v15[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView bottomAnchor](self, "bottomAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 4.0));
      v15[1] = v10;
      v11 = v15;
      goto LABEL_11;
    case 7uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView rightAnchor](self, "rightAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 4.0));
      v14[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineRegionSelectorCropHandleView bottomAnchor](self, "bottomAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 4.0));
      v14[1] = v10;
      v11 = v14;
LABEL_11:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

      break;
    default:
      v12 = &__NSArray0__struct;
      break;
  }

  return v12;
}

- (unint64_t)handle
{
  return self->_handle;
}

- (CAShapeLayer)handleLayer
{
  return self->_handleLayer;
}

- (void)setHandleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_handleLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleLayer, 0);
}

@end
