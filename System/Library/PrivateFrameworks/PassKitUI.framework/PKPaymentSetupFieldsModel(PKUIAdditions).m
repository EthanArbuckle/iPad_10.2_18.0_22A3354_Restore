@implementation PKPaymentSetupFieldsModel(PKUIAdditions)

- (double)minimumRequiredWidthForFieldIdentifiers:()PKUIAdditions withFont:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = PKUIGetMinScreenWidthType();
  v26 = *MEMORY[0x1E0DC1138];
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "paymentSetupFieldWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isFieldTypeLabel") & 1) == 0)
        {
          if (v8)
            objc_msgSend(v16, "localizedDisplayName");
          else
            objc_msgSend(v16, "compactLocalizedDisplayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sizeWithAttributes:", v9);
          v19 = v18;

          if (v19 > v14)
            v14 = v19;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

@end
