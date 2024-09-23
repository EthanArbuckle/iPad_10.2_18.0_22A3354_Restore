@implementation SFShareAudioViewController

+ (id)instantiateViewController
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Sharing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD9A0], "storyboardWithName:bundle:", CFSTR("ShareAudioGuest"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantiateViewControllerWithIdentifier:", CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainBundle:", v2);
  objc_msgSend(v4, "setMainStoryboard:", v3);
  objc_msgSend(v4, "setModalPresentationStyle:", 6);
  objc_msgSend(v4, "setModalTransitionStyle:", 2);
  v5 = (id)objc_msgSend(v4, "view");
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioViewController;
  -[SFShareAudioViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  -[SFShareAudioViewController _showBringClose](self, "_showBringClose");
  -[SFShareAudioViewController _sessionStart](self, "_sessionStart");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SFShareAudioSessionClient *shareAudioSession;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)SFShareAudioViewController;
  -[SFShareAudioViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  -[SFShareAudioSessionClient invalidate](self->_shareAudioSession, "invalidate");
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  NSErrorF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioViewController _reportCompletion:mediaRouteID:](self, "_reportCompletion:mediaRouteID:", v6, 0);

}

- (void)_reportCompletion:(id)a3 mediaRouteID:(id)a4
{
  id v6;
  SFShareAudioSessionClient *shareAudioSession;
  void (**v8)(void *, SFSharedAudioDeviceInfo *, _QWORD);
  id completion;
  SFSharedAudioDeviceInfo *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SFShareAudioSessionClient invalidate](self->_shareAudioSession, "invalidate");
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  v8 = (void (**)(void *, SFSharedAudioDeviceInfo *, _QWORD))_Block_copy(self->_completion);
  if (v8)
  {
    completion = self->_completion;
    self->_completion = 0;

    if (v6)
    {
      v10 = objc_alloc_init(SFSharedAudioDeviceInfo);
      -[SFSharedAudioDeviceInfo setMediaRouteIdentifier:](v10, "setMediaRouteIdentifier:", v6);
      v8[2](v8, v10, 0);
    }
    else
    {
      if (v11)
      {
        ((void (*)(void (**)(void *, SFSharedAudioDeviceInfo *, _QWORD), _QWORD))v8[2])(v8, 0);
        goto LABEL_7;
      }
      NSErrorF();
      v10 = (SFSharedAudioDeviceInfo *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, SFSharedAudioDeviceInfo *, SFSharedAudioDeviceInfo *))v8)[2](v8, 0, v10);
    }

  }
LABEL_7:

}

- (void)reportError:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (gLogCategory_SFShareAudioViewController <= 90)
  {
    if (gLogCategory_SFShareAudioViewController != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      v4 = v7;
    }
  }
  if (v4)
  {
    -[SFShareAudioViewController _reportCompletion:mediaRouteID:](self, "_reportCompletion:mediaRouteID:", v4, 0);
  }
  else
  {
    NSErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShareAudioViewController _reportCompletion:mediaRouteID:](self, "_reportCompletion:mediaRouteID:", v6, 0);

  }
}

- (void)reportUserCancelled
{
  id v3;

  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioViewController _reportCompletion:mediaRouteID:](self, "_reportCompletion:mediaRouteID:", v3, 0);

}

- (void)_sessionStart
{
  SFShareAudioSessionClient *v3;
  SFShareAudioSessionClient *shareAudioSession;
  SFShareAudioSessionClient *v5;
  _QWORD v6[6];

  v3 = (SFShareAudioSessionClient *)objc_alloc_init(MEMORY[0x24BE901C0]);
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = v3;
  v5 = v3;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__SFShareAudioViewController__sessionStart__block_invoke;
  v6[3] = &unk_24CE0FE78;
  v6[4] = v5;
  v6[5] = self;
  -[SFShareAudioSessionClient setProgressHandler:](v5, "setProgressHandler:", v6);
  -[SFShareAudioSessionClient activate](v5, "activate");

}

_QWORD *__43__SFShareAudioViewController__sessionStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v4 == result[178])
    return (_QWORD *)objc_msgSend(result, "_sessionProgressEvent:info:", a2, a3);
  return result;
}

