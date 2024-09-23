@implementation SSKMirroredDisplayController

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayTransformUpdater:(id)a5 caDisplayQueue:(id)a6 assertion:(id)a7
{
  FBSDisplayIdentity *v11;
  FBSDisplayConfiguration *v12;
  OS_dispatch_queue *v13;
  SSKDisplayAssertion *v14;
  FBSDisplayIdentity *displayIdentity;
  FBSDisplayConfiguration *currentConfiguration;
  FBSDisplayConfiguration *v17;
  CADisplay *v18;
  CADisplay *caDisplay;
  SSKDisplayAssertion *displayAssertion;
  SSKDisplayAssertion *v21;
  OS_dispatch_queue *displayMutationQueue;
  FBSDisplayIdentity *v23;

  v11 = (FBSDisplayIdentity *)a3;
  v12 = (FBSDisplayConfiguration *)a4;
  v13 = (OS_dispatch_queue *)a6;
  v14 = (SSKDisplayAssertion *)a7;
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v11;
  v23 = v11;

  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v12;
  v17 = v12;

  -[FBSDisplayConfiguration CADisplay](self->_currentConfiguration, "CADisplay");
  v18 = (CADisplay *)objc_claimAutoreleasedReturnValue();
  caDisplay = self->_caDisplay;
  self->_caDisplay = v18;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v14;
  v21 = v14;

  displayMutationQueue = self->_displayMutationQueue;
  self->_displayMutationQueue = v13;

}

- (void)displayIdentityDidUpdate:(id)a3 configuration:(id)a4
{
  id v6;
  FBSDisplayConfiguration **p_currentConfiguration;
  FBSDisplayConfiguration *currentConfiguration;
  id v9;

  v6 = a4;
  currentConfiguration = self->_currentConfiguration;
  p_currentConfiguration = &self->_currentConfiguration;
  v9 = v6;
  if ((-[FBSDisplayConfiguration isEqual:](currentConfiguration, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_currentConfiguration, a4);

}

- (void)displayIdentityDidDisconnect:(id)a3
{
  -[BSAtomicSignal signal](self->_lostControlOfDisplaySignal, "signal", a3);
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKMirroredDisplayController displayAssertionDidGainControlOfDisplay:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKMirroredDisplayController.m"), 68, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay addObserver:forKeyPath:options:context:](self->_caDisplay, "addObserver:forKeyPath:options:context:", self, CFSTR("preferences"), 0, self);
  -[SSKMirroredDisplayController _ensureCADisplayModeForMirroring](self, "_ensureCADisplayModeForMirroring");
  objc_msgSend(MEMORY[0x24BDE57D8], "generateSeed");
}

- (void)displayAssertionDidLoseControlOfDisplay:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKMirroredDisplayController displayAssertionDidLoseControlOfDisplay:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SSKMirroredDisplayController.m"), 79, CFSTR("this call must be made on the main thread"));

  }
  -[CADisplay removeObserver:forKeyPath:context:](self->_caDisplay, "removeObserver:forKeyPath:context:", self, CFSTR("preferences"), self);
  -[BSAtomicSignal signal](self->_lostControlOfDisplaySignal, "signal");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__SSKMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v6[3] = &unk_25171C3B8;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);
}

uint64_t __79__SSKMirroredDisplayController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SSKLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    _SSKDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_245FEA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect CADisplay prefs change", (uint8_t *)&v5, 0xCu);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "hasControlOfDisplay");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_ensureCADisplayModeForMirroring");
  return result;
}

