@implementation UIEnumerateApplicationsInPreferredOrderForOpeningDocument

void ___UIEnumerateApplicationsInPreferredOrderForOpeningDocument_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v3, "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      v7 = objc_msgSend(v3, "supportsOpenInPlace");

      if ((v7 & 1) == 0)
        goto LABEL_13;
    }
    else
    {

    }
    objc_msgSend(v3, "sdkVersion");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("1.0");
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend(*(id *)(a1 + 48), "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v12, "getResourceValue:forKey:error:", &v16, *MEMORY[0x1E0C99C00], 0);
    v13 = v16;

    if (!v13
      || (objc_msgSend(v13, "BOOLValue") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isVersion:greaterThanOrEqualToVersion:", v11, CFSTR("13.0")),
          v14,
          v15))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
LABEL_13:

}

@end
