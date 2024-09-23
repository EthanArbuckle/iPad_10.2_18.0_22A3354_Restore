@implementation SYDocumentWorkflowsDisabledDataStore

+ (id)_disabledRepositoryError
{
  if (_disabledRepositoryError_onceToken != -1)
    dispatch_once(&_disabledRepositoryError_onceToken, &__block_literal_global_5);
  return (id)_disabledRepositoryError_error;
}

void __64__SYDocumentWorkflowsDisabledDataStore__disabledRepositoryError__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("Repository is disabled.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -129, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_disabledRepositoryError_error;
  _disabledRepositoryError_error = v2;

}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "_disabledRepositoryError");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  if (a6)
  {
    objc_msgSend((id)objc_opt_class(), "_disabledRepositoryError");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
