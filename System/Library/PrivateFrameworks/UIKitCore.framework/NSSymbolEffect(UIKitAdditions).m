@implementation NSSymbolEffect(UIKitAdditions)

- (uint64_t)ui_isSupportedByImageView
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "_effectType");
  return (v1 < 0xD) & (0x167Eu >> v1);
}

- (uint64_t)ui_isSupportedByBarButtonItem
{
  if ((unint64_t)(objc_msgSend(a1, "_effectType") - 5) >= 2)
    return objc_msgSend(a1, "ui_isSupportedByImageView");
  else
    return 0;
}

- (uint64_t)ui_rbAnimation
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "_effectType");
  if ((unint64_t)(v1 - 1) > 0xB)
    return 0xFFFFFFFFLL;
  else
    return dword_186684E44[v1 - 1];
}

- (id)ui_animationConfigurationWithOptions:()UIKitAdditions completion:configuration:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  id v19;
  _BOOL4 v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unsigned int v27;
  BOOL v28;
  unsigned int v29;
  id v30;
  unsigned int v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v59;
  void *v60;
  BOOL v61;
  int v62;
  int v63;
  uint64_t v64;
  void *v65;
  char v66;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(a1, "ui_rbAnimation");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "layoutDirection");
  v16 = objc_msgSend(v9, "_repeatBehavior");
  if (v16 == 1 || !v16 && objc_msgSend(a1, "ui_effectPrefersIndefiniteBehaviorOverDiscreteBehavior"))
  {
    v17 = objc_msgSend(v9, "_prefersContinuous");
    v66 = 1;
  }
  else
  {
    v66 = 0;
    v17 = 0;
  }
  switch(objc_msgSend(a1, "_effectType"))
  {
    case 1:
      v19 = a1;
      v20 = objc_msgSend(v19, "_fillStyle") == 1;
      if (objc_msgSend(v19, "_inactiveStyle") == 1)
        v21 = v20 | 2;
      else
        v21 = v20;
      v22 = objc_msgSend(v19, "_playbackStyle");

      if (v22 == 1)
        v23 = v21 | 8;
      else
        v23 = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D874F8]);

      goto LABEL_46;
    case 2:
    case 4:
      v18 = objc_msgSend(a1, "_layerBehavior");
      goto LABEL_41;
    case 3:
      v38 = a1;
      v18 = objc_msgSend(v38, "_layerBehavior");
      v39 = objc_msgSend(v38, "_direction");

      v40 = 2 * (v39 == 2);
      if (v39 == 1)
        v40 = 1;
      if (v17)
        v41 = v40 | 0x10;
      else
        v41 = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (_QWORD *)MEMORY[0x1E0D874B0];
      goto LABEL_40;
    case 5:
      v42 = a1;
      v18 = objc_msgSend(v42, "_layerBehavior");
      v43 = objc_msgSend(v42, "_style");

      if (v43 == 2)
        v27 = 3;
      else
        v27 = 0;
      v28 = v43 == 1;
      v29 = 2;
      goto LABEL_34;
    case 6:
      v25 = a1;
      v18 = objc_msgSend(v25, "_layerBehavior");
      v26 = objc_msgSend(v25, "_style");

      v27 = 2 * (v26 == 2);
      v28 = v26 == 1;
      v29 = 3;
LABEL_34:
      if (v28)
        v44 = v29;
      else
        v44 = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v44);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (_QWORD *)MEMORY[0x1E0D874A8];
      goto LABEL_40;
    case 9:
      v30 = a1;
      v18 = objc_msgSend(v30, "_layerBehavior");
      switch(objc_msgSend(v30, "_style"))
      {
        case 1:
          v31 = 19;
          break;
        case 2:
          v31 = 35;
          break;
        case 3:
          objc_msgSend(v30, "_angle");
          objc_msgSend(MEMORY[0x1E0CE8710], "_normalizeAngle:");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59 * 0.0174532925);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D87500]);

          goto LABEL_57;
        case 4:
          v61 = v15 == 1;
          v62 = 16;
          v63 = 32;
          goto LABEL_60;
        case 5:
          v61 = v15 == 1;
          v62 = 32;
          v63 = 16;
LABEL_60:
          if (v61)
            v62 = v63;
          v31 = v62 | 1;
          break;
        default:
LABEL_57:
          v31 = 0;
          break;
      }
      if (v17)
        v64 = v31 | 0x100;
      else
        v64 = v31;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0D87508]);

      goto LABEL_41;
    case 10:
      v32 = a1;
      v18 = objc_msgSend(v32, "_layerBehavior");
      v33 = objc_msgSend(v32, "_isClockwise");

      v34 = 2 * (v33 == 2);
      if (v33 == 1)
        v34 = 1;
      if (v17)
        v35 = v34 | 0x10;
      else
        v35 = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (_QWORD *)MEMORY[0x1E0D874E8];
      goto LABEL_40;
    case 12:
      v46 = a1;
      v18 = objc_msgSend(v46, "_layerBehavior");
      v47 = objc_msgSend(v46, "_style");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47 == 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (_QWORD *)MEMORY[0x1E0D874B8];
LABEL_40:
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, *v37);

LABEL_41:
      if (v18 == 2)
      {
        v48 = *MEMORY[0x1E0D874C0];
        v49 = MEMORY[0x1E0C9AAA0];
      }
      else
      {
        if (v18 != 1)
          goto LABEL_46;
        v48 = *MEMORY[0x1E0D874C0];
        v49 = MEMORY[0x1E0C9AAB0];
      }
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v49, v48);
LABEL_46:
      if (objc_msgSend(a1, "ui_effectSupportsRepeat"))
      {
        if ((v66 & 1) != 0)
        {
          LODWORD(v50) = 2139095040;
        }
        else
        {
          v51 = objc_msgSend(v9, "_repeatBehavior");
          LODWORD(v50) = 1.0;
          if (v51 == 2)
            *(float *)&v50 = (float)objc_msgSend(v9, "_repeatCount", v50);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0D874D0]);

        objc_msgSend(v9, "_repeatDelay");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D874D8]);

      }
      objc_msgSend(v9, "_speed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(fmin(v54, 2.0), 0.5));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0D874F0]);

      if (v10)
      {
        v56 = _Block_copy(v10);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D874C8]);

      }
      v57 = (void *)objc_opt_new();
      objc_msgSend(v57, "setAnimation:", v12);
      objc_msgSend(v57, "setOptions:", v13);

      return v57;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSSymbolEffect+UIKitAdditions.m"), 333, CFSTR("Unsupported effect type added to image view"));

      goto LABEL_46;
  }
}

- (uint64_t)ui_effectSupportsRepeat
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "_effectType");
  return (v1 < 0xD) & (0x160Eu >> v1);
}

- (BOOL)ui_effectPrefersIndefiniteBehaviorOverDiscreteBehavior
{
  return (unint64_t)(objc_msgSend(a1, "_effectType") - 1) < 2;
}

@end
