@implementation CNPhoneNumber(PKAdditions)

- (id)pkFormattedStringValue
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(a1, "countryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97398], "defaultCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(a1, "formattedStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(a1, "formattedInternationalStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_5:
      objc_msgSend(a1, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

@end
