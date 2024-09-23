@implementation IPALocalPreviewSizeRegistry

- (IPALocalPreviewSizeRegistry)init
{
  IPALocalPreviewSizeRegistry *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  IPAPreviewSizePolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IPAPreviewSizePolicy *v15;
  void *v16;
  void *v17;
  IPAPreviewSizePolicy *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  IPAPreviewSizePolicy *v23;
  void *v24;
  void *v25;
  IPAPreviewSizePolicy *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  IPAPreviewSizePolicy *v31;
  void *v32;
  void *v33;
  IPAPreviewSizePolicy *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  IPAPreviewSizePolicy *v39;
  void *v40;
  void *v41;
  IPAPreviewSizePolicy *v42;
  void *v43;
  IPAPreviewSizePolicy *v44;
  void *v45;
  void *v46;
  void *v47;
  IPAPreviewSizePolicy *v48;
  objc_super v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)IPALocalPreviewSizeRegistry;
  v2 = -[IPAPreviewSizeRegistry initWithName:](&v50, sel_initWithName_, CFSTR("Local"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__32s"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("__32s_422"));

  if (v6)
  {
    +[IPAImageSizePolicy bestFitPolicyWithEvenWidthTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithEvenWidthTotalPixelCount:", 1020);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      v8 = 1024;
    else
      v8 = 4096;
    +[IPAImageSizePolicy bestFitPolicyWithTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithTotalPixelCount:", v8);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  v10 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:]([IPAPreviewSizePolicy alloc], "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleMicro"), &unk_1E9876BE0, v7, &__block_literal_global_521, &__block_literal_global_50);
  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v10);
  +[IPAImageSizePolicy bestFitPolicyWithTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithTotalPixelCount:", 12288);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v11;
  +[IPAImageSizePolicy bestFitPolicyInSquare:](IPAImageSizePolicy, "bestFitPolicyInSquare:", 128.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPAImageSizePolicy largestPolicyWithPolicies:](IPAImageSizePolicy, "largestPolicyWithPolicies:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [IPAPreviewSizePolicy alloc];
  thresholdForSizePolicy(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  thresholdForSizePolicy(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](v15, "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleTiny"), &unk_1E9876BF8, v14, v16, v17);

  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v18);
  +[IPAImageSizePolicy bestFitPolicyWithTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithTotalPixelCount:", 97200);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v19;
  +[IPAImageSizePolicy bestFitPolicyInSquare:](IPAImageSizePolicy, "bestFitPolicyInSquare:", 360.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPAImageSizePolicy largestPolicyWithPolicies:](IPAImageSizePolicy, "largestPolicyWithPolicies:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [IPAPreviewSizePolicy alloc];
  thresholdForSizePolicy(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  thresholdForSizePolicy(v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](v23, "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleMini"), &unk_1E9876C10, v22, v24, v25);

  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v26);
  +[IPAImageSizePolicy bestFitPolicyWithTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithTotalPixelCount:", 786432);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v27;
  +[IPAImageSizePolicy bestFitPolicyInSquare:](IPAImageSizePolicy, "bestFitPolicyInSquare:", 1024.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPAImageSizePolicy largestPolicyWithPolicies:](IPAImageSizePolicy, "largestPolicyWithPolicies:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [IPAPreviewSizePolicy alloc];
  thresholdForSizePolicy(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  thresholdForSizePolicy(v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](v31, "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleThumbnail"), &unk_1E9876C28, v30, v32, v33);

  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v34);
  +[IPAImageSizePolicy bestFitPolicyWithTotalPixelCount:](IPAImageSizePolicy, "bestFitPolicyWithTotalPixelCount:", 15725430);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v35;
  +[IPAImageSizePolicy bestFitPolicyInSquare:](IPAImageSizePolicy, "bestFitPolicyInSquare:", 4579.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPAImageSizePolicy largestPolicyWithPolicies:](IPAImageSizePolicy, "largestPolicyWithPolicies:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = [IPAPreviewSizePolicy alloc];
  thresholdForSizePolicy(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  thresholdForSizePolicy(v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](v39, "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleLargePreview"), &unk_1E9876C40, v38, v40, v41);

  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v42);
  +[IPAImageSizePolicy originalSizePolicy](IPAImageSizePolicy, "originalSizePolicy");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:]([IPAPreviewSizePolicy alloc], "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleFullSizePreview"), &unk_1E9876C58, v43, &__block_literal_global_58, &__block_literal_global_60);
  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v44);
  +[IPAImageSizePolicy bestFitPolicyInSquare:](IPAImageSizePolicy, "bestFitPolicyInSquare:", 480.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPAImageSizePolicy largestPolicyWithPolicies:](IPAImageSizePolicy, "largestPolicyWithPolicies:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:]([IPAPreviewSizePolicy alloc], "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", CFSTR("RKImageStyleFaceTile"), &unk_1E9876C70, v47, &__block_literal_global_63, &__block_literal_global_65);
  -[IPAPreviewSizeRegistry addPolicy:](v2, "addPolicy:", v48);

  return v2;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke_2_64()
{
  return 0;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke_62()
{
  return 0;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke_2_59()
{
  return 1;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke_57()
{
  return 1;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke_2()
{
  return 1;
}

uint64_t __35__IPALocalPreviewSizeRegistry_init__block_invoke()
{
  return 1;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__IPALocalPreviewSizeRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __45__IPALocalPreviewSizeRegistry_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

@end
