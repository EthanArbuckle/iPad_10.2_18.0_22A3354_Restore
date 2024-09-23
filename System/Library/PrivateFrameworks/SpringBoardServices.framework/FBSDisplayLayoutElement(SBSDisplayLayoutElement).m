@implementation FBSDisplayLayoutElement(SBSDisplayLayoutElement)

- (uint64_t)isSpringBoardElement
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = BSEqualStrings();
  return v7;
}

- (uint64_t)layoutRole
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isSpringBoardElement"))
    return 0;
  objc_msgSend(a1, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (uint64_t)sb_isTransitioning
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isSpringBoardElement");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "otherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForSetting:", 2);

    return v4;
  }
  return result;
}

- (uint64_t)sb_isStashedPIP
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isSpringBoardElement");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "otherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForSetting:", 3);

    return v4;
  }
  return result;
}

@end
