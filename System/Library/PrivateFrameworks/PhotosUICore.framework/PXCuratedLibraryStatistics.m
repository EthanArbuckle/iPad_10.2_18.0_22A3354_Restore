@implementation PXCuratedLibraryStatistics

- (NSString)summaryDescription
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[2];
  void (*v15)(uint64_t, unint64_t);
  void *v16;
  id v17;
  PXCuratedLibraryStatistics *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  __CFString *v25;
  uint64_t v26;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke;
  aBlock[3] = &unk_1E5144A98;
  v5 = v3;
  v26 = 20;
  v24 = v5;
  v25 = CFSTR("  ");
  v6 = _Block_copy(aBlock);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_2;
  v21[3] = &unk_1E5149198;
  v7 = v5;
  v22 = v7;
  v8 = _Block_copy(v21);
  v14[0] = v4;
  v14[1] = 3221225472;
  v15 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3;
  v16 = &unk_1E513A878;
  v9 = v7;
  v19 = v6;
  v20 = v8;
  v17 = v9;
  v18 = self;
  v10 = v8;
  v11 = v6;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3((uint64_t)v14, 1uLL);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3((uint64_t)v14, 3uLL);
  v15((uint64_t)v14, 4uLL);
  v15((uint64_t)v14, 2uLL);
  v15((uint64_t)v14, 5uLL);
  v15((uint64_t)v14, 0);
  v12 = v9;

  return (NSString *)v12;
}

- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  void *v7;
  objc_class *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryStatistics.m"), 184, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCuratedLibraryStatistics numberOfAssetsWithPlaybackStyle:displayProminence:autoPlaybackEligibility:]", v9);

  abort();
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_1E5149688;
  -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v4, "stringByPaddingToLength:withString:startingAtIndex:", *(_QWORD *)(a1 + 48), CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  id v5;
  _QWORD *v6;
  void (**v7)(void *, const __CFString *, uint64_t, uint64_t);
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  id v12;
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  void (*v49)(_QWORD *, unint64_t);
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  unint64_t v54;
  _QWORD v55[2];
  uint64_t (*v56)(uint64_t, unint64_t);
  void *v57;
  id v58;

  if (a2 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *PlaybackStyleGroupDescription(PXDisplayAssetPlaybackStyle)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXCuratedLibraryStatistics.m"), 41, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("== %@ ==\n\n"), off_1E513A8C0[a2]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v4 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v56 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4;
  v57 = &unk_1E5149140;
  v58 = *(id *)(a1 + 48);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4((uint64_t)v55, 2uLL);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4((uint64_t)v55, 1uLL);
  v56((uint64_t)v55, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v48[0] = v4;
  v48[1] = 3221225472;
  v49 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5;
  v50 = &unk_1E513A7D8;
  v5 = *(id *)(a1 + 48);
  v51 = *(_QWORD *)(a1 + 40);
  v52 = v5;
  v54 = a2;
  v53 = *(id *)(a1 + 56);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5(v48, 0);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5(v48, 1uLL);
  v49(v48, 2uLL);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v13[0] = v4;
  v13[1] = 3221225472;
  v14 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7;
  v15 = &unk_1E513A828;
  v16 = *(_QWORD *)(a1 + 40);
  v17 = &v44;
  v18 = &v36;
  v19 = &v28;
  v20 = &v40;
  v21 = &v32;
  v22 = &v24;
  v23 = a2;
  v6 = v13;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7((uint64_t)v6, 0);
  v14((uint64_t)v6, 1);
  v14((uint64_t)v6, 2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_9;
  aBlock[3] = &unk_1E513A850;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v7 = (void (**)(void *, const __CFString *, uint64_t, uint64_t))_Block_copy(aBlock);
  v7[2](v7, CFSTR("Total"), v41[3], v45[3]);
  v7[2](v7, CFSTR("Large"), v33[3], v37[3]);
  v7[2](v7, CFSTR("Key"), v25[3], v29[3]);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_4(uint64_t a1, unint64_t a2)
{
  void *v3;
  void *v4;

  if (a2 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *AutoPlaybackElibilityDescription(PXCuratedLibraryAutoPlaybackElibility)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXCuratedLibraryStatistics.m"), 83, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_5(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;

  if (a2 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *DisplayProminenceDescription(PXCuratedLibraryAssetDisplayProminence)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXCuratedLibraryStatistics.m"), 62, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  (*(void (**)(void))(a1[5] + 16))();
  v9[0] = MEMORY[0x1E0C809B0];
  v10 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6;
  v11 = &unk_1E513A7B0;
  v4 = a1[7];
  v5 = (void *)a1[5];
  v12 = a1[4];
  v14 = v4;
  v15 = a2;
  v9[1] = 3221225472;
  v13 = v5;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6((uint64_t)v9, 2);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6((uint64_t)v9, 1);
  v10((uint64_t)v9, 0);
  (*(void (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], v6);

}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_7(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8;
  v9 = &unk_1E513A800;
  v12 = *(_QWORD *)(a1 + 88);
  v13 = a2;
  v4 = *(_OWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 32);
  v11 = v4;
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8((uint64_t)v7, 2);
  __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8((uint64_t)v7, 1);
  v8((uint64_t)v7, 0);
  result = objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsWithPlaybackStyle:displayProminence:autoPlaybackEligibility:", *(_QWORD *)(a1 + 88), a2, 2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += result;
  if (a2 == 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += result;
    v6 = a1 + 80;
  }
  else
  {
    if (a2 != 1)
      return result;
    v6 = a1 + 72;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24) += result;
  return result;
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a4 >= 1)
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.1f%%"), (double)a3 * 100.0 / (double)a4);
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_8(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  if (a2)
  {
    v2 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 32), "numberOfAssetsWithPlaybackStyle:displayProminence:autoPlaybackEligibility:", v2[8], v2[9], a2);
    *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 24) += result;
    v3 = v2[9];
    if (v3 == 2)
    {
      *(_QWORD *)(*(_QWORD *)(v2[6] + 8) + 24) += result;
      v4 = v2 + 7;
    }
    else
    {
      if (v3 != 1)
        return result;
      v4 = v2 + 6;
    }
    *(_QWORD *)(*(_QWORD *)(*v4 + 8) + 24) += result;
  }
  return result;
}

void __48__PXCuratedLibraryStatistics_summaryDescription__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend(*(id *)(a1 + 32), "numberOfAssetsWithPlaybackStyle:displayProminence:autoPlaybackEligibility:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 <= 0)
  {
    (*(void (**)(uint64_t, const __CFString *))(v4 + 16))(v4, &stru_1E5149688);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  }
}

@end
