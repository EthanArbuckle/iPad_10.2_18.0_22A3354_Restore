@implementation CRFormUnderlinedFieldTextOverlapCleanupStep

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  void *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  CROSLogForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = 136315138;
    v15 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: %s is running.", (uint8_t *)&v14, 0xCu);

  }
  +[CRFormFieldTextOverlapCleanupStep cleanupTextOverlapForFields:document:underlinedFieldsOnly:](CRFormFieldTextOverlapCleanupStep, "cleanupTextOverlapForFields:document:underlinedFieldsOnly:", v7, v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
