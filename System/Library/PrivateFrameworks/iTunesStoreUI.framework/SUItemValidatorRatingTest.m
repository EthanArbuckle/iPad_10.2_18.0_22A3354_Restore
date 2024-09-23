@implementation SUItemValidatorRatingTest

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUItemValidatorRatingTest;
  return -[SUItemValidatorTest copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)validateItems:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a3);
      v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "contentRating");
      if (objc_msgSend(v10, "shouldHideWhenRestricted"))
      {
        if ((objc_msgSend(v10, "isRestricted") & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    result = 0;
    if (!a4)
      return result;
    goto LABEL_13;
  }
LABEL_10:
  result = 1;
  if (a4)
LABEL_13:
    *a4 = 0;
  return result;
}

@end
