@implementation NSSymbolContentTransition(UIKitAdditions)

- (uint64_t)ui_isSupportedByImageView
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "_effectType");
  return (v1 < 0xC) & (0x980u >> v1);
}

- (id)ui_animationConfigurationFromSymbolImage:()UIKitAdditions toSymbolImage:options:completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "_effectType");
  if (v16 == 7)
  {
    v18 = a1;
    if (objc_msgSend(v18, "_style") || (dyld_program_sdk_at_least() & 1) == 0)
    {
      v19 = 96;
      goto LABEL_11;
    }
LABEL_10:
    v19 = 0;
LABEL_11:
    v20 = objc_msgSend(v18, "_layerBehavior");
    v21 = objc_msgSend(v18, "_style");
    v22 = v19 | 3;
    v23 = v19 | 2;
    if (v21 != 1)
      v23 = v19;
    if (v21 != 2)
      v22 = v23;
    if (v21 == 3)
      v24 = v19 | 4u;
    else
      v24 = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D874E0]);

    if (v20 == 2)
    {
      v26 = *MEMORY[0x1E0D874C0];
      v27 = MEMORY[0x1E0C9AAA0];
    }
    else
    {
      if (v20 != 1)
      {
LABEL_24:
        v17 = 6;
        goto LABEL_25;
      }
      v26 = *MEMORY[0x1E0D874C0];
      v27 = MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, v26);
    goto LABEL_24;
  }
  if (v16 == 11)
  {
    objc_msgSend(a1, "_fallback");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v16 != 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSSymbolEffect+UIKitAdditions.m"), 543, CFSTR("Unsupported content transition type added to image view"));

    v17 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  if ((objc_msgSend(v11, "_isSameSymbolImageExceptVariableValue:", v12) & 1) != 0)
  {
    v17 = 0;
LABEL_25:
    objc_msgSend(v13, "_speed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(fmin(v29, 2.0), 0.5));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D874F0]);

    if (v14)
    {
      v31 = _Block_copy(v14);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D874C8]);

    }
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setAnimation:", v17);
    objc_msgSend(v32, "setOptions:", v15);
    goto LABEL_28;
  }
  if (qword_1ECD82180 != -1)
    dispatch_once(&qword_1ECD82180, &__block_literal_global_613);
  objc_msgSend((id)_MergedGlobals_1294, "ui_animationConfigurationFromSymbolImage:toSymbolImage:options:completion:", v11, v12, v13, v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v32;
}

@end
