@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_10001F1B8;
  if (!qword_10001F1B8)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileBluetooth.framework/"));
    v4 = (void *)qword_10001F1B8;
    qword_10001F1B8 = (uint64_t)v3;

    v2 = (void *)qword_10001F1B8;
  }
  return v2;
}

@end
