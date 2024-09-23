@implementation CLPlacemark(PPSpecificityComparison)

- (uint64_t)pp_specificityCompare:()PPSpecificityComparison
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[16];
  _BYTE v75[128];
  _BYTE v76[128];
  _QWORD v77[6];
  _QWORD v78[8];

  v78[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "name");
      v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E7E221D0;
    }
    v62 = (__CFString *)v6;
    v78[0] = v6;
    objc_msgSend(a1, "subThoroughfare");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(a1, "subThoroughfare");
      v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_1E7E221D0;
    }
    v60 = (__CFString *)v9;
    v78[1] = v9;
    objc_msgSend(a1, "thoroughfare");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(a1, "thoroughfare");
      v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = &stru_1E7E221D0;
    }
    v58 = (__CFString *)v11;
    v78[2] = v11;
    objc_msgSend(a1, "subLocality");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(a1, "subLocality");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E7E221D0;
    }
    v78[3] = v13;
    objc_msgSend(a1, "locality");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(a1, "locality");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = &stru_1E7E221D0;
    }
    v78[4] = v15;
    objc_msgSend(a1, "administrativeArea");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(a1, "administrativeArea");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E7E221D0;
    }
    v78[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)

    if (v14)
    if (v12)

    if (v10)
    if (v8)

    if (v5)
    objc_msgSend(v4, "name");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v4, "name");
      v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1E7E221D0;
    }
    v61 = (__CFString *)v19;
    v77[0] = v19;
    objc_msgSend(v4, "subThoroughfare");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v4, "subThoroughfare");
      v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = &stru_1E7E221D0;
    }
    v59 = (__CFString *)v21;
    v77[1] = v21;
    objc_msgSend(v4, "thoroughfare");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v4, "thoroughfare");
      v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = &stru_1E7E221D0;
    }
    v63 = (void *)v18;
    v57 = (__CFString *)v23;
    v77[2] = v23;
    objc_msgSend(v4, "subLocality");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v4, "subLocality");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = &stru_1E7E221D0;
    }
    v77[3] = v25;
    objc_msgSend(v4, "locality");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v4, "locality");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = &stru_1E7E221D0;
    }
    v77[4] = v27;
    objc_msgSend(v4, "administrativeArea");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v4, "administrativeArea");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = &stru_1E7E221D0;
    }
    v77[5] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)

    if (v26)
    if (v24)

    if (v22)
    v31 = v30;
    if (v20)

    if (v63)
    v32 = objc_msgSend(v64, "count");
    if (v32 != objc_msgSend(v30, "count"))
    {
      pp_default_log_handle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C392E000, v33, OS_LOG_TYPE_FAULT, "Number of fields used for specificity comparison should always be the same.", buf, 2u);
      }

    }
    v34 = objc_msgSend(v64, "count");
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v35 = v64;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    v37 = v34;
    if (v36)
    {
      v38 = v36;
      v39 = *(_QWORD *)v71;
      v40 = v34;
      while (2)
      {
        v41 = 0;
        v37 = v40 - v38;
        do
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(v35);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v41), "isEqualToString:", &stru_1E7E221D0))
          {
            v37 = v40 - v41;
            goto LABEL_77;
          }
          ++v41;
        }
        while (v38 != v41);
        v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
        v40 = v37;
        if (v38)
          continue;
        break;
      }
    }
LABEL_77:
    v65 = v4;

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v42 = v31;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    v44 = v34;
    if (v43)
    {
      v45 = v43;
      v46 = *(_QWORD *)v67;
      v47 = v34;
      while (2)
      {
        v48 = 0;
        v44 = v47 - v45;
        do
        {
          if (*(_QWORD *)v67 != v46)
            objc_enumerationMutation(v42);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v48), "isEqualToString:", &stru_1E7E221D0))
          {
            v44 = v47 - v48;
            goto LABEL_87;
          }
          ++v48;
        }
        while (v45 != v48);
        v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        v47 = v44;
        if (v45)
          continue;
        break;
      }
    }
LABEL_87:

    if (v37 >= v44)
      v49 = v44;
    else
      v49 = v37;
    v50 = v34 - v49 + 1;
    while (v34 >= v50)
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", --v34);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", v34);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if ((v53 & 1) == 0)
      {
        v7 = 0;
        goto LABEL_95;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v54, "compare:", v55);

LABEL_95:
    v4 = v65;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
