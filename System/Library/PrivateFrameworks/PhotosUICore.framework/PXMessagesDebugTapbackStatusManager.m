@implementation PXMessagesDebugTapbackStatusManager

- (BOOL)hasTapbacksForAsset:(id)a3
{
  return objc_msgSend(a3, "isFavorite");
}

- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4
{
  id v5;
  id v6;
  PXMessagesDebugTapbackUserData *v7;
  int v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PXMessagesDebugTapbackUserData);
  if (objc_msgSend(v5, "isFavorite"))
  {
    v8 = objc_msgSend(v5, "isFavorite");
    v9 = v8 ^ objc_msgSend(v6, "isFavorite");
  }
  else
  {
    v9 = 0;
  }
  -[PXMessagesDebugTapbackUserData setShouldAnimate:](v7, "setShouldAnimate:", v9);
  -[PXMessagesDebugTapbackUserData setAsset:](v7, "setAsset:", v5);

  return v7;
}

- (Class)decorationViewClass
{
  return (Class)objc_opt_class();
}

@end
