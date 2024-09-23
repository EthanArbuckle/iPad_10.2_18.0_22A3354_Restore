@implementation PHPhotosHighlight(PXDisplayAssetAdoption)

- (BOOL)px_isDayGroupHighlight
{
  return objc_msgSend(a1, "kind") == 3;
}

- (BOOL)px_isDayHighlight
{
  return objc_msgSend(a1, "kind") == 0;
}

- (BOOL)px_isMonthHighlight
{
  return objc_msgSend(a1, "kind") == 1;
}

- (BOOL)px_isEvent
{
  return !objc_msgSend(a1, "type") || objc_msgSend(a1, "type") == 5;
}

- (uint64_t)px_isTrip
{
  uint64_t result;

  result = objc_msgSend(a1, "type");
  if ((_DWORD)result != 1)
    return objc_msgSend(a1, "type") == 2;
  return result;
}

@end
