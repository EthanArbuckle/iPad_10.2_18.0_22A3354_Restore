@implementation PXPeopleSuggestionsMediaProvider

- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8
{
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v11 = a3;
  v12 = a8;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionsMediaProvider.m"), 16, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPeopleSuggestionsMediaProvider requestImageForPersonSuggestion:targetSize:displayScale:cropFactor:cornerStyle:resultHandler:]", v15);

  abort();
}

- (void)cancelRequest:(int)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionsMediaProvider.m"), 20, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPeopleSuggestionsMediaProvider cancelRequest:]", v7);

  abort();
}

@end
