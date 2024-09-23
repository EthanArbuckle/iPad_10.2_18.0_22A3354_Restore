@implementation PXAssetsDataSource(PXCMM)

- (uint64_t)aggregateMediaType
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  _QWORD v12[4];

  v2 = objc_msgSend(a1, "numberOfSections");
  if (v2 < 1)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = objc_msgSend(a1, "numberOfItemsInSection:", v5);
    if (v7 < 1)
    {
LABEL_11:
      if ((v4 & 1) == 0)
        goto LABEL_15;
    }
    else
    {
      v8 = v7;
      v9 = 0;
      while (1)
      {
        v12[0] = objc_msgSend(a1, "identifier");
        v12[1] = v5;
        v12[2] = v9;
        v12[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(a1, "assetAtItemIndexPath:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "mediaType") == 1)
          v4 = 1;
        else
          v6 |= objc_msgSend(v10, "mediaType") == 2;

        if ((v4 & 1) != 0 && (v6 & 1) != 0)
          break;
        if (v8 == ++v9)
          goto LABEL_11;
      }
      v6 = 1;
      v4 = 1;
    }
    if ((v6 & 1) != 0)
      return 0;
LABEL_15:
    ++v5;
  }
  while (v5 != v3);
  if ((v6 & 1) != 0)
    result = 2;
  else
    result = 0;
  if ((v4 & 1) != 0)
    return 1;
  return result;
}

@end
