@implementation ICRemoteRequestOperationResponseIsAllowedForClassName

void ___ICRemoteRequestOperationResponseIsAllowedForClassName_block_invoke()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNames;
  _ICRemoteRequestOperationResponseIsAllowedForClassName_sAllowableRemoteRequestOperationResponseClassNames = v2;

}

@end
