@implementation ODIImageLinear

- (ODIImageLinear)initWithImagePresentationName:(id)a3 state:(id)a4
{
  id v7;
  id v8;
  ODIImageLinear *v9;
  ODIImageLinear *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ODIImageLinear;
  v9 = -[ODILinear initWithState:](&v12, sel_initWithState_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mImagePresentationName, a3);
    -[ODILinear setIsTextCentered:](v10, "setIsTextCentered:", 0);
  }

  return v10;
}

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  CGFloat MaxY;
  CGFloat MaxX;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = a3;
  LODWORD(v9) = 1033476506;
  +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:](ODIDrawable, "shapeGeometryForRoundedRectangleWithRadius:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v10, self->super.mState, x, y, width, height, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v30, v12, self->super.mState);
  if (self->super.mIsHorizontal)
  {
    v13 = width * 0.05;
    v15 = y + v13;
    v16 = width - (float)(v13 + v13);
    v17 = v16 * 0.899999976;
    v31.origin.x = x + v13;
    v14 = v31.origin.x;
    v31.origin.y = v15;
    v31.size.width = v16;
    v31.size.height = v16 * 0.899999976;
    MaxY = CGRectGetMaxY(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v18 = CGRectGetMaxY(v32);
    v33.origin.x = v14;
    v33.origin.y = v15;
    v33.size.width = v16;
    v33.size.height = v16 * 0.899999976;
    v19 = CGRectGetMaxY(v33);
    height = v18 - v19;
    y = MaxY;
  }
  else
  {
    v20 = height * 0.05;
    v15 = y + v20;
    v17 = height - (float)(v20 + v20);
    v16 = v17 * 1.11;
    v34.origin.x = x + v20;
    v14 = v34.origin.x;
    v34.origin.y = v15;
    v34.size.width = v17 * 1.11;
    v34.size.height = v17;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v21 = CGRectGetMaxX(v35);
    v36.origin.x = v14;
    v36.origin.y = v15;
    v36.size.width = v17 * 1.11;
    v36.size.height = v17;
    v19 = CGRectGetMaxX(v36);
    width = v21 - v19;
    x = MaxX;
  }
  LODWORD(v19) = 1033476506;
  +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:](ODIDrawable, "shapeGeometryForRoundedRectangleWithRadius:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v22, self->super.mState, v14, v15, v16, v17, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODIDrawable mapStyleForPresentationName:point:shape:state:](ODIDrawable, "mapStyleForPresentationName:point:shape:state:", self->mImagePresentationName, v30, v24, self->super.mState);
  +[ODIDrawable shapeGeometryForRectangle](ODIDrawable, "shapeGeometryForRectangle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 0;
  +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v25, self->super.mState, x, y, width, height, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIText mapTextFromPoint:toShape:isCenteredHorizontally:isCenteredVertically:includeChildren:state:](ODIText, "mapTextFromPoint:toShape:isCenteredHorizontally:isCenteredVertically:includeChildren:state:", v30, v27, self->super.mIsTextCenteredHorizontally, self->super.mIsTextCenteredVertically, 1, self->super.mState);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mImagePresentationName, 0);
}

@end
