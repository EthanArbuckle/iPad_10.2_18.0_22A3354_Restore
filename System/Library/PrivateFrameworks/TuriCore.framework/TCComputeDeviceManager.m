@implementation TCComputeDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  return (id)sharedInstance_singleton_0;
}

void __40__TCComputeDeviceManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TCComputeDeviceManager initSingleton]([TCComputeDeviceManager alloc], "initSingleton");
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TCComputeDeviceManager;
  -[TCComputeDeviceManager dealloc](&v2, sel_dealloc);
}

- (id)initSingleton
{
  TCComputeDeviceManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TCComputeDeviceManager;
  v2 = -[TCComputeDeviceManager init](&v5, sel_init);
  if (v2)
  {
    +[TCPreferences userPreferences](TCPreferences, "userPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_forceCPU = objc_msgSend(v3, "devicePolicy") == 1;

  }
  return v2;
}

- (TCComputeDeviceManager)initWithDevices:(id)a3 forceCPU:(BOOL)a4
{
  id v6;
  TCComputeDeviceManager *v7;
  TCComputeDeviceManager *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCComputeDeviceManager;
  v7 = -[TCComputeDeviceManager init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_forceCPU = a4;
    -[TCComputeDeviceManager setDevices:](v7, "setDevices:", v6);
  }

  return v8;
}

- (void)setDevices:(id)a3
{
  id v4;
  TCComputeDevice *v5;
  id v6;
  TCComputeDevice *v7;
  TCComputeDevice *v8;
  id v9;

  v4 = a3;
  v5 = -[TCComputeDevice initWithDevices:forceCPU:]([TCComputeDevice alloc], "initWithDevices:forceCPU:", 0, self->_forceCPU);
  -[TCComputeDeviceManager setDefaultDevice:](self, "setDefaultDevice:", v5);

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TCComputeDeviceManager selectDevices:group1:group2:](self, "selectDevices:group1:group2:", v4, v9, v6);

  v7 = -[TCComputeDevice initWithDevices:forceCPU:]([TCComputeDevice alloc], "initWithDevices:forceCPU:", v9, self->_forceCPU);
  -[TCComputeDeviceManager setPipelineDevicePrimary:](self, "setPipelineDevicePrimary:", v7);

  v8 = -[TCComputeDevice initWithDevices:forceCPU:]([TCComputeDevice alloc], "initWithDevices:forceCPU:", v6, self->_forceCPU);
  -[TCComputeDeviceManager setPipelineDeviceSecondary:](self, "setPipelineDeviceSecondary:", v8);

}

- (void)selectDevices:(id)a3 group1:(id)a4 group2:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_30);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
      if ((objc_msgSend(v14, "isLowPower", (_QWORD)v20) & 1) != 0)
        break;
      v15 = objc_msgSend(v7, "count");
      v16 = v7;
      if (!v15 || (v17 = objc_msgSend(v8, "count"), v16 = v8, !v17))
        objc_msgSend(v16, "addObject:", v14);
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  if (objc_msgSend(v8, "count") || objc_msgSend(v7, "count") != 1)
  {
    if (!objc_msgSend(v8, "count", (_QWORD)v20) && (unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v19);

      objc_msgSend(v7, "removeLastObject");
    }
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18);

  }
}

uint64_t __54__TCComputeDeviceManager_selectDevices_group1_group2___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isLowPower") & 1) == 0 && (objc_msgSend(v5, "isLowPower") & 1) != 0)
    goto LABEL_14;
  if (!objc_msgSend(v4, "isLowPower") || objc_msgSend(v5, "isLowPower"))
  {
    if (objc_msgSend(v4, "isRemovable") && !objc_msgSend(v5, "isRemovable"))
      goto LABEL_14;
    if ((objc_msgSend(v4, "isRemovable") & 1) != 0 || (objc_msgSend(v5, "isRemovable") & 1) == 0)
    {
      if (!objc_msgSend(v4, "isHeadless") || objc_msgSend(v5, "isHeadless"))
      {
        if ((objc_msgSend(v4, "isHeadless") & 1) != 0 || (objc_msgSend(v5, "isHeadless") & 1) == 0)
        {
          v6 = 0;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
LABEL_14:
      v6 = -1;
      goto LABEL_16;
    }
  }
LABEL_13:
  v6 = 1;
LABEL_16:

  return v6;
}

- (TCComputeDevice)defaultDevice
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TCComputeDevice)pipelineDevicePrimary
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPipelineDevicePrimary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TCComputeDevice)pipelineDeviceSecondary
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPipelineDeviceSecondary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineDeviceSecondary, 0);
  objc_storeStrong((id *)&self->_pipelineDevicePrimary, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
}

@end
