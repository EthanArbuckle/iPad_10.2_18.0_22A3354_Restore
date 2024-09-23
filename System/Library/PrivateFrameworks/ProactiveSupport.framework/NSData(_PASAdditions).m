@implementation NSData(_PASAdditions)

- (id)_pas_dataWithNonnullBytes
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  if (!objc_msgSend(v1, "bytes") && !objc_msgSend(v1, "length"))
    v1 = &unk_1EE5A9FD0;
  return v1;
}

@end
