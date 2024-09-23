@implementation PXPhotoLibraryProcessingProgressReport

+ (id)colorForNotEnriched
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
}

+ (id)colorForDefault
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
}

+ (id)colorForPartial
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.65, 0.8, 0.0, 1.0);
}

+ (id)colorForSceneComplete
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.45, 0.8, 0.0, 1.0);
}

+ (id)colorForComplete
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.8, 0.0, 1.0);
}

+ (void)requestBriefDescriptionForLibrary:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D77E90];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke;
  v11[3] = &unk_1E5134110;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "requestProcessingProgressForLibrary:result:", v10, v11);

}

+ (void)requestFullDescriptionForLibrary:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D77E90];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke;
  v11[3] = &unk_1E5134110;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "requestProcessingProgressForLibrary:result:", v9, v11);

}

+ (id)_processingProgressDescription:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t var1;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3->var0 - a3->var2 < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%%\n"), CFSTR("Scenes 🏞:"), *(_QWORD *)&a3->var6, v16, v20);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%% (%lu/%lu pending)\n"), CFSTR("Scenes 🏞:"), *(_QWORD *)&a3->var6, a3->var0 - a3->var2, a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->var0 - a3->var3 < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%%\n"), CFSTR("Faces 🧑:"), *(_QWORD *)&a3->var7, v17, v21);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%% (%lu/%lu pending)\n"), CFSTR("Faces 🧑:"), *(_QWORD *)&a3->var7, a3->var0 - a3->var3, a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3->var0 - a3->var4 < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%%\n"), CFSTR("MediaAnalysis (image):"), *(_QWORD *)&a3->var8, v18, v22);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%% (%lu/%lu pending)\n"), CFSTR("MediaAnalysis (image):"), *(_QWORD *)&a3->var8, a3->var0 - a3->var4, a3->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var1;
  if (var1 - a3->var5 < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%%\n"), CFSTR("MediaAnalysis (video):"), *(_QWORD *)&a3->var9, v19, v23);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%% (%lu/%lu pending)\n"), CFSTR("MediaAnalysis (video):"), *(_QWORD *)&a3->var9, var1 - a3->var5, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
  objc_msgSend(v10, "appendAttributedString:", v11);

  objc_msgSend(v10, "appendAttributedString:", v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
  objc_msgSend(v10, "appendAttributedString:", v12);

  objc_msgSend(v10, "appendAttributedString:", v9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  objc_msgSend(v10, "appendAttributedString:", v13);

  objc_msgSend(v10, "appendAttributedString:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  objc_msgSend(v10, "appendAttributedString:", v14);

  objc_msgSend(v10, "appendAttributedString:", v9);
  return v10;
}

+ (id)_syndicationProgressDescription:(id *)a3
{
  void *v4;
  id v5;
  void (**v6)(void *, uint64_t, int64_t, void *);
  int64_t var1;
  void *v8;
  int64_t var2;
  void *v10;
  int64_t var3;
  void *v12;
  int64_t var4;
  void *v14;
  int64_t var5;
  void *v16;
  int64_t var6;
  void *v18;
  int64_t var7;
  void *v20;
  int64_t var8;
  void *v22;
  int64_t var9;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t aBlock;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, void *);
  void *v33;
  id v34;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("Syndication Summary:\n"));
  aBlock = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __74__PXPhotoLibraryProcessingProgressReport__syndicationProgressDescription___block_invoke;
  v33 = &unk_1E5134138;
  v5 = v4;
  v34 = v5;
  v6 = (void (**)(void *, uint64_t, int64_t, void *))_Block_copy(&aBlock);
  var1 = a3->var1;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -6, var1, v8);

  var2 = a3->var2;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -5, var2, v10);

  var3 = a3->var3;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -4, var3, v12);

  var4 = a3->var4;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -3, var4, v14);

  var5 = a3->var5;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -2, var5, v16);

  var6 = a3->var6;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, -1, var6, v18);

  var7 = a3->var7;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkRedColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, var7, v20);

  var8 = a3->var8;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkTealColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 1, var8, v22);

  var9 = a3->var9;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGreenColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 2, var9, v24);

  v25 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tTotal: %lu\n"), a3->var0, aBlock, v31, v32, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithString:", v26);

  objc_msgSend(v5, "appendAttributedString:", v27);
  v28 = v5;

  return v28;
}

