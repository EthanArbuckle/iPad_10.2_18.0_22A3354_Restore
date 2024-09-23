@implementation UIButtonConfigurationStyleBehaviors

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id (*v13)(uint64_t, void *);
  uint64_t *v14;
  void (**v15)(void *, id);
  id v16;
  uint64_t v18;
  uint64_t v19;

  v7 = a2;
  v8 = a5;
  fallbackForegroundColorForTraitCollection(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
    v11 = v7;
  else
    v11 = (void *)v9;
  v12 = v11;
  if ((a4 & 2) == 0)
  {
    if ((a4 & 0x10) != 0)
    {
      v19 = MEMORY[0x1E0C809B0];
      v13 = __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_3;
      v14 = &v19;
    }
    else
    {
      if ((a4 & 1) == 0 || objc_msgSend(v8, "userInterfaceIdiom") == 6)
        goto LABEL_13;
      v18 = MEMORY[0x1E0C809B0];
      v13 = __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_4;
      v14 = &v18;
    }
    v14[1] = 3221225472;
    v14[2] = (uint64_t)v13;
    v14[3] = (uint64_t)&unk_1E16B1DC8;
    v14[4] = (uint64_t)v12;
    v15 = (void (**)(void *, id))_Block_copy(v14);

    if (v15)
      goto LABEL_12;
LABEL_13:
    v16 = v12;
    goto LABEL_14;
  }
  v15 = (void (**)(void *, id))&__block_literal_global_13_4;
LABEL_12:
  v15[2](v15, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v16;
}

uint64_t __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_6()
{
  return 0;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_5(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a2;
  v7 = a4;
  v8 = v7;
  if ((a3 & 1) != 0 && objc_msgSend(v7, "userInterfaceIdiom") == 6 || !_AXSButtonShapesEnabled())
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_6(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t *v12;
  id v13;
  void (**v14)(void *, id);
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((a3 & 2) != 0)
  {
    v20 = MEMORY[0x1E0C809B0];
    v11 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_7;
    v12 = &v20;
  }
  else if ((a3 & 0x10) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
  {
    v19 = MEMORY[0x1E0C809B0];
    v11 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_8;
    v12 = &v19;
  }
  else if ((a3 & 1) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
  {
    v18 = MEMORY[0x1E0C809B0];
    v11 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_9;
    v12 = &v18;
  }
  else
  {
    if ((a3 & 0x14) != 0 && objc_msgSend(v7, "userInterfaceIdiom") == 6)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v15 = v10;
      goto LABEL_20;
    }
    v17 = MEMORY[0x1E0C809B0];
    v11 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_10;
    v12 = &v17;
  }
  v12[1] = 3221225472;
  v12[2] = (uint64_t)v11;
  v12[3] = (uint64_t)&unk_1E16B1DC8;
  v13 = v9;
  v12[4] = (uint64_t)v13;
  v14 = (void (**)(void *, id))_Block_copy(v12);

  if (!v14)
  {
    v10 = v13;
    goto LABEL_19;
  }
  v14[2](v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v15;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_11()
{
  return 0;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a2);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(void *, id);
  id v14;
  id (*v15)(uint64_t, void *);
  uint64_t *v16;
  uint64_t v18;
  uint64_t v19;

  v7 = a2;
  v8 = a5;
  fallbackForegroundColorForTraitCollection(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
    v11 = v7;
  else
    v11 = (void *)v9;
  v12 = v11;
  if ((a4 & 2) != 0)
  {
    v13 = (void (**)(void *, id))&__block_literal_global_20_2;
    goto LABEL_13;
  }
  if ((a4 & 0x10) != 0 && objc_msgSend(v8, "userInterfaceIdiom") != 6)
  {
    v19 = MEMORY[0x1E0C809B0];
    v15 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_3;
    v16 = &v19;
    goto LABEL_16;
  }
  if ((a4 & 1) != 0 && objc_msgSend(v8, "userInterfaceIdiom") != 6)
  {
    v18 = MEMORY[0x1E0C809B0];
    v15 = __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_4;
    v16 = &v18;
LABEL_16:
    v16[1] = 3221225472;
    v16[2] = (uint64_t)v15;
    v16[3] = (uint64_t)&unk_1E16B1DC8;
    v16[4] = (uint64_t)v12;
    v13 = (void (**)(void *, id))_Block_copy(v16);

    if (v13)
      goto LABEL_13;
LABEL_17:
    v14 = v12;
    goto LABEL_18;
  }
  if ((a4 & 0x14) == 0 || objc_msgSend(v8, "userInterfaceIdiom") != 6)
    goto LABEL_17;
  v13 = (void (**)(void *, id))&__block_literal_global_21_3;
LABEL_13:
  v13[2](v13, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v14;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  void *v13;
  void (**v14)(void *, id);
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  if (v8)
  {
    v11 = v8;
    if ((a4 & 2) == 0)
    {
LABEL_3:
      if ((a4 & 0x10) != 0 && objc_msgSend(v10, "userInterfaceIdiom") != 6)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_4;
        v19[3] = &unk_1E16B1DC8;
        v12 = (id *)v19;
      }
      else
      {
        if ((a4 & 1) == 0 || objc_msgSend(v10, "userInterfaceIdiom") == 6)
        {
          if ((a4 & 0x14) == 0 || objc_msgSend(v10, "userInterfaceIdiom") != 6)
            goto LABEL_17;
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_6;
          v17[3] = &unk_1E16B1DC8;
          v12 = (id *)v17;
          v13 = v8;
LABEL_15:
          v12[4] = v13;
          v14 = (void (**)(void *, id))_Block_copy(v12);

          if (v14)
            goto LABEL_16;
LABEL_17:
          v15 = v11;
          goto LABEL_18;
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_5;
        v18[3] = &unk_1E16B1DC8;
        v12 = (id *)v18;
      }
      v13 = v11;
      goto LABEL_15;
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2;
    v20[3] = &unk_1E16B1DC8;
    v21 = v9;
    __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2((uint64_t)v20, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if ((a4 & 2) == 0)
      goto LABEL_3;
  }
  v14 = (void (**)(void *, id))&__block_literal_global_35;
LABEL_16:
  v14[2](v14, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v15;
}

UIColor *__76___UIButtonConfigurationStyleBehaviors_effectiveBehaviorWithoutButtonShapes__block_invoke()
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_12()
{
  return 0;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int isSameColor;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    || objc_msgSend(v3, "userInterfaceIdiom") == 6
    || (+[UIColor tintColor](UIColor, "tintColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        +[UIColor whiteColor](UIColor, "whiteColor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        isSameColor = _isSameColor(v5, v6, v4),
        v6,
        v5,
        !isSameColor))
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (objc_msgSend(v9, "userInterfaceStyle") != 2)
    {
      v10 = v9;
      v11 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (objc_msgSend(v9, "userInterfaceStyle") == 2)
    {
      v10 = v9;
      v11 = 1;
LABEL_9:
      objc_msgSend(v10, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", v11, 0x1E1A994B0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  v12 = v9;
LABEL_10:
  v13 = v12;

  v14 = (id)objc_msgSend(v8, "resolvedColorWithTraitCollection:", v13);
  return v14;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_6(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(void *, id);
  id (*v12)(uint64_t, void *);
  uint64_t *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if ((a3 & 2) != 0)
  {
    v11 = (void (**)(void *, id))&__block_literal_global_30_1;
  }
  else
  {
    if ((a3 & 0x10) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
    {
      v19 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_8;
      v13 = &v19;
    }
    else if ((a3 & 1) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
    {
      v18 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_9;
      v13 = &v18;
    }
    else
    {
      if ((a3 & 0x14) != 0 && objc_msgSend(v7, "userInterfaceIdiom") == 6)
      {
        +[UIColor clearColor](UIColor, "clearColor");
        v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v15 = v10;
        goto LABEL_20;
      }
      v17 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_10;
      v13 = &v17;
    }
    v13[1] = 3221225472;
    v13[2] = (uint64_t)v12;
    v13[3] = (uint64_t)&unk_1E16B1DC8;
    v14 = v9;
    v13[4] = (uint64_t)v14;
    v11 = (void (**)(void *, id))_Block_copy(v13);

    if (!v11)
    {
      v10 = v14;
      goto LABEL_19;
    }
  }
  v11[2](v11, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v15;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_11()
{
  return 0;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = _tintBehaviorAlphaReduction(v3, v4, 1.0, 1.0);
  _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(void *, id);
  id v14;
  id (*v15)(uint64_t, void *);
  uint64_t *v16;
  uint64_t v18;
  uint64_t v19;

  v7 = a2;
  v8 = a5;
  fallbackForegroundColorForTraitCollection(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
    v11 = v7;
  else
    v11 = (void *)v9;
  v12 = v11;
  if ((a4 & 2) != 0)
  {
    v13 = (void (**)(void *, id))&__block_literal_global_27_1;
    goto LABEL_13;
  }
  if ((a4 & 0x10) != 0 && objc_msgSend(v8, "userInterfaceIdiom") != 6)
  {
    v19 = MEMORY[0x1E0C809B0];
    v15 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_3;
    v16 = &v19;
    goto LABEL_16;
  }
  if ((a4 & 1) != 0 && objc_msgSend(v8, "userInterfaceIdiom") != 6)
  {
    v18 = MEMORY[0x1E0C809B0];
    v15 = __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_4;
    v16 = &v18;
LABEL_16:
    v16[1] = 3221225472;
    v16[2] = (uint64_t)v15;
    v16[3] = (uint64_t)&unk_1E16B1DC8;
    v16[4] = (uint64_t)v12;
    v13 = (void (**)(void *, id))_Block_copy(v16);

    if (v13)
      goto LABEL_13;
LABEL_17:
    v14 = v12;
    goto LABEL_18;
  }
  if ((a4 & 0x14) == 0 || objc_msgSend(v8, "userInterfaceIdiom") != 6)
    goto LABEL_17;
  v13 = (void (**)(void *, id))&__block_literal_global_28_1;
LABEL_13:
  v13[2](v13, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v14;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_7(uint64_t a1, void *a2, char a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t *v13;
  id v14;
  void (**v15)(void *, id);
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v7, "userInterfaceIdiom") == 6)
    +[UIColor clearColor](UIColor, "clearColor");
  else
    +[UIColor tintColor](UIColor, "tintColor");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v6;
  else
    v10 = (void *)v8;
  v11 = v10;
  if ((a3 & 2) == 0)
  {
    if ((a3 & 0x10) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
    {
      v21 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_9;
      v13 = &v21;
      goto LABEL_20;
    }
    if ((a3 & 1) != 0 && objc_msgSend(v7, "userInterfaceIdiom") != 6)
    {
      v20 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_10;
      v13 = &v20;
      goto LABEL_20;
    }
    if ((a3 & 0x14) == 0 || objc_msgSend(v7, "userInterfaceIdiom") != 6)
    {
      v19 = MEMORY[0x1E0C809B0];
      v12 = __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_11;
      v13 = &v19;
LABEL_20:
      v13[1] = 3221225472;
      v13[2] = (uint64_t)v12;
      v13[3] = (uint64_t)&unk_1E16B1DC8;
      v16 = v11;
      v13[4] = (uint64_t)v16;
      v15 = (void (**)(void *, id))_Block_copy(v13);

      if (v15)
        goto LABEL_21;
      v14 = v16;
LABEL_23:
      v17 = v14;
      goto LABEL_24;
    }
LABEL_16:
    +[UIColor clearColor](UIColor, "clearColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "userInterfaceIdiom") == 6)
    goto LABEL_16;
  v15 = (void (**)(void *, id))&__block_literal_global_37_0;
LABEL_21:
  v15[2](v15, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v17;
}

uint64_t __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a2);
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "userInterfaceIdiom") == 6)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);

  }
  else
  {
    _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), v3, 0.5, 0.4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __55___UIButtonConfigurationStyleBehaviors_plainBehaviors___block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.75);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_grayBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.05);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_4(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.1);
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _colorByReducingAlpha(v3, (uint64_t)v2, 0.75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = _tintBehaviorAlphaReduction(v3, v4, 0.5, 0.55);
  _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_tintBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = _tintBehaviorAlphaReduction(v3, v4, 0.65, 0.7);
  _colorByReducingAlpha(*(void **)(a1 + 32), (uint64_t)v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "resolvedColorWithTraitCollection:", v2);

  v5 = v4;
  return v5;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.5);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return _colorByReducingAlpha(*(void **)(a1 + 32), a2, 0.75);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v4;
  if (!v4)
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)objc_msgSend(v5, "resolvedColorWithTraitCollection:", v3);
  if (!v4)

  return v6;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _colorByReducingAlpha(v3, (uint64_t)v2, 0.75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_9(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.5, 0.2);
}

id __53___UIButtonConfigurationStyleBehaviors_fillBehaviors__block_invoke_10(uint64_t a1, void *a2)
{
  return _colorByReducingAlphaInLightAddingWhiteWithAlphaInDark(*(void **)(a1 + 32), a2, 0.75, 0.2);
}

@end
