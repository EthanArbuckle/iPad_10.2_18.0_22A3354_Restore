@implementation UIView(PUAnimationGroup)

- (id)_pu_animationDictionary
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "animationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v1, "animationForKey:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:options:animations:completion:
{
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  uint64_t v20;

  v14 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_options_animations_completion___block_invoke;
  v16[3] = &unk_1E589C960;
  v18 = a2;
  v19 = a3;
  v20 = a6;
  v17 = v14;
  v15 = v14;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);

}

+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:
{
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;

  v18 = a9;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __138__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke;
  v20[3] = &unk_1E589C988;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a8;
  v21 = v18;
  v19 = v18;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a7, v20, a10);

}

+ (void)pu_animateViews:()PUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:
{
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  uint64_t v20;

  v14 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __130__UIView_PUAnimationGroup__pu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke;
  v16[3] = &unk_1E589C960;
  v18 = a2;
  v19 = a3;
  v20 = a6;
  v17 = v14;
  v15 = v14;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);

}

+ (void)pu_animateViews:()PUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:
{
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v22 = a11;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __143__UIView_PUAnimationGroup__pu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke;
  v24[3] = &unk_1E589C9B0;
  v26 = a2;
  v27 = a3;
  v28 = a10;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v25 = v22;
  v23 = v22;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a9, v24, a12);

}

+ (void)_pu_animateViews:()PUAnimationGroup withAnimationBlock:completionHandler:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  PULayerAnimationGroup *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  PULayerAnimation *v39;
  void *v40;
  void *v41;
  PULayerAnimationGroup *v42;
  void *v43;
  id v44;
  void (**v45)(_QWORD, _QWORD);
  id obj;
  id obja;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  PULayerAnimationGroup *v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v44 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[views count] > 0"));

  }
  v45 = (void (**)(_QWORD, _QWORD))v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUAnimationGroup.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animationBlock != NULL"));

  }
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v12;
  v42 = -[PULayerAnimationGroup initWithReferenceLayer:]([PULayerAnimationGroup alloc], "initWithReferenceLayer:", v12);
  +[PUAnimationGroup pushAnimationGroup:](PUAnimationGroup, "pushAnimationGroup:");
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v50)
  {
    v48 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v72 != v48)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "animationKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          v53 = v14;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v68;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v68 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
                objc_msgSend(v15, "animationForKey:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
            }
            while (v20);
          }

          objc_msgSend(v52, "setObject:forKey:", v17, v53);
        }

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v50);
  }

  v25 = MEMORY[0x1E0C809B0];
  if (v44)
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke;
    v65[3] = &unk_1E58ABAC8;
    v66 = v44;
    -[PUAnimationGroup setCompletionHandler:](v42, "setCompletionHandler:", v65);

  }
  v63[0] = v25;
  v63[1] = 3221225472;
  v63[2] = __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke_2;
  v63[3] = &unk_1E58A9910;
  v26 = v42;
  v64 = v26;
  ((void (**)(_QWORD, _QWORD *))v45)[2](v45, v63);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = obj;
  v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v60;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v60 != v49)
          objc_enumerationMutation(obja);
        v54 = v27;
        v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v27);
        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v29, "animationKeys");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v56;
          do
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v56 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
              objc_msgSend(v30, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "animationForKey:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38 != v37)
              {
                v39 = -[PULayerAnimation initWithLayer:key:]([PULayerAnimation alloc], "initWithLayer:key:", v29, v36);
                -[PUAnimationGroup addSubAnimationGroup:](v26, "addSubAnimationGroup:", v39);

              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
          }
          while (v33);
        }

        v27 = v54 + 1;
      }
      while (v54 + 1 != v51);
      v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    }
    while (v51);
  }

  +[PUAnimationGroup popAnimationGroup:](PUAnimationGroup, "popAnimationGroup:", v26);
}

@end
