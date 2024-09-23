@implementation SAKCDataExclaveTextLayoutSegment

- (_QWORD)initWithInfo:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)SAKCDataExclaveTextLayoutSegment;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[1] = a2;
  }
  return result;
}

@end
