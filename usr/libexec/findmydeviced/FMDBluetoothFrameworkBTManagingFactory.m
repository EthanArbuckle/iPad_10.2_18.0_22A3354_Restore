@implementation FMDBluetoothFrameworkBTManagingFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_1003068E0 != -1)
    dispatch_once(&qword_1003068E0, &stru_1002C4D00);
  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = byte_1003068D8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAutomationBluetoothManager: isAutomationActive: %d", (uint8_t *)v5, 8u);
  }

  return byte_1003068D8;
}

+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;

  v5 = a3;
  v6 = a4;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive](FMDBluetoothFrameworkBTManagingFactory, "isAutomationActive"))
  {
    if (qword_1003068F8 != -1)
      dispatch_once(&qword_1003068F8, &stru_1002C4D20);
    objc_msgSend((id)qword_1003068F0, "setBluetoothManager:", v6);
    v7 = (id)qword_1003068F0;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AFD58;
    block[3] = &unk_1002C1328;
    v10 = v5;
    if (qword_1003068E8 != -1)
      dispatch_once(&qword_1003068E8, block);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));

  }
  return v7;
}

@end
