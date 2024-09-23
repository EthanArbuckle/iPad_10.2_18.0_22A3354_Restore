@implementation THGuidedPanPageTarget

- (THGuidedPanPageTarget)initWithLayout:(id)a3 targeted:(BOOL)a4
{
  THGuidedPanPageTarget *v6;
  THGuidedPanPageTarget *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THGuidedPanPageTarget;
  v6 = -[THGuidedPanPageTarget init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    v6->_targeted = a4;
    objc_msgSend(a3, "frameInRoot");
    v7->_unscaledFrame.origin.x = v8;
    v7->_unscaledFrame.origin.y = v9;
    v7->_unscaledFrame.size.width = v10;
    v7->_unscaledFrame.size.height = v11;
    v7->_layout = (THPageLayout *)a3;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGuidedPanPageTarget;
  -[THGuidedPanPageTarget dealloc](&v3, "dealloc");
}

- (BOOL)guidedPanTargetIsTargeted
{
  return self->_targeted;
}

- (CGRect)guidedPanTargetUnscaledRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unscaledFrame.origin.x;
  y = self->_unscaledFrame.origin.y;
  width = self->_unscaledFrame.size.width;
  height = self->_unscaledFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)guidedPanTargetUnscaledPageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unscaledFrame.origin.x;
  y = self->_unscaledFrame.origin.y;
  width = self->_unscaledFrame.size.width;
  height = self->_unscaledFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)viewScaleWithController:(id)a3
{
  double result;

  objc_msgSend(objc_msgSend(a3, "delegate"), "guidedPanZoomedOutViewScale");
  return result;
}

- (id)p_wellForTarget:(id)a3 wellRect:(CGRect)a4 blendDistance:(double)a5 prev:(BOOL)a6
{
  return sub_15FC7C(a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)guidedPanTargetAddWellsToArray:(id)a3 withController:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (self->_targeted)
  {
    v6 = -[THPageLayout previousTargetFromLayout:column:](self->_layout, "previousTargetFromLayout:column:", self->_layout, 0);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "guidedPanTargetUnscaledRect");
      x = v31.origin.x;
      y = v31.origin.y;
      width = v31.size.width;
      height = v31.size.height;
      MidX = CGRectGetMidX(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      MinY = CGRectGetMinY(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34.size.height = CGRectGetHeight(v33);
      v34.size.width = 0.0;
      v34.origin.x = MidX;
      v34.origin.y = MinY;
      v35 = CGRectInset(v34, -50.0, 0.0);
      v14 = v35.origin.x;
      v15 = v35.origin.y;
      v16 = v35.size.width;
      v17 = v35.size.height;
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v18 = -[THGuidedPanPageTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v7, 1, v14, v15, v16, v17, fmax(CGRectGetWidth(v35), 300.0));
      objc_msgSend(v18, "setIdentifier:", CFSTR("prev"));
      objc_msgSend(a3, "addObject:", v18);
    }
    v19 = -[THPageLayout firstChildTarget](self->_layout, "firstChildTarget");
    if (v19
      || (v19 = -[THPageLayout nextTargetFromLayout:column:](self->_layout, "nextTargetFromLayout:column:", self->_layout, 0)) != 0)
    {
      objc_msgSend(v19, "guidedPanTargetUnscaledRect");
      v20 = v36.origin.x;
      v21 = v36.origin.y;
      v22 = v36.size.width;
      v23 = v36.size.height;
      v24 = CGRectGetMidX(v36);
      v37.origin.x = v20;
      v37.origin.y = v21;
      v37.size.width = v22;
      v37.size.height = v23;
      v25 = CGRectGetMinY(v37);
      v38.origin.x = v20;
      v38.origin.y = v21;
      v38.size.width = v22;
      v38.size.height = v23;
      v39.size.height = CGRectGetHeight(v38);
      v39.size.width = 0.0;
      v39.origin.x = v24;
      v39.origin.y = v25;
      v40 = CGRectInset(v39, -50.0, 0.0);
      v26 = v40.origin.x;
      v27 = v40.origin.y;
      v28 = v40.size.width;
      v29 = v40.size.height;
      v40.origin.x = v20;
      v40.origin.y = v21;
      v40.size.width = v22;
      v40.size.height = v23;
      v30 = -[THGuidedPanPageTarget p_wellForTarget:wellRect:blendDistance:prev:](self, "p_wellForTarget:wellRect:blendDistance:prev:", v19, 0, v26, v27, v28, v29, fmax(CGRectGetWidth(v40), 300.0));
      objc_msgSend(v30, "setIdentifier:", CFSTR("next"));
      objc_msgSend(a3, "addObject:", v30);
    }
  }
}

- (int)guidedPanTargetKind
{
  return 0;
}

- (int64_t)guidedPanRelativePageIndexWithController:(id)a3
{
  return (int64_t)objc_msgSend(a3, "relativePageIndexForLayout:", self->_layout);
}

+ (id)p_childPageLayoutAtCenterFromLayout:(id)a3 visibleUnscaledCenter:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *i;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGRect v27;

  y = a4.y;
  x = a4.x;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(a3, "children", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v23;
  v12 = 1.79769313e308;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v7);
      v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
      v15 = objc_opt_class(THPageLayout);
      *(_QWORD *)&v16 = TSUDynamicCast(v15, v14).n128_u64[0];
      v18 = v17;
      if (!v17)
      {
        v18 = objc_msgSend(a1, "p_childPageLayoutAtCenterFromLayout:visibleUnscaledCenter:", v14, x, y);
        if (!v18)
          continue;
      }
      objc_msgSend(v18, "frameInRoot", v16);
      v19 = vabdd_f64(CGRectGetMidX(v27), x);
      if (v19 < v12 || v10 == 0)
      {
        v10 = v18;
        v12 = v19;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v9);
  return v10;
}

+ (id)guidedPanTargetForPageAtLocation:(id)a3 controller:(id)a4
{
  id v6;
  id result;

  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "layoutController"), "rootLayout");
  objc_msgSend(a3, "unscaledPoint");
  result = objc_msgSend(a1, "p_childPageLayoutAtCenterFromLayout:visibleUnscaledCenter:", v6);
  if (result)
    return -[THGuidedPanPageTarget initWithLayout:targeted:]([THGuidedPanPageTarget alloc], "initWithLayout:targeted:", result, 0);
  return result;
}

- (id)guidedPanTargetUpdatedTargetForLocation:(id)a3 withController:(id)a4
{
  void *v7;
  id v8;
  id result;

  v7 = (void *)objc_opt_class(self);
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "layoutController"), "rootLayout");
  objc_msgSend(a3, "unscaledPoint");
  result = objc_msgSend(v7, "p_childPageLayoutAtCenterFromLayout:visibleUnscaledCenter:", v8);
  if (result)
    return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithLayout:targeted:", result, 0);
  return result;
}

- (BOOL)targeted
{
  return self->_targeted;
}

- (THPageLayout)layout
{
  return self->_layout;
}

- (CGRect)unscaledFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unscaledFrame.origin.x;
  y = self->_unscaledFrame.origin.y;
  width = self->_unscaledFrame.size.width;
  height = self->_unscaledFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
