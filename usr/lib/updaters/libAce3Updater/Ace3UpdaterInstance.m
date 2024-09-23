@implementation Ace3UpdaterInstance

- (void)uarpRestoreInitOptions
{
  _BYTE *v3;
  _BYTE *v4;
  void *v5;

  v3 = uarpZalloc(0x50uLL);
  v4 = v3;
  if (v3)
  {
    v3[9] = 1;
    *v3 = -[UARPSoCUpdaterInstance routerID](self, "routerID");
    *((_DWORD *)v4 + 1) = -[UARPSoCUpdaterInstance logicUnitNumber](self, "logicUnitNumber");
    v4[8] = -[UARPSoCUpdaterInstance skipSameVersion](self, "skipSameVersion");
    *((_DWORD *)v4 + 18) = -[UARPSoCUpdaterInstance updaterMode](self, "updaterMode");
    if (-[UARPSoCUpdaterInstance updaterMode](self, "updaterMode") == 4)
      v4[10] = 1;
  }
  else
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "log:", CFSTR("%s: error allocating options: No resources"), "-[Ace3UpdaterInstance uarpRestoreInitOptions]");

  }
  return v4;
}

- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks
{
  uarpRestoreLayer4Callbacks *v3;
  uarpRestoreLayer4Callbacks *v4;
  void *v5;

  v3 = (uarpRestoreLayer4Callbacks *)uarpZalloc(0x88uLL);
  v4 = v3;
  if (v3)
  {
    v3->var0 = USBCUpdateEndpointInitialize;
  }
  else
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "log:", CFSTR("%s: error allocating callbacks: No resources"), "-[Ace3UpdaterInstance uarpRestoreLayer4Callbacks]");

  }
  return v4;
}

- (const)uarpRestoreQueueName
{
  return "com.apple.uarp.restore.ace3";
}

- (BOOL)skipApplyStage
{
  return 1;
}

- (const)namePrefix
{
  return "ace3";
}

@end
