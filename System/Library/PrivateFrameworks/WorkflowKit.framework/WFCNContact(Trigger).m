@implementation WFCNContact(Trigger)

- (id)triggerDisplayName
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "nickname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    objc_msgSend(a1, "nickname");
  else
    objc_msgSend(a1, "formattedName");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
