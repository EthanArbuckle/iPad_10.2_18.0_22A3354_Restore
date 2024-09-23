@implementation RCWaveformScrollView

- (void)beginIgnoringContentOffsetChanges
{
  ++self->_ignoreContentOffsetChangesCount;
}

- (void)endIgnoringContentOffsetChanges
{
  --self->_ignoreContentOffsetChangesCount;
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v3;

  if (!self->_ignoreContentOffsetChangesCount)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
  }
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  objc_super v4;

  if (!self->_ignoreContentOffsetChangesCount)
  {
    v4.receiver = self;
    v4.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView setContentOffset:animated:](&v4, "setContentOffset:animated:", a4, a3.x, a3.y);
  }
}

- (CGPoint)contentOffsetInPresentationLayer:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGPoint result;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformScrollView layer](self, "layer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentationLayer"));

    if (v5)
    {
      objc_msgSend(v5, "bounds");
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)RCWaveformScrollView;
      -[RCWaveformScrollView contentOffset](&v14, "contentOffset");
    }
    v9 = v6;
    v11 = v7;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView contentOffset](&v15, "contentOffset");
    v9 = v8;
    v11 = v10;
  }
  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4 usingCurrentAnimatedPosition:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  objc_super v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  if (a5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCWaveformScrollView layer](self, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationLayer"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "animationKeys"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
      objc_msgSend(v13, "convertRect:fromLayer:", v16, x, y, width, height);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

    }
    else
    {
      v37.receiver = self;
      v37.super_class = (Class)RCWaveformScrollView;
      -[RCWaveformScrollView convertRect:fromView:](&v37, "convertRect:fromView:", v11, x, y, width, height);
      v18 = v29;
      v20 = v30;
      v22 = v31;
      v24 = v32;
    }

  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView convertRect:fromView:](&v38, "convertRect:fromView:", v11, x, y, width, height);
    v18 = v25;
    v20 = v26;
    v22 = v27;
    v24 = v28;
  }

  v33 = v18;
  v34 = v20;
  v35 = v22;
  v36 = v24;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

@end
