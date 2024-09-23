@implementation CNContact(TUSearchResultsAdditions)

- (uint64_t)displayName
{
  return objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a1, 0);
}

- (const)isoCountryCode
{
  return &stru_1E38A53C8;
}

- (id)handles
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "phoneNumberStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emailAddressStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)mostRecentCallType
{
  return 3;
}

- (uint64_t)mostRecentCallWasMissed
{
  return 0;
}

@end