+ (id)_highlightEnrichmentProgressDescription:(id *)a3
{
  unint64_t v5;
  void *v6;
  uint64_t *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v5 = 0x1E0CB3000uLL;
  if (a3->var0 - a3->var1 < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%%\n"), CFSTR("Highlights:"), *(_QWORD *)&a3->var6, v39, v40);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\t%2.1f%% (%lu/%lu pending)\n"), CFSTR("Highlights:"), *(_QWORD *)&a3->var6, a3->var0 - a3->var1, a3->var0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v42);
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  objc_msgSend(v6, "appendAttributedString:");
  v7 = (uint64_t *)MEMORY[0x1E0DC1140];
  if (a3->var5 >= 1)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tNot Enriched: %lu\n"), a3->var5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *v7;
    objc_msgSend(a1, "colorForNotEnriched");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v11);

    v5 = 0x1E0CB3000uLL;
    objc_msgSend(v6, "appendAttributedString:", v12);

  }
  if (a3->var4 >= 1)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tMetadata Only: %lu\n"), a3->var4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *v7;
    objc_msgSend(a1, "colorForDefault");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v16);

    v5 = 0x1E0CB3000uLL;
    objc_msgSend(v6, "appendAttributedString:", v17);

  }
  if (a3->var3 >= 1)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tMetadata and Score: %lu\n"), a3->var3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *v7;
    objc_msgSend(a1, "colorForPartial");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v21);

    v5 = 0x1E0CB3000uLL;
    objc_msgSend(v6, "appendAttributedString:", v22);

  }
  if (a3->var2 <= 0)
  {
    v25 = *v7;
  }
  else
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tMetadata and Scenes: %lu\n"), a3->var2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v7;
    v45 = v25;
    objc_msgSend(a1, "colorForSceneComplete");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v23, "initWithString:attributes:", v24, v27);

    v5 = 0x1E0CB3000;
    objc_msgSend(v6, "appendAttributedString:", v28);

  }
  v29 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("\tComplete: %lu\n"), a3->var1);
  v30 = v5;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v25;
  objc_msgSend(a1, "colorForComplete");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v29, "initWithString:attributes:", v31, v33);

  objc_msgSend(v6, "appendAttributedString:", v34);
  v35 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(*(id *)(v30 + 2368), "stringWithFormat:", CFSTR("\tTotal: %lu\n"), a3->var0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithString:", v36);

  objc_msgSend(v6, "appendAttributedString:", v37);
  return v6;
}

+ (id)highlightEnrichmentProgressImageWithProgressReport:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v16;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 150.0, 40.0);
  v18[1] = 3221225472;
  v6 = *(_OWORD *)&a3->var0;
  v7 = *(_OWORD *)&a3->var2;
  v19 = xmmword_1A7BB4BE0;
  v20 = v6;
  v8 = *(_OWORD *)&a3->var4;
  v9 = *(_OWORD *)&a3->var6;
  v21 = v7;
  v22 = v8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __93__PXPhotoLibraryProcessingProgressReport_highlightEnrichmentProgressImageWithProgressReport___block_invoke;
  v18[3] = &__block_descriptor_184_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v18[4] = a1;
  v23 = v9;
  v24 = xmmword_1A7BB4BF0;
  __asm { FMOV            V0.2D, #4.0 }
  v25 = _Q0;
  v26 = xmmword_1A7BB4C00;
  __asm { FMOV            V0.2D, #2.0 }
  v27 = _Q0;
  objc_msgSend(v5, "imageWithActions:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)syndicationProgressImageWithProgressReport:(id *)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v15;
  _QWORD v17[4];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 150.0, 40.0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__PXPhotoLibraryProcessingProgressReport_syndicationProgressImageWithProgressReport___block_invoke;
  v17[3] = &__block_descriptor_192_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v5 = *(_OWORD *)&a3->var4;
  v6 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)&a3->var0;
  v20 = *(_OWORD *)&a3->var2;
  v21 = v5;
  v8 = *(_OWORD *)&a3->var8;
  v22 = v6;
  v23 = v8;
  v18 = xmmword_1A7BB4BE0;
  v19 = v7;
  __asm { FMOV            V1.2D, #4.0 }
  v24 = xmmword_1A7BB4BF0;
  v25 = _Q1;
  __asm { FMOV            V1.2D, #2.0 }
  v26 = xmmword_1A7BB4C00;
  v27 = _Q1;
  objc_msgSend(v4, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __85__PXPhotoLibraryProcessingProgressReport_syndicationProgressImageWithProgressReport___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  CGPath *Mutable;
  double x;
  double y;
  double width;
  double height;
  char v37;
  char v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v39 = a2;
  v3 = (CGContext *)objc_msgSend(v39, "CGContext");
  v4 = *(double *)(a1 + 32);
  v5 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 56) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v6, "CGColor"));

  objc_msgSend(v39, "fillRect:", v4, *(double *)(a1 + 128), v5, *(double *)(a1 + 136));
  v7 = v4 + v5;
  v8 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 64) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v9, "CGColor"));

  objc_msgSend(v39, "fillRect:", v7, *(double *)(a1 + 128), v8, *(double *)(a1 + 136));
  v10 = v7 + v8;
  v11 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 72) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v12, "CGColor"));

  objc_msgSend(v39, "fillRect:", v10, *(double *)(a1 + 128), v11, *(double *)(a1 + 136));
  v13 = v10 + v11;
  v14 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 80) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v15, "CGColor"));

  objc_msgSend(v39, "fillRect:", v13, *(double *)(a1 + 128), v14, *(double *)(a1 + 136));
  v16 = v13 + v14;
  v17 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 88) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v18, "CGColor"));

  objc_msgSend(v39, "fillRect:", v16, *(double *)(a1 + 128), v17, *(double *)(a1 + 136));
  v19 = v16 + v17;
  v20 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 96) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v21, "CGColor"));

  objc_msgSend(v39, "fillRect:", v19, *(double *)(a1 + 128), v20, *(double *)(a1 + 136));
  v22 = v19 + v20;
  v23 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 104) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v24, "CGColor"));

  objc_msgSend(v39, "fillRect:", v22, *(double *)(a1 + 128), v23, *(double *)(a1 + 136));
  v25 = v22 + v23;
  v26 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 112) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v27, "CGColor"));

  objc_msgSend(v39, "fillRect:", v25, *(double *)(a1 + 128), v26, *(double *)(a1 + 136));
  v28 = v25 + v26;
  v29 = *(double *)(a1 + 40) * (double)*(uint64_t *)(a1 + 120) / (double)*(uint64_t *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v30, "CGColor"));

  objc_msgSend(v39, "fillRect:", v28, *(double *)(a1 + 128), v29, *(double *)(a1 + 136));
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v31, "CGColor"));

  Mutable = CGPathCreateMutable();
  x = *(double *)(a1 + 144);
  y = *(double *)(a1 + 152);
  width = *(double *)(a1 + 160) + x * -2.0;
  height = *(double *)(a1 + 168) + y * -2.0;
  v37 = 1;
  do
  {
    v38 = v37;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    CGPathAddRoundedRect(Mutable, 0, v40, *(double *)(a1 + 176) + 1.0, *(double *)(a1 + 184) + 1.0);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v42 = CGRectInset(v41, 0.5, 0.5);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    v37 = 0;
  }
  while ((v38 & 1) != 0);
  CGContextBeginPath(v3);
  CGContextAddPath(v3, Mutable);
  CGContextClosePath(v3);
  CGContextStrokePath(v3);
  CGPathRelease(Mutable);

}

