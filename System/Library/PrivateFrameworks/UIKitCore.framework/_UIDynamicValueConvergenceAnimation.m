@implementation _UIDynamicValueConvergenceAnimation

- (_UIDynamicValueConvergenceAnimation)initWithValue:(double)a3 targetValue:(double)a4 convergenceRate:(double)a5 minimumDifference:(double)a6
{
  _UIDynamicValueConvergenceAnimation *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIDynamicValueConvergenceAnimation;
  result = -[_UIDynamicAnimation init](&v11, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_targetValue = a4;
    result->_convergenceRate = a5;
    result->_minimumDifference = a6;
  }
  return result;
}

- (void)runWithValueApplier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id applier;
  objc_super v9;

  v6 = a4;
  v7 = _Block_copy(a3);
  applier = self->_applier;
  self->_applier = v7;

  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicValueConvergenceAnimation;
  -[_UIDynamicAnimation runWithCompletion:](&v9, sel_runWithCompletion_, v6);

}

- (BOOL)_animateForInterval:(double)a3
{
  uint64_t v3;
  int has_internal_diagnostics;
  double convergenceRate;
  double v7;
  long double v8;
  double v9;
  void (**applier)(id, _QWORD, double, double);
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double value;
  double targetValue;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t)(a3 * 1000.0);
  if (v3 < 1)
    return 0;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  convergenceRate = self->_convergenceRate;
  if (has_internal_diagnostics)
  {
    if (convergenceRate <= 0.0)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v18 = self->_convergenceRate;
        value = self->_value;
        targetValue = self->_targetValue;
        v21 = 134218496;
        v22 = v18;
        v23 = 2048;
        v24 = value;
        v25 = 2048;
        v26 = targetValue;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "convergenceRate %g should be positive; converging from %g to %g",
          (uint8_t *)&v21,
          0x20u);
      }

    }
  }
  else if (convergenceRate <= 0.0)
  {
    v13 = _animateForInterval____s_category;
    if (!_animateForInterval____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_animateForInterval____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_convergenceRate;
      v16 = self->_value;
      v17 = self->_targetValue;
      v21 = 134218496;
      v22 = v15;
      v23 = 2048;
      v24 = v16;
      v25 = 2048;
      v26 = v17;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "convergenceRate %g should be positive; converging from %g to %g",
        (uint8_t *)&v21,
        0x20u);
    }
  }
  v7 = self->_value;
  v8 = pow(self->_convergenceRate, (double)v3);
  v9 = v7 * v8 + (1.0 - v8) * self->_targetValue;
  self->_value = v9;
  applier = (void (**)(id, _QWORD, double, double))self->_applier;
  if (applier)
  {
    applier[2](applier, -[_UIDynamicAnimation state](self, "state"), v7, self->_value);
    v9 = self->_value;
  }
  return vabdd_f64(v9, self->_targetValue) < self->_minimumDifference;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  self->_targetValue = a3;
}

- (double)convergenceRate
{
  return self->_convergenceRate;
}

- (void)setConvergenceRate:(double)a3
{
  self->_convergenceRate = a3;
}

- (double)minimumDifference
{
  return self->_minimumDifference;
}

- (void)setMinimumDifference:(double)a3
{
  self->_minimumDifference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_applier, 0);
}

@end
