@implementation DIPBluetoothManager

+ (BOOL)isAvailable
{
  void *v2;
  unsigned __int8 v3;

  +[DIPBluetoothManager configureManager](DIPBluetoothManager, "configureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "available");

  return v3;
}

+ (int64_t)powerState
{
  void *v2;
  int64_t v3;

  +[DIPBluetoothManager configureManager](DIPBluetoothManager, "configureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "powerState");

  return v3;
}

+ (void)configureManager
{
  if (qword_100644A10[0] != -1)
    dispatch_once(qword_100644A10, &stru_1005FFB80);
}

@end
