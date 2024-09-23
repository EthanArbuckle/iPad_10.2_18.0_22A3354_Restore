@implementation WPStorageAccessPromptQuirk

- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainPairings:(id)a4
{

  return 0;
}

- (WPStorageAccessPromptQuirk)initWithName:(id)a3 withDomainData:(id)a4
{
  id v7;
  id v8;
  WPStorageAccessPromptQuirk *v9;
  void *v10;
  int v11;
  WPStorageAccessPromptQuirk *v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)WPStorageAccessPromptQuirk;
  v9 = -[WPStorageAccessPromptQuirk init](&v39, sel_init);
  if (v9)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    v25 = __Block_byref_object_dispose__0;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    v20 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke;
    v14[3] = &unk_251BCF150;
    v14[4] = &v35;
    v14[5] = &v31;
    v14[6] = &v21;
    v14[7] = &v27;
    v14[8] = &v15;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);
    if (!*((_BYTE *)v28 + 24))
    {
      v10 = (void *)v16[5];
      v16[5] = (uint64_t)&unk_251BD0B38;

    }
    if (*((_BYTE *)v36 + 24))
    {
      v9->_isValid = 0;
    }
    else
    {
      v11 = *((unsigned __int8 *)v32 + 24);
      v9->_isValid = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v9->_name, a3);
        objc_storeStrong((id *)&v9->_quirkDomains, (id)v22[5]);
        objc_storeStrong((id *)&v9->_triggerPages, (id)v16[5]);
      }
    }
    v12 = v9;
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
  }

  return v9;
}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("quirkDomains")))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
      v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_2;
      v12[3] = &unk_251BCF128;
      v12[4] = a1[4];
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
      goto LABEL_8;
    }
LABEL_10:
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    goto LABEL_11;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("triggerPages")))
    goto LABEL_11;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
  v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_4;
  v11[3] = &unk_251BCF100;
  v11[4] = a1[4];
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);
LABEL_8:
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    *a4 = 1;
LABEL_11:

}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];

  v8 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_3;
  v10[3] = &unk_251BCF100;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10, v8);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;

}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

void __58__WPStorageAccessPromptQuirk_initWithName_withDomainData___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (id)describeQuirkDomains
{
  NSDictionary *quirkDomains;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  quirkDomains = self->_quirkDomains;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WPStorageAccessPromptQuirk_describeQuirkDomains__block_invoke;
  v6[3] = &unk_251BCF128;
  v6[4] = &v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](quirkDomains, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend((id)v8[5], "componentsJoinedByString:", CFSTR("; "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__WPStorageAccessPromptQuirk_describeQuirkDomains__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@]"), v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

}

- (id)description
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;

  if (-[NSString length](self->_name, "length"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    name = self->_name;
    -[WPStorageAccessPromptQuirk describeQuirkDomains](self, "describeQuirkDomains");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray componentsJoinedByString:](self->_triggerPages, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ - [%@]"), name, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WPStorageAccessPromptQuirk describeQuirkDomains](self, "describeQuirkDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)domainPairings
{
  return self->_domainPairings;
}

- (NSDictionary)quirkDomains
{
  return self->_quirkDomains;
}

- (NSArray)triggerPages
{
  return self->_triggerPages;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPairings, 0);
  objc_storeStrong((id *)&self->_triggerPages, 0);
  objc_storeStrong((id *)&self->_quirkDomains, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
