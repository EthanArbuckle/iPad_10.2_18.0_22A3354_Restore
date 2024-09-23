@implementation OSIAmbientLightMonitor

- (OSIAmbientLightMonitor)init
{
  OSIAmbientLightMonitor *v2;
  BrightnessSystemClient *v3;
  BrightnessSystemClient *brightnessClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSIAmbientLightMonitor;
  v2 = -[OSIAmbientLightMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init((Class)BrightnessSystemClient);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;

  }
  return v2;
}

- (int)currentAmbientLightLevel
{
  dispatch_semaphore_t v3;
  BrightnessSystemClient *brightnessClient;
  NSObject *v5;
  id v6;
  unsigned int v7;
  dispatch_time_t v8;
  int v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -1;
  brightnessClient = self->_brightnessClient;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10001B4B8;
  v14 = &unk_100060EC0;
  v16 = &v17;
  v5 = v3;
  v15 = v5;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](brightnessClient, "registerNotificationBlock:forProperties:", &v11, &off_100065908);
  v6 = -[BrightnessSystemClient copyPropertyForKey:](self->_brightnessClient, "copyPropertyForKey:", CFSTR("TrustedLux"), v11, v12, v13, v14);
  if ((objc_msgSend(v6, "intValue") & 0x80000000) != 0)
  {
    if ((v18[3] & 0x80000000) == 0)
      goto LABEL_3;
LABEL_5:
    v8 = dispatch_walltime(0, 2000000000);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "intValue");
  *((_DWORD *)v18 + 6) = v7;
  if ((v7 & 0x80000000) != 0)
    goto LABEL_5;
LABEL_3:
  v8 = 0;
LABEL_6:
  dispatch_semaphore_wait(v5, v8);
  -[BrightnessSystemClient unregisterNotificationForKey:](self->_brightnessClient, "unregisterNotificationForKey:", CFSTR("TrustedLux"));
  v9 = *((_DWORD *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end
