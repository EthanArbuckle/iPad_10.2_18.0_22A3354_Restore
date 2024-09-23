@implementation PBUIWallpaperConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperGradient, 0);
  objc_storeStrong((id *)&self->_wallpaperColorName, 0);
  objc_storeStrong((id *)&self->_wallpaperColor, 0);
  objc_storeStrong((id *)&self->_originalVideoURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperInfo, 0);
  objc_storeStrong((id *)&self->_wallpaperOptions, 0);
  objc_storeStrong((id *)&self->_wallpaperImageHashData, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailImage, 0);
  objc_storeStrong((id *)&self->_wallpaperOriginalImage, 0);
  objc_storeStrong((id *)&self->_wallpaperImage, 0);
}

- (PBUIWallpaperOptions)wallpaperOptions
{
  return self->_wallpaperOptions;
}

- (BOOL)needsWallpaperDimmingTreatment
{
  return self->_needsWallpaperDimmingTreatment;
}

- (PBUIWallpaperConfiguration)initWithVariant:(int64_t)a3 type:(int64_t)a4
{
  PBUIWallpaperConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBUIWallpaperConfiguration;
  result = -[PBUIWallpaperConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_variant = a3;
    result->_wallpaperType = a4;
  }
  return result;
}

- (PBUIWallpaperConfiguration)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Use a designated initializer"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)proceduralWallpaperIdentifier
{
  void *v2;
  void *v3;

  -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kSBUIMagicWallpaperIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)proceduralWallpaperOptions
{
  void *v2;
  void *v3;

  -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kSBUIMagicWallpaperPresetOptionsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVariant:type:", -[PBUIWallpaperConfiguration variant](self, "variant"), -[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType"));
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment");
    *(_BYTE *)(v4 + 9) = -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment");
    -[PBUIWallpaperConfiguration wallpaperImage](self, "wallpaperImage");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5;

    -[PBUIWallpaperConfiguration wallpaperOriginalImage](self, "wallpaperOriginalImage");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v7;

    -[PBUIWallpaperConfiguration wallpaperThumbnailImage](self, "wallpaperThumbnailImage");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v9;

    -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](self, "wallpaperThumbnailImageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v12;

    -[PBUIWallpaperConfiguration wallpaperImageHashData](self, "wallpaperImageHashData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v15;

    -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v18;

    -[PBUIWallpaperConfiguration videoURL](self, "videoURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    v22 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v21;

    -[PBUIWallpaperConfiguration originalVideoURL](self, "originalVideoURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v24;

    -[PBUIWallpaperConfiguration wallpaperOptions](self, "wallpaperOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    v28 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v27;

    -[PBUIWallpaperConfiguration wallpaperColor](self, "wallpaperColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    v31 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v30;

    -[PBUIWallpaperConfiguration wallpaperColorName](self, "wallpaperColorName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    v34 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v33;

    -[PBUIWallpaperConfiguration wallpaperGradient](self, "wallpaperGradient");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    v37 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v36;

    v38 = (id)v4;
  }

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  PBUIWallpaperConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PBUIWallpaperConfiguration *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  _BOOL4 v46;
  _BOOL4 v47;
  _BOOL4 v49;

  v4 = (PBUIWallpaperConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v47) = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[PBUIWallpaperConfiguration variant](self, "variant");
      if (v8 != -[PBUIWallpaperConfiguration variant](v7, "variant"))
        goto LABEL_18;
      v9 = -[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType");
      if (v9 != -[PBUIWallpaperConfiguration wallpaperType](v7, "wallpaperType"))
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperImage](self, "wallpaperImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperImage](v7, "wallpaperImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = BSEqualObjects();

      if (!v12)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperOriginalImage](self, "wallpaperOriginalImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperOriginalImage](v7, "wallpaperOriginalImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (v13 != 0) ^ (v14 != 0);

      if ((v15 & 1) != 0)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperThumbnailImage](self, "wallpaperThumbnailImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperThumbnailImage](v7, "wallpaperThumbnailImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (v16 != 0) ^ (v17 != 0);

      if ((v18 & 1) != 0)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](self, "wallpaperThumbnailImageData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](v7, "wallpaperThumbnailImageData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = BSEqualObjects();

      if (!v21)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperImageHashData](self, "wallpaperImageHashData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperImageHashData](v7, "wallpaperImageHashData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = BSEqualObjects();

      if (!v24)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration proceduralWallpaperInfo](v7, "proceduralWallpaperInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = BSEqualObjects();

      if (!v27)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration videoURL](self, "videoURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration videoURL](v7, "videoURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = BSEqualObjects();

      if (!v30)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration originalVideoURL](self, "originalVideoURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration originalVideoURL](v7, "originalVideoURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = BSEqualObjects();

      if (!v33)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperOptions](self, "wallpaperOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperOptions](v7, "wallpaperOptions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = BSEqualObjects();

      if (!v36)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperColor](self, "wallpaperColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperColor](v7, "wallpaperColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = BSEqualObjects();

      if (!v39)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperColorName](self, "wallpaperColorName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperColorName](v7, "wallpaperColorName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = BSEqualObjects();

      if (!v42)
        goto LABEL_18;
      -[PBUIWallpaperConfiguration wallpaperGradient](self, "wallpaperGradient");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperConfiguration wallpaperGradient](v7, "wallpaperGradient");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = BSEqualObjects();

      if (!v45)
        goto LABEL_18;
      v46 = -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment");
      if (v46 == -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](v7, "needsWallpaperDimmingTreatment"))
      {
        v49 = -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment");
        v47 = v49 ^ -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](v7, "needsInactiveAppearanceTreatment") ^ 1;
      }
      else
      {
LABEL_18:
        LOBYTE(v47) = 0;
      }

    }
    else
    {
      LOBYTE(v47) = 0;
    }
  }

  return v47;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;

  v3 = -[PBUIWallpaperConfiguration variant](self, "variant");
  v4 = -[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType") + v3;
  -[PBUIWallpaperConfiguration wallpaperImage](self, "wallpaperImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 + objc_msgSend(v26, "hash");
  -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](self, "wallpaperThumbnailImageData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v25, "hash");
  -[PBUIWallpaperConfiguration wallpaperImageHashData](self, "wallpaperImageHashData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + v6 + objc_msgSend(v24, "hash");
  -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[PBUIWallpaperConfiguration videoURL](self, "videoURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 + objc_msgSend(v10, "hash");
  -[PBUIWallpaperConfiguration originalVideoURL](self, "originalVideoURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 + v11 + objc_msgSend(v12, "hash");
  -[PBUIWallpaperConfiguration wallpaperOptions](self, "wallpaperOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[PBUIWallpaperConfiguration wallpaperColor](self, "wallpaperColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 + objc_msgSend(v16, "hash");
  -[PBUIWallpaperConfiguration wallpaperColorName](self, "wallpaperColorName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 + objc_msgSend(v18, "hash");
  -[PBUIWallpaperConfiguration wallpaperGradient](self, "wallpaperGradient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13 + v19 + objc_msgSend(v20, "hash");
  v22 = v21 + -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment");

  return v22 + -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment");
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperType(-[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("wallpaperType"));

  -[PBUIWallpaperConfiguration wallpaperImage](self, "wallpaperImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v7, CFSTR("wallpaperImage"), 1);

  -[PBUIWallpaperConfiguration wallpaperOriginalImage](self, "wallpaperOriginalImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v9, CFSTR("wallpaperOriginalImage"), 1);

  -[PBUIWallpaperConfiguration wallpaperThumbnailImage](self, "wallpaperThumbnailImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v11, CFSTR("wallpaperThumbnailImage"), 1);

  -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](self, "wallpaperThumbnailImageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v13, CFSTR("wallpaperThumbnailImageData"), 1);

  -[PBUIWallpaperConfiguration wallpaperImageHashData](self, "wallpaperImageHashData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v15, CFSTR("wallpaperImageHashData"), 1);

  -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v17, CFSTR("proceduralWallpaperInfo"), 1);

  -[PBUIWallpaperConfiguration videoURL](self, "videoURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v19, CFSTR("videoURL"), 1);

  -[PBUIWallpaperConfiguration originalVideoURL](self, "originalVideoURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v21, CFSTR("originalVideoURL"), 1);

  -[PBUIWallpaperConfiguration wallpaperOptions](self, "wallpaperOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v23, CFSTR("wallpaperOptions"), 1);

  -[PBUIWallpaperConfiguration wallpaperColor](self, "wallpaperColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v25, CFSTR("wallpaperColor"), 1);

  -[PBUIWallpaperConfiguration wallpaperColorName](self, "wallpaperColorName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v27, CFSTR("wallpaperColorName"), 1);

  -[PBUIWallpaperConfiguration wallpaperGradient](self, "wallpaperGradient");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v29, CFSTR("wallpaperGradient"), 1);

  v31 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment"), CFSTR("needsWallpaperDimmingTreatment"), 1);
  v32 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment"), CFSTR("needsInactiveAppearanceTreatment"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  PBUIStringForWallpaperType(-[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("wallpaperType"));

  PBUIStringForWallpaperVariant(-[PBUIWallpaperConfiguration variant](self, "variant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("variant"));

  -[PBUIWallpaperConfiguration wallpaperImage](self, "wallpaperImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("wallpaperImage"));

  -[PBUIWallpaperConfiguration wallpaperOriginalImage](self, "wallpaperOriginalImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("wallpaperOriginalImage"));

  -[PBUIWallpaperConfiguration wallpaperThumbnailImage](self, "wallpaperThumbnailImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("wallpaperThumbnailImage"));

  -[PBUIWallpaperConfiguration wallpaperThumbnailImageData](self, "wallpaperThumbnailImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("wallpaperThumbnailImageData"));

  -[PBUIWallpaperConfiguration wallpaperImageHashData](self, "wallpaperImageHashData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("wallpaperImageHashData"));

  -[PBUIWallpaperConfiguration proceduralWallpaperInfo](self, "proceduralWallpaperInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("proceduralWallpaperInfo"));

  -[PBUIWallpaperConfiguration videoURL](self, "videoURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("videoURL"));

  -[PBUIWallpaperConfiguration originalVideoURL](self, "originalVideoURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("originalVideoURL"));

  -[PBUIWallpaperConfiguration wallpaperOptions](self, "wallpaperOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("wallpaperOptions"));

  -[PBUIWallpaperConfiguration wallpaperColor](self, "wallpaperColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("wallpaperColor"));

  -[PBUIWallpaperConfiguration wallpaperColorName](self, "wallpaperColorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("wallpaperColorName"));

  -[PBUIWallpaperConfiguration wallpaperGradient](self, "wallpaperGradient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("wallpaperGradient"));

  objc_msgSend(v18, "encodeBool:forKey:", -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment"), CFSTR("needsWallpaperDimmingTreatment"));
  objc_msgSend(v18, "encodeBool:forKey:", -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment"), CFSTR("needsInactiveAppearanceTreatment"));

}

- (PBUIWallpaperConfiguration)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PBUIWallpaperImage *wallpaperImage;
  void *v13;
  uint64_t v14;
  UIImage *wallpaperOriginalImage;
  void *v16;
  uint64_t v17;
  UIImage *wallpaperThumbnailImage;
  void *v19;
  uint64_t v20;
  NSData *wallpaperThumbnailImageData;
  void *v22;
  uint64_t v23;
  NSData *wallpaperImageHashData;
  void *v25;
  uint64_t v26;
  NSDictionary *proceduralWallpaperInfo;
  void *v28;
  uint64_t v29;
  NSURL *videoURL;
  void *v31;
  uint64_t v32;
  NSURL *originalVideoURL;
  void *v34;
  uint64_t v35;
  PBUIWallpaperOptions *wallpaperOptions;
  void *v37;
  uint64_t v38;
  UIColor *wallpaperColor;
  void *v40;
  uint64_t v41;
  NSString *wallpaperColorName;
  void *v43;
  uint64_t v44;
  PBUIWallpaperGradient *wallpaperGradient;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PBUIWallpaperConfiguration;
  v5 = -[PBUIWallpaperConfiguration init](&v47, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("wallpaperType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wallpaperType = PBUIWallpaperTypeForString(v7);

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("variant"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_variant = PBUIWallpaperVariantForString(v9);

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("wallpaperImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    wallpaperImage = v5->_wallpaperImage;
    v5->_wallpaperImage = (PBUIWallpaperImage *)v11;

    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("wallpaperOriginalImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    wallpaperOriginalImage = v5->_wallpaperOriginalImage;
    v5->_wallpaperOriginalImage = (UIImage *)v14;

    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("wallpaperThumbnailImage"));
    v17 = objc_claimAutoreleasedReturnValue();
    wallpaperThumbnailImage = v5->_wallpaperThumbnailImage;
    v5->_wallpaperThumbnailImage = (UIImage *)v17;

    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("wallpaperThumbnailImageData"));
    v20 = objc_claimAutoreleasedReturnValue();
    wallpaperThumbnailImageData = v5->_wallpaperThumbnailImageData;
    v5->_wallpaperThumbnailImageData = (NSData *)v20;

    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("wallpaperImageHashData"));
    v23 = objc_claimAutoreleasedReturnValue();
    wallpaperImageHashData = v5->_wallpaperImageHashData;
    v5->_wallpaperImageHashData = (NSData *)v23;

    objc_opt_self();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("proceduralWallpaperInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    proceduralWallpaperInfo = v5->_proceduralWallpaperInfo;
    v5->_proceduralWallpaperInfo = (NSDictionary *)v26;

    objc_opt_self();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, CFSTR("videoURL"));
    v29 = objc_claimAutoreleasedReturnValue();
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v29;

    objc_opt_self();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, CFSTR("originalVideoURL"));
    v32 = objc_claimAutoreleasedReturnValue();
    originalVideoURL = v5->_originalVideoURL;
    v5->_originalVideoURL = (NSURL *)v32;

    objc_opt_self();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, CFSTR("wallpaperOptions"));
    v35 = objc_claimAutoreleasedReturnValue();
    wallpaperOptions = v5->_wallpaperOptions;
    v5->_wallpaperOptions = (PBUIWallpaperOptions *)v35;

    objc_opt_self();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, CFSTR("wallpaperColor"));
    v38 = objc_claimAutoreleasedReturnValue();
    wallpaperColor = v5->_wallpaperColor;
    v5->_wallpaperColor = (UIColor *)v38;

    objc_opt_self();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v40, CFSTR("wallpaperColorName"));
    v41 = objc_claimAutoreleasedReturnValue();
    wallpaperColorName = v5->_wallpaperColorName;
    v5->_wallpaperColorName = (NSString *)v41;

    objc_opt_self();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, CFSTR("wallpaperGradient"));
    v44 = objc_claimAutoreleasedReturnValue();
    wallpaperGradient = v5->_wallpaperGradient;
    v5->_wallpaperGradient = (PBUIWallpaperGradient *)v44;

    v5->_needsWallpaperDimmingTreatment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsWallpaperDimmingTreatment"));
    v5->_needsInactiveAppearanceTreatment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsInactiveAppearanceTreatment"));
  }

  return v5;
}

- (int64_t)wallpaperType
{
  return self->_wallpaperType;
}

- (void)setNeedsWallpaperDimmingTreatment:(BOOL)a3
{
  self->_needsWallpaperDimmingTreatment = a3;
}

- (BOOL)needsInactiveAppearanceTreatment
{
  return self->_needsInactiveAppearanceTreatment;
}

- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3
{
  self->_needsInactiveAppearanceTreatment = a3;
}

- (PBUIWallpaperImage)wallpaperImage
{
  return self->_wallpaperImage;
}

- (void)setWallpaperImage:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperImage, a3);
}

- (UIImage)wallpaperOriginalImage
{
  return self->_wallpaperOriginalImage;
}

- (void)setWallpaperOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperOriginalImage, a3);
}

- (UIImage)wallpaperThumbnailImage
{
  return self->_wallpaperThumbnailImage;
}

- (void)setWallpaperThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailImage, a3);
}

- (NSData)wallpaperThumbnailImageData
{
  return self->_wallpaperThumbnailImageData;
}

- (void)setWallpaperThumbnailImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)wallpaperImageHashData
{
  return self->_wallpaperImageHashData;
}

- (void)setWallpaperImageHashData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setWallpaperOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)proceduralWallpaperInfo
{
  return self->_proceduralWallpaperInfo;
}

- (void)setProceduralWallpaperInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)originalVideoURL
{
  return self->_originalVideoURL;
}

- (void)setOriginalVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIColor)wallpaperColor
{
  return self->_wallpaperColor;
}

- (void)setWallpaperColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)wallpaperColorName
{
  return self->_wallpaperColorName;
}

- (void)setWallpaperColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void)setWallpaperGradient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)variant
{
  return self->_variant;
}

@end
