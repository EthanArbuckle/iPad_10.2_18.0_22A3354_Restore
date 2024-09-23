@implementation ARSession

- (void)updateCameraFocusLensPosition:(float)a3
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  float v10;
  float v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ARSession *v26;
  __int16 v27;
  double v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "isAutoFocusEnabled");

  v7 = sub_1009604A8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v6 & 1) == 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134349056;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Auto focus is disabled; will try to manually set lens position",
        buf,
        0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", AVCaptureDeviceTypeBuiltInWideAngleCamera, AVMediaTypeVideo, 1));
    if (-[NSObject isLockingFocusWithCustomLensPositionSupported](v8, "isLockingFocusWithCustomLensPositionSupported"))
    {
      -[NSObject lensPosition](v8, "lensPosition");
      v11 = vabds_f32(a3, v10);
      v12 = sub_1009604A8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v11 >= 2.2204e-16)
      {
        if (v14)
        {
          *(_DWORD *)buf = 134349312;
          v26 = self;
          v27 = 2048;
          v28 = a3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Will lock lens position with value: %f", buf, 0x16u);
        }

        v24 = 0;
        v19 = -[NSObject lockForConfiguration:](v8, "lockForConfiguration:", &v24);
        v13 = v24;
        v20 = sub_1009604A8();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = v21;
        if (v19)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134349056;
            v26 = self;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Successfully locked camera", buf, 0xCu);
          }

          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1009604E8;
          v23[3] = &unk_1011DCD08;
          v23[4] = self;
          -[NSObject setFocusModeLockedWithLensPosition:completionHandler:](v8, "setFocusModeLockedWithLensPosition:completionHandler:", v23, COERCE_DOUBLE((unint64_t)LODWORD(a3)));
          -[NSObject unlockForConfiguration](v8, "unlockForConfiguration");
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349314;
            v26 = self;
            v27 = 2112;
            v28 = *(double *)&v13;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}p] Could not lock camera: %@", buf, 0x16u);
          }

        }
        goto LABEL_22;
      }
      if (v14)
      {
        *(_DWORD *)buf = 134349312;
        v26 = self;
        v27 = 2048;
        v28 = a3;
        v15 = "[%{public}p] Lens position is already %f; will not update";
        v16 = v13;
        v17 = 22;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      }
    }
    else
    {
      v18 = sub_1009604A8();
      v13 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v26 = self;
        v15 = "[%{public}p] Locking focus with custom lens position is not supported on the current device";
        v16 = v13;
        v17 = 12;
        goto LABEL_12;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v9)
  {
    *(_DWORD *)buf = 134349056;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Auto focus is enabled; will NOT manually set lens position",
      buf,
      0xCu);
  }
LABEL_23:

}

- (BOOL)isVIORunning
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;

  if (!-[ARSession state](self, "state"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession technique](self, "technique"));
    v4 = objc_msgSend(v3, "vioThrottled");

    if (!v4)
      return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "isVIO");

  return v6;
}

- (BOOL)isVLFRunning
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;

  if (!-[ARSession state](self, "state"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession technique](self, "technique"));
    v4 = objc_msgSend(v3, "vioThrottled");

    if (!v4)
      return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ARSession configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "isVLF");

  return v6;
}

@end
