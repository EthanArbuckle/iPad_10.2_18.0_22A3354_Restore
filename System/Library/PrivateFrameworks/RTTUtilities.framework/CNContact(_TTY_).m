@implementation CNContact(_TTY_)

- (uint64_t)ttyIsMe
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ttyMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

+ (id)contactForPhoneNumber:()_TTY_
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBACC0];
  v4 = a3;
  objc_msgSend(v3, "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBA288];
  v17[0] = v5;
  v17[1] = v6;
  v7 = *MEMORY[0x24BDBA2E8];
  v17[2] = *MEMORY[0x24BDBA348];
  v17[3] = v7;
  v17[4] = *MEMORY[0x24BDBA3E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBACA0];
  objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "predicateForContactsMatchingPhoneNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
