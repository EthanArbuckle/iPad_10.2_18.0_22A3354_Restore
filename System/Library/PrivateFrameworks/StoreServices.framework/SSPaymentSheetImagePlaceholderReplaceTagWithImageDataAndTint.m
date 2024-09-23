@implementation SSPaymentSheetImagePlaceholderReplaceTagWithImageDataAndTint

void __SSPaymentSheetImagePlaceholderReplaceTagWithImageDataAndTint_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  NSObject *v45;
  int v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), a2, *(_QWORD *)(a1 + 32), CFSTR("%%"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mutableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", v3);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v5;
    v9 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
    v10 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v8, v6, CFSTR(" "));
      if (*(_QWORD *)(a1 + 48))
        break;
LABEL_44:
      objc_msgSend(*(id *)(a1 + 40), "mutableString", v55);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "rangeOfString:", v3);
      v4 = v7;
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_45;
    }
    if (!v9[117])
    {
      v11 = (void *)SSVPassKitFramework();
      SSVWeakLinkedStringConstantForString("PKPaymentContentItemImageAttachment", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v9[117];
      v9[117] = v12;

    }
    if (!SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageAndScaleAttachment)
    {
      v14 = (void *)SSVPassKitFramework();
      SSVWeakLinkedStringConstantForString("PKPaymentContentItemImageAndScaleAttachment", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageAndScaleAttachment;
      SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageAndScaleAttachment = v15;

    }
    if (!v10[119])
    {
      v17 = (void *)SSVPassKitFramework();
      SSVWeakLinkedStringConstantForString("PKPaymentContentItemImageKey", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v10[119];
      v10[119] = v18;

    }
    if (!SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemScaleKey)
    {
      v20 = (void *)SSVPassKitFramework();
      SSVWeakLinkedStringConstantForString("PKPaymentContentItemScaleKey", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemScaleKey;
      SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemScaleKey = v21;

    }
    if (!SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemTintMatchingTextKey)
    {
      v23 = (void *)SSVPassKitFramework();
      SSVWeakLinkedStringConstantForString("PKPaymentContentItemTintMatchingTextKey", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemTintMatchingTextKey;
      SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemTintMatchingTextKey = v24;

    }
    if (!SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageAndScaleAttachment
      || !v10[119]
      || !SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemScaleKey
      || *(float *)(a1 + 56) <= 0.0)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v42)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v43 = objc_msgSend(v42, "shouldLog");
      if (objc_msgSend(v42, "shouldLogToDisk"))
        v44 = v43 | 2;
      else
        v44 = v43;
      objc_msgSend(v42, "OSLogObject");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        v46 = v44;
      else
        v46 = v44 & 2;
      if (v46)
      {
        v47 = *(_QWORD *)(a1 + 32);
        v57 = 138543362;
        v58 = v47;
        LODWORD(v56) = 12;
        v55 = &v57;
        v48 = (void *)_os_log_send_and_compose_impl();

        v9 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
        if (v48)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v48, 4, &v57, v56);
          v45 = objc_claimAutoreleasedReturnValue();
          free(v48);
          SSFileLog(v42, CFSTR("%@"), v49, v50, v51, v52, v53, v54, (uint64_t)v45);
          goto LABEL_42;
        }
      }
      else
      {
        v9 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
LABEL_42:

      }
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v9[117], *(_QWORD *)(a1 + 48), v8, 1);
      v10 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
      goto LABEL_44;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = objc_msgSend(v26, "shouldLog");
    if (objc_msgSend(v26, "shouldLogToDisk"))
      v27 |= 2u;
    objc_msgSend(v26, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      v27 &= 2u;
    if (v27)
    {
      v30 = *(_QWORD *)(a1 + 32);
      LODWORD(v29) = *(_DWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 138543618;
      v58 = v30;
      v9 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
      v59 = 2114;
      v60 = v31;
      LODWORD(v56) = 22;
      v55 = &v57;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32)
      {
LABEL_29:

        v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = &storePrivacyIdentifiers_ss_once_object___COUNTER__;
        objc_msgSend(v39, "setObject:forKey:", *(_QWORD *)(a1 + 48), SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageKey);
        LODWORD(v40) = *(_DWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKey:", v41, SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemScaleKey);

        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", SSPaymentSheetAppleIDUppercaseReplacementPattern_block_invoke_kPKPaymentContentItemImageAndScaleAttachment, v39, v8, 1);
        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v32, 4, &v57, v56);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v32);
      SSFileLog(v26, CFSTR("%@"), v33, v34, v35, v36, v37, v38, (uint64_t)v28);
    }

    goto LABEL_29;
  }
  v7 = v4;
LABEL_45:

}

@end
