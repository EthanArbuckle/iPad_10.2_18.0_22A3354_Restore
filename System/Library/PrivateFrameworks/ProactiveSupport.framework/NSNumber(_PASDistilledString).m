@implementation NSNumber(_PASDistilledString)

- (id)_pas_revivedString
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = objc_msgSend(a1, "compare:", &unk_1E443F7D0);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v2 == -1)
    v4 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%lld"), objc_msgSend(a1, "longLongValue"));
  else
    v4 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%llu"), objc_msgSend(a1, "unsignedLongLongValue"));
  return v4;
}

@end
