@implementation WBSFormAutoFillTestSupport

+ (id)stringRepresentationFromMetadataProvider:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "formCount");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__WBSFormAutoFillTestSupport_stringRepresentationFromMetadataProvider___block_invoke;
    v10[3] = &unk_1E4B396B0;
    v11 = v5;
    v6 = v5;
    objc_msgSend(v3, "enumerateFormsUsingBlock:", v10);
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("\n"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("No forms exist on this page.\n");
  }

  return v8;
}

void __71__WBSFormAutoFillTestSupport_stringRepresentationFromMetadataProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id *, void *, void *);
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sanitizedMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_arrayForKey:", CFSTR("FormControls"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_46);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("FormControls"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("FormID"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("RequestType"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("TextSample"));
  v23[0] = CFSTR("UsernameElementUniqueID");
  v23[1] = CFSTR("PasswordElementUniqueID");
  v24[0] = CFSTR("UsernameElement");
  v24[1] = CFSTR("PasswordElement");
  v23[2] = CFSTR("OldPasswordElementUniqueID");
  v23[3] = CFSTR("ConfirmPasswordElementUniqueID");
  v24[2] = CFSTR("OldPasswordElement");
  v24[3] = CFSTR("ConfirmPasswordElement");
  v23[4] = CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID");
  v24[4] = CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberField");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "copy");
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __sanitizedFormMetadata_block_invoke_2;
  v19 = &unk_1E4B39718;
  v20 = v8;
  v10 = v5;
  v21 = v10;
  v22 = v6;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v16);
  v13 = v22;
  v14 = v10;

  objc_msgSend(v14, "description", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

}

@end
