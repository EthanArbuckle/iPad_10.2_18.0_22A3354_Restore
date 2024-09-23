uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2)
{
  SignpostFormattedString(a1, a2, CFSTR("signpost.description"));
  return objc_claimAutoreleasedReturnValue();
}

id SignpostFormattedString(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a1 && v5 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "stringValue");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", &stru_24DDE40F0, &stru_24DDE4110);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@%s%@%@%@"), CFSTR("__##__"), v7, CFSTR("#____#"), a1, CFSTR("#_##_#"), v9, CFSTR("##__##"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v11);

      goto LABEL_11;
    }
LABEL_10:
    v8 = 0;
  }
LABEL_11:

  return v8;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

