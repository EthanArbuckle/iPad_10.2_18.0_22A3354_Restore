@implementation PBUIMaterialTreatment

- (double)resolvedBackdropScale
{
  void *v3;
  double (**v4)(_QWORD);
  double v5;

  -[PBUIMaterialTreatment backdropScaleAdjustment](self, "backdropScaleAdjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -1.0;
  -[PBUIMaterialTreatment backdropScaleAdjustment](self, "backdropScaleAdjustment");
  v4 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[PBUIMaterialTreatment weighting](self, "weighting");
  v5 = v4[2](v4);

  return v5;
}

- (PBUIMaterialTreatment)initWithRecipeName:(id)a3 fromBundle:(id)a4
{
  id v6;
  id v7;
  PBUIMaterialTreatment *v8;
  uint64_t v9;
  NSString *recipeName;

  v6 = a3;
  v7 = a4;
  v8 = -[PBUIMaterialTreatment init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    recipeName = v8->_recipeName;
    v8->_recipeName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_recipeBundle, a4);
    v8->_weighting = 1.0;
    v8->_usesStaticBackdropScaleFactor = 0;
  }

  return v8;
}

- (BOOL)canInterpolateToLowerScales
{
  return 0;
}

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  double (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v10 = (void *)getMTMaterialLayerClass_softClass;
  v35 = getMTMaterialLayerClass_softClass;
  if (!getMTMaterialLayerClass_softClass)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = (uint64_t)__getMTMaterialLayerClass_block_invoke;
    v29 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B94840;
    v30 = (void (*)(uint64_t))&v32;
    __getMTMaterialLayerClass_block_invoke((uint64_t)&v26);
    v10 = (void *)v33[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v32, 8);
  if (v11)
  {
    v12 = objc_alloc_init(v11);
    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "setRecipeName:fromBundle:", self->_recipeName, self->_recipeBundle);
    objc_msgSend(v12, "setWeighting:", self->_weighting);
    v13 = MEMORY[0x1E0C809B0];
    if (self->_backdropScaleAdjustment)
    {
      v26 = 0;
      v27 = (uint64_t)&v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__4;
      v30 = __Block_byref_object_dispose__4;
      v31 = (id)MEMORY[0x1BCCA5978]();
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke;
      v23[3] = &unk_1E6B95F70;
      v25 = &v26;
      v24 = v9;
      objc_msgSend(v12, "setBackdropScaleAdjustment:", v23);

      _Block_object_dispose(&v26, 8);
    }
    v26 = 0;
    v27 = (uint64_t)&v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__4;
    v30 = __Block_byref_object_dispose__4;
    objc_msgSend(v12, "blurRadiusTransformer");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    v18 = 3221225472;
    v19 = __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke_2;
    v20 = &unk_1E6B95F98;
    v22 = &v26;
    v21 = v9;
    objc_msgSend(v12, "setBlurRadiusTransformer:", &v17);
    objc_msgSend(v8, "bounds", v17, v18, v19, v20);
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v8, "addSublayer:", v12);

    _Block_object_dispose(&v26, 8);
    goto LABEL_9;
  }
  if (a5)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D68];
    v36[0] = *MEMORY[0x1E0CB2D60];
    v36[1] = v15;
    v37[0] = CFSTR("MTMaterialLayer could not be loaded.");
    v37[1] = CFSTR("Check that the current process is able to link CoreMaterial and MaterialKit.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PaperBoardUI.PBUIRenderer"), 1, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  }
  return v11 != 0;
}

