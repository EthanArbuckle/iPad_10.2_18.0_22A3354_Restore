@implementation PASArgSubcommand

uint64_t __73___PASArgSubcommand_simpleSubcommandWithHelpGenerator_name_help_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("help"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "subcommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "naiveUsageHelpWithPositionalArgString:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = objc_retainAutorelease(v7);
    printf("%s", (const char *)objc_msgSend(v10, "UTF8String"));

    v8 = 0;
  }
  else
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v8;
}

@end
