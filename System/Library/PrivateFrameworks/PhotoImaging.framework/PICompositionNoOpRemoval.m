@implementation PICompositionNoOpRemoval

+ (id)_noOpRemovalFunctions
{
  _QWORD v3[36];
  _QWORD v4[37];

  v4[36] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("apertureRedEye");
  v3[1] = CFSTR("autoLoop");
  v4[0] = &__block_literal_global_8128;
  v4[1] = &__block_literal_global_8128;
  v3[2] = CFSTR("cinematicAudio");
  v3[3] = CFSTR("cropStraighten");
  v4[2] = &__block_literal_global_8128;
  v4[3] = &__block_literal_global_8128;
  v3[4] = CFSTR("curves");
  v3[5] = CFSTR("definition");
  v4[4] = &__block_literal_global_8128;
  v4[5] = &__block_literal_global_8128;
  v3[6] = CFSTR("depthEffect");
  v3[7] = CFSTR("effect");
  v4[6] = &__block_literal_global_8128;
  v4[7] = &__block_literal_global_8128;
  v3[8] = CFSTR("effect3D");
  v3[9] = CFSTR("grain");
  v4[8] = &__block_literal_global_8128;
  v4[9] = &__block_literal_global_8128;
  v3[10] = CFSTR("highResFusion");
  v3[11] = CFSTR("levels");
  v4[10] = &__block_literal_global_8128;
  v4[11] = &__block_literal_global_8128;
  v3[12] = CFSTR("livePhotoKeyFrame");
  v3[13] = CFSTR("mute");
  v4[12] = &__block_literal_global_8128;
  v4[13] = &__block_literal_global_8128;
  v3[14] = CFSTR("noiseReduction");
  v3[15] = CFSTR("orientation");
  v4[14] = &__block_literal_global_8128;
  v4[15] = &__block_literal_global_8128;
  v3[16] = CFSTR("portraitEffect");
  v3[17] = CFSTR("portraitVideo");
  v4[16] = &__block_literal_global_8128;
  v4[17] = &__block_literal_global_8128;
  v3[18] = CFSTR("raw");
  v3[19] = CFSTR("rawNoiseReduction");
  v4[18] = &__block_literal_global_8128;
  v4[19] = &__block_literal_global_8128;
  v3[20] = CFSTR("redEye");
  v3[21] = CFSTR("retouch");
  v4[20] = &__block_literal_global_8128;
  v4[21] = &__block_literal_global_8128;
  v3[22] = CFSTR("inpaint");
  v3[23] = CFSTR("selectiveColor");
  v4[22] = &__block_literal_global_8128;
  v4[23] = &__block_literal_global_8128;
  v3[24] = CFSTR("semanticEnhance");
  v3[25] = CFSTR("semanticStyle");
  v4[24] = &__block_literal_global_8128;
  v4[25] = &__block_literal_global_8128;
  v3[26] = CFSTR("sharpen");
  v3[27] = CFSTR("slomo");
  v4[26] = &__block_literal_global_8128;
  v4[27] = &__block_literal_global_8128;
  v3[28] = CFSTR("smartBlackAndWhite");
  v3[29] = CFSTR("smartColor");
  v4[28] = &__block_literal_global_8128;
  v4[29] = &__block_literal_global_8128;
  v3[30] = CFSTR("smartTone");
  v3[31] = CFSTR("trim");
  v4[30] = &__block_literal_global_62;
  v4[31] = &__block_literal_global_8128;
  v3[32] = CFSTR("videoPosterFrame");
  v3[33] = CFSTR("videoStabilize");
  v4[32] = &__block_literal_global_8128;
  v4[33] = &__block_literal_global_8128;
  v3[34] = CFSTR("vignette");
  v3[35] = CFSTR("whiteBalance");
  v4[34] = &__block_literal_global_8128;
  v4[35] = &__block_literal_global_77;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 36);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)noOpRemovalFunctions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PICompositionNoOpRemoval_noOpRemovalFunctions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (noOpRemovalFunctions_onceToken != -1)
    dispatch_once(&noOpRemovalFunctions_onceToken, block);
  return (id)noOpRemovalFunctions_noOpRules;
}