- (void)_sessionProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4;
  __CFString *v6;
  const char *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  SFShareAudioViewController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  const __CFString *v16;
  __CFString *v17;

  v4 = *(_QWORD *)&a3;
  v6 = (__CFString *)a4;
  v17 = v6;
  if (gLogCategory_SFShareAudioViewController > 30)
    goto LABEL_42;
  if (gLogCategory_SFShareAudioViewController == -1)
  {
    v8 = _LogCategory_Initialize();
    v6 = v17;
    if (!v8)
      goto LABEL_42;
  }
  if ((int)v4 > 119)
  {
    if ((int)v4 <= 219)
    {
      switch((_DWORD)v4)
      {
        case 0x78:
          v7 = "ShowPairInstructions";
          goto LABEL_39;
        case 0xC8:
          v7 = "GuestiOSConnecting";
          goto LABEL_39;
        case 0xD2:
          v7 = "GuestiOSAuthenticated";
          goto LABEL_39;
      }
    }
    else if ((int)v4 > 309)
    {
      if ((_DWORD)v4 == 310)
      {
        v7 = "GuestHeadphonesConnected";
        goto LABEL_39;
      }
      if ((_DWORD)v4 == 320)
      {
        v7 = "GuestHeadphonesWaitForRoute";
        goto LABEL_39;
      }
    }
    else
    {
      if ((_DWORD)v4 == 220)
      {
        v7 = "GuestiOSWaitingForAccept";
        goto LABEL_39;
      }
      if ((_DWORD)v4 == 300)
      {
        v7 = "GuestHeadphonesConnecting";
        goto LABEL_39;
      }
    }
LABEL_38:
    v7 = "?";
    goto LABEL_39;
  }
  if ((int)v4 <= 29)
  {
    switch((_DWORD)v4)
    {
      case 0:
        v7 = "Invalid";
        goto LABEL_39;
      case 0xA:
        v7 = "Activated";
        goto LABEL_39;
      case 0x14:
        v7 = "Invalidated";
        goto LABEL_39;
    }
    goto LABEL_38;
  }
  if ((int)v4 > 49)
  {
    if ((_DWORD)v4 == 50)
    {
      v7 = "Failed";
      goto LABEL_39;
    }
    if ((_DWORD)v4 == 100)
    {
      v7 = "Confirm";
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if ((_DWORD)v4 == 30)
  {
    v7 = "Interrupted";
    goto LABEL_39;
  }
  if ((_DWORD)v4 != 40)
    goto LABEL_38;
  v7 = "Succeeded";
LABEL_39:
  v9 = &stru_24CE12D78;
  if (v6)
    v9 = v6;
  v15 = v7;
  v16 = v9;
  LogPrintF();
  v6 = v17;
LABEL_42:
  if ((int)v4 > 119)
  {
    if ((v4 - 200) <= 0x14 && ((1 << (v4 + 56)) & 0x100401) != 0
      || (v4 - 300) <= 0x14 && ((1 << (v4 - 44)) & 0x100401) != 0)
    {
      -[SFShareAudioViewController _showConnecting:](self, "_showConnecting:", v17, v15, v16);
      -[SFShareAudioConnectingViewController sessionProgressEvent:info:](self->_vcConnecting, "sessionProgressEvent:info:", v4, v17);
      goto LABEL_60;
    }
    if ((_DWORD)v4 == 120)
    {
      -[SFShareAudioViewController _showPairInstructions:](self, "_showPairInstructions:", v17);
LABEL_60:
      v6 = v17;
      goto LABEL_61;
    }
    goto LABEL_61;
  }
  switch((_DWORD)v4)
  {
    case '(':
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = 0;
      v13 = v10;
      goto LABEL_57;
    case '2':
      CFErrorGetTypeID();
      CFDictionaryGetTypedValue();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "code") - 299008;
      v11 = self;
      v12 = v10;
      if (v14 != 2023)
      {
        -[SFShareAudioViewController _showError:](self, "_showError:", v10);
        goto LABEL_59;
      }
      v13 = 0;
LABEL_57:
      -[SFShareAudioViewController _reportCompletion:mediaRouteID:](v11, "_reportCompletion:mediaRouteID:", v12, v13, v15, v16);
LABEL_59:

      goto LABEL_60;
    case 'd':
      -[SFShareAudioViewController _showConfirm:](self, "_showConfirm:", v17);
      goto LABEL_60;
  }
LABEL_61:

}

