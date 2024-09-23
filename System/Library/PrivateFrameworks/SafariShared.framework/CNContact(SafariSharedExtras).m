@implementation CNContact(SafariSharedExtras)

- (uint64_t)safari_fullName
{
  return objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a1, 0);
}

+ (id)safari_defaultDescriptors
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[13];

  v10[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)safari_defaultDescriptors_descriptors;
  if (!safari_defaultDescriptors_descriptors)
  {
    v1 = *MEMORY[0x1E0C96670];
    v10[0] = *MEMORY[0x1E0C967F0];
    v10[1] = v1;
    v2 = *MEMORY[0x1E0C966D0];
    v10[2] = *MEMORY[0x1E0C966A8];
    v10[3] = v2;
    v3 = *MEMORY[0x1E0C96780];
    v10[4] = *MEMORY[0x1E0C966C0];
    v10[5] = v3;
    v4 = *MEMORY[0x1E0C96758];
    v10[6] = *MEMORY[0x1E0C967C0];
    v10[7] = v4;
    v5 = *MEMORY[0x1E0C968A0];
    v10[8] = *MEMORY[0x1E0C967B8];
    v10[9] = v5;
    v10[10] = *MEMORY[0x1E0C96740];
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[11] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)safari_defaultDescriptors_descriptors;
    safari_defaultDescriptors_descriptors = v7;

    v0 = (void *)safari_defaultDescriptors_descriptors;
  }
  return v0;
}

+ (id)safari_imageViewDescriptors
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)safari_imageViewDescriptors_descriptors;
  if (!safari_imageViewDescriptors_descriptors)
  {
    v1 = *MEMORY[0x1E0C966C0];
    v6[0] = *MEMORY[0x1E0C966D0];
    v6[1] = v1;
    v2 = *MEMORY[0x1E0C96708];
    v6[2] = *MEMORY[0x1E0C96780];
    v6[3] = v2;
    v6[4] = *MEMORY[0x1E0C96890];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)safari_imageViewDescriptors_descriptors;
    safari_imageViewDescriptors_descriptors = v3;

    v0 = (void *)safari_imageViewDescriptors_descriptors;
  }
  return v0;
}

+ (id)safari_oneTimeCodeViewDescriptors
{
  if (safari_oneTimeCodeViewDescriptors_onceToken != -1)
    dispatch_once(&safari_oneTimeCodeViewDescriptors_onceToken, &__block_literal_global_21);
  return (id)safari_oneTimeCodeViewDescriptors_descriptors;
}

- (id)safari_valueForWBSABProperty:()SafariSharedExtras
{
  void *v2;
  void *v3;

  +[WBSContactsHelper CNContactKeyFromWBSABKey:](WBSContactsHelper, "CNContactKeyFromWBSABKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length") && objc_msgSend(a1, "isKeyAvailable:", v2))
  {
    objc_msgSend(a1, "valueForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
