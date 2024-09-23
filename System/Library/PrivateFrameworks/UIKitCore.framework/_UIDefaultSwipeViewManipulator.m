@implementation _UIDefaultSwipeViewManipulator

- (CGRect)restingFrameForSwipedView:(id)a3 atIndexPath:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_msgSend(a3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIDefaultSwipeViewManipulator swipedViewRestingOffset](self, "swipedViewRestingOffset");
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)removeAnimationsFromSwipedView:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "animationKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(v4, "position");
      objc_msgSend(v7, "setPosition:");
      objc_msgSend(v7, "removeAllAnimations");
    }
  }

}

- (void)moveSwipedView:(id)a3 atIndexPath:(id)a4 withSwipeInfo:(id *)a5 animator:(id)a6
{
  id v10;
  id v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double MidY;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  v10 = a3;
  v11 = a6;
  -[_UIDefaultSwipeViewManipulator restingFrameForSwipedView:atIndexPath:](self, "restingFrameForSwipedView:atIndexPath:", v10, a4);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v16 = CGRectGetMidX(v22) + a5->var3;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidY = CGRectGetMidY(v23);
  if (v11)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __84___UIDefaultSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke;
    v18[3] = &unk_1E16B4E70;
    v19 = v10;
    v20 = v16;
    v21 = MidY;
    objc_msgSend(v11, "addAnimations:", v18);

  }
  else
  {
    objc_msgSend(v10, "setCenter:", v16, MidY);
  }

}

- (double)swipedViewRestingOffset
{
  return self->_swipedViewRestingOffset;
}

- (void)setSwipedViewRestingOffset:(double)a3
{
  self->_swipedViewRestingOffset = a3;
}

@end
