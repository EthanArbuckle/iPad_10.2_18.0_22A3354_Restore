@implementation THGuidedPanColumnTarget

- (THGuidedPanColumnTarget)initWithLayout:(id)a3 column:(id)a4
{
  THGuidedPanColumnTarget *v6;
  THGuidedPanColumnTarget *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THGuidedPanColumnTarget;
  v6 = -[THGuidedPanColumnTarget init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      -[THGuidedPanColumnTarget setLayout:](v6, "setLayout:", a3);
      -[THGuidedPanColumnTarget setColumn:](v7, "setColumn:", a4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[THGuidedPanColumnTarget setLayout:](self, "setLayout:", 0);
  -[THGuidedPanColumnTarget setColumn:](self, "setColumn:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanColumnTarget;
  -[THGuidedPanColumnTarget dealloc](&v3, "dealloc");
}

- (CGRect)guidedPanTargetUnscaledRect
{
  TSWPLayoutTarget *layout;
  CGRect v3;

  layout = self->_layout;
  -[TSWPColumn typographicBounds](self->_column, "typographicBounds");
  -[TSWPLayoutTarget rectInRoot:](layout, "rectInRoot:");
  return CGRectInset(v3, -15.0, -15.0);
}

- (CGRect)guidedPanTargetUnscaledPageRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[TSWPLayoutTarget pageLayout](self->_layout, "pageLayout"), "frameInRoot");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)viewScaleWithController:(id)a3
{
  double result;

  -[THGuidedPanColumnTarget guidedPanTargetUnscaledRect](self, "guidedPanTargetUnscaledRect");
  objc_msgSend(a3, "viewScaleForUnscaledRect:forPage:", 0);
  return result;
}

- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6
{
  return sub_15FC7C(a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4
{
  double x;
  double y;
  double width;
  double height;
  CGFloat MidX;
  CGFloat MinY;
  double v13;
  double v14;
  CGFloat v15;
  THGuidedPanRectWell *v16;
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[7];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  -[THGuidedPanColumnTarget guidedPanTargetUnscaledRect](self, "guidedPanTargetUnscaledRect");
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;
  MidX = CGRectGetMidX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MinY = CGRectGetMinY(v46);
  objc_msgSend(a4, "viewScaleForUnscaledRect:forPage:", 0, x, y, width, height);
  v14 = v13;
  v15 = -10.0 / v13;
  v47.size.width = 0.0;
  v47.origin.x = MidX;
  v47.origin.y = MinY;
  v47.size.height = height;
  v48 = CGRectInset(v47, v15, 0.0);
  v16 = -[THGuidedPanRectWell initWithUnscaledRect:wellRect:target:]([THGuidedPanRectWell alloc], "initWithUnscaledRect:wellRect:target:", self, x, y, width, height, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
  -[THGuidedPanRectWell setAllowVerticalMovementInWell:](v16, "setAllowVerticalMovementInWell:", 1);
  -[THGuidedPanRectWell setIdentifier:](v16, "setIdentifier:", CFSTR("column"));
  -[THGuidedPanRectWell setSmoothWeight:](v16, "setSmoothWeight:", 0.2);
  -[THGuidedPanRectWell setCurrentWeight:](v16, "setCurrentWeight:", 1.0);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_160198;
  v44[3] = &unk_42A298;
  v44[4] = v16;
  v44[5] = a4;
  *(double *)&v44[6] = 240.0 / v14;
  -[THGuidedPanRectWell setWeightBlock:](v16, "setWeightBlock:", v44);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_16022C;
  v43[3] = &unk_42A2C0;
  v43[4] = v16;
  -[THGuidedPanRectWell setRatingBlock:](v16, "setRatingBlock:", v43);
  objc_msgSend(a3, "addObject:", v16);

  v17 = -[TSWPLayoutTarget previousTargetFromLayout:column:](self->_layout, "previousTargetFromLayout:column:", self->_layout, self->_column);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, "guidedPanTargetUnscaledRect");
    v19 = v49.origin.x;
    v20 = v49.origin.y;
    v21 = v49.size.width;
    v22 = v49.size.height;
    v23 = CGRectGetMidX(v49);
    v50.origin.x = v19;
    v50.origin.y = v20;
    v50.size.width = v21;
    v50.size.height = v22;
    v24 = CGRectGetMinY(v50);
    v51.origin.x = v19;
    v51.origin.y = v20;
    v51.size.width = v21;
    v51.size.height = v22;
    v52.size.height = CGRectGetHeight(v51);
    v52.size.width = 0.0;
    v52.origin.x = v23;
    v52.origin.y = v24;
    v53 = CGRectInset(v52, -50.0, 0.0);
    v25 = v53.origin.x;
    v26 = v53.origin.y;
    v27 = v53.size.width;
    v28 = v53.size.height;
    v53.origin.x = v19;
    v53.origin.y = v20;
    v53.size.width = v21;
    v53.size.height = v22;
    v29 = -[THGuidedPanColumnTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v18, 1, v25, v26, v27, v28, fmax(CGRectGetWidth(v53), 300.0));
    objc_msgSend(v29, "setIdentifier:", CFSTR("prev"));
    objc_msgSend(a3, "addObject:", v29);
  }
  v30 = -[TSWPLayoutTarget nextTargetFromLayout:column:](self->_layout, "nextTargetFromLayout:column:", self->_layout, self->_column);
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v30, "guidedPanTargetUnscaledRect");
    v32 = v54.origin.x;
    v33 = v54.origin.y;
    v34 = v54.size.width;
    v35 = v54.size.height;
    v36 = CGRectGetMidX(v54);
    v55.origin.x = v32;
    v55.origin.y = v33;
    v55.size.width = v34;
    v55.size.height = v35;
    v37 = CGRectGetMinY(v55);
    v56.origin.x = v32;
    v56.origin.y = v33;
    v56.size.width = v34;
    v56.size.height = v35;
    v57.size.height = CGRectGetHeight(v56);
    v57.size.width = 0.0;
    v57.origin.x = v36;
    v57.origin.y = v37;
    v58 = CGRectInset(v57, -50.0, 0.0);
    v38 = v58.origin.x;
    v39 = v58.origin.y;
    v40 = v58.size.width;
    v41 = v58.size.height;
    v58.origin.x = v32;
    v58.origin.y = v33;
    v58.size.width = v34;
    v58.size.height = v35;
    v42 = -[THGuidedPanColumnTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v31, 0, v38, v39, v40, v41, fmax(CGRectGetWidth(v58), 300.0));
    objc_msgSend(v42, "setIdentifier:", CFSTR("next"));
    objc_msgSend(a3, "addObject:", v42);
  }
}

- (int)guidedPanTargetKind
{
  return 1;
}

- (int64_t)guidedPanRelativePageIndexWithController:(id)a3
{
  return (int64_t)objc_msgSend(a3, "relativePageIndexForLayout:", self->_layout);
}

- (BOOL)guidedPanTargetIsTargeted
{
  return 1;
}

- (TSWPLayoutTarget)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPColumn)column
{
  return self->_column;
}

- (void)setColumn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
