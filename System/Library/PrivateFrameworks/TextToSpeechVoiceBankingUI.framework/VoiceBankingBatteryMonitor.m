@implementation VoiceBankingBatteryMonitor

- (void)batteryStateChanged
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = objc_msgSend(v3, sel_currentDevice);
  v5 = objc_msgSend(v4, sel_batteryState);

  (*((void (**)(BOOL))self->super.isa + 12))(v5 != (id)1);
  swift_release();
}

@end
