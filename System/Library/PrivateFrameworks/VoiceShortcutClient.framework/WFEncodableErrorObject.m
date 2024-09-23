@implementation WFEncodableErrorObject

void __WFEncodableErrorObject_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  WFAllowedClassesForDecodingNSError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)WFEncodableErrorObject_encodableClasses;
  WFEncodableErrorObject_encodableClasses = v9;

}

@end
