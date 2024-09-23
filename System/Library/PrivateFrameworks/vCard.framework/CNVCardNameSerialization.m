@implementation CNVCardNameSerialization

+ (id)compositeNameWithComponents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isCompany"))
    objc_msgSend(a1, "compositeNameForCompanyWithComponents:", v4);
  else
    objc_msgSend(a1, "compositeNameForPersonWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)compositeNameForPersonWithComponents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v3, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(v3, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v3, "firstName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  objc_msgSend(v3, "middleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v3, "middleName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  objc_msgSend(v3, "lastName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v3, "lastName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

  }
  objc_msgSend(v3, "suffix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v3, "suffix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)compositeNameForCompanyWithComponents:(id)a3
{
  return (id)objc_msgSend(a3, "companyName");
}

@end
