@implementation PLFileBackedThumbnailVirtualResource

- (int64_t)dataLength
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLVirtualResource fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileSize");

  return v7;
}

- (int64_t)estimatedDataLength
{
  float v3;

  v3 = (float)-[PLVirtualResource unorientedWidth](self, "unorientedWidth") * 0.37961;
  return (uint64_t)(float)(v3 * (float)-[PLVirtualResource unorientedHeight](self, "unorientedHeight"));
}

@end
