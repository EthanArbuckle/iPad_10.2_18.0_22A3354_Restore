@implementation MFLibraryMessage

- (int64_t)mailDropDeliveryState
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  signed int v9;
  int64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFLibraryMessage headers](self, "headers"));
  v4 = H_MAIL_DROP_DELIVERY_STATE;
  v5 = objc_msgSend(v3, "hasHeaderForKey:", H_MAIL_DROP_DELIVERY_STATE);

  if ((v5 & 1) == 0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFLibraryMessage headers](self, "headers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstHeaderForKey:", v4));

  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_msgSend(v7, "intValue");
    if (v8 - 9 >= 0xFFFFFFF8)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
