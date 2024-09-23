@implementation REMMutableCRMergeableStringDocument(Hashtags)

- (void)addHashtag:()Hashtags range:.cold.1(void *a1, NSUInteger a2, NSUInteger a3, NSObject *a4)
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  NSRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "replicaIDSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17.location = a2;
  v17.length = a3;
  NSStringFromRange(v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134218498;
  v11 = a1;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1B4A39000, a4, OS_LOG_TYPE_ERROR, "Invalid nil value provided when trying to -addHashtag:range: to REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, range: %@}", (uint8_t *)&v10, 0x20u);

}

@end
