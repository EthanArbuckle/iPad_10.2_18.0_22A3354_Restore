@implementation WBSFormFieldFingerprinter

+ (id)fingerprintForControlMetadata:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_fingerprintComponentsForControlMetadata:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_fingerprintComponentsForControlMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "fieldName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E4B40D18;
  objc_msgSend(a1, "_hashForString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fieldID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E4B40D18;
  objc_msgSend(a1, "_hashForString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fieldClass");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E4B40D18;
  objc_msgSend(a1, "_hashForString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectElementInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("1");
  if (!v17)
    v18 = CFSTR("0");
  v19 = v18;

  v22[0] = v8;
  v22[1] = v12;
  v22[2] = v16;
  v22[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_hashForString:(id)a3
{
  objc_msgSend(a3, "safari_md5Hash");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
