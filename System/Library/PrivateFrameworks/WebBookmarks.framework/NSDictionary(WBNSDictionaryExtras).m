@implementation NSDictionary(WBNSDictionaryExtras)

- (id)wb_stringForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wb_objectOfType:()WBNSDictionaryExtras forKey:isValid:
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  char isKindOfClass;
  void (*v10)(_QWORD, uint64_t);
  id v11;
  _QWORD v13[5];

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__NSDictionary_WBNSDictionaryExtras__wb_objectOfType_forKey_isValid___block_invoke;
  v13[3] = &__block_descriptor_40_e8_v12__0B8l;
  v13[4] = a5;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BD4C84](v13);
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7[2](v7, 1);
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v7[2];
  if ((isKindOfClass & 1) == 0)
  {
    v10(v7, 0);
    goto LABEL_6;
  }
  v10(v7, 1);
  v11 = v8;
LABEL_7:

  return v11;
}

- (uint64_t)wb_BOOLForKey:()WBNSDictionaryExtras
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "wb_numberForKey:isValid:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (uint64_t)wb_numberForKey:()WBNSDictionaryExtras
{
  return objc_msgSend(a1, "wb_numberForKey:isValid:", a3, 0);
}

- (id)wb_numberForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wb_dictionaryForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wb_arrayForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wb_dateForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wb_URLForKey:()WBNSDictionaryExtras isValid:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "wb_objectOfType:forKey:isValid:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
