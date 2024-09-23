@implementation APOdmlDatabaseConfiguration

- (BOOL)isDaemonProcess
{
  return self->_isDaemonProcess;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69D775C;
  block[3] = &unk_1E6A291E0;
  block[4] = a1;
  if (qword_1ED532F58 != -1)
    dispatch_once(&qword_1ED532F58, block);
  return (id)qword_1ED532F40;
}

- (APOdmlDatabaseConfiguration)init
{
  APOdmlDatabaseConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APOdmlDatabaseConfiguration;
  result = -[APOdmlDatabaseConfiguration init](&v3, sel_init);
  if (result)
    result->_isDaemonProcess = 0;
  return result;
}

- (void)setProcessToDaemon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69F3358;
  block[3] = &unk_1E6A29570;
  block[4] = self;
  if (qword_1ED532EA0 != -1)
    dispatch_once(&qword_1ED532EA0, block);
}

@end
