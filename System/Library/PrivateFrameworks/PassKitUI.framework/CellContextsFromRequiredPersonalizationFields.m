@implementation CellContextsFromRequiredPersonalizationFields

id ___CellContextsFromRequiredPersonalizationFields_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v2, 2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  v14 = v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "pk_arrayByRemovingObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "setGivenName:", v11);
  objc_msgSend(v14, "setFamilyName:", v13);
  objc_msgSend(v4, "setName:", v14);

}

id ___CellContextsFromRequiredPersonalizationFields_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "postalAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postalCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "postalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C970B0]);
  objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostalAddress:", v9);

}

uint64_t ___CellContextsFromRequiredPersonalizationFields_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "emailAddress");
}

uint64_t ___CellContextsFromRequiredPersonalizationFields_block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setEmailAddress:", a2);
}

id ___CellContextsFromRequiredPersonalizationFields_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "phoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C97398];
  v5 = a3;
  objc_msgSend(v4, "phoneNumberWithStringValue:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhoneNumber:", v6);

}

@end
