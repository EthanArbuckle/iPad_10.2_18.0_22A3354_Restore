@implementation SKUISimpleAnimationFactory

+ (id)backOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISimpleAnimationFactory backOutTimingFunction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  LODWORD(v4) = 1047233823;
  LODWORD(v5) = 1068457001;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)easeQuadInTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISimpleAnimationFactory easeQuadInTimingFunction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  LODWORD(v2) = 1054615798;
  LODWORD(v4) = 1062333317;
  LODWORD(v5) = 1058642330;
  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)easeQuadInOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISimpleAnimationFactory easeQuadInOutTimingFunction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  LODWORD(v2) = 1054615798;
  LODWORD(v4) = 1058139013;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)easeQuadOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUISimpleAnimationFactory easeQuadOutTimingFunction].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  LODWORD(v2) = 1043878380;
  LODWORD(v3) = 1053609165;
  LODWORD(v4) = 1058139013;
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUISimpleAnimationFactory factoryWithTimingFunction:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init((Class)a1);
  v14 = (void *)v13[1];
  v13[1] = v4;

  return v13;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

+ (void)backOutTimingFunction
{
  OUTLINED_FUNCTION_1();
}

+ (void)easeQuadInTimingFunction
{
  OUTLINED_FUNCTION_1();
}

+ (void)easeQuadInOutTimingFunction
{
  OUTLINED_FUNCTION_1();
}

+ (void)easeQuadOutTimingFunction
{
  OUTLINED_FUNCTION_1();
}

+ (void)factoryWithTimingFunction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
