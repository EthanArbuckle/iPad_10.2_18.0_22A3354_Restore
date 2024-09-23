@implementation PHSwipeDownTracker

- (PHSwipeDownTracker)init
{
  PHSwipeDownTracker *v2;
  PXSwipeDownTracker *v3;
  PXSwipeDownTracker *impl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSwipeDownTracker;
  v2 = -[PHSwipeDownTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = (PXSwipeDownTracker *)objc_alloc_init(MEMORY[0x1E0D7BAB0]);
    impl = v2->_impl;
    v2->_impl = v3;

  }
  return v2;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  __int128 v16;
  _OWORD v17[3];

  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v13 = a3.y;
  v14 = a3.x;
  -[PHSwipeDownTracker impl](self, "impl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a5->c;
  v17[0] = *(_OWORD *)&a5->a;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v15, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", v17, v14, v13, v12, v11, width, height, x, y, *MEMORY[0x1E0D7CFF8], *(_QWORD *)(MEMORY[0x1E0D7CFF8] + 8));

}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  id v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[PHSwipeDownTracker impl](self, "impl");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackGestureTranslation:velocity:", v7, v6, x, y);

}

- (double)dismissalProgress
{
  void *v2;
  double v3;
  double v4;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissalProgress");
  v4 = v3;

  return v4;
}

- (BOOL)shouldFinishDismissal
{
  void *v2;
  char v3;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldFinishDismissal");

  return v3;
}

- (CGPoint)trackedCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackedCenter");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)trackedBounds
{
  void *v2;
  double v3;
  double v4;
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

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackedBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[PHSwipeDownTracker impl](self, "impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "trackedTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (PHDisplayVelocity)trackedVelocity
{
  void *v2;
  double v3;
  double v4;
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
  PHDisplayVelocity result;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackedVelocity");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (double)finalAnimationDuration
{
  void *v2;
  double v3;
  double v4;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalAnimationDuration");
  v4 = v3;

  return v4;
}

- (double)finalAnimationSpringDamping
{
  void *v2;
  double v3;
  double v4;

  -[PHSwipeDownTracker impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalAnimationSpringDamping");
  v4 = v3;

  return v4;
}

- (PXSwipeDownTracker)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
