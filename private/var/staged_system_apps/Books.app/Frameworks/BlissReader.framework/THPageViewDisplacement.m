@implementation THPageViewDisplacement

- (THPageViewDisplacement)initWithView:(id)a3 scrollView:(id)a4
{
  THPageViewDisplacement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THPageViewDisplacement;
  v6 = -[THPageViewDisplacement init](&v8, "init");
  if (v6)
  {
    v6->_view = (UIView *)a3;
    v6->_scrollView = (TSKScrollView *)a4;
    v6->_numberOfPagesShown = 1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageViewDisplacement;
  -[THPageViewDisplacement dealloc](&v3, "dealloc");
}

- (void)prepareToZoomWithEnumerator:(id)a3
{
  (*((void (**)(id, Block_layout *))a3 + 2))(a3, &stru_42A118);
}

- (void)resetAnimationsWithEnumerator:(id)a3
{
  (*((void (**)(id, Block_layout *))a3 + 2))(a3, &stru_42A138);
}

- (void)hideWithEnumerator:(id)a3
{
  (*((void (**)(id, Block_layout *))a3 + 2))(a3, &stru_42A158);
}

- (void)animateZoomWithDuration:(double)a3 initialPageIndex:(unint64_t)a4 minViewScale:(double)a5 maxViewScale:(double)a6 currentViewScale:(double)a7 enumerator:(id)a8
{
  _QWORD v12[10];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_15E99C;
  v12[3] = &unk_42A180;
  *(double *)&v12[6] = a6;
  *(double *)&v12[7] = a5;
  v12[4] = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
  v12[5] = a4;
  *(double *)&v12[8] = a7;
  *(double *)&v12[9] = a3;
  (*((void (**)(id, _QWORD *))a8 + 2))(a8, v12);
}

- (void)animateOpacityAndDisplaymentProgess:(double)a3 delay:(double)a4 duration:(double)a5 initialPageIndex:(unint64_t)a6 enumerator:(id)a7
{
  _QWORD v12[9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_15EBFC;
  v12[3] = &unk_42A1A8;
  v12[4] = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
  v12[5] = a6;
  *(double *)&v12[6] = a3;
  *(double *)&v12[7] = a5;
  *(double *)&v12[8] = a4;
  (*((void (**)(id, _QWORD *))a7 + 2))(a7, v12);
}

- (void)updateZoomInitialPageIndex:(unint64_t)a3 minViewScale:(double)a4 maxViewScale:(double)a5 currentViewScale:(double)a6 enumerator:(id)a7
{
  _QWORD v9[9];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_15EE24;
  v9[3] = &unk_42A1A8;
  *(double *)&v9[6] = a5;
  *(double *)&v9[7] = a4;
  *(double *)&v9[8] = a6;
  v9[4] = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
  v9[5] = a3;
  (*((void (**)(id, _QWORD *))a7 + 2))(a7, v9);
}

- (void)animateFadeWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15F02C;
  v5[3] = &unk_42A1C8;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  (*((void (**)(id, _QWORD *))a5 + 2))(a5, v5);
}

- (void)animateShowWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15F1DC;
  v5[3] = &unk_42A1C8;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  (*((void (**)(id, _QWORD *))a5 + 2))(a5, v5);
}

- (void)animateOverscrollWithDuration:(unint64_t)a3 enumerator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15F388;
  v4[3] = &unk_42A1E8;
  v4[4] = a3;
  (*((void (**)(id, _QWORD *))a4 + 2))(a4, v4);
}

- (void)startRevealTOCWithPageIndex:(unint64_t)a3 enumerator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15F4E8;
  v4[3] = &unk_42A208;
  v4[4] = a3;
  (*((void (**)(id, _QWORD *))a4 + 2))(a4, v4);
}

- (void)endRevealTOCWithEnumerator:(id)a3
{
  (*((void (**)(id, Block_layout *))a3 + 2))(a3, &stru_42A248);
}

- (void)updateDisplacementAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 enumerator:(id)a5
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  unint64_t numberOfPagesShown;
  CAMediaTimingFunction *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  UIView *view;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MinX;
  double MaxX;
  BOOL v30;
  double v31;
  double v32;
  CGRect rect;
  id (*v34)(uint64_t, void *, uint64_t);
  void *v35;
  CAMediaTimingFunction *v36;
  CGFloat v37;
  unint64_t v38;
  double v39;
  BOOL v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[TSKScrollView tsk_bounds](self->_scrollView, "tsk_bounds", a3);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  v12 = CGRectGetWidth(v41);
  if (v12 == 0.0)
    v13 = 1.0;
  else
    v13 = v12;
  numberOfPagesShown = self->_numberOfPagesShown;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  rect.origin.y = CGRectGetMinX(v42) / v13 * (double)numberOfPagesShown;
  v15 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut);
  -[UIView bounds](self->_view, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  view = self->_view;
  -[TSKScrollView bounds](self->_scrollView, "bounds");
  -[UIView convertRect:fromView:](view, "convertRect:fromView:", self->_scrollView);
  rect.origin.x = v43.origin.x;
  v25 = v43.origin.y;
  v26 = v43.size.width;
  v27 = v43.size.height;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v17;
  v44.origin.y = v19;
  v44.size.width = v21;
  v44.size.height = v23;
  v32 = fmax(MinX - CGRectGetMinX(v44), 0.0);
  v45.origin.x = v17;
  v45.origin.y = v19;
  v45.size.width = v21;
  v45.size.height = v23;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = rect.origin.x;
  v46.origin.y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  *(_QWORD *)&rect.size.width = _NSConcreteStackBlock;
  *(_QWORD *)&rect.size.height = 3221225472;
  v30 = fmin(v32, 40.0) + fmin(fmax(MaxX - CGRectGetMaxX(v46), 0.0), 40.0) <= 0.0;
  v31 = 1.0;
  if (v30)
    v31 = 0.0;
  v34 = sub_15F88C;
  v35 = &unk_42A270;
  v40 = a4;
  v37 = rect.origin.y;
  v38 = numberOfPagesShown;
  v36 = v15;
  v39 = v31;
  (*((void (**)(id, CGSize *))a5 + 2))(a5, &rect.size);
}

- (unint64_t)numberOfPagesShown
{
  return self->_numberOfPagesShown;
}

- (void)setNumberOfPagesShown:(unint64_t)a3
{
  self->_numberOfPagesShown = a3;
}

@end
