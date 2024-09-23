@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000C90F8;
  if (!qword_1000C90F8)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileBluetooth.framework/"));
    v4 = (void *)qword_1000C90F8;
    qword_1000C90F8 = (uint64_t)v3;

    v2 = (void *)qword_1000C90F8;
  }
  return v2;
}

@end
