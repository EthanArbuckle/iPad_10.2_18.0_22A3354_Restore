@implementation SAKCDataExclaveAddressSpace

- (_QWORD)initWithInfo:(uint64_t)a3 name:
{
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)SAKCDataExclaveAddressSpace;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

@end
