@implementation CIImage(UIKitAdditions)

- (uint64_t)initWithImage:()UIKitAdditions
{
  uint64_t v4;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  if (v4)
    return objc_msgSend(a1, "initWithCGImage:", v4);

  return 0;
}

- (uint64_t)initWithImage:()UIKitAdditions options:
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  if (v7)
  {
    v8 = objc_msgSend(a1, "initWithCGImage:options:", v7, v6);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

@end
