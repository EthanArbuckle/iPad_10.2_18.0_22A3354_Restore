@implementation NSStringFromSBUIControllerRequireContentOptions

uint64_t __NSStringFromSBUIControllerRequireContentOptions_block_invoke(uint64_t result, uint64_t a2)
{
  const __CFString *v2;

  switch(a2)
  {
    case 1:
      v2 = CFSTR("SBUIControllerRequireContentOptionWithoutUpdatingStatusBar");
      break;
    case 4:
      v2 = CFSTR("SBUIControllerRequireContentOptionReactivateSpotlight");
      break;
    case 2:
      v2 = CFSTR("SBUIControllerRequireContentOptionWithoutCheckingAuthenticationState");
      break;
    default:
      return result;
  }
  return objc_msgSend(*(id *)(result + 32), "addObject:", v2);
}

@end
