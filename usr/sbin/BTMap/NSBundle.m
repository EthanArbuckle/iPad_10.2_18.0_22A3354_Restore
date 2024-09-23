@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_10000D080;
  if (!qword_10000D080)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileBluetooth.framework/"));
    v4 = (void *)qword_10000D080;
    qword_10000D080 = (uint64_t)v3;

    v2 = (void *)qword_10000D080;
  }
  return v2;
}

@end
