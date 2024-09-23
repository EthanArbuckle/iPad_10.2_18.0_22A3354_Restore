@implementation SBSProximityHandoffUI

- (SBSProximityHandoffUI)init
{
  return -[SBSProximityHandoffUI initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSProximityHandoffUI)initWithTarget:(id)a3
{
  id v4;
  SBSProximityHandoffUI *v5;
  uint64_t v6;
  SBSImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSProximityHandoffUI;
  v5 = -[SBSProximityHandoffUI init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", v5, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSImplementer *)v6;

  }
  return v5;
}

- (void)startWithHandoffType:(unint64_t)a3
{
  -[SBSImplementer handoffStartWithHandoffType:](self->_sbProxy, "handoffStartWithHandoffType:", a3);
}

- (void)startWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
  -[SBSImplementer handoffStartWithArtworkColors:handoffType:](self->_sbProxy, "handoffStartWithArtworkColors:handoffType:", a3, a4);
}

- (void)updateIntensity:(float)a3 handoffType:(unint64_t)a4
{
  -[SBSImplementer handoffUpdateIntensity:handoffType:](self->_sbProxy, "handoffUpdateIntensity:handoffType:", a4);
}

- (void)cancelWithHandoffType:(unint64_t)a3 error:(id)a4
{
  -[SBSImplementer handoffCancelWithHandoffType:](self->_sbProxy, "handoffCancelWithHandoffType:", a3, a4);
}

- (void)completeWithHandoffType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _SBSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_222D7A000, v5, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service setting device as stereo leader.", v7, 2u);
    }

    v8 = CFSTR("reason");
    v9[0] = CFSTR("ProximityHandoffV2");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSImplementer handoffSetDeviceAsStereoLeader:withOptions:](self->_sbProxy, "handoffSetDeviceAsStereoLeader:withOptions:", 1, v6);

  }
  -[SBSImplementer handoffCompleteWithHandoffType:](self->_sbProxy, "handoffCompleteWithHandoffType:", a3);
}

- (void)start
{
  -[SBSProximityHandoffUI startWithHandoffType:](self, "startWithHandoffType:", 0);
}

- (void)startWithArtworkColors:(id)a3
{
  -[SBSProximityHandoffUI startWithArtworkColors:handoffType:](self, "startWithArtworkColors:handoffType:", a3, 0);
}

- (void)updateIntensity:(float)a3
{
  -[SBSProximityHandoffUI updateIntensity:handoffType:](self, "updateIntensity:handoffType:", 0);
}

- (void)cancel:(id)a3
{
  -[SBSProximityHandoffUI cancelWithHandoffType:error:](self, "cancelWithHandoffType:error:", 0, a3);
}

- (void)complete
{
  -[SBSProximityHandoffUI completeWithHandoffType:](self, "completeWithHandoffType:", 0);
}

- (void)handoffCancelled
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222D7A000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service cancelled.", v5, 2u);
  }

  -[SBSProximityHandoffUI delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proximityHandoffUI:stateTransition:", self, 0);

}

- (void)handoffCompleted
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222D7A000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service completed.", v5, 2u);
  }

  -[SBSProximityHandoffUI delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proximityHandoffUI:stateTransition:", self, 1);

}

- (void)handoffInactive
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222D7A000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service inactive.", v5, 2u);
  }

  -[SBSProximityHandoffUI delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proximityHandoffUI:stateTransition:", self, 4);

}

- (void)handoffStarted
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222D7A000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service started.", v5, 2u);
  }

  -[SBSProximityHandoffUI delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proximityHandoffUI:stateTransition:", self, 2);

}

- (void)handoffUpdating
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _SBSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222D7A000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service updating.", v5, 2u);
  }

  -[SBSProximityHandoffUI delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proximityHandoffUI:stateTransition:", self, 3);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSProximityHandoffUI;
  -[SBSProximityHandoffUI dealloc](&v3, sel_dealloc);
}

- (SBSProximityHandoffUIDelegate)delegate
{
  return (SBSProximityHandoffUIDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
