@implementation TKVibrationInterfaceUtilities

+ (void)configureVibrationNameTextField:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  TLLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setAutocapitalizationType:", 2);
  objc_msgSend(v4, "setReturnKeyType:", 9);
  objc_msgSend(v4, "setEnablesReturnKeyAutomatically:", 1);

}

+ (BOOL)vibrationNameTextField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (!v13)
      goto LABEL_6;
  }
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (!v17)
  {
    objc_msgSend(v8, "setText:", &stru_24D3804C8);
    objc_msgSend(v8, "sendActionsForControlEvents:", 0x20000);
LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  v18 = 1;
LABEL_7:

  return v18;
}

+ (id)descriptionForDuration:(double)a3
{
  float v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * llround(a3 * 10.0) + 0x1999999999999998, 1) < 0x1999999999999999uLL)
  {
    v8 = llround(a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%ld"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9;
    if (v8 == 1)
      v5 = CFSTR("SECONDS_SINGULAR_FORMAT");
    else
      v5 = CFSTR("SECONDS_PLURAL_FORMAT");
    if (v9)
      goto LABEL_3;
LABEL_9:
    v10 = 0;
    goto LABEL_12;
  }
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("SECONDS_PLURAL_FORMAT");
  if (!v4)
    goto LABEL_9;
LABEL_3:
  TLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;

LABEL_12:
  return v10;
}

@end
