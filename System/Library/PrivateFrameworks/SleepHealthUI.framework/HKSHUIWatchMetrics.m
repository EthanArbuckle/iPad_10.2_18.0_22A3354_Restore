@implementation HKSHUIWatchMetrics

+ (id)_sharedMetrics
{
  if (qword_1EEB571D0 != -1)
    dispatch_once(&qword_1EEB571D0, &__block_literal_global);
  return (id)qword_1EEB571C8;
}

void __36__HKSHUIWatchMetrics__sharedMetrics__block_invoke()
{
  HKSHUIWatchMetrics *v0;
  void *v1;

  v0 = objc_alloc_init(HKSHUIWatchMetrics);
  v1 = (void *)qword_1EEB571C8;
  qword_1EEB571C8 = (uint64_t)v0;

}

- (HKSHUIWatchMetrics)init
{
  HKSHUIWatchMetrics *v2;
  void *v3;
  uint64_t v4;
  CLKDevice *device;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSHUIWatchMetrics;
  v2 = -[HKSHUIWatchMetrics init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

  }
  return v2;
}

+ (double)distanceFromTopToFirstBaselineInNavBar
{
  void *v2;
  void *v3;
  double v4;
  double v6[6];

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(v6, v3);
  v4 = v6[0];

  return v4;
}

+ (double)distanceFromFirstBaselineToSecondBaselineInNavBar
{
  void *v2;
  void *v3;
  double v4;
  __int128 v6;

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(&v6, v3);
  v4 = *((double *)&v6 + 1);

  return v4;
}

+ (double)navBarHeight
{
  void *v2;
  void *v3;
  double v4;
  __int128 v6;
  double v7;

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(&v6, v3);
  v4 = v7;

  return v4;
}

+ (double)distanceFromTopToMidlineInBavBar
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "copySafeAreaVerticalInset");
  v4 = v3;
  objc_msgSend(a1, "cornerElementHeight");
  return v4 + v5 * 0.5;
}

+ (double)copySafeAreaHeight
{
  void *v2;
  void *v3;
  double v4;
  __int128 v6;
  double v7;

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(&v6, v3);
  v4 = v7;

  return v4;
}

+ (double)copySafeAreaWidth
{
  void *v2;
  void *v3;
  double v4;
  __int128 v6;
  double v7;

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(&v6, v3);
  v4 = v7;

  return v4;
}

+ (double)copySafeAreaVerticalInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(a1, "copySafeAreaHeight");
  v7 = (v5 - v6) * 0.5;

  return v7;
}

+ (double)copySafeAreaHorizontalInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(a1, "copySafeAreaWidth");
  v7 = (v5 - v6) * 0.5;

  return v7;
}

+ (double)cornerElementHeight
{
  void *v2;
  void *v3;
  double v4;
  __int128 v6;
  double v7;

  objc_msgSend(a1, "_sharedMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants(&v6, v3);
  v4 = v7;

  return v4;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
