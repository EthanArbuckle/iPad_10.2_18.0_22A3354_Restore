@implementation UIView(SBSAC2PropertyAnimating)

- (BOOL)sbsa_isPropertyActivelyC2AnimatingForKeyPath:()SBSAC2PropertyAnimating
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v16 = 0;
  objc_msgSend(a1, "_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:caLayerRelativeKeyPath:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  objc_msgSend(v5, "presentationModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__UIView_SBSAC2PropertyAnimating__sbsa_isPropertyActivelyC2AnimatingForKeyPath___block_invoke;
  v12[3] = &unk_1E8EA80D8;
  v13 = v6;
  v14 = a1;
  v15 = v4;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v7, "bs_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10 != 0;
}

- (id)_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:()SBSAC2PropertyAnimating caLayerRelativeKeyPath:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = ___CAKeyPathFromUIKeyPath_block_invoke;
  v25 = &unk_1E8EA8150;
  v27 = &v28;
  v9 = v8;
  v26 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v22);
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."), v22, v23, v24, v25);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsString:", CFSTR("layer")) & 1) == 0
    && objc_msgSend(v9, "count")
    && !*((_BYTE *)v29 + 24))
  {
    objc_msgSend(v9, "insertObject:atIndex:", CFSTR("layer"), objc_msgSend(v9, "count") - 1);
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v11;
  }

  _Block_object_dispose(&v28, 8);
  if (v10)
  {
    objc_msgSend(a1, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasPrefix:", CFSTR("layer.")))
    {
      objc_msgSend(v10, "substringFromIndex:", objc_msgSend(CFSTR("layer."), "length"));
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
    if (objc_msgSend(v10, "containsString:", CFSTR("layer")))
    {
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = objc_msgSend(v15, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_36_0) + 1;
      objc_msgSend(v15, "subarrayWithRange:", 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "valueForKeyPath:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "removeObjectsInRange:", 0, v16);
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("."));
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v19;
      v10 = (id)v20;
    }
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sbsa_presentationModifierValueForKeyPath:()SBSAC2PropertyAnimating
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v43;
  void *v44;
  id obj;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0;
  objc_msgSend(a1, "_sbsa_deepestLayerAndCALayerRelativeKeyPathForUIKeyPath:caLayerRelativeKeyPath:", v4, &v55);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v55;
  objc_msgSend(v5, "presentationModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke;
  v53[3] = &unk_1E8EA8100;
  v8 = v6;
  v54 = v8;
  objc_msgSend(v7, "bs_firstObjectPassingTest:", v53);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v9;
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = v4;
  objc_msgSend(a1, "_independentlyAnimatableMemberKeyPathsForPropertyKeyPath:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v5, "presentationModifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __76__UIView_SBSAC2PropertyAnimating__sbsa_presentationModifierValueForKeyPath___block_invoke_2;
        v46[3] = &unk_1E8EA8128;
        v17 = v8;
        v47 = v17;
        v48 = v15;
        objc_msgSend(v16, "bs_firstObjectPassingTest:", v46);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "value");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v18 && v19)
        {
          if (!v10)
          {
            objc_msgSend(v5, "valueForKey:", v17);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v44, "containsString:", CFSTR("center")))
          {
            objc_msgSend(v10, "bs_CGPointValue");
            v22 = v21;
            v24 = v23;
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v22 = v25;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v24 = v26;
            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", v22, v24);
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v44, "containsString:", CFSTR("bounds")))
              goto LABEL_27;
            objc_msgSend(v10, "bs_CGRectValue");
            v29 = v28;
            v31 = v30;
            v33 = v32;
            v35 = v34;
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v29 = v36;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v31 = v37;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v33 = v38;
            }
            if (BSEqualObjects())
            {
              objc_msgSend(v20, "bs_CGFloatValue");
              v35 = v39;
            }
            objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGRect:", v29, v31, v33, v35);
            v27 = objc_claimAutoreleasedReturnValue();
          }
          v40 = (void *)v27;

          v10 = v40;
        }
LABEL_27:

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v12);
  }

  v41 = v10;
  return v41;
}

@end