+ (id)copyOfAdjustmentRemovingNoOps:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;

  v6 = a3;
  v7 = a4;
  +[PICompositionSerializerConstants mapForSerialization](PICompositionSerializerConstants, "mapForSerialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("omitIfDisabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (!v12)
    {
      v13 = 0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "noOpRemovalFunctions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v7);
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_msgSend(v6, "copy");
    ((void (**)(_QWORD, void *))v15)[2](v15, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)objc_msgSend(v6, "copy");
  }

LABEL_9:
  return v13;
}

+ (id)copyOfCompositionRemovingNoOps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v18 = v4;
  objc_msgSend(v4, "schema");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)objc_msgSend(a1, "copyOfAdjustmentRemovingNoOps:identifier:", v15, v14);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v14);

          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v5;
}

void __48__PICompositionNoOpRemoval_noOpRemovalFunctions__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_noOpRemovalFunctions");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)noOpRemovalFunctions_noOpRules;
  noOpRemovalFunctions_noOpRules = v1;

}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqual:", &unk_1E50513A0) & 1) == 0)
    {

LABEL_70:
      v24 = v4;
      goto LABEL_71;
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQ")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "isEqual:", &unk_1E50513A0)))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceStrength"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceStrength"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
LABEL_63:

LABEL_64:
        if (!v6)
          goto LABEL_66;
        goto LABEL_65;
      }
      v43 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceWarmth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceWarmth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
LABEL_61:

LABEL_62:
        v9 = v43;
        if (!v8)
          goto LABEL_64;
        goto LABEL_63;
      }
      v42 = v11;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayI"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
LABEL_59:

LABEL_60:
        v11 = v42;
        if (!v10)
          goto LABEL_62;
        goto LABEL_61;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayQ"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayQ"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v39, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
LABEL_57:

LABEL_58:
        if (!v12)
          goto LABEL_60;
        goto LABEL_59;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayWarmth"));
    v38 = objc_claimAutoreleasedReturnValue();
    v40 = v13;
    if (v38)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayWarmth"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v36, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
        v15 = (void *)v38;
LABEL_55:

LABEL_56:
        v13 = v40;
        if (!v40)
          goto LABEL_58;
        goto LABEL_57;
      }
      v37 = v3;
    }
    else
    {
      v37 = v3;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayY"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
        v15 = (void *)v38;
LABEL_53:

LABEL_54:
        v3 = v37;
        if (!v15)
          goto LABEL_56;
        goto LABEL_55;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("temperature"));
    v33 = objc_claimAutoreleasedReturnValue();
    v35 = v14;
    if (v33)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("temperature"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "isEqual:", &unk_1E50513B8))
      {
        v7 = 0;
        v15 = (void *)v38;
        v16 = (void *)v33;
LABEL_51:

LABEL_52:
        v14 = v35;
        if (!v35)
          goto LABEL_54;
        goto LABEL_53;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tint"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tint"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v29, "isEqual:", &unk_1E50513A0))
      {
        v18 = (void *)v17;
        v7 = 0;
        v15 = (void *)v38;
LABEL_49:

LABEL_50:
        v16 = (void *)v33;
        if (!v33)
          goto LABEL_52;
        goto LABEL_51;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmFace"));
    v30 = (void *)v17;
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmFace"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "isEqual:", &unk_1E50513A0))
      {
        v7 = 0;
        v15 = (void *)v38;
        v19 = (void *)v31;
LABEL_47:

LABEL_48:
        v18 = v30;
        if (!v30)
          goto LABEL_50;
        goto LABEL_49;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTemp"));
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTemp")),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "isEqual:", &unk_1E50513A0)))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTint"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTint"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v23, "isEqual:", &unk_1E50513A0);

      }
      else
      {
        v7 = 1;
      }
      v15 = (void *)v38;
      v20 = (void *)v28;
      if (!v28)
      {
LABEL_46:
        v19 = (void *)v31;
        if (!v31)
          goto LABEL_48;
        goto LABEL_47;
      }
    }
    else
    {
      v7 = 0;
      v15 = (void *)v38;
      v20 = (void *)v28;
    }

    goto LABEL_46;
  }
  v7 = 0;
LABEL_65:

LABEL_66:
  if (v5)

  if ((v7 & 1) == 0)
    goto LABEL_70;
  v24 = 0;
LABEL_71:

  return v24;
}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("inputImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("primary"));

  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("inputImage"));
  return v2;
}

id __49__PICompositionNoOpRemoval__noOpRemovalFunctions__block_invoke(int a1, id a2)
{
  return a2;
}

@end
