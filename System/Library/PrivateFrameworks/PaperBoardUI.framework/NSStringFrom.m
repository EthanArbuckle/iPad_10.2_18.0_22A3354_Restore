@implementation NSStringFrom

uint64_t __NSStringFrom_PBUIPosterViewControllerUpdateReasons_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;

  if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        v2 = CFSTR("CreateHomeScreenController");
        break;
      case 32:
        v2 = CFSTR("OrientationUpdate");
        break;
      case 64:
        v2 = CFSTR("MaglevDynamicOrientationUpdate");
        break;
      default:
LABEL_13:
        v2 = CFSTR("(invalid _PBUIPosterViewControllerUpdateReason specified)");
        break;
    }
  }
  else
  {
    v2 = CFSTR("Unknown");
    switch(a2)
    {
      case 0:
        return objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v2);
      case 1:
        v2 = CFSTR("PosterUpdate");
        break;
      case 2:
        v2 = CFSTR("UpdateForActiveVariant");
        break;
      case 4:
        v2 = CFSTR("SceneDeactivation");
        break;
      case 8:
        v2 = CFSTR("SceneActivation");
        break;
      default:
        goto LABEL_13;
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v2);
}

@end
