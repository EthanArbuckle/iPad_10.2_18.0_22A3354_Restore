@implementation AVOutputDeviceDiscoverySession(PHAirPlayRouteAvailability)

- (uint64_t)_pu_routeAvailability
{
  uint64_t result;

  result = objc_msgSend(a1, "discoveryMode");
  if (result)
  {
    if (objc_msgSend(a1, "devicePresenceDetected"))
      return 1;
    else
      return 2;
  }
  return result;
}

@end
