@implementation _UISEIdleTimerFailGestureFeature

- (_UISEIdleTimerFailGestureFeature)initWithSettings:(id)a3
{
  _UISEIdleTimerFailGestureFeature *v4;
  _UISEIdleTimerFailGestureFeature *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISEIdleTimerFailGestureFeature;
  v4 = -[_UISEIdleTimerFailGestureFeature init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_settings, a3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  void *v5;
  double v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __55___UISEIdleTimerFailGestureFeature__incorporateSample___block_invoke;
  v11 = &unk_1E16B3F40;
  objc_copyWeak(&v12, &location);
  v5 = _Block_copy(&v8);
  if (!a3->var0)
  {
    -[_UISEGestureFeatureSettings maximumSwipeDuration](self->_settings, "maximumSwipeDuration", v8, v9, v10, v11);
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_after(v7, MEMORY[0x1E0C80D38], v5);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

@end
