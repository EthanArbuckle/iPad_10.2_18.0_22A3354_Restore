@implementation CNPostalAddress(RTContact)

+ (id)_rt_labelStringWithAddressLabelType:()RTContact
{
  if (a3 > 3)
    return 0;
  else
    return **((id **)&unk_1E92A2010 + a3);
}

- (id)_rt_toString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "postalCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("street, %@, city, %@, state, %@, postalCode, %@, country, %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