double __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = (*(double (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scaleReductionFactor");
  return v2 / v3;
}

double __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;

  v2 = (*(double (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "scaleReductionFactor");
  return v2 / v3;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v5, "setFrame:");
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setWeighting:", self->_weighting);
  objc_msgSend(v4, "setBackdropScaleAdjustment:", self->_backdropScaleAdjustment);
  objc_msgSend(v4, "setRecipeBundle:", self->_recipeBundle);
  objc_msgSend(v4, "setRecipeName:", self->_recipeName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIMaterialTreatment)initWithCoder:(id)a3
{
  id v4;
  PBUIMaterialTreatment *v5;
  uint64_t v6;
  NSString *recipeName;
  double v8;
  void *v9;
  uint64_t v10;
  NSBundle *recipeBundle;
  double v12;
  uint64_t v13;
  id backdropScaleAdjustment;
  PBUIMaterialTreatment *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PBUIMaterialTreatment init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecipeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    recipeName = v5->_recipeName;
    v5->_recipeName = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Weighting"));
    v5->_weighting = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecipeBundle_URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      recipeBundle = v5->_recipeBundle;
      v5->_recipeBundle = (NSBundle *)v10;

      if (!v5->_recipeBundle)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB28A8];
        v22 = *MEMORY[0x1E0CB3308];
        v23[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 260, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "failWithError:", v20);
        v15 = 0;
        goto LABEL_8;
      }
    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ResolvedBackdropScaleAdjustment"));
    if (v12 != -1.0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39__PBUIMaterialTreatment_initWithCoder___block_invoke;
      v21[3] = &__block_descriptor_40_e8_d16__0d8l;
      *(double *)&v21[4] = v12;
      v13 = MEMORY[0x1BCCA5978](v21);
      backdropScaleAdjustment = v5->_backdropScaleAdjustment;
      v5->_backdropScaleAdjustment = (id)v13;

    }
  }
  v15 = v5;
LABEL_8:

  return v15;
}

double __39__PBUIMaterialTreatment_initWithCoder___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)encodeWithCoder:(id)a3
{
  NSBundle *recipeBundle;
  void *v5;
  void (**backdropScaleAdjustment)(double);
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_recipeName, CFSTR("RecipeName"));
  recipeBundle = self->_recipeBundle;
  if (recipeBundle)
  {
    -[NSBundle bundleURL](recipeBundle, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("RecipeBundle_URL"));

  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("RecipeBundle_URL"));
  }
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("Weighting"), self->_weighting);
  backdropScaleAdjustment = (void (**)(double))self->_backdropScaleAdjustment;
  if (backdropScaleAdjustment)
    backdropScaleAdjustment[2](self->_weighting);
  else
    v7 = -1.0;
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("ResolvedBackdropScaleAdjustment"), v7);

}

- (NSString)description
{
  return (NSString *)-[PBUIMaterialTreatment descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIMaterialTreatment descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_recipeName, CFSTR("recipe"));
  v5 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("weighting"), 3, self->_weighting);
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_recipeBundle, CFSTR("bundle"), 1);
  -[PBUIMaterialTreatment resolvedBackdropScale](self, "resolvedBackdropScale");
  if (v7 >= 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[PBUIMaterialTreatment resolvedBackdropScale](self, "resolvedBackdropScale");
    v10 = v9;
    v11 = -[PBUIMaterialTreatment usesStaticBackdropScaleFactor](self, "usesStaticBackdropScaleFactor");
    v12 = CFSTR("depends-on-weight");
    if (v11)
      v12 = CFSTR("fixed");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%f (%@)"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v13, CFSTR("backdropScale"));

  }
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIMaterialTreatment succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSString)recipeName
{
  return self->_recipeName;
}

- (void)setRecipeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSBundle)recipeBundle
{
  return self->_recipeBundle;
}

- (void)setRecipeBundle:(id)a3
{
  objc_storeStrong((id *)&self->_recipeBundle, a3);
}

- (double)weighting
{
  return self->_weighting;
}

- (void)setWeighting:(double)a3
{
  self->_weighting = a3;
}

- (id)backdropScaleAdjustment
{
  return self->_backdropScaleAdjustment;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)usesStaticBackdropScaleFactor
{
  return self->_usesStaticBackdropScaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backdropScaleAdjustment, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeName, 0);
}

@end
