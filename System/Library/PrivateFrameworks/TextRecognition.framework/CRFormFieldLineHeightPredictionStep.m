@implementation CRFormFieldLineHeightPredictionStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  CROSLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = 134217984;
    v19 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLineHeightPredictionStep is running (#input:%lu).", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ShouldUpdateExternalFieldsOption"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  +[CRFormParser predictLineHeightForFields:inDocument:shouldUpdateExternalFields:](CRFormParser, "predictLineHeightForFields:inDocument:shouldUpdateExternalFields:", v8, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(v14, "count");
    v18 = 134217984;
    v19 = v16;
    _os_log_impl(&dword_1D4FB8000, v15, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLineHeightPredictionStep is completed (#output:%lu).", (uint8_t *)&v18, 0xCu);
  }

  return v14;
}

@end
