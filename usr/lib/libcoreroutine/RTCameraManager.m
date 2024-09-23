@implementation RTCameraManager

uint64_t __58__RTCameraManager_Embedded_handleCameraPowerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCameraPowerNotification:", *(_QWORD *)(a1 + 40));
}

void __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleCameraPowerNotification:", CFSTR("com.apple.isp.frontcamerapower"));

}

void __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleCameraPowerNotification:", CFSTR("com.apple.isp.backcamerapower"));

}

+ (RTCameraManager)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (RTCameraManager *)+[RTCameraManager allocWithZone:](RTCameraManager_Embedded, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTCameraManager;
  return (RTCameraManager *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

@end
