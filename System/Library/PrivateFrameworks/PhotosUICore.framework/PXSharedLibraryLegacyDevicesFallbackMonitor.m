@implementation PXSharedLibraryLegacyDevicesFallbackMonitor

- (PXSharedLibraryLegacyDevicesFallbackMonitor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevicesFallbackMonitor.m"), 28, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryLegacyDevicesFallbackMonitor init]");

  abort();
}

- (id)_init
{
  PXSharedLibraryLegacyDevicesFallbackMonitor *v2;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryLegacyDevicesFallbackMonitor;
  v2 = -[PXSharedLibraryLegacyDevicesFallbackMonitor init](&v7, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__PXSharedLibraryLegacyDevicesFallbackMonitor__init__block_invoke;
    v4[3] = &unk_1E5131928;
    objc_copyWeak(&v5, &location);
    PXSharedLibraryFetchLegacyDevices(v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXSharedLibraryLegacyDevicesFallbackMonitor signalChange:](self, "signalChange:", 1);
  }
}

- (void)setDevices:(id)a3
{
  NSArray *v4;
  NSArray *devices;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->_devices;
  devices = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSArray *)-[NSArray copy](v9, "copy");
    devices = self->_devices;
    self->_devices = v8;
LABEL_4:

  }
}

- (void)_updateLegacyDevices:(id)a3 error:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  if (v6)
    v7 = 2;
  v9[2] = __74__PXSharedLibraryLegacyDevicesFallbackMonitor__updateLegacyDevices_error___block_invoke;
  v9[3] = &unk_1E5144A98;
  v10 = v5;
  v11 = v7;
  v9[4] = self;
  v8 = v5;
  -[PXSharedLibraryLegacyDevicesFallbackMonitor performChanges:](self, "performChanges:", v9);

}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

uint64_t __74__PXSharedLibraryLegacyDevicesFallbackMonitor__updateLegacyDevices_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setDevices:", *(_QWORD *)(a1 + 40));
}

void __52__PXSharedLibraryLegacyDevicesFallbackMonitor__init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updateLegacyDevices:error:", v6, v5);

}

+ (id)legacyDevicesFallbackMonitorIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3
{
  int v4;
  id v5;

  v4 = _os_feature_enabled_impl();
  v5 = 0;
  if (v4 && !a3)
    v5 = -[PXSharedLibraryLegacyDevicesFallbackMonitor _init]([PXSharedLibraryLegacyDevicesFallbackMonitor alloc], "_init");
  return v5;
}

@end
