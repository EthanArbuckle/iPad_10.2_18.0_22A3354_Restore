@implementation SBStringFromPIPLayoutReason

uint64_t __SBStringFromPIPLayoutReason_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const __CFString *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
    result = objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("+"));
  if (a2 > 511)
  {
    if (a2 > 4095)
    {
      if (a2 >= 0x4000)
      {
        if (a2 == 0x4000)
        {
          v5 = CFSTR("RegionComposerUpdate");
        }
        else
        {
          if (a2 != 0x8000)
            return result;
          v5 = CFSTR("OverlayViewSetup");
        }
      }
      else if (a2 == 4096)
      {
        v5 = CFSTR("UpdateMetrics");
      }
      else
      {
        if (a2 != 0x2000)
          return result;
        v5 = CFSTR("UpdateRegions");
      }
    }
    else if (a2 > 1919)
    {
      if (a2 == 1920)
      {
        v5 = CFSTR("AllGestures");
      }
      else
      {
        if (a2 != 2048)
          return result;
        v5 = CFSTR("StashedTabHandle");
      }
    }
    else if (a2 == 512)
    {
      v5 = CFSTR("RotationGesture");
    }
    else
    {
      if (a2 != 1024)
        return result;
      v5 = CFSTR("InteractionEnded");
    }
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  }
  if (a2 > 15)
  {
    if (a2 > 127)
    {
      if (a2 == 128)
      {
        v5 = CFSTR("PanGesture");
      }
      else
      {
        if (a2 != 256)
          return result;
        v5 = CFSTR("ResizeGesture");
      }
    }
    else if (a2 == 16)
    {
      v5 = CFSTR("PreferredScale");
    }
    else
    {
      if (a2 != 32)
        return result;
      v5 = CFSTR("UpdateStashState");
    }
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  }
  v5 = CFSTR("InitialLayout");
  switch(a2)
  {
    case 1:
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
    case 2:
      v5 = CFSTR("ContainerSize");
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
    case 4:
      v5 = CFSTR("EdgeInsets");
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
    case 8:
      v5 = CFSTR("PreferredContentSize");
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
    default:
      return result;
  }
  return result;
}

@end
