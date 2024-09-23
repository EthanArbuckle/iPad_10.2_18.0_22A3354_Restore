@implementation RTCameraManager_Embedded

- (void)handleCameraPowerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__RTCameraManager_Embedded_handleCameraPowerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleCameraPowerNotification:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  RTCameraManagerNotificationCameraPowerChanged *v6;
  id v7;

  v7 = a3;
  v4 = -[RTDarwinNotificationHelper stateForNotificationName:](self->_notificationHelper, "stateForNotificationName:", v7) == 1;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.isp.frontcamerapower")) & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.isp.backcamerapower"));
  v6 = -[RTCameraManagerNotificationCameraPowerChanged initWithCameraType:powerState:]([RTCameraManagerNotificationCameraPowerChanged alloc], "initWithCameraType:powerState:", v5, v4);
  if (v6)
    -[RTNotifier postNotification:](self, "postNotification:", v6);

}

- (RTCameraManager_Embedded)init
{
  RTCameraManager_Embedded *v2;
  uint64_t v3;
  RTDarwinNotificationHelper *notificationHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTCameraManager_Embedded;
  v2 = -[RTNotifier init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    notificationHelper = v2->_notificationHelper;
    v2->_notificationHelper = (RTDarwinNotificationHelper *)v3;

  }
  return v2;
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.frontcamerapower"));
  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.backcamerapower"));
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.frontcamerapower"));
  -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.backcamerapower"));
  v3.receiver = self;
  v3.super_class = (Class)RTCameraManager_Embedded;
  -[RTCameraManager_Embedded dealloc](&v3, sel_dealloc);
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTDarwinNotificationHelper *notificationHelper;
  uint64_t v11;
  RTDarwinNotificationHelper *v12;
  RTCameraManagerNotificationCameraPowerChanged *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTCameraManagerNotificationCameraPowerChanged, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) == 1)
    {
      objc_initWeak(location, self);
      notificationHelper = self->_notificationHelper;
      v11 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke;
      v21[3] = &unk_1E92983E8;
      objc_copyWeak(&v22, location);
      -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](notificationHelper, "addObserverForNotificationName:handler:", CFSTR("com.apple.isp.frontcamerapower"), v21);
      v12 = self->_notificationHelper;
      v16 = v11;
      v17 = 3221225472;
      v18 = __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke_2;
      v19 = &unk_1E92983E8;
      objc_copyWeak(&v20, location);
      -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v12, "addObserverForNotificationName:handler:", CFSTR("com.apple.isp.backcamerapower"), &v16);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    v14 = -[RTDarwinNotificationHelper stateForNotificationName:](self->_notificationHelper, "stateForNotificationName:", v7, v16, v17, v18, v19) == 1;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.isp.frontcamerapower")) & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.isp.backcamerapower"));
    v13 = -[RTCameraManagerNotificationCameraPowerChanged initWithCameraType:powerState:]([RTCameraManagerNotificationCameraPowerChanged alloc], "initWithCameraType:powerState:", v15, v14);
    if (v13)
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v13, v6);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityCamera);
    v13 = (RTCameraManagerNotificationCameraPowerChanged *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1D1A22000, &v13->super.super, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)location, 0xCu);
    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTCameraManagerNotificationCameraPowerChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5))
    {
      -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.frontcamerapower"));
      -[RTDarwinNotificationHelper removeObserverForNotificationName:](self->_notificationHelper, "removeObserverForNotificationName:", CFSTR("com.apple.isp.backcamerapower"));
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityCamera);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Unsupported notification %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
