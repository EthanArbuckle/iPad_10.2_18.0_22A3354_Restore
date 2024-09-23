@implementation CRLCanvasSpacingGuideUILayer

- (CRLCanvasSpacingGuideUILayer)initWithSpacingRect:(CGRect)a3 ofOrientation:(int)a4 icc:(id)a5 useVisibleRect:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CRLCanvasSpacingGuideUILayer *v13;
  uint64_t v14;
  CRLSwappableAxesGeometry *mHorizontalGeom;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRLCanvasSpacingGuideUILayer;
  v13 = -[CRLCanvasSpacingGuideUILayer init](&v17, "init");
  if (v13)
  {
    if (a4)
      v14 = objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry swappedAxesGeometry](CRLSwappableAxesGeometry, "swappedAxesGeometry"));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry standardAxesGeometry](CRLSwappableAxesGeometry, "standardAxesGeometry"));
    mHorizontalGeom = v13->mHorizontalGeom;
    v13->mHorizontalGeom = (CRLSwappableAxesGeometry *)v14;

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](v13, "setFrameFromSpacingRect:icc:", v12, x, y, width, height);
    +[CATransaction commit](CATransaction, "commit");
  }

  return v13;
}

- (void)setFrameFromSpacingRect:(CGRect)a3 icc:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CRLSwappableAxesGeometry *mHorizontalGeom;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CRLSwappableAxesGeometry *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CRLSwappableAxesGeometry *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CRLSwappableAxesGeometry *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CRLSwappableAxesGeometry *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double mWidth;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double rect;
  CGAffineTransform v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->mUseVisibleRect)
  {
    objc_msgSend(v9, "visibleScaledRectForCanvasUI");
    v81 = v11;
    v82 = v10;
    v80 = v12;
    rect = v13;
  }
  else
  {
    v81 = CGRectNull.origin.y;
    v82 = CGRectNull.origin.x;
    v80 = CGRectNull.size.width;
    rect = CGRectNull.size.height;
  }
  objc_msgSend(v9, "viewScale");
  v79 = v14;
  CGAffineTransformMakeScale(&v84, v14, v14);
  v85.origin.x = x;
  v85.origin.y = y;
  v85.size.width = width;
  v85.size.height = height;
  v86 = CGRectApplyAffineTransform(v85, &v84);
  v15 = v86.origin.x;
  v16 = v86.origin.y;
  v17 = v86.size.width;
  v18 = v86.size.height;
  mHorizontalGeom = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMinX:](mHorizontalGeom, "rectMinX:");
  v21 = v20;
  -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v15, v16, v17, v18);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](mHorizontalGeom, "makePointWithX:Y:", v21, v22);
  v24 = v23;
  v26 = v25;
  v27 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMaxX:](v27, "rectMaxX:", v15, v16, v17, v18);
  v29 = v28;
  -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v15, v16, v17, v18);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v27, "makePointWithX:Y:", v29, v30);
  v32 = v31;
  v87.origin.y = v81;
  v87.origin.x = v82;
  v87.size.width = v80;
  v87.size.height = rect;
  if (!CGRectIsNull(v87))
  {
    v33 = self->mHorizontalGeom;
    -[CRLSwappableAxesGeometry rectMinX:](v33, "rectMinX:", v15, v16, v17, v18);
    v77 = v34;
    -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v15, v16, v17, v18);
    v36 = v35;
    -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v82, v81, v80, rect);
    -[CRLSwappableAxesGeometry makePointWithX:Y:](v33, "makePointWithX:Y:", v77, fmax(v36, v37));
    v76 = v38;
    v78 = v39;
    v40 = self->mHorizontalGeom;
    -[CRLSwappableAxesGeometry rectMaxX:](v40, "rectMaxX:", v15, v16, v17, v18);
    v42 = v41;
    -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v15, v16, v17, v18);
    v44 = v43;
    v24 = v76;
    -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v82, v81, v80, rect);
    v46 = fmin(v44, v45);
    v47 = v42;
    v26 = v78;
    -[CRLSwappableAxesGeometry makePointWithX:Y:](v40, "makePointWithX:Y:", v47, v46);
    v32 = v48;
  }
  v49 = sub_10005FDB0(v24, v26, v32);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMinX:](v56, "rectMinX:");
  v58 = v57;
  -[CRLSwappableAxesGeometry rectMidY:](self->mHorizontalGeom, "rectMidY:", v49, v51, v53, v55);
  v60 = v59 + 1.0 + -7.0 / v79;
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v49, v51, v53, v55);
  -[CRLSwappableAxesGeometry makeRectWithX:Y:width:height:](v56, "makeRectWithX:Y:width:height:", v58, v60, v61, 15.0);
  v66 = sub_100063148(v62, v63, v64, v65);
  v68 = v67;
  v70 = v69;
  v72 = v71;
  -[CRLCanvasSpacingGuideUILayer setFrame:](self, "setFrame:");
  mWidth = self->mWidth;
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v66, v68, v70, v72);
  if (mWidth != v74)
  {
    -[CAShapeLayer removeFromSuperlayer](self->mArrowLayer, "removeFromSuperlayer");
    -[CRLCanvasSpacingGuideUILayer p_generateArrowLayerForSpacingRect:andViewScale:](self, "p_generateArrowLayerForSpacingRect:andViewScale:", v66, v68, v70, v72, v79);
    -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v66, v68, v70, v72);
    self->mWidth = v75;
  }
  +[CATransaction commit](CATransaction, "commit");

}

