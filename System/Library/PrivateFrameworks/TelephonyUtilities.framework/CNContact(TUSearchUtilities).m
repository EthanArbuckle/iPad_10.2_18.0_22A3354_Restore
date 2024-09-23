@implementation CNContact(TUSearchUtilities)

+ (id)keysToFetchForFaceTime
{
  if (keysToFetchForFaceTime_onceToken != -1)
    dispatch_once(&keysToFetchForFaceTime_onceToken, &__block_literal_global_10);
  return (id)keysToFetchForFaceTime_keysToFetchForFaceTime;
}

- (id)anyDestinationID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "phoneNumberStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "emailAddressStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)faceTimeQuicklookURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("addressbook://%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)phoneNumberStrings
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "phoneNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByApplyingSelector:", sel_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_stringValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)phoneNumberLastFourDigitStrings
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "phoneNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByApplyingSelector:", sel_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_lastFourDigits);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)emailAddressStrings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "emailAddresses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByApplyingSelector:", sel_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
