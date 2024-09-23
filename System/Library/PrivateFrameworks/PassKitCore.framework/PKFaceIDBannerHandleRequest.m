@implementation PKFaceIDBannerHandleRequest

+ (id)create
{
  id result;
  objc_super v3;

  result = [PKFaceIDBannerHandleRequest alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKBannerHandleRequest;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      *((_QWORD *)result + 1) = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
