@implementation SBSAPlatformMetricsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPlatformMetricsContext:", self);
}

- (SBSAPlatformMetricsContext)initWithPlatformMetricsContext:(id)a3
{
  id *v4;
  SBSAPlatformMetricsContext *v5;
  uint64_t v6;
  NSMutableDictionary *metricsDictionary;

  v4 = (id *)a3;
  v5 = -[SBSAPlatformMetricsContext init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "mutableCopy");
    metricsDictionary = v5->_metricsDictionary;
    v5->_metricsDictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (SBSAPlatformMetricsContext)init
{
  SBSAPlatformMetricsContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *metricsDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSAPlatformMetricsContext;
  v2 = -[SBSAPlatformMetricsContext init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    metricsDictionary = v2->_metricsDictionary;
    v2->_metricsDictionary = v3;

  }
  return v2;
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAPlatformMetricsContext copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithPlatformMetricsContext:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (void)_setMinimumEdgePadding:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("minimumEdgePadding"));

}

- (void)_setMaximumCornerRadius:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("maximumCornerRadius"));

}

- (void)_setCustomLayoutSquareLargeCornerRadius:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("customLayoutSquareLargeCornerRadius"));

}

- (void)_setCustomLayoutSquareCornerRadius:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("customLayoutSquareCornerRadius"));

}

- (void)_setCustomLayoutOvalCornerRadius:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("customLayoutOvalCornerRadius"));

}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (double)maximumCornerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("maximumCornerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingMaximumCornerRadius:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SBSAPlatformMetricsContext_copyBySettingMaximumCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __63__SBSAPlatformMetricsContext_copyBySettingMaximumCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMaximumCornerRadius:", *(double *)(a1 + 32));
}

- (double)customLayoutSquareCornerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("customLayoutSquareCornerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingCustomLayoutSquareCornerRadius:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __74__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomLayoutSquareCornerRadius:", *(double *)(a1 + 32));
}

- (double)customLayoutSquareLargeCornerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("customLayoutSquareLargeCornerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingCustomLayoutSquareLargeCornerRadius:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareLargeCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __79__SBSAPlatformMetricsContext_copyBySettingCustomLayoutSquareLargeCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomLayoutSquareLargeCornerRadius:", *(double *)(a1 + 32));
}

- (double)customLayoutOvalCornerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("customLayoutOvalCornerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingCustomLayoutOvalCornerRadius:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__SBSAPlatformMetricsContext_copyBySettingCustomLayoutOvalCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __72__SBSAPlatformMetricsContext_copyBySettingCustomLayoutOvalCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomLayoutOvalCornerRadius:", *(double *)(a1 + 32));
}

- (void)_setCustomLayoutTallRectCornerRadius:(double)a3
{
  NSMutableDictionary *metricsDictionary;
  id v4;

  metricsDictionary = self->_metricsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](metricsDictionary, "setObject:forKey:", v4, CFSTR("customLayoutTallRectCornerRadius"));

}

- (double)customLayoutTallRectCornerRadius
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("customLayoutTallRectCornerRadius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingCustomLayoutTallRectCornerRadius:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SBSAPlatformMetricsContext_copyBySettingCustomLayoutTallRectCornerRadius___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __76__SBSAPlatformMetricsContext_copyBySettingCustomLayoutTallRectCornerRadius___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomLayoutTallRectCornerRadius:", *(double *)(a1 + 32));
}

- (double)minimumEdgePadding
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[NSMutableDictionary objectForKey:](self->_metricsDictionary, "objectForKey:", CFSTR("minimumEdgePadding"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 8);

  return v4;
}

- (id)copyBySettingMinimumEdgePadding:(double)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SBSAPlatformMetricsContext_copyBySettingMinimumEdgePadding___block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0_8l;
  *(double *)&v4[4] = a3;
  return -[SBSAPlatformMetricsContext copyWithBlock:](self, "copyWithBlock:", v4);
}

uint64_t __62__SBSAPlatformMetricsContext_copyBySettingMinimumEdgePadding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMinimumEdgePadding:", *(double *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *metricsDictionary;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  metricsDictionary = self->_metricsDictionary;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__SBSAPlatformMetricsContext_isEqual___block_invoke;
  v11[3] = &unk_1E8EA4320;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v5, "appendObject:counterpart:", metricsDictionary, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual");

  return v9;
}

id __38__SBSAPlatformMetricsContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_metricsDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

@end