- (void)_showBringClose
{
  id v3;

  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("BringClose"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMainController:", self);
  -[SFShareAudioViewController _transitionToViewController:animate:](self, "_transitionToViewController:animate:", v3, 0);

}

- (void)_showError:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    v5 = v6;
    LogPrintF();
  }
  -[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("Error"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainController:", self);
  objc_msgSend(v4, "setError:", v6);
  -[SFShareAudioViewController _transitionToViewController:animate:](self, "_transitionToViewController:animate:", v4, 0);

}

- (void)_showConfirm:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    v5 = v6;
    LogPrintF();
  }
  -[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("Confirm"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMainController:", self);
  objc_msgSend(v4, "setProductID:", CFDictionaryGetInt64Ranged());
  objc_msgSend(v4, "setColorCode:", CFDictionaryGetInt64Ranged());
  -[SFShareAudioViewController _transitionToViewController:animate:](self, "_transitionToViewController:animate:", v4, 0);

}

- (void)_showPairInstructions:(id)a3
{
  SFShareAudioHoldButtonViewController *v4;
  id v5;

  v5 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = objc_alloc_init(SFShareAudioHoldButtonViewController);
  -[SFShareAudioBaseViewController setMainController:](v4, "setMainController:", self);
  -[SFShareAudioHoldButtonViewController setProductID:](v4, "setProductID:", CFDictionaryGetInt64Ranged());
  -[SFShareAudioHoldButtonViewController setColorCode:](v4, "setColorCode:", CFDictionaryGetInt64Ranged());
  -[SFShareAudioViewController _transitionToViewController:animate:](self, "_transitionToViewController:animate:", v4, 0);

}

- (void)_showConnecting:(id)a3
{
  SFShareAudioConnectingViewController *v4;
  id v5;

  v5 = a3;
  v4 = self->_vcConnecting;
  if (!v4)
  {
    -[UIStoryboard instantiateViewControllerWithIdentifier:](self->_mainStoryboard, "instantiateViewControllerWithIdentifier:", CFSTR("Connecting"));
    v4 = (SFShareAudioConnectingViewController *)objc_claimAutoreleasedReturnValue();
    -[SFShareAudioBaseViewController setMainController:](v4, "setMainController:", self);
    objc_storeStrong((id *)&self->_vcConnecting, v4);
  }
  -[SFShareAudioConnectingViewController setProductID:](v4, "setProductID:", CFDictionaryGetInt64Ranged());
  -[SFShareAudioConnectingViewController setColorCode:](v4, "setColorCode:", CFDictionaryGetInt64Ranged());
  -[SFShareAudioViewController _transitionToViewController:animate:](self, "_transitionToViewController:animate:", v4, 0);

}

- (void)_transitionToViewController:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;

  v4 = a4;
  v15 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 0.5);
    objc_msgSend(v6, "setType:", *MEMORY[0x24BDE5E00]);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v7);

    -[SFShareAudioViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v6, 0);

    objc_msgSend(v15, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAnimation:forKey:", v6, 0);

  }
  -[SFShareAudioViewController viewControllers](self, "viewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v15);

  if (v13)
    v14 = (id)-[SFShareAudioViewController popToViewController:animated:](self, "popToViewController:animated:", v15, 0);
  else
    -[SFShareAudioViewController pushViewController:animated:](self, "pushViewController:animated:", v15, 0);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (SFShareAudioSessionClient)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_shareAudioSession, a3);
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (void)setMainBundle:(id)a3
{
  objc_storeStrong((id *)&self->_mainBundle, a3);
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setMainStoryboard:(id)a3
{
  objc_storeStrong((id *)&self->_mainStoryboard, a3);
}

- (SFShareAudioConnectingViewController)vcConnecting
{
  return self->_vcConnecting;
}

- (void)setVcConnecting:(id)a3
{
  objc_storeStrong((id *)&self->_vcConnecting, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcConnecting, 0);
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
