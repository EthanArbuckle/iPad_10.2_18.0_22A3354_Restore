@implementation NSURL(WFFileType)

- (id)wfFileType
{
  void *v2;
  void *v3;
  uint64_t v5;

  if (!objc_msgSend(a1, "isFileURL")
    || (v5 = 0,
        objc_msgSend(a1, "getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99AD0], 0),
        +[WFFileType typeWithString:](WFFileType, "typeWithString:", v5),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileType typeFromFilename:](WFFileType, "typeFromFilename:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
