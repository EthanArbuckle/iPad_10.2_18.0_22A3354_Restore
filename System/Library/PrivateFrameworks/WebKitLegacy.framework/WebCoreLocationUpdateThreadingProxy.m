@implementation WebCoreLocationUpdateThreadingProxy

uint64_t __71___WebCoreLocationUpdateThreadingProxy_geolocationAuthorizationGranted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "geolocationAuthorizationGranted");
}

uint64_t __70___WebCoreLocationUpdateThreadingProxy_geolocationAuthorizationDenied__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "geolocationAuthorizationDenied");
}

uint64_t __56___WebCoreLocationUpdateThreadingProxy_positionChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "positionChanged:", *(_QWORD *)(a1 + 40));
}

uint64_t __54___WebCoreLocationUpdateThreadingProxy_errorOccurred___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "errorOccurred:", *(_QWORD *)(a1 + 40));
}

uint64_t __56___WebCoreLocationUpdateThreadingProxy_resetGeolocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resetGeolocation");
}

@end
