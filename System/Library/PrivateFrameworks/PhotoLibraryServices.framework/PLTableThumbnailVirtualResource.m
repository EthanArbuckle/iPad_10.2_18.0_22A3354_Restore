@implementation PLTableThumbnailVirtualResource

- (int64_t)dataLength
{
  int v3;
  int64_t v4;
  unsigned __int16 v5;
  void *v6;
  int64_t v7;

  v3 = -[PLVirtualResource unorientedWidth](self, "unorientedWidth");
  v4 = -[PLVirtualResource unorientedHeight](self, "unorientedHeight");
  v5 = -[PLVirtualResource recipeID](self, "recipeID");
  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v5 >> 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "tableFormatBytesPerRowForWidth:", v4) * v3 + 28;

  return v7;
}

@end
