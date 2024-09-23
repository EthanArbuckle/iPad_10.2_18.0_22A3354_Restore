@implementation UIAutocorrectShadowView

- (void)setEdgeType:(int)a3
{
  if (self->m_edgeType != a3)
  {
    self->m_edgeType = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  int m_edgeType;
  uint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIColor *v9;
  void *v10;
  void *v11;
  UIColor *v12;
  void *v13;
  void *v14;
  UIColor *v15;
  void *v16;
  void *v17;
  UIColor *v18;
  void *v19;
  void *v20;
  UIColor *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  m_edgeType = self->m_edgeType;
  if (m_edgeType == 2)
    v4 = 2;
  else
    v4 = 8 * (m_edgeType == 1);
  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v25 = CGRectInset(v24, 8.0, 8.0);
  v26 = CGRectIntegral(v25);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (!_MergedGlobals_21_7)
  {
    v9 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.06);
    v10 = (void *)_MergedGlobals_21_7;
    _MergedGlobals_21_7 = (uint64_t)v9;

  }
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v28 = CGRectInset(v27, 1.0, 1.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v28.origin.x, v28.origin.y + 1.0, v28.size.width, v28.size.height + 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_21_7, "set");
  objc_msgSend(v11, "fill");

  if (!qword_1ECD7C520)
  {
    v12 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.05);
    v13 = (void *)qword_1ECD7C520;
    qword_1ECD7C520 = (uint64_t)v12;

  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v30 = CGRectInset(v29, 0.0, 1.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v30.origin.x, v30.origin.y + 1.0, v30.size.width, v30.size.height + 2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7C520, "set");
  objc_msgSend(v14, "fill");

  if (!qword_1ECD7C528)
  {
    v15 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.05);
    v16 = (void *)qword_1ECD7C528;
    qword_1ECD7C528 = (uint64_t)v15;

  }
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v32 = CGRectInset(v31, -1.0, 1.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v32.origin.x, v32.origin.y + 1.0, v32.size.width, v32.size.height + 3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7C528, "set");
  objc_msgSend(v17, "fill");

  if (!qword_1ECD7C530)
  {
    v18 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.04);
    v19 = (void *)qword_1ECD7C530;
    qword_1ECD7C530 = (uint64_t)v18;

  }
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v34 = CGRectInset(v33, -2.0, -1.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height + 4.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7C530, "set");
  objc_msgSend(v20, "fill");

  if (!qword_1ECD7C538)
  {
    v21 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.02);
    v22 = (void *)qword_1ECD7C538;
    qword_1ECD7C538 = (uint64_t)v21;

  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectInset(v35, -3.0, -2.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v36.origin.x, v36.origin.y + 0.0, v36.size.width, v36.size.height + 5.0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7C538, "set");
  objc_msgSend(v23, "fill");

}

@end
