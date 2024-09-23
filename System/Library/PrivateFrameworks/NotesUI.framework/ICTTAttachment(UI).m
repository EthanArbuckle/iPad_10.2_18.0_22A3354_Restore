@implementation ICTTAttachment(UI)

- (BOOL)embeddingType
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "attachmentUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CD12D8]))
  {

    return 1;
  }
  objc_msgSend(a1, "attachmentUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CD12E0]);

  return v4 != 0;
}

@end