- (void)_ensureCADisplayModeForMirroring
{
  CADisplay *caDisplay;
  id v5;
  void *v6;
  void *v7;
  CADisplayMode *v8;
  CADisplayMode *requestedMode;
  NSString *v10;
  NSString *requestedOverscanAdjustment;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  BSAtomicSignal *v25;
  NSObject *displayMutationQueue;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  CGSize v31;
  _QWORD block[4];
  BSAtomicSignal *v33;
  id v34;
  id v35;
  SSKMirroredDisplayController *v36;
  CGSize v37;
  uint64_t v38;
  SEL v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SSKMirroredDisplayController _ensureCADisplayModeForMirroring]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("SSKMirroredDisplayController.m"), 100, CFSTR("this call must be made on the main thread"));

  }
  caDisplay = self->_caDisplay;
  v5 = objc_alloc_init(MEMORY[0x24BDE5678]);
  -[CADisplay preferredModeWithCriteria:](caDisplay, "preferredModeWithCriteria:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_requestedMode)
  {
    -[CADisplay currentMode](self->_caDisplay, "currentMode");
    v8 = (CADisplayMode *)objc_claimAutoreleasedReturnValue();
    requestedMode = self->_requestedMode;
    self->_requestedMode = v8;

  }
  if (!self->_requestedOverscanAdjustment)
  {
    -[CADisplay overscanAdjustment](self->_caDisplay, "overscanAdjustment");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestedOverscanAdjustment = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v10;

  }
  if (BSSizeEqualToSize())
  {
    -[CADisplay logicalScale](self->_caDisplay, "logicalScale");
    self->_requestedLogicalScale.width = v12;
    self->_requestedLogicalScale.height = v13;
  }
  v14 = SSKCADifferenceMaskCalculate(self->_caDisplay, v6, v7, 1);
  if (SSKCADisplayDifferenceMaskHasDifference(v14))
  {
    SSKLogDisplayControlling();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      _SSKDisplayControllerLoggingProem(self->_displayIdentity, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SSKCADisplayDifferenceMaskDescription(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v16;
      v42 = 2114;
      v43 = v17;
      _os_log_impl(&dword_245FEA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ we're in control of the display but our CADisplay needs updating: %{public}@", buf, 0x16u);

    }
    objc_storeStrong((id *)&self->_requestedMode, v6);
    v18 = (NSString *)objc_msgSend(v7, "copy");
    v19 = self->_requestedOverscanAdjustment;
    self->_requestedOverscanAdjustment = v18;

    __asm { FMOV            V0.2D, #1.0 }
    v31 = _Q0;
    self->_requestedLogicalScale = _Q0;
    v25 = self->_lostControlOfDisplaySignal;
    displayMutationQueue = self->_displayMutationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke;
    block[3] = &unk_25171C408;
    v33 = v25;
    v34 = v6;
    v35 = v7;
    v36 = self;
    v37 = v31;
    v38 = 1;
    v39 = a2;
    v27 = v25;
    dispatch_async(displayMutationQueue, block);

LABEL_16:
    goto LABEL_17;
  }
  if (v14 == -1)
  {
    SSKLogDisplayControlling();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      _SSKDisplayControllerLoggingProem(self->_displayIdentity, self);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2114;
      v43 = v6;
      v44 = 2114;
      v45 = v7;
      _os_log_error_impl(&dword_245FEA000, v27, OS_LOG_TYPE_ERROR, "%{public}@ we're in control of the display but we can't tell if our CADisplay is up to date. is one of these nil? preferredMode:%{public}@; preferredOverscan:%{public}@",
        buf,
        0x20u);

    }
    goto LABEL_16;
  }
LABEL_17:

}

void __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDE5680]);
    objc_msgSend(v2, "setCurrentMode:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setOverscanAdjustment:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setConnectionSeed:", objc_msgSend(v3, "connectionSeed"));

    objc_msgSend(v2, "setLogicalScale:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(v2, "setPointScale:", *(_QWORD *)(a1 + 80));
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "setDisplayProperties:", v2);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2;
    block[3] = &unk_25171C3E0;
    v10 = v4;
    v5 = *(_QWORD *)(a1 + 88);
    block[4] = *(_QWORD *)(a1 + 56);
    v9 = v5;
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 64);
  SSKLogDisplayControlling();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      _SSKDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_245FEA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display change successful : mode=%{public}@ overscan=%{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(a1, v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayAssertion");
}

- (void)_updateDisplayAssertion
{
  SSKDisplayAssertionPreferences *v3;

  v3 = objc_alloc_init(SSKDisplayAssertionPreferences);
  -[SSKDisplayAssertionPreferences setWantsControlOfDisplay:](v3, "setWantsControlOfDisplay:", 1);
  -[SSKDisplayAssertionPreferences setCloneMirroringMode:](v3, "setCloneMirroringMode:", 1);
  -[SSKDisplayAssertion updateWithPreferences:](self->_displayAssertion, "updateWithPreferences:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedOverscanAdjustment, 0);
  objc_storeStrong((id *)&self->_requestedMode, 0);
  objc_storeStrong((id *)&self->_caDisplay, 0);
  objc_storeStrong((id *)&self->_displayMutationQueue, 0);
  objc_storeStrong((id *)&self->_lostControlOfDisplaySignal, 0);
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

void __64__SSKMirroredDisplayController__ensureCADisplayModeForMirroring__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _SSKDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_245FEA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ display change failed: is the connection seed out of date?", (uint8_t *)&v4, 0xCu);

}

@end
