@implementation BrightnessSystemClient

- (id)monitorDisplayOnStateForReason:(id)a3 handler:(id)a4
{
  id v4;
  _QWORD v6[7];
  _QWORD v7[3];
  char v8;
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028FAC;
  v6[3] = &unk_10007DCA0;
  v6[5] = v7;
  v6[6] = v9;
  v6[4] = a4;
  v4 = -[BrightnessSystemClient monitorKeys:forReason:handler:](self, "monitorKeys:forReason:handler:", &off_100085840, a3, v6);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v9, 8);
  return v4;
}

- (id)monitorKeys:(id)a3 forReason:(id)a4 handler:(id)a5
{
  _QWORD v9[6];

  -[BrightnessSystemClient registerNotificationBlock:forProperties:](self, "registerNotificationBlock:forProperties:", a5, a3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000290DC;
  v9[3] = &unk_10007DCC8;
  v9[4] = self;
  v9[5] = a3;
  return -[TMSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]([TMSimpleAssertion alloc], "initWithIdentifier:forReason:invalidationBlock:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BrightnessSystemClient keys (%@)"), objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|"))), a4, v9);
}

@end
