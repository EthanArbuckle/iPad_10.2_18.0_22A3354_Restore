@implementation CAPresentationModifier

- (BOOL)supportsNewValue:(_BOOL8)a1
{
  _BOOL8 v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend((id)v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "CA_numericValueCount");
    v6 = objc_msgSend(v3, "CA_numericValueCount");

    v2 = v5 == v6;
  }
  return v2;
}

@end
