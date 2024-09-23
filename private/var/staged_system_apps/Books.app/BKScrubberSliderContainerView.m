@implementation BKScrubberSliderContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned int v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  id v42;
  CGRect v44;
  CGRect v45;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView sessionIndicatorView](self, "sessionIndicatorView"));
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);

  if (!v9)
    goto LABEL_3;
  objc_msgSend(v8, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView thumbView](self, "thumbView"));
  objc_msgSend(v18, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberSliderContainerView thumbView](self, "thumbView"));
  objc_msgSend(v8, "convertRect:fromView:", v27, v20, v22, v24, v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  -[BKScrubberSliderContainerView thumbTouchInsets](self, "thumbTouchInsets");
  v37 = v31 + v36;
  v40 = v33 - (v38 + v39);
  v44.size.height = v35 - (v36 + v41);
  v44.origin.x = v29 + v38;
  v44.origin.y = v37;
  v44.size.width = v40;
  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  if (!CGRectIntersectsRect(v44, v45))
    v42 = v8;
  else
LABEL_3:
    v42 = 0;

  return v42;
}

- (UIView)bufferedView
{
  return self->_bufferedView;
}

- (void)setBufferedView:(id)a3
{
  objc_storeStrong((id *)&self->_bufferedView, a3);
}

- (UIView)sessionIndicatorView
{
  return self->_sessionIndicatorView;
}

- (void)setSessionIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIndicatorView, a3);
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setThumbView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbView, a3);
}

- (UIEdgeInsets)thumbTouchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_thumbTouchInsets.top;
  left = self->_thumbTouchInsets.left;
  bottom = self->_thumbTouchInsets.bottom;
  right = self->_thumbTouchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setThumbTouchInsets:(UIEdgeInsets)a3
{
  self->_thumbTouchInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_sessionIndicatorView, 0);
  objc_storeStrong((id *)&self->_bufferedView, 0);
}

@end
