@implementation STUConcretePrimitives

- (CRKAirPlayPrimitives)airPlayPrimitives
{
  CRKAirPlayPrimitives *airPlayPrimitives;
  void *v4;
  CRKAirPlayPrimitives *v5;
  CRKAirPlayPrimitives *v6;

  airPlayPrimitives = self->_airPlayPrimitives;
  if (!airPlayPrimitives)
  {
    v4 = (void *)objc_opt_new(CRKAirPlayPrimitivesProvider);
    v5 = (CRKAirPlayPrimitives *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makePrimitives"));
    v6 = self->_airPlayPrimitives;
    self->_airPlayPrimitives = v5;

    airPlayPrimitives = self->_airPlayPrimitives;
  }
  return airPlayPrimitives;
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  CRKIDSLocalPrimitives *IDSLocalPrimitives;
  CRKIDSLocalPrimitives *v4;
  CRKIDSLocalPrimitives *v5;

  IDSLocalPrimitives = self->_IDSLocalPrimitives;
  if (!IDSLocalPrimitives)
  {
    v4 = (CRKIDSLocalPrimitives *)objc_msgSend(objc_alloc((Class)CRKConcreteIDSLocalPrimitives), "initWithServiceName:", CFSTR("com.apple.private.alloy.classroom"));
    v5 = self->_IDSLocalPrimitives;
    self->_IDSLocalPrimitives = v4;

    IDSLocalPrimitives = self->_IDSLocalPrimitives;
  }
  return IDSLocalPrimitives;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  CRKIDSAddressTranslator *IDSAddressTranslator;
  CRKIDSAddressTranslator *v4;
  CRKIDSAddressTranslator *v5;

  IDSAddressTranslator = self->_IDSAddressTranslator;
  if (!IDSAddressTranslator)
  {
    v4 = (CRKIDSAddressTranslator *)objc_opt_new(CRKConcreteIDSAddressTranslator);
    v5 = self->_IDSAddressTranslator;
    self->_IDSAddressTranslator = v4;

    IDSAddressTranslator = self->_IDSAddressTranslator;
  }
  return IDSAddressTranslator;
}

- (STULockScreenPrimitives)lockScreenPrimitives
{
  STULockScreenPrimitives *lockScreenPrimitives;
  STUConcreteLockScreenPrimitives *v4;
  STULockScreenPrimitives *v5;

  lockScreenPrimitives = self->_lockScreenPrimitives;
  if (!lockScreenPrimitives)
  {
    v4 = objc_opt_new(STUConcreteLockScreenPrimitives);
    v5 = self->_lockScreenPrimitives;
    self->_lockScreenPrimitives = (STULockScreenPrimitives *)v4;

    lockScreenPrimitives = self->_lockScreenPrimitives;
  }
  return lockScreenPrimitives;
}

- (STULSPrimitives)launchServicesPrimitives
{
  STULSPrimitives *launchServicesPrimitives;
  STUConcreteLSPrimitives *v4;
  STULSPrimitives *v5;

  launchServicesPrimitives = self->_launchServicesPrimitives;
  if (!launchServicesPrimitives)
  {
    v4 = objc_opt_new(STUConcreteLSPrimitives);
    v5 = self->_launchServicesPrimitives;
    self->_launchServicesPrimitives = (STULSPrimitives *)v4;

    launchServicesPrimitives = self->_launchServicesPrimitives;
  }
  return launchServicesPrimitives;
}

- (STUWorkspacePrimitives)workspacePrimitives
{
  STUWorkspacePrimitives *workspacePrimitives;
  STUConcreteWorkspacePrimitives *v4;
  STUWorkspacePrimitives *v5;

  workspacePrimitives = self->_workspacePrimitives;
  if (!workspacePrimitives)
  {
    v4 = objc_opt_new(STUConcreteWorkspacePrimitives);
    v5 = self->_workspacePrimitives;
    self->_workspacePrimitives = (STUWorkspacePrimitives *)v4;

    workspacePrimitives = self->_workspacePrimitives;
  }
  return workspacePrimitives;
}

- (CRKTimerPrimitives)timerPrimitives
{
  CRKTimerPrimitives *timerPrimitives;
  void *v4;
  CRKTimerPrimitives *v5;
  CRKTimerPrimitives *v6;

  timerPrimitives = self->_timerPrimitives;
  if (!timerPrimitives)
  {
    v4 = (void *)objc_opt_new(CRKTimerPrimitivesProvider);
    v5 = (CRKTimerPrimitives *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makePrimitives"));
    v6 = self->_timerPrimitives;
    self->_timerPrimitives = v5;

    timerPrimitives = self->_timerPrimitives;
  }
  return timerPrimitives;
}

- (CRKProcessPrimitives)processPrimitives
{
  CRKProcessPrimitives *processPrimitives;
  void *v4;
  CRKProcessPrimitives *v5;
  CRKProcessPrimitives *v6;

  processPrimitives = self->_processPrimitives;
  if (!processPrimitives)
  {
    v4 = (void *)objc_opt_new(CRKProcessPrimitivesProvider);
    v5 = (CRKProcessPrimitives *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makePrimitives"));
    v6 = self->_processPrimitives;
    self->_processPrimitives = v5;

    processPrimitives = self->_processPrimitives;
  }
  return processPrimitives;
}

- (CRKOSTransactionPrimitives)osTransactionPrimitives
{
  CRKOSTransactionPrimitives *osTransactionPrimitives;
  CRKOSTransactionPrimitives *v4;
  CRKOSTransactionPrimitives *v5;

  osTransactionPrimitives = self->_osTransactionPrimitives;
  if (!osTransactionPrimitives)
  {
    v4 = (CRKOSTransactionPrimitives *)objc_opt_new(CRKConcreteOSTransactionPrimitives);
    v5 = self->_osTransactionPrimitives;
    self->_osTransactionPrimitives = v4;

    osTransactionPrimitives = self->_osTransactionPrimitives;
  }
  return osTransactionPrimitives;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  CRKFileSystemPrimitives *fileSystemPrimitives;
  CRKFileSystemPrimitives *v4;
  CRKFileSystemPrimitives *v5;

  fileSystemPrimitives = self->_fileSystemPrimitives;
  if (!fileSystemPrimitives)
  {
    v4 = (CRKFileSystemPrimitives *)objc_opt_new(CRKConcreteFileSystemPrimitives);
    v5 = self->_fileSystemPrimitives;
    self->_fileSystemPrimitives = v4;

    fileSystemPrimitives = self->_fileSystemPrimitives;
  }
  return fileSystemPrimitives;
}

- (CRKClassKitFacade)studentClassKitFacade
{
  CRKClassKitFacade *studentClassKitFacade;
  CRKClassKitFacade *v4;
  CRKClassKitFacade *v5;

  studentClassKitFacade = self->_studentClassKitFacade;
  if (!studentClassKitFacade)
  {
    v4 = (CRKClassKitFacade *)objc_claimAutoreleasedReturnValue(+[CRKClassKitFacadeFactory makeStudentClassKitFacade](CRKClassKitFacadeFactory, "makeStudentClassKitFacade"));
    v5 = self->_studentClassKitFacade;
    self->_studentClassKitFacade = v4;

    studentClassKitFacade = self->_studentClassKitFacade;
  }
  return studentClassKitFacade;
}

- (CRKClassKitFacade)instructorClassKitFacade
{
  CRKClassKitFacade *instructorClassKitFacade;
  CRKClassKitFacade *v4;
  CRKClassKitFacade *v5;

  instructorClassKitFacade = self->_instructorClassKitFacade;
  if (!instructorClassKitFacade)
  {
    v4 = (CRKClassKitFacade *)objc_claimAutoreleasedReturnValue(+[CRKClassKitFacadeFactory makeInstructorClassKitFacadeWithPersonaAdoption:](CRKClassKitFacadeFactory, "makeInstructorClassKitFacadeWithPersonaAdoption:", 1));
    v5 = self->_instructorClassKitFacade;
    self->_instructorClassKitFacade = v4;

    instructorClassKitFacade = self->_instructorClassKitFacade;
  }
  return instructorClassKitFacade;
}

- (STUUserNotificationPrimitives)userNotificationPrimitives
{
  STUUserNotificationPrimitives *userNotificationPrimitives;
  STUConcreteUserNotificationPrimitives *v4;
  STUUserNotificationPrimitives *v5;

  userNotificationPrimitives = self->_userNotificationPrimitives;
  if (!userNotificationPrimitives)
  {
    v4 = objc_opt_new(STUConcreteUserNotificationPrimitives);
    v5 = self->_userNotificationPrimitives;
    self->_userNotificationPrimitives = (STUUserNotificationPrimitives *)v4;

    userNotificationPrimitives = self->_userNotificationPrimitives;
  }
  return userNotificationPrimitives;
}

- (STUGlobalNotificationPrimitives)globalNotificationPrimitives
{
  STUGlobalNotificationPrimitives *globalNotificationPrimitives;
  STUConcreteGlobalNotificationPrimitives *v4;
  STUGlobalNotificationPrimitives *v5;

  globalNotificationPrimitives = self->_globalNotificationPrimitives;
  if (!globalNotificationPrimitives)
  {
    v4 = objc_opt_new(STUConcreteGlobalNotificationPrimitives);
    v5 = self->_globalNotificationPrimitives;
    self->_globalNotificationPrimitives = (STUGlobalNotificationPrimitives *)v4;

    globalNotificationPrimitives = self->_globalNotificationPrimitives;
  }
  return globalNotificationPrimitives;
}

- (STUXPCPrimitives)XPCPrimitives
{
  STUXPCPrimitives *XPCPrimitives;
  STUConcreteXPCPrimitives *v4;
  STUXPCPrimitives *v5;

  XPCPrimitives = self->_XPCPrimitives;
  if (!XPCPrimitives)
  {
    v4 = objc_opt_new(STUConcreteXPCPrimitives);
    v5 = self->_XPCPrimitives;
    self->_XPCPrimitives = (STUXPCPrimitives *)v4;

    XPCPrimitives = self->_XPCPrimitives;
  }
  return XPCPrimitives;
}

- (STUSharediPadPrimitives)sharediPadPrimitives
{
  STUSharediPadPrimitives *sharediPadPrimitives;
  STUConcreteSharediPadPrimitives *v4;
  STUSharediPadPrimitives *v5;

  sharediPadPrimitives = self->_sharediPadPrimitives;
  if (!sharediPadPrimitives)
  {
    v4 = objc_opt_new(STUConcreteSharediPadPrimitives);
    v5 = self->_sharediPadPrimitives;
    self->_sharediPadPrimitives = (STUSharediPadPrimitives *)v4;

    sharediPadPrimitives = self->_sharediPadPrimitives;
  }
  return sharediPadPrimitives;
}

- (STUScreenDimmingPrimitives)screenDimmingPrimitives
{
  STUScreenDimmingPrimitives *screenDimmingPrimitives;
  id v4;
  STUScreenDimmingPrimitives *v5;
  STUScreenDimmingPrimitives *v6;

  screenDimmingPrimitives = self->_screenDimmingPrimitives;
  if (!screenDimmingPrimitives)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "makeScreenDimmingPrimitives");
    v5 = (STUScreenDimmingPrimitives *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_screenDimmingPrimitives;
    self->_screenDimmingPrimitives = v5;

    screenDimmingPrimitives = self->_screenDimmingPrimitives;
  }
  return screenDimmingPrimitives;
}

- (STUEnvironmentPrimitives)environmentPrimitives
{
  STUEnvironmentPrimitives *environmentPrimitives;
  STUConcreteEnvironmentPrimitives *v4;
  STUEnvironmentPrimitives *v5;

  environmentPrimitives = self->_environmentPrimitives;
  if (!environmentPrimitives)
  {
    v4 = objc_opt_new(STUConcreteEnvironmentPrimitives);
    v5 = self->_environmentPrimitives;
    self->_environmentPrimitives = (STUEnvironmentPrimitives *)v4;

    environmentPrimitives = self->_environmentPrimitives;
  }
  return environmentPrimitives;
}

- (STUUserDefaultsPrimitives)userDefaultsPrimitives
{
  STUUserDefaultsPrimitives *userDefaultsPrimitives;
  STUConcreteUserDefaultsPrimitives *v4;
  STUUserDefaultsPrimitives *v5;

  userDefaultsPrimitives = self->_userDefaultsPrimitives;
  if (!userDefaultsPrimitives)
  {
    v4 = objc_opt_new(STUConcreteUserDefaultsPrimitives);
    v5 = self->_userDefaultsPrimitives;
    self->_userDefaultsPrimitives = (STUUserDefaultsPrimitives *)v4;

    userDefaultsPrimitives = self->_userDefaultsPrimitives;
  }
  return userDefaultsPrimitives;
}

- (STUAnalyticsPrimitives)analyticsPrimitives
{
  STUAnalyticsPrimitives *analyticsPrimitives;
  STUConcreteAnalyticsPrimitives *v4;
  STUAnalyticsPrimitives *v5;

  analyticsPrimitives = self->_analyticsPrimitives;
  if (!analyticsPrimitives)
  {
    v4 = objc_opt_new(STUConcreteAnalyticsPrimitives);
    v5 = self->_analyticsPrimitives;
    self->_analyticsPrimitives = (STUAnalyticsPrimitives *)v4;

    analyticsPrimitives = self->_analyticsPrimitives;
  }
  return analyticsPrimitives;
}

- (STUDevicePrimitives)devicePrimitives
{
  STUDevicePrimitives *devicePrimitives;
  id v4;
  STUDevicePrimitives *v5;
  STUDevicePrimitives *v6;

  devicePrimitives = self->_devicePrimitives;
  if (!devicePrimitives)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "makeDevicePrimitives");
    v5 = (STUDevicePrimitives *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_devicePrimitives;
    self->_devicePrimitives = v5;

    devicePrimitives = self->_devicePrimitives;
  }
  return devicePrimitives;
}

- (STUAccountsPrimitives)accountsPrimitives
{
  STUAccountsPrimitives *accountsPrimitives;
  STUConcreteAccountsPrimitives *v4;
  STUAccountsPrimitives *v5;

  accountsPrimitives = self->_accountsPrimitives;
  if (!accountsPrimitives)
  {
    v4 = objc_opt_new(STUConcreteAccountsPrimitives);
    v5 = self->_accountsPrimitives;
    self->_accountsPrimitives = (STUAccountsPrimitives *)v4;

    accountsPrimitives = self->_accountsPrimitives;
  }
  return accountsPrimitives;
}

- (STUSystemStatusPrimitives)systemStatusPrimitives
{
  STUSystemStatusPrimitives *systemStatusPrimitives;
  STUConcreteSystemStatusPrimitives *v4;
  STUSystemStatusPrimitives *v5;

  systemStatusPrimitives = self->_systemStatusPrimitives;
  if (!systemStatusPrimitives)
  {
    v4 = objc_opt_new(STUConcreteSystemStatusPrimitives);
    v5 = self->_systemStatusPrimitives;
    self->_systemStatusPrimitives = (STUSystemStatusPrimitives *)v4;

    systemStatusPrimitives = self->_systemStatusPrimitives;
  }
  return systemStatusPrimitives;
}

- (STURunningBoardPrimitives)runningBoardPrimitives
{
  STURunningBoardPrimitives *runningBoardPrimitives;
  STUConcreteRunningBoardPrimitives *v4;
  STURunningBoardPrimitives *v5;

  runningBoardPrimitives = self->_runningBoardPrimitives;
  if (!runningBoardPrimitives)
  {
    v4 = objc_opt_new(STUConcreteRunningBoardPrimitives);
    v5 = self->_runningBoardPrimitives;
    self->_runningBoardPrimitives = (STURunningBoardPrimitives *)v4;

    runningBoardPrimitives = self->_runningBoardPrimitives;
  }
  return runningBoardPrimitives;
}

- (STUMobileKeyBagPrimitives)mobileKeyBagPrimitives
{
  STUMobileKeyBagPrimitives *mobileKeyBagPrimitives;
  _TtC8studentd33STUConcreteMobileKeyBagPrimitives *v4;
  STUMobileKeyBagPrimitives *v5;

  mobileKeyBagPrimitives = self->_mobileKeyBagPrimitives;
  if (!mobileKeyBagPrimitives)
  {
    v4 = objc_opt_new(_TtC8studentd33STUConcreteMobileKeyBagPrimitives);
    v5 = self->_mobileKeyBagPrimitives;
    self->_mobileKeyBagPrimitives = (STUMobileKeyBagPrimitives *)v4;

    mobileKeyBagPrimitives = self->_mobileKeyBagPrimitives;
  }
  return mobileKeyBagPrimitives;
}

- (STUFBSPrimitives)frontBoardServicesPrimitives
{
  STUFBSPrimitives *frontBoardServicesPrimitives;
  STUConcreteFBSPrimitives_iOS *v4;
  STUFBSPrimitives *v5;

  frontBoardServicesPrimitives = self->_frontBoardServicesPrimitives;
  if (!frontBoardServicesPrimitives)
  {
    v4 = objc_opt_new(STUConcreteFBSPrimitives_iOS);
    v5 = self->_frontBoardServicesPrimitives;
    self->_frontBoardServicesPrimitives = (STUFBSPrimitives *)v4;

    frontBoardServicesPrimitives = self->_frontBoardServicesPrimitives;
  }
  return frontBoardServicesPrimitives;
}

+ (id)makeScreenDimmingPrimitives
{
  return objc_opt_new(STUConcreteScreenDimmingPrimitives_iOS);
}

+ (id)makeDevicePrimitives
{
  return objc_opt_new(STUConcreteDevicePrimitives_iOS);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontBoardServicesPrimitives, 0);
  objc_storeStrong((id *)&self->_mobileKeyBagPrimitives, 0);
  objc_storeStrong((id *)&self->_runningBoardPrimitives, 0);
  objc_storeStrong((id *)&self->_systemStatusPrimitives, 0);
  objc_storeStrong((id *)&self->_accountsPrimitives, 0);
  objc_storeStrong((id *)&self->_devicePrimitives, 0);
  objc_storeStrong((id *)&self->_analyticsPrimitives, 0);
  objc_storeStrong((id *)&self->_userDefaultsPrimitives, 0);
  objc_storeStrong((id *)&self->_environmentPrimitives, 0);
  objc_storeStrong((id *)&self->_screenDimmingPrimitives, 0);
  objc_storeStrong((id *)&self->_sharediPadPrimitives, 0);
  objc_storeStrong((id *)&self->_XPCPrimitives, 0);
  objc_storeStrong((id *)&self->_globalNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_userNotificationPrimitives, 0);
  objc_storeStrong((id *)&self->_instructorClassKitFacade, 0);
  objc_storeStrong((id *)&self->_studentClassKitFacade, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
  objc_storeStrong((id *)&self->_osTransactionPrimitives, 0);
  objc_storeStrong((id *)&self->_processPrimitives, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_workspacePrimitives, 0);
  objc_storeStrong((id *)&self->_launchServicesPrimitives, 0);
  objc_storeStrong((id *)&self->_lockScreenPrimitives, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);
  objc_storeStrong((id *)&self->_airPlayPrimitives, 0);
}

@end
