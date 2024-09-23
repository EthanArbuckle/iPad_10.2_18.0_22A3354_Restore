@implementation TVRUIVolumeController

- (id)initForWindow:(id)a3 eventHandler:(id)a4
{
  id v7;
  id v8;
  TVRUIVolumeController *v9;
  TVRUIVolumeController *v10;
  void *v11;
  id eventHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVRUIVolumeController;
  v9 = -[TVRUIVolumeController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_window, a3);
    v11 = _Block_copy(v8);
    eventHandler = v10->_eventHandler;
    v10->_eventHandler = v11;

  }
  return v10;
}

- (void)enableVolumeControl
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t v18[2];
  uint8_t buf[16];
  __int16 v20;

  v3 = -[TVRUIVolumeController supportsVolumeControl](self, "supportsVolumeControl");
  _TVRUIVolumeControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Registering for volume button events", buf, 2u);
    }

    -[TVRUIVolumeController window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TVRUIVolumeController window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setSystemVolumeHUDEnabled:", 0);

    }
    -[TVRUIVolumeController volumeIncreaseSBSInvalidator](self, "volumeIncreaseSBSInvalidator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      -[TVRUIVolumeController volumeDecreaseSBSInvalidator](self, "volumeDecreaseSBSInvalidator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        _TVRUIVolumeControllerLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Begin consuming volume button presses", v17, 2u);
        }

        objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 4, self, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUIVolumeController setVolumeDecreaseSBSInvalidator:](self, "setVolumeDecreaseSBSInvalidator:", v15);

        objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
        v4 = objc_claimAutoreleasedReturnValue();
        -[NSObject beginConsumingPressesForButtonKind:eventConsumer:priority:](v4, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 3, self, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUIVolumeController setVolumeIncreaseSBSInvalidator:](self, "setVolumeIncreaseSBSInvalidator:", v16);

        goto LABEL_14;
      }
    }
    _TVRUIVolumeControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      v10 = "Already listening for volume button presses";
      v11 = v18;
      goto LABEL_13;
    }
  }
  else if (v5)
  {
    v20 = 0;
    v10 = "Volume control is NOT supported. Skipping listening for volume button events";
    v11 = (uint8_t *)&v20;
LABEL_13:
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
  }
LABEL_14:

}

- (void)disableVolumeControl
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIVolumeControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = -[TVRUIVolumeController supportsVolumeControl](self, "supportsVolumeControl");
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering from volume button events. supportsVolumeControl:%{BOOL}d", (uint8_t *)v9, 8u);
  }

  -[TVRUIVolumeController window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIVolumeController window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSystemVolumeHUDEnabled:", 1);

  }
  -[TVRUIVolumeController volumeDecreaseSBSInvalidator](self, "volumeDecreaseSBSInvalidator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[TVRUIVolumeController volumeIncreaseSBSInvalidator](self, "volumeIncreaseSBSInvalidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[TVRUIVolumeController setVolumeDecreaseSBSInvalidator:](self, "setVolumeDecreaseSBSInvalidator:", 0);
  -[TVRUIVolumeController setVolumeIncreaseSBSInvalidator:](self, "setVolumeIncreaseSBSInvalidator:", 0);
}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _TVRUIVolumeControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBSHardwareButtonKind();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[TVRUIVolumeController consumeSinglePressDownForButtonKind:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s, buttonKind: %@", (uint8_t *)&v8, 0x16u);

  }
  if (a3 == 4 || a3 == 3)
  {
    -[TVRUIVolumeController eventHandler](self, "eventHandler");
    v7 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(v7 + 16))();
  }
  else
  {
    _TVRUIVolumeControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      -[TVRUIVolumeController consumeSinglePressDownForButtonKind:].cold.1(a3, v7);
  }

}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  self->_supportsVolumeControl = a3;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BSInvalidatable)volumeDecreaseSBSInvalidator
{
  return self->_volumeDecreaseSBSInvalidator;
}

- (void)setVolumeDecreaseSBSInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, a3);
}

- (BSInvalidatable)volumeIncreaseSBSInvalidator
{
  return self->_volumeIncreaseSBSInvalidator;
}

- (void)setVolumeIncreaseSBSInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

- (void)consumeSinglePressDownForButtonKind:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromSBSHardwareButtonKind();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21B042000, a2, OS_LOG_TYPE_ERROR, "Unsupported button kind: %@", (uint8_t *)&v4, 0xCu);

}

@end
