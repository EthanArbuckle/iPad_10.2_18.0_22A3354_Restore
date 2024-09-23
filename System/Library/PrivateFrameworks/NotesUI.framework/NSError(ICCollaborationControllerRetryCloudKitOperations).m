@implementation NSError(ICCollaborationControllerRetryCloudKitOperations)

- (uint64_t)ic_shouldRetryCloudKitError
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(&unk_1E5C71AF0, "containsObject:", v3) ^ 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
