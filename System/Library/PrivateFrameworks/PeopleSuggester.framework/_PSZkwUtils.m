@implementation _PSZkwUtils

+ (id)clientModelMismatchErrorResponseForRequest:(id)a3 requestedClientModelId:(id)a4 actualClientModelId:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Wrong delegate for request. Expected %@ but found %@."), a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:].cold.1((uint64_t)v9, v10);

  v11 = objc_alloc((Class)getATXSuggestionRequestResponseClass());
  v12 = (void *)MEMORY[0x1E0CB35C8];
  getATXSuggestionRequestResponseClass();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CB2D50];
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v14, 5, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v11, "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", 0, 0, v8, 3, v16);

  return v17;
}

+ (void)clientModelMismatchErrorResponseForRequest:(uint64_t)a1 requestedClientModelId:(NSObject *)a2 actualClientModelId:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Client model mismatch when fetching ZKW suggestion: %@", (uint8_t *)&v2, 0xCu);
}

@end
