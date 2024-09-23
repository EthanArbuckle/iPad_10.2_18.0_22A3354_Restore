@implementation PXStoryMiroVideoInfo

- (id)token
{
  if (token_once != -1)
    dispatch_once(&token_once, &__block_literal_global_72253);
  return (id)token_token;
}

- (PXStoryMiroVideoInfo)initWithData:(id)a3
{
  id v4;
  PXStoryMiroVideoInfo *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  PXStoryMiroVideoRangeInfo *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryMiroVideoInfo;
  v5 = -[PXStoryMiroAssetInfo initWithData:](&v13, sel_initWithData_, v4);
  if (v5)
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * objc_msgSend(v4, "length") - 0x3333333333333334, 1) <= 0x1999999999999999uLL)
    {
      objc_msgSend(v4, "subdataWithRange:", 0, 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryMiroVideoInfo token](v5, "token");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToData:", v7);

      if (v8)
      {
        if ((unint64_t)objc_msgSend(v4, "length") >= 5)
        {
          v9 = 4;
          while (1)
          {
            objc_msgSend(v4, "subdataWithRange:", v9, 10);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[PXStoryMiroVideoRangeInfo initWithData:]([PXStoryMiroVideoRangeInfo alloc], "initWithData:", v10);
            if (-[PXStoryMiroAssetInfo isUsed](v11, "isUsed"))
              break;
            v9 += 10;

            if (v9 >= objc_msgSend(v4, "length"))
              goto LABEL_10;
          }
          -[PXStoryMiroAssetInfo setIsUsed:](v5, "setIsUsed:", 1);

        }
      }
    }
  }
LABEL_10:

  return v5;
}

void __29__PXStoryMiroVideoInfo_token__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "MVFI", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)token_token;
  token_token = v0;

}

@end
