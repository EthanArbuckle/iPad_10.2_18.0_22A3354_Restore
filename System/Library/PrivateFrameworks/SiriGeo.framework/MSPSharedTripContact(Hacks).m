@implementation MSPSharedTripContact(Hacks)

- (id)in_labeledValue
{
  void *v2;

  if (objc_msgSend(a1, "isPhoneNumber"))
  {
    objc_msgSend(a1, "labeledValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
