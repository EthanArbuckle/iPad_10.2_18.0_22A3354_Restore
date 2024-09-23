@implementation RTStateTransitionMotionActivityTypeHistogram

- (RTStateTransitionMotionActivityTypeHistogram)init
{
  RTStateTransitionMotionActivityTypeHistogram *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *motionActivityTypeBins;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTStateTransitionMotionActivityTypeHistogram;
  v2 = -[RTStateTransitionMotionActivityTypeHistogram init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    motionActivityTypeBins = v2->_motionActivityTypeBins;
    v2->_motionActivityTypeBins = v3;

  }
  return v2;
}

- (void)addMotionActivityType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[RTStateTransitionMotionActivityTypeHistogram motionActivityTypeBins](self, "motionActivityTypeBins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTStateTransitionMotionActivityTypeHistogram motionActivityTypeBins](self, "motionActivityTypeBins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "integerValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v8);

}

- (unint64_t)getDominantMotionActivityType
{
  void *v2;
  NSObject *v3;
  unint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  -[RTStateTransitionMotionActivityTypeHistogram motionActivityTypeBins](self, "motionActivityTypeBins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__RTStateTransitionMotionActivityTypeHistogram_getDominantMotionActivityType__block_invoke;
  v9[3] = &unk_1E92A22C0;
  v9[4] = v10;
  v9[5] = &v15;
  v9[6] = &v11;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (*((_BYTE *)v12 + 24))
  {
    v16[3] = 0;
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", v16[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%@ detected multimodal distribution, defaulting dominant motionActivityType to %@", buf, 0x16u);

    }
  }
  v4 = v16[3];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

void __77__RTStateTransitionMotionActivityTypeHistogram_getDominantMotionActivityType__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  if (v6 >= 2)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    if (v7 <= v8)
    {
      if (v7 != v8)
        return;
      v9 = 1;
    }
    else
    {
      v9 = 0;
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
  }
}

- (void)show
{
  void *v3;
  uint64_t v4;
  id v5;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTStateTransitionMotionActivityTypeHistogram motionActivityTypeBins](self, "motionActivityTypeBins");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[RTStateTransitionMotionActivityTypeHistogram motionActivityTypeBins](self, "motionActivityTypeBins");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_87);

    }
  }
}

void __52__RTStateTransitionMotionActivityTypeHistogram_show__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v4, "integerValue");

  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2048;
    v12 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "motionActivityType, %@, frequency, %lu", (uint8_t *)&v9, 0x16u);

  }
}

- (NSMutableDictionary)motionActivityTypeBins
{
  return self->_motionActivityTypeBins;
}

- (void)setMotionActivityTypeBins:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityTypeBins, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivityTypeBins, 0);
}

@end