void __93__PXPhotoLibraryProcessingProgressReport_highlightEnrichmentProgressImageWithProgressReport___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  CGPath *Mutable;
  double x;
  double y;
  double width;
  double height;
  char v25;
  char v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v27 = a2;
  v3 = (CGContext *)objc_msgSend(v27, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "colorForNotEnriched");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 96) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(v27, "fillRect:", v5, *(double *)(a1 + 120), v6, *(double *)(a1 + 128));
  v7 = v5 + v6;
  v8 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 88) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "colorForDefault");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v9, "CGColor"));

  objc_msgSend(v27, "fillRect:", v7, *(double *)(a1 + 120), v8, *(double *)(a1 + 128));
  v10 = v7 + v8;
  v11 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 80) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "colorForPartial");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v12, "CGColor"));

  objc_msgSend(v27, "fillRect:", v10, *(double *)(a1 + 120), v11, *(double *)(a1 + 128));
  v13 = v10 + v11;
  v14 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 72) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "colorForSceneComplete");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v15, "CGColor"));

  objc_msgSend(v27, "fillRect:", v13, *(double *)(a1 + 120), v14, *(double *)(a1 + 128));
  v16 = v13 + v14;
  v17 = *(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 64) / (double)*(uint64_t *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "colorForComplete");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v18, "CGColor"));

  objc_msgSend(v27, "fillRect:", v16, *(double *)(a1 + 120), v17, *(double *)(a1 + 128));
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v19, "CGColor"));

  Mutable = CGPathCreateMutable();
  x = *(double *)(a1 + 136);
  y = *(double *)(a1 + 144);
  width = *(double *)(a1 + 152) + x * -2.0;
  height = *(double *)(a1 + 160) + y * -2.0;
  v25 = 1;
  do
  {
    v26 = v25;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    CGPathAddRoundedRect(Mutable, 0, v28, *(double *)(a1 + 168) + 1.0, *(double *)(a1 + 176) + 1.0);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v30 = CGRectInset(v29, 0.5, 0.5);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    v25 = 0;
  }
  while ((v26 & 1) != 0);
  CGContextBeginPath(v3);
  CGContextAddPath(v3, Mutable);
  CGContextClosePath(v3);
  CGContextStrokePath(v3);
  CGPathRelease(Mutable);

}

