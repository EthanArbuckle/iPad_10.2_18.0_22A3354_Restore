@implementation BYSourceDeviceMigration

- (void)startDeviceTransferTask
{
  id v2;

  -[BYSourceDeviceMigration sourceDeviceTransferTask](self, "sourceDeviceTransferTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)cancelDeviceTransferTask
{
  id v2;

  -[BYSourceDeviceMigration sourceDeviceTransferTask](self, "sourceDeviceTransferTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

+ (id)createDeviceTransferTask:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D4E0C0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFileTransferSession:", v4);

  return v5;
}

- (BOOL)requiresProcessAssertion
{
  return 0;
}

@end
