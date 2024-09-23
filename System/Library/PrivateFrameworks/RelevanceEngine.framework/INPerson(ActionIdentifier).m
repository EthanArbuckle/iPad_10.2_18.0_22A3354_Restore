@implementation INPerson(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "personHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "contactIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(a1, "contactIdentifier");
    else
      objc_msgSend(a1, "customIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v3;
  v6 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  return v6;
}

@end
