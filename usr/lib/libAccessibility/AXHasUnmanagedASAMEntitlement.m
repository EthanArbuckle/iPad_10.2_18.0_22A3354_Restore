@implementation AXHasUnmanagedASAMEntitlement

BOOL ___AXHasUnmanagedASAMEntitlement_block_invoke()
{
  _BOOL8 result;

  result = _AXHasBooleanEntitlement((const __CFString *)kAXAACLegacyEntitlement)
        || _AXHasBooleanEntitlement((const __CFString *)kAXAACEntitlement)
        || _AXHasBooleanEntitlement((const __CFString *)kAXInternalASAMEntitlement);
  _AXHasUnmanagedASAMEntitlement_hasUnmanagedASAMEntitlement = result;
  return result;
}

@end
