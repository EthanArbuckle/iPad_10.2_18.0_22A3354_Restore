@implementation ATXModeGymFeaturizer

- (ATXModeGymFeaturizer)init
{
  ATXModeGymFeaturizer *v2;
  uint64_t v3;
  ATXPOICategoryVisitDataProvider *dataProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXModeGymFeaturizer;
  v2 = -[ATXModeGymFeaturizer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dataProvider = v2->_dataProvider;
    v2->_dataProvider = (ATXPOICategoryVisitDataProvider *)v3;

  }
  return v2;
}

- (id)provideFeatures
{
  ATXModeFeatureSet *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeGymFeaturizer dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCurrentVisit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "possibleCategoryNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D26860]) & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("gym"));
    -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v3, "setValue:forBinaryFeatureOfType:", v8, 24);

  }
  else
  {
    -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v3, "setValue:forBinaryFeatureOfType:", 0, 24);
  }

  return v3;
}

- (void)beginListening
{
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  -[ATXModeGymFeaturizer dataProvider](self, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *MEMORY[0x1E0D26860];
  v5[1] = CFSTR("gym");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribeToPOIChangesForCategories:observer:enterSelector:exitSelector:sinkCompletion:", v4, self, sel_handleChange, sel_handleChange, &__block_literal_global_7);

}

void __38__ATXModeGymFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38__ATXModeGymFeaturizer_beginListening__block_invoke_cold_1(v2, v4);

  }
}

- (void)stopListening
{
  id v2;

  -[ATXModeGymFeaturizer dataProvider](self, "dataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeToPOIChanges");

}

- (void)handleChange
{
  void *v3;
  id v4;

  -[ATXModeGymFeaturizer provideFeatures](self, "provideFeatures");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXModeGymFeaturizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featurizer:didUpdateFeatures:", self, v4);

}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ATXPOICategoryVisitDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __38__ATXModeGymFeaturizer_beginListening__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_ERROR, "ATXModeGymFeaturizer: error subscribing to stream: %@", (uint8_t *)&v4, 0xCu);

}

@end
