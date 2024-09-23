@implementation NSArray

uint64_t __55__NSArray_PKArrayAdditions__pk_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__NSArray_PKArrayAdditions__pk_createArrayByRemovingObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__NSArray_PKArrayAdditions__pk_countObjectsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __58__NSArray_PKArrayAdditions__pk_containsObjectPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

void __68__NSArray_PKError__pk_FilteredBillingErrorsForContactFields_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PKPaymentErrorDomain")))
  {
LABEL_15:

    goto LABEL_16;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 == 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = a1;
    v4 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v3, "userInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v10))
          {

LABEL_14:
            objc_msgSend(*(id *)(v16 + 40), "addObject:", v3);
            goto LABEL_15;
          }
          objc_msgSend(v3, "userInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("PKPaymentErrorPostalAddress"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v10);

          if (v15)
            goto LABEL_14;
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    goto LABEL_15;
  }
LABEL_16:

}

void __90__NSArray_PKError__pk_FilteredShippingErrorsForContactFields_errors_contactFieldOptional___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PKDisbursementErrorDomain"));

    if (!v13 || objc_msgSend(v3, "code") != 2)
      goto LABEL_41;
    objc_msgSend(v3, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("PKDisbursementErrorContactField"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48) && !v7)
      goto LABEL_28;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
LABEL_19:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19), (_QWORD)v25))goto LABEL_38;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v17)
            goto LABEL_19;
          break;
        }
      }
    }
LABEL_39:

    goto LABEL_40;
  }
  v6 = objc_msgSend(v3, "code");
  if (v6 == 1)
  {
    objc_msgSend(v3, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48) && !v7)
      goto LABEL_28;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = *(id *)(a1 + 32);
    v21 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
LABEL_31:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v15);
        if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24)))
          break;
        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v22)
            goto LABEL_31;
          goto LABEL_39;
        }
      }
LABEL_38:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (v6 == 3)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (!v8)
    {
LABEL_40:

      goto LABEL_41;
    }
    v9 = v8;
    v10 = *(_QWORD *)v34;
LABEL_6:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v7);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v11), "isEqualToString:", CFSTR("post")))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v9)
          goto LABEL_6;
        goto LABEL_40;
      }
    }
LABEL_28:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    goto LABEL_40;
  }
LABEL_41:

}

void __42__NSArray_PKError__pk_FilteredCardErrors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PKPaymentErrorDomain"));

  if (v4 && objc_msgSend(v5, "code") == -1001)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

id __57__NSArray_PKEnhancedMerchantAdditions__deepCopyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

id __73__NSArray_PKEnhancedMerchantAdditions__nonZeroUnsignedLongLongArrayValue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "nonZeroUnsignedLongLongNSNumberValue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
      if (objc_msgSend(v4, "unsignedLongLongValue"))
        v5 = v4;
      else
        v5 = 0;
      v3 = v5;

    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

id __56__NSArray_PKEnhancedMerchantAdditions__stringArrayValue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
