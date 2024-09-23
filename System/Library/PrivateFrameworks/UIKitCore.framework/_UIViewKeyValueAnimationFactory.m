@implementation _UIViewKeyValueAnimationFactory

+ (id)animationForKeyPathsAndRelativeValues:(id)a3
{
  return _animationForKeyPathsAndValues(a3, 1);
}

+ (id)animationsTransitioningFromAnimation:(id)a3 toAnimation:(id)a4 onView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  _collectTransitions(v7, v10, &__block_literal_global_667);
  v34 = v8;
  _collectTransitions(v8, v10, &__block_literal_global_14_9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v39)
  {
    v37 = v9;
    v38 = *(_QWORD *)v42;
    v36 = v11;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v9;
        v16 = v13;
        v17 = v14;
        objc_msgSend(v17, "fromAnimation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fromValue");
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "toAnimation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "toValue");
        v21 = objc_claimAutoreleasedReturnValue();

        if (!(v19 | v21))
        {
          v28 = 0;
          goto LABEL_23;
        }
        v22 = (void *)objc_opt_class();
        objc_msgSend(v15, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_defaultUIViewAnimationForLayer:forKey:", v23, v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "setAdditive:", 1);
            if (v19 && v21)
            {
              v25 = (void *)v19;
              v26 = v21;
              v27 = 0xFFFFFFFFLL;
              goto LABEL_17;
            }
            if (v19 || !v21)
            {
              if (!v19 || v21)
                abort();
              v30 = (id)v19;
              v29 = v30;
              v31 = v30;
            }
            else
            {
              v25 = (void *)v21;
              v26 = v21;
              v27 = 4294967294;
LABEL_17:
              objc_msgSend(v25, "CA_addValue:multipliedBy:", v26, v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (id)v21;
              v31 = (id)v21;
            }
            objc_msgSend(v30, "CA_addValue:multipliedBy:", v31, 0xFFFFFFFFLL);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setFromValue:", v29);
            objc_msgSend(v24, "setToValue:", v32);
            v28 = v24;

            v11 = v36;
            v9 = v37;
            goto LABEL_22;
          }
        }
        v28 = 0;
LABEL_22:

LABEL_23:
        if (v28)
          objc_msgSend(v11, "addObject:", v28);

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v39);
  }

  return v11;
}

+ (id)animationForKeyPathsAndValues:(id)a3
{
  return _animationForKeyPathsAndValues(a3, 0);
}

@end