void __74__PXPhotoLibraryProcessingProgressReport__syndicationProgressDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = [v6 alloc];
  v9 = (void *)MEMORY[0x1E0CB3940];
  PHAssetSyndicationEligibilityShortDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\t%@: %lu\n"), v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1140];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v13);
}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD aBlock[4];
  id v23;
  id v24;
  _OWORD v25[5];

  v3 = *(void **)(a1 + 48);
  v4 = a2[3];
  v25[2] = a2[2];
  v25[3] = v4;
  v25[4] = a2[4];
  v5 = a2[1];
  v25[0] = *a2;
  v25[1] = v5;
  objc_msgSend(v3, "_processingProgressDescription:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_2;
  aBlock[3] = &unk_1E5134098;
  v8 = v6;
  v23 = v8;
  v24 = *(id *)(a1 + 40);
  v9 = _Block_copy(aBlock);
  v10 = objc_msgSend(*(id *)(a1 + 32), "wellKnownPhotoLibraryIdentifier");
  v11 = (void *)MEMORY[0x1E0D77E90];
  v12 = *(_QWORD *)(a1 + 32);
  if (v10 == 3)
  {
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_4;
    v20[3] = &unk_1E51340C0;
    v13 = *(_QWORD *)(a1 + 48);
    v14 = (id *)v21;
    v21[0] = v9;
    v21[1] = v13;
    v15 = v9;
    objc_msgSend(v11, "requestSyndicationProgressForLibrary:result:", v12, v20);
  }
  else
  {
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_5;
    v18[3] = &unk_1E51340E8;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = (id *)v19;
    v19[0] = v9;
    v19[1] = v16;
    v17 = v9;
    objc_msgSend(v11, "requestHighlightEnrichmentProgressForLibrary:result:", v12, v18);
  }

}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "appendAttributedString:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "appendAttributedString:", v4);

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setAlignment:", 0);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, 0, objc_msgSend(v5, "length"));
  v8 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v5, "length"));

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_3;
  v12[3] = &unk_1E5148CE0;
  v10 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = v10;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  _OWORD v7[5];

  v3 = *(void **)(a1 + 40);
  v4 = a2[3];
  v7[2] = a2[2];
  v7[3] = v4;
  v7[4] = a2[4];
  v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  objc_msgSend(v3, "_syndicationProgressDescription:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_5(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  _OWORD v7[4];

  v3 = *(void **)(a1 + 40);
  v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  v5 = a2[3];
  v7[2] = a2[2];
  v7[3] = v5;
  objc_msgSend(v3, "_highlightEnrichmentProgressDescription:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __87__PXPhotoLibraryProcessingProgressReport_requestFullDescriptionForLibrary_resultBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;
  id *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  void *v16;
  __int128 v17;
  _QWORD v18[4];
  void *v19;
  __int128 v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🏞: %2.0f%%  🧑: %2.0f%%"), *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "wellKnownPhotoLibraryIdentifier");
  v5 = (void *)MEMORY[0x1E0D77E90];
  v6 = *(_QWORD *)(a1 + 32);
  if (v4 == 3)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_2;
    v18[3] = &unk_1E5134048;
    v7 = (id *)&v20;
    v13 = *(_OWORD *)(a1 + 40);
    v8 = (id)v13;
    v20 = v13;
    v9 = &v19;
    v19 = v3;
    v10 = v3;
    objc_msgSend(v5, "requestSyndicationProgressForLibrary:result:", v6, v18);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_4;
    v15[3] = &unk_1E5134070;
    v7 = (id *)&v17;
    v14 = *(_OWORD *)(a1 + 40);
    v11 = (id)v14;
    v17 = v14;
    v9 = &v16;
    v16 = v3;
    v12 = v3;
    objc_msgSend(v5, "requestHighlightEnrichmentProgressForLibrary:result:", v6, v15);
  }

}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  _OWORD v12[5];

  v3 = *(void **)(a1 + 48);
  v4 = a2[3];
  v12[2] = a2[2];
  v12[3] = v4;
  v12[4] = a2[4];
  v5 = a2[1];
  v12[0] = *a2;
  v12[1] = v5;
  objc_msgSend(v3, "syndicationProgressImageWithProgressReport:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_3;
  block[3] = &unk_1E5145688;
  v11 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  _OWORD v12[4];

  v3 = *(void **)(a1 + 48);
  v4 = a2[1];
  v12[0] = *a2;
  v12[1] = v4;
  v5 = a2[3];
  v12[2] = a2[2];
  v12[3] = v5;
  objc_msgSend(v3, "highlightEnrichmentProgressImageWithProgressReport:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_5;
  block[3] = &unk_1E5145688;
  v11 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __88__PXPhotoLibraryProcessingProgressReport_requestBriefDescriptionForLibrary_resultBlock___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
