@implementation UIFontPickerLoadRecentsMatchingConfigurationForSuite

void ___UIFontPickerLoadRecentsMatchingConfigurationForSuite_block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  __objc2_class **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  id obj;
  id obja;
  uint64_t (**v33)(id, void *);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v33 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1[4], "_clientRecentFonts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  v7 = off_1E167C000;
  if (!v6)
    goto LABEL_22;
  v8 = v6;
  v9 = *(_QWORD *)v39;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(obj);
      v11 = (void *)objc_msgSend(objc_alloc(v7[194]), "initWithFontDescriptor:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      objc_msgSend(v11, "familyName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v5[2](v5, v12) & 1) == 0)
      {

        goto LABEL_18;
      }
      objc_msgSend(v11, "fontName");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v11, "fontName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v33[2](v33, v15);

        v7 = off_1E167C000;
        if (!v16)
          goto LABEL_18;
      }
      else
      {

      }
      if (objc_msgSend(v11, "isFontFamilyAvailable")
        && objc_msgSend(v11, "matchesConfiguration:", a1[4]))
      {
        v17 = a1[5];
        if (objc_msgSend(a1[4], "includeFaces"))
        {
          objc_msgSend(v17, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v11, "familyInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

        }
      }
      if ((unint64_t)objc_msgSend(a1[5], "count") >= 7)
      {

        goto LABEL_22;
      }
LABEL_18:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v8)
      continue;
    break;
  }
LABEL_22:

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obja = a1[6];
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v19)
    goto LABEL_43;
  v20 = v19;
  v21 = *(_QWORD *)v35;
  while (2)
  {
    v22 = 0;
    while (2)
    {
      if (*(_QWORD *)v35 != v21)
        objc_enumerationMutation(obja);
      -[__objc2_class infoWithName:](v7[194], "infoWithName:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v22));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "familyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v5[2](v5, v24) & 1) == 0)
      {

        goto LABEL_39;
      }
      objc_msgSend(v23, "fontName");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)v25;
        objc_msgSend(v23, "fontName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v33[2](v33, v27);

        v7 = off_1E167C000;
        if (!v28)
          goto LABEL_39;
      }
      else
      {

      }
      if (objc_msgSend(v23, "isFontFamilyAvailable")
        && objc_msgSend(v23, "matchesConfiguration:", a1[4]))
      {
        v29 = a1[5];
        if (objc_msgSend(a1[4], "includeFaces"))
        {
          objc_msgSend(v29, "addObject:", v23);
        }
        else
        {
          objc_msgSend(v23, "familyInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v30);

        }
      }
      if ((unint64_t)objc_msgSend(a1[5], "count") >= 7)
      {

        goto LABEL_43;
      }
LABEL_39:

      if (v20 != ++v22)
        continue;
      break;
    }
    v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v20)
      continue;
    break;
  }
LABEL_43:

}

@end
