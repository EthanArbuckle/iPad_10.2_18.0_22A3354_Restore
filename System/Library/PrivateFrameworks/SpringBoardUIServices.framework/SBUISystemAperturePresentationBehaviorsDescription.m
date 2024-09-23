@implementation SBUISystemAperturePresentationBehaviorsDescription

void __SBUISystemAperturePresentationBehaviorsDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2 > 127)
  {
    if (a2 > 1023)
    {
      switch(a2)
      {
        case 1024:
          v3 = CFSTR("showsExclusivelyOverAssociatedAppOrScene");
          break;
        case 2048:
          v3 = CFSTR("isSuppressedOnContinuityDisplay");
          break;
        case 4096:
          v3 = CFSTR("requireAssociatedAppBundleIdentifierForSuppression");
          break;
        default:
          return;
      }
    }
    else
    {
      switch(a2)
      {
        case 128:
          v3 = CFSTR("customViewHandlesLongPress");
          break;
        case 256:
          v3 = CFSTR("requiresAssociatedApp");
          break;
        case 512:
          v3 = CFSTR("dismissesUponHandlingLaunchAction");
          break;
        default:
          return;
      }
    }
  }
  else if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        v3 = CFSTR("disablesTapToApp");
        break;
      case 32:
        v3 = CFSTR("disablesTapToAppWhenCompactOrMinimal");
        break;
      case 64:
        v3 = CFSTR("undimsScreenIfNecessary");
        break;
      default:
        return;
    }
  }
  else
  {
    switch(a2)
    {
      case 2:
        v3 = CFSTR("showsOverAssociatedAppBundleIdentifier");
        break;
      case 4:
        v3 = CFSTR("showsOverAssociatedScene");
        break;
      case 8:
        v3 = CFSTR("showsOnCoversheet");
        break;
      default:
        return;
    }
  }
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" | %@"), v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

@end
