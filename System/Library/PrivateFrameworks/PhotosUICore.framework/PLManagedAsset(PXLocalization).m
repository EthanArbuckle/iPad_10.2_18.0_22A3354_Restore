@implementation PLManagedAsset(PXLocalization)

- (uint64_t)px_displayType
{
  uint64_t result;
  int v3;
  uint64_t v4;

  switch(objc_msgSend(a1, "playbackStyle"))
  {
    case 0u:
      result = 1;
      break;
    case 1u:
    case 3u:
      if (objc_msgSend(a1, "playbackVariation") == 3)
        result = 5;
      else
        result = 1;
      break;
    case 2u:
      result = 6;
      break;
    case 4u:
      result = 2;
      break;
    case 5u:
      v3 = objc_msgSend(a1, "playbackVariation");
      v4 = 2;
      if (v3 == 2)
        v4 = 3;
      if (v3 == 1)
        result = 4;
      else
        result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
