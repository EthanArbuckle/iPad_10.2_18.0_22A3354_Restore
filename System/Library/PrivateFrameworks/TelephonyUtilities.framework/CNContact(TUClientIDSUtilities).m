@implementation CNContact(TUClientIDSUtilities)

- (id)allIDSDestinations
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "phoneNumberStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emailAddressStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "count");
  v5 = objc_msgSend(v3, "count") + v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v5);
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_IDSFormattedDestinationID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v3, "arrayByApplyingSelector:", sel_IDSFormattedDestinationID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
