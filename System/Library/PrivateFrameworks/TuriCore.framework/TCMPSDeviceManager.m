@implementation TCMPSDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_singleton;
}

void __36__TCMPSDeviceManager_sharedInstance__block_invoke()
{
  TCMPSDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(TCMPSDeviceManager);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (TCMPSDeviceManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMPSDeviceManager;
  return -[TCMPSDeviceManager init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TCMPSDeviceManager;
  -[TCMPSDeviceManager dealloc](&v2, sel_dealloc);
}

- (BOOL)shouldPreferDevice:(id)a3 overDevice:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (!v6 || (objc_msgSend(v5, "isLowPower") & 1) == 0 && (objc_msgSend(v6, "isLowPower") & 1) != 0)
    goto LABEL_15;
  if (!objc_msgSend(v5, "isLowPower") || objc_msgSend(v6, "isLowPower"))
  {
    if (objc_msgSend(v5, "isRemovable") && !objc_msgSend(v6, "isRemovable"))
      goto LABEL_15;
    if ((objc_msgSend(v5, "isRemovable") & 1) != 0 || (objc_msgSend(v6, "isRemovable") & 1) == 0)
    {
      if (!objc_msgSend(v5, "isHeadless") || objc_msgSend(v6, "isHeadless"))
      {
        if ((objc_msgSend(v5, "isHeadless") & 1) == 0)
          objc_msgSend(v6, "isHeadless");
        goto LABEL_14;
      }
LABEL_15:
      v7 = 1;
      goto LABEL_16;
    }
  }
LABEL_14:
  v7 = 0;
LABEL_16:

  return v7;
}

- (void)setPreferredDeviceFromDevices:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[TCMPSDeviceManager shouldPreferDevice:overDevice:](self, "shouldPreferDevice:overDevice:", v10, v7))
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  -[TCMPSDeviceManager setPreferredDevice:](self, "setPreferredDevice:", v7);

}

- (MTLDevice)preferredDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreferredDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDevice, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
}

@end
