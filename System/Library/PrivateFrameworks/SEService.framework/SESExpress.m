@implementation SESExpress

+ (id)processConfigurationChange:(id)a3 newConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCF20];
  if (v5)
  {
    +[SESExpress getUWBExpressKeyIdentifiers:appletIdentifiers:](SESExpress, "getUWBExpressKeyIdentifiers:appletIdentifiers:", v5, &unk_24C2CB600);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)objc_opt_new();
  }
  v10 = (void *)MEMORY[0x24BDBCF20];
  if (v6)
  {
    +[SESExpress getUWBExpressKeyIdentifiers:appletIdentifiers:](SESExpress, "getUWBExpressKeyIdentifiers:appletIdentifiers:", v6, &unk_24C2CB618);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)objc_opt_new();
  }
  if (objc_msgSend(v9, "isEqualToSet:", v12))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke;
    v16[3] = &unk_24C2BCDC8;
    v17 = v12;
    v18 = &v19;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
    if (*((_BYTE *)v20 + 24))
      v13 = &unk_24C2CB648;
    else
      v13 = (void *)MEMORY[0x24BDBD1A8];
    v14 = v13;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v14 = &unk_24C2CB630;
  }

  return v14;
}

void __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  objc_msgSend(v5, "appletIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("A000000909ACCE5501"));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke_2;
    v21[3] = &unk_24C2BCDA0;
    v9 = v5;
    v22 = v9;
    objc_msgSend(v8, "find:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("aliroGroupResolvingKeys"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v12 == 0) == (v14 != 0) || v12 && (objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
    else
    {
      objc_msgSend(v9, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ECP2Info"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ECP2Info"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("associatedReaderIdentifiers"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v17 == 0) == (v20 != 0) || v17 && (objc_msgSend(v17, "isEqual:", v20) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }

    }
  }

}

uint64_t __58__SESExpress_processConfigurationChange_newConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "appletIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appletIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (id)getUWBExpressKeyIdentifiers:(id)a3 appletIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SESExpress_getUWBExpressKeyIdentifiers_appletIdentifiers___block_invoke;
  v9[3] = &unk_24C2BCDF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "filterMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__SESExpress_getUWBExpressKeyIdentifiers_appletIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v18;
  const char *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appletIdentifier")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    SESDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = v3;
      _os_log_impl(&dword_20A048000, v8, OS_LOG_TYPE_ERROR, "Missing or invalid appletIdentifier %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_12;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
  {
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
      SESDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = v3;
        v19 = "Invalid keyIdentifier %@";
LABEL_18:
        _os_log_impl(&dword_20A048000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v20, 0xCu);
      }
LABEL_19:

      goto LABEL_12;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UWBExpressEnabled"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (v15)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SESExpressKey withKeyIdentifier:appletIdentifier:configuration:](SESExpressKey, "withKeyIdentifier:appletIdentifier:configuration:", v16, v8, v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
        goto LABEL_12;
      }
      SESDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = v3;
        v19 = "Invalid UWBExpressEnabled %@";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
LABEL_13:

  return v9;
}

@end
