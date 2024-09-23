@implementation SKHandle(StatusKitAgent)

- (id)idsDestination
{
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "handleString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "ska_appearsToBeEmail"))
  {
    v2 = MEMORY[0x219A1D0D8](v1);
  }
  else if (MEMORY[0x219A1D120](v1))
  {
    v2 = IDSCopyIDForPseudonymID();
  }
  else
  {
    v2 = IDSCopyIDForPhoneNumber();
  }
  v3 = (void *)v2;

  return v3;
}

- (id)normalizedHandleString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BE4FE70]);
  objc_msgSend(a1, "handleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUnprefixedURI:", v3);

  objc_msgSend(v4, "unprefixedURI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)isNormalizedEqualToHandle:()StatusKitAgent
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == a1)
    return 1;
  v4 = a3;
  objc_msgSend(a1, "normalizedHandleString");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedHandleString");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
    v7 = objc_msgSend((id)v5, "isEqualToString:", v6);
  else
    v7 = 1;

  return v7;
}

@end
