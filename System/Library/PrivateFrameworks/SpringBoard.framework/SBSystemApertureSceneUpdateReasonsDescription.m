@implementation SBSystemApertureSceneUpdateReasonsDescription

uint64_t __SBSystemApertureSceneUpdateReasonsDescription_block_invoke(uint64_t result, uint64_t a2)
{
  const __CFString *v2;

  if (a2 <= 63)
  {
    switch(a2)
    {
      case 1:
        v2 = CFSTR("sceneSize");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      case 2:
        v2 = CFSTR("containerViewFrame");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 4:
        v2 = CFSTR("trailingViewFrame");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      case 8:
        v2 = CFSTR("leadingViewframe");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      default:
        if (a2 == 16)
        {
          v2 = CFSTR("minimalViewFrame");
        }
        else
        {
          if (a2 != 32)
            return result;
          v2 = CFSTR("obstructedAreaFrame");
        }
        break;
    }
    return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
  }
  if (a2 <= 255)
  {
    if (a2 == 64)
    {
      v2 = CFSTR("layoutMode");
      return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
    }
    if (a2 == 128)
    {
      v2 = CFSTR("foreground");
      return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
    }
  }
  else
  {
    switch(a2)
    {
      case 256:
        v2 = CFSTR("minimalViewLayoutAxisChanged");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      case 512:
        v2 = CFSTR("detachedMinimalViewFrame");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
      case 1024:
        v2 = CFSTR("sceneLayoutTransition");
        return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
    }
  }
  return result;
}

@end
