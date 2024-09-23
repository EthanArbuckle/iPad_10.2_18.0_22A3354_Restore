@implementation NSStringFromPRSPosterSnapshotOptions

void *__NSStringFromPRSPosterSnapshotOptions_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *result;

  v2 = 0;
  if (a2 > 15)
  {
    v3 = CFSTR("IncludeFloatingLayer");
    v4 = CFSTR("RenderAsUnlocked");
    v5 = CFSTR("RenderAsPreview");
    if (a2 != 128)
      v5 = 0;
    if (a2 != 64)
      v4 = v5;
    if (a2 != 32)
      v3 = v4;
    v6 = CFSTR("IncludeBackgroundLayer");
    v7 = CFSTR("IncludePrimaryLayers");
    if (a2 != 24)
      v7 = 0;
    if (a2 != 16)
      v6 = v7;
    if (a2 <= 31)
      v2 = v6;
    else
      v2 = v3;
  }
  else
  {
    switch(a2)
    {
      case -1:
        v2 = CFSTR("All");
        break;
      case 0:
        v2 = CFSTR("None");
        break;
      case 2:
        v2 = CFSTR("IncludeHeaderElements");
        break;
      case 4:
        v2 = CFSTR("IncludeComplications");
        break;
      case 8:
        v2 = CFSTR("IncludeForegroundLayer");
        break;
      default:
        break;
    }
  }
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "addObject:", v2);
  return result;
}

@end
