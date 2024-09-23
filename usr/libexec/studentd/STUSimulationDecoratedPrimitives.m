@implementation STUSimulationDecoratedPrimitives

- (STUSimulationDecoratedPrimitives)initWithSimulations:(id)a3
{
  id v5;
  STUSimulationDecoratedPrimitives *v6;
  STUSimulationDecoratedPrimitives *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUSimulationDecoratedPrimitives;
  v6 = -[STUSimulationDecoratedPrimitives init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_simulations, a3);

  return v7;
}

- (CRKAirPlayPrimitives)airPlayPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "airPlayPrimitives"));

  return (CRKAirPlayPrimitives *)v4;
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "IDSLocalSimulation"));

  return (CRKIDSLocalPrimitives *)v3;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IDSAddressTranslator"));

  return (CRKIDSAddressTranslator *)v4;
}

- (CRKTimerPrimitives)timerPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timerPrimitives"));

  return (CRKTimerPrimitives *)v4;
}

- (CRKProcessPrimitives)processPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processPrimitives"));

  return (CRKProcessPrimitives *)v4;
}

- (CRKOSTransactionPrimitives)osTransactionPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "osTransactionPrimitives"));

  return (CRKOSTransactionPrimitives *)v4;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileSystemPrimitives"));

  return (CRKFileSystemPrimitives *)v4;
}

- (CRKClassKitFacade)studentClassKitFacade
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "studentClassKitFacade"));

  return (CRKClassKitFacade *)v4;
}

- (CRKClassKitFacade)instructorClassKitFacade
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructorClassKitFacade"));

  return (CRKClassKitFacade *)v4;
}

- (STULockScreenPrimitives)lockScreenPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lockScreenPrimitives"));

  return (STULockScreenPrimitives *)v4;
}

- (STUUserNotificationPrimitives)userNotificationPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userNotificationPrimitives"));

  return (STUUserNotificationPrimitives *)v4;
}

- (STUGlobalNotificationPrimitives)globalNotificationPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "globalNotificationPrimitives"));

  return (STUGlobalNotificationPrimitives *)v4;
}

- (STUXPCPrimitives)XPCPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "XPCPrimitives"));

  return (STUXPCPrimitives *)v4;
}

- (STUSharediPadPrimitives)sharediPadPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharediPadPrimitives"));

  return (STUSharediPadPrimitives *)v4;
}

- (STUScreenDimmingPrimitives)screenDimmingPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenDimmingPrimitives"));

  return (STUScreenDimmingPrimitives *)v4;
}

- (STUEnvironmentPrimitives)environmentPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentPrimitives"));

  return (STUEnvironmentPrimitives *)v4;
}

- (STUUserDefaultsPrimitives)userDefaultsPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userDefaultsPrimitives"));

  return (STUUserDefaultsPrimitives *)v4;
}

- (STUAnalyticsPrimitives)analyticsPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "analyticsPrimitives"));

  return (STUAnalyticsPrimitives *)v4;
}

- (STULSPrimitives)launchServicesPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchServicesPrimitives"));

  return (STULSPrimitives *)v4;
}

- (STUWorkspacePrimitives)workspacePrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workspacePrimitives"));

  return (STUWorkspacePrimitives *)v4;
}

- (STUDevicePrimitives)devicePrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devicePrimitives"));

  return (STUDevicePrimitives *)v4;
}

- (STUFBSPrimitives)frontBoardServicesPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontBoardServicesPrimitives"));

  return (STUFBSPrimitives *)v4;
}

- (STUAccountsPrimitives)accountsPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsPrimitives"));

  return (STUAccountsPrimitives *)v4;
}

- (STUSystemStatusPrimitives)systemStatusPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "systemStatusPrimitives"));

  return (STUSystemStatusPrimitives *)v4;
}

- (STURunningBoardPrimitives)runningBoardPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "runningBoardPrimitives"));

  return (STURunningBoardPrimitives *)v4;
}

- (STUMobileKeyBagPrimitives)mobileKeyBagPrimitives
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulationDecoratedPrimitives simulations](self, "simulations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mobileKeyBagPrimitives"));

  return (STUMobileKeyBagPrimitives *)v4;
}

- (STUSimulations)simulations
{
  return self->_simulations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulations, 0);
}

@end
