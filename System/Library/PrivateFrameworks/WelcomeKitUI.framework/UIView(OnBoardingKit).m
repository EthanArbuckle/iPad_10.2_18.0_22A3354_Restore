@implementation UIView(OnBoardingKit)

- (id)wl_progressLabel
{
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  objc_class *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(a1, "subviews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v2, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    while (2)
    {
      for (j = 0; j != v8; ++j)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
        {
          v12 = v11;

          v2 = v12;
          goto LABEL_21;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_21:

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v2, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    while (2)
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("OBContentView"));

        if (v21)
        {
          v22 = v18;

          v2 = v22;
          goto LABEL_31;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_31:

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v2, "subviews", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    while (2)
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = v28;

          v2 = v29;
          goto LABEL_41;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_41:

  return v2;
}

@end
