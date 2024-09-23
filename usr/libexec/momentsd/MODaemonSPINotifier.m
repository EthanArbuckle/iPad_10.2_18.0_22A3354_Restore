@implementation MODaemonSPINotifier

- (MODaemonSPINotifier)initWithName:(id)a3
{
  MODaemonSPINotifier *v3;
  MODaemonSPINotifier *v4;
  MODaemonSPINotifier *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MODaemonSPINotifier;
  v3 = -[MONotifier initWithName:](&v7, "initWithName:", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)sendNotification:(int)a3 withPayload:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[MONotifier isEnabled](self, "isEnabled"))
    -[MONotifier notify:withPayload:](self, "notify:withPayload:", v4, v6);

}

@end
