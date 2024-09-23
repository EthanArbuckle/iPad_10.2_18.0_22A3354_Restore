@implementation WFPencilActionConfigurationMetricsProvider

- (WFPencilActionConfigurationMetricsProvider)init
{
  WFPencilActionConfigurationMetricsProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  WFPencilActionConfigurationMetricsProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFPencilActionConfigurationMetricsProvider;
  v2 = -[WFPencilActionConfigurationMetricsProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- ($230CD50FFBDA44837086E7C5FCE6954E)metricsWithInterfaceOrientation:(SEL)a3
{
  WFPencilActionConfigurationMetricsCacheKey *v7;
  void *v8;
  double v9;
  double v10;
  WFPencilActionConfigurationMetricsCacheKey *v11;
  os_unfair_lock_s *p_cacheLock;
  void *v13;
  void *v14;
  WFPencilActionConfigurationMetricsCacheValue *v15;
  void *v16;
  double v17;
  _BOOL8 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  __int128 v34;
  void *v35;
  $230CD50FFBDA44837086E7C5FCE6954E *result;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BOOL8 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v7 = [WFPencilActionConfigurationMetricsCacheKey alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v11 = -[WFPencilActionConfigurationMetricsCacheKey initWithInterfaceOrientation:screenSize:](v7, "initWithInterfaceOrientation:screenSize:", a4, v9, v10);

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[WFPencilActionConfigurationMetricsProvider cache](self, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v14;
    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    _CF = (unint64_t)(a4 - 1) >= 2;
    v19 = (unint64_t)(a4 - 1) < 2;
    if (_CF)
      v20 = 20.0;
    else
      v20 = 0.0;
    v21 = 40.0;
    if (!_CF)
      v21 = 0.0;
    v22 = v21 + 716.0 + 240.0;
    v23 = v17 - v22;
    if (vabdd_f64(v17, v22) >= 60.0)
    {
      v40 = xmmword_20CE6D4C0;
      v24 = 208.0;
    }
    else
    {
      v24 = v23 / 3.0 + 208.0;
      __asm { FMOV            V3.2D, #30.0 }
      *(double *)&_Q3 = v24;
      v40 = _Q3;
      v23 = v17 - (v21 + v24 * 3.0 + 60.0 + 32.0 + 240.0);
    }
    if (v23 >= 0.0)
    {
      v29 = 3;
    }
    else
    {
      v23 = v17 - (v21 + v24 * 2.0 + 30.0 + 32.0 + 240.0);
      v29 = 2;
    }
    if (v23 >= 144.0)
    {
      v23 = v17 - (v21 + (double)(v29 - 1) * 30.0 + (double)v29 * v24 + 176.0 + 240.0);
      v30 = xmmword_20CE6D4F0;
      v31 = xmmword_20CE6D500;
      v32 = 88.0;
    }
    else
    {
      v30 = xmmword_20CE6D4D0;
      v31 = xmmword_20CE6D4E0;
      v32 = 16.0;
    }
    if (v23 >= v24 + 30.0)
    {
      v33 = (double)v29++;
      v23 = v17 - (v21 + v33 * 30.0 + (double)v29 * v24 + v32 + v32 + 240.0);
    }
    if (v23 >= 40.0)
    {
      v23 = v17 - (v21 + (double)(v29 - 1) * 30.0 + (double)v29 * v24 + v32 + v32 + 280.0);
      v34 = xmmword_20CE6D520;
    }
    else
    {
      v34 = xmmword_20CE6D510;
    }
    v39 = v34;
    if (v23 <= 0.0)
    {
      v37 = v30;
    }
    else
    {
      *((double *)&v30 + 1) = v23 * 0.5 + v32;
      v37 = v30;
      *((double *)&v31 + 1) = *((double *)&v30 + 1);
    }
    v38 = v31;

    v41 = v19;
    v42 = v39;
    v43 = v29;
    v44 = v40;
    v45 = v37;
    v46 = v38;
    v47 = xmmword_20CE6D530;
    v48 = 0x405C400000000000;
    v49 = v20;
    v50 = 0;
    v51 = v20;
    v52 = xmmword_20CE6D540;
    v53 = xmmword_20CE6D550;
    v54 = xmmword_20CE6D560;
    v15 = -[WFPencilActionConfigurationMetricsCacheValue initWithValue:]([WFPencilActionConfigurationMetricsCacheValue alloc], "initWithValue:", &v41);
    -[WFPencilActionConfigurationMetricsProvider cache](self, "cache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v15, v11);

    os_unfair_lock_unlock(p_cacheLock);
    if (!v15)
    {
      *(_OWORD *)&retstr->var4.var2.top = 0u;
      *(_OWORD *)&retstr->var4.var2.bottom = 0u;
      *(_OWORD *)&retstr->var3.var2.bottom = 0u;
      *(_OWORD *)&retstr->var4.var0 = 0u;
      *(_OWORD *)&retstr->var3.var0 = 0u;
      *(_OWORD *)&retstr->var3.var2.top = 0u;
      *(_OWORD *)&retstr->var2.var3.top = 0u;
      *(_OWORD *)&retstr->var2.var3.bottom = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
      goto LABEL_27;
    }
  }
  -[WFPencilActionConfigurationMetricsCacheValue value](v15, "value", v37);
LABEL_27:

  return result;
}

- (CGSize)sheetPreferredContentSizeWithMetrics:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[WFPencilActionConfigurationMetricsProvider uiEdgeInsetsFromDirectionalInsets:](self, "uiEdgeInsetsFromDirectionalInsets:", a3->var3.var2.top, a3->var3.var2.leading, a3->var3.var2.bottom, a3->var3.var2.trailing);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12 - (v6 + v10);
  v15 = v14 - (v4 + v8);

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)uiEdgeInsetsFromDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  CGFloat bottom;
  double leading;
  CGFloat top;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "layoutDirection");

  if (v9)
    v10 = trailing;
  else
    v10 = leading;
  if (v9)
    v11 = leading;
  else
    v11 = trailing;
  v12 = top;
  v13 = bottom;
  result.right = v11;
  result.bottom = v13;
  result.left = v10;
  result.top = v12;
  return result;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_2911);
  return (id)sharedProvider_sharedProvider;
}

void __60__WFPencilActionConfigurationMetricsProvider_sharedProvider__block_invoke()
{
  WFPencilActionConfigurationMetricsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(WFPencilActionConfigurationMetricsProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

@end
