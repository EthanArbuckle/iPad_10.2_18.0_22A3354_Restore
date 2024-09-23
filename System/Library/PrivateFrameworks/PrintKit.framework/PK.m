@implementation PK

void __33__PK_ipp_attribute_t_loggingDict__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __CFString *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "loggingValue:", objc_msgSend(*(id *)(a1 + 32), "value_tag"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("<nil for value tag>");
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

uint64_t __38__PK_ipp_attribute_t_enumerateValues___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33__PK_ipp_t_userCodableDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "loggingDict");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

uint64_t __32__PK_ipp_t_enumerateAttributes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__PK_ipp_t_replaceOrAddAttribute_withAttribute_settingGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __39__PK_ipp_t__addRange_name_lower_upper___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__PK_ipp_t__addRange_name_lower_upper___block_invoke_2;
  v3[3] = &__block_descriptor_40_e24_v16__0__PK_ipp_value_t_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "withNewEmptyValue:", v3);
}

uint64_t __39__PK_ipp_t__addRange_name_lower_upper___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setRange:", &v3);
}

void __35__PK_ipp_t__addRanges_name_values___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke_2;
  v6[3] = &unk_24E6CB138;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __35__PK_ipp_t__addRanges_name_values___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  _QWORD v9[4];
  int v10;
  int v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "rangeValue");
  v5 = v4 + 1;
  v7 = v4 + v6;
  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3321888768;
  v9[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke_3;
  v9[3] = &__block_descriptor_40_ea8_32c23_ZTS17ipp_value_range_t_e24_v16__0__PK_ipp_value_t_8l;
  v10 = v5;
  v11 = v7;
  objc_msgSend(v8, "withNewEmptyValue:", v9);

}

uint64_t __35__PK_ipp_t__addRanges_name_values___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setRange:", &v3);
}

uint64_t __35__PK_ipp_t__addBoolean_name_value___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__PK_ipp_t__addBoolean_name_value___block_invoke_2;
  v3[3] = &__block_descriptor_33_e24_v16__0__PK_ipp_value_t_8l;
  v4 = *(_BYTE *)(a1 + 32);
  return objc_msgSend(a2, "withNewEmptyValue:", v3);
}

uint64_t __35__PK_ipp_t__addBoolean_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBoolean:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke_2;
  v3[3] = &__block_descriptor_36_e24_v16__0__PK_ipp_value_t_8l;
  v4 = *(_DWORD *)(a1 + 32);
  return objc_msgSend(a2, "withNewEmptyValue:", v3);
}

uint64_t __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteger:", *(unsigned int *)(a1 + 32));
}

void __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
  void *v8;
  id v9;
  int v10;
  NSString *v11;
  NSString *v12;
  id v13;
  NSString *v14;
  id obj;
  _QWORD v16[4];
  id v17;
  NSString *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(NSString **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        if (v8)
          v9 = v8;
        v10 = *(_DWORD *)(a1 + 48);
        if (v10 == 72)
        {
          ipp_lang_code(v7);
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else if (v10 == 71)
        {
          -[NSString stringByReplacingOccurrencesOfString:withString:](v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v7;
        }
        v12 = v11;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3321888768;
        v16[2] = __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke_2;
        v16[3] = &__block_descriptor_48_ea8_32c24_ZTS18ipp_value_string_t_e24_v16__0__PK_ipp_value_t_8l;
        v13 = v8;
        v17 = v13;
        v14 = v12;
        v18 = v14;
        objc_msgSend(v3, "withNewEmptyValue:", v16);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

}

void __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "setString:", v3, v4);
  }
  else
  {

  }
}

void __38__PK_ipp_t__addCollection_name_value___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__PK_ipp_t__addCollection_name_value___block_invoke_2;
  v3[3] = &unk_24E6CB230;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "withNewEmptyValue:", v3);

}

uint64_t __38__PK_ipp_t__addCollection_name_value___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCollection:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke_2;
  v3[3] = &__block_descriptor_44_e24_v16__0__PK_ipp_value_t_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a2, "withNewEmptyValue:", v3);
}

uint64_t __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setResolution:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t __45__PK_ipp_t__addOctetString_name_data_length___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__PK_ipp_t__addOctetString_name_data_length___block_invoke_2;
  v3[3] = &__block_descriptor_44_e24_v16__0__PK_ipp_value_t_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a2, "withNewEmptyValue:", v3);
}

void __45__PK_ipp_t__addOctetString_name_data_length___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a1 + 32), *(int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnknown:", v3);

}

void __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  int v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    v4 = 0;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      v6[0] = v5;
      v6[1] = 3221225472;
      v6[2] = __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke_2;
      v6[3] = &unk_24E6CB298;
      v7 = *(id *)(a1 + 32);
      v8 = v4;
      objc_msgSend(v3, "withNewEmptyValue:", v6);

      ++v4;
    }
    while (*(_QWORD *)(a1 + 40) > v4);
  }

}

void __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setInteger:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))());

}

void __37__PK_ipp_t__findAttribute0_valueTag___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v6, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;

  if (*a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    if (*(_DWORD *)(a1 + 48))
    {
      v7 = objc_msgSend(v11, "value_tag");
      v8 = *(_DWORD *)(a1 + 48);
      if (v7 != v8 && (v7 != 53 || v8 != 65) && (v7 != 65 || v8 != 53))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = 0;

      }
    }
  }

}

void __39__PK_ipp_collection_t_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "loggingDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

@end
