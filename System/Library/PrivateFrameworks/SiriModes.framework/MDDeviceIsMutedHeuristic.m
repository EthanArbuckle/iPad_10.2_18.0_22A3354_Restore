@implementation MDDeviceIsMutedHeuristic

- (MDDeviceIsMutedHeuristic)init
{
  dispatch_queue_t v3;
  void *v4;
  MDDeviceIsMutedHeuristic *v5;

  v3 = dispatch_queue_create("com.apple.siri.mode.MDDeviceIsMutedHeuristic", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09250]), "initWithName:options:queue:delegate:", CFSTR("com.apple.springboard.ringerstate"), 1, v3, 0);
  v5 = -[MDDeviceIsMutedHeuristic initWithRingerStateObserver:](self, "initWithRingerStateObserver:", v4);

  return v5;
}

- (MDDeviceIsMutedHeuristic)initWithRingerStateObserver:(id)a3
{
  id v5;
  MDDeviceIsMutedHeuristic *v6;
  MDModeDecision *v7;
  MDModeDecision *displayOnlyModeDecision;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDDeviceIsMutedHeuristic;
  v6 = -[MDDeviceIsMutedHeuristic init](&v10, sel_init);
  if (v6)
  {
    v7 = -[MDModeDecision initWithMode:]([MDModeDecision alloc], "initWithMode:", 2);
    displayOnlyModeDecision = v6->_displayOnlyModeDecision;
    v6->_displayOnlyModeDecision = v7;

    objc_storeStrong((id *)&v6->_ringerStateObserver, a3);
  }

  return v6;
}

- (id)determineCurrentMode
{
  MDModeDecision *v3;

  if (-[MDDeviceIsMutedHeuristic isDeviceSilentMode](self, "isDeviceSilentMode"))
    v3 = self->_displayOnlyModeDecision;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isDeviceSilentMode
{
  return -[AFNotifyObserver state](self->_ringerStateObserver, "state") == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayOnlyModeDecision, 0);
  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
}

@end
