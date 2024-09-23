@implementation AVAsset

uint64_t __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(a2, "tvp_languageCodeFromLocale");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tvp_languageCodeFromLocale");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend((id)v6, "isEqual:", *(_QWORD *)(a1 + 32));
  v9 = objc_msgSend((id)v7, "isEqual:", *(_QWORD *)(a1 + 32));
  if (!(v6 | v7))
    goto LABEL_2;
  if (!v6 && v7)
  {
LABEL_5:
    v10 = 1;
    goto LABEL_14;
  }
  if (v6 && !v7)
  {
LABEL_13:
    v10 = -1;
    goto LABEL_14;
  }
  v11 = v9 ^ 1;
  if (((v8 ^ 1) & 1) != 0 || v11)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v8 | v11) == 1)
      {
        v12 = *MEMORY[0x24BDBCB20];
        objc_msgSend(*(id *)(a1 + 40), "displayNameForKey:value:", *MEMORY[0x24BDBCB20], v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "displayNameForKey:value:", v12, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "localizedCaseInsensitiveCompare:", v14);

        goto LABEL_14;
      }
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_2:
  v10 = 0;
LABEL_14:

  return v10;
}

void __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = objc_msgSend(v15, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CC8]);
  v6 = 40;
  if (v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v15);
  if (*(_QWORD *)(a1 + 72) - 1 <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "tvp_languageCodeFromLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tvp_languageCodeFromLocale");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    if (v9)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_8:
      if (!v7)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_13:
    v11 = *(void **)(a1 + 56);
    objc_msgSend((id)objc_opt_class(), "tvp_filteredAndSubsortedMainProgramSubtitleOptionsFromOptions:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    v13 = *(void **)(a1 + 56);
    objc_msgSend((id)objc_opt_class(), "tvp_sortedAuxSubtitleOptionsFromOptions:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    goto LABEL_14;
  }
LABEL_12:
  if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) == 0)
    goto LABEL_13;
LABEL_14:

}

uint64_t __85__AVAsset_ATVAudioSubtitleAdditionsPrivate__tvp_sortedAuxSubtitleOptionsFromOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "tvp_localizedDisplayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tvp_localizedDisplayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

@end