- (void)p_generateArrowLayerForSpacingRect:(CGRect)a3 andViewScale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  CAShapeLayer *v9;
  CAShapeLayer *mArrowLayer;
  CGPath *Mutable;
  double v12;
  double v13;
  CRLSwappableAxesGeometry *mHorizontalGeom;
  double v15;
  double v16;
  double v17;
  CRLSwappableAxesGeometry *v18;
  double v19;
  double v20;
  double v21;
  CRLSwappableAxesGeometry *v22;
  double v23;
  double v24;
  double v25;
  CRLSwappableAxesGeometry *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CRLSwappableAxesGeometry *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CRLSwappableAxesGeometry *v38;
  double v39;
  double v40;
  double v41;
  CRLSwappableAxesGeometry *v42;
  double v43;
  double v44;
  double v45;
  CRLSwappableAxesGeometry *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CRLSwappableAxesGeometry *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  mArrowLayer = self->mArrowLayer;
  self->mArrowLayer = v9;

  Mutable = CGPathCreateMutable();
  -[CRLSwappableAxesGeometry makePointWithX:Y:](self->mHorizontalGeom, "makePointWithX:Y:", 0.5, 0.5);
  v78 = v13;
  v79 = v12;
  mHorizontalGeom = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](mHorizontalGeom, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](mHorizontalGeom, "makePointWithX:Y:", 1.5, v15 * 0.5);
  v70 = v16;
  v75 = v17;
  v18 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v18, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v18, "makePointWithX:Y:", 0.5, v19 + -0.5);
  v76 = v21;
  v77 = v20;
  v22 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v22, "rectWidth:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v22, "makePointWithX:Y:", v23 + -0.5, 0.5);
  v73 = v25;
  v74 = v24;
  v26 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v26, "rectWidth:", x, y, width, height);
  v28 = v27 + -1.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v26, "makePointWithX:Y:", v28, v29 * 0.5);
  v71 = v31;
  v72 = v30;
  v32 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v32, "rectWidth:", x, y, width, height);
  v34 = v33 + -0.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v32, "makePointWithX:Y:", v34, v35 + -0.5);
  v68 = v37;
  v69 = v36;
  v38 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v38, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v38, "makePointWithX:Y:", 5.5, v39 * 0.5 + -3.0);
  v66 = v41;
  v67 = v40;
  v42 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v42, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v42, "makePointWithX:Y:", 5.5, v43 * 0.5 + 3.0);
  v64 = v45;
  v65 = v44;
  v46 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v46, "rectWidth:", x, y, width, height);
  v48 = v47 + -5.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v46, "makePointWithX:Y:", v48, v49 * 0.5 + -3.0);
  v62 = v51;
  v63 = v50;
  v52 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v52, "rectWidth:", x, y, width, height);
  v54 = v53 + -5.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  -[CRLSwappableAxesGeometry makePointWithX:Y:](v52, "makePointWithX:Y:", v54, v55 * 0.5 + 3.0);
  v60 = v57;
  v61 = v56;
  CGPathMoveToPoint(Mutable, 0, v79, v78);
  CGPathAddLineToPoint(Mutable, 0, v77, v76);
  CGPathMoveToPoint(Mutable, 0, v74, v73);
  CGPathAddLineToPoint(Mutable, 0, v69, v68);
  CGPathMoveToPoint(Mutable, 0, v70, v75);
  CGPathAddLineToPoint(Mutable, 0, v72, v71);
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", x, y, width, height);
  if (v58 * a4 >= 14.0)
  {
    CGPathMoveToPoint(Mutable, 0, v67, v66);
    CGPathAddLineToPoint(Mutable, 0, v70, v75);
    CGPathAddLineToPoint(Mutable, 0, v65, v64);
    CGPathMoveToPoint(Mutable, 0, v63, v62);
    CGPathAddLineToPoint(Mutable, 0, v72, v71);
    CGPathAddLineToPoint(Mutable, 0, v61, v60);
  }
  -[CAShapeLayer setFillColor:](self->mArrowLayer, "setFillColor:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasGuideController guideColor](CRLCanvasGuideController, "guideColor"));
  -[CAShapeLayer setStrokeColor:](self->mArrowLayer, "setStrokeColor:", objc_msgSend(v59, "CGColor"));

  -[CAShapeLayer setLineCap:](self->mArrowLayer, "setLineCap:", kCALineCapSquare);
  -[CAShapeLayer setLineWidth:](self->mArrowLayer, "setLineWidth:", 1.0);
  -[CAShapeLayer setPath:](self->mArrowLayer, "setPath:", Mutable);
  CGPathRelease(Mutable);
  -[CRLCanvasSpacingGuideUILayer addSublayer:](self, "addSublayer:", self->mArrowLayer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHorizontalGeom, 0);
  objc_storeStrong((id *)&self->mArrowLayer, 0);
}

@end
