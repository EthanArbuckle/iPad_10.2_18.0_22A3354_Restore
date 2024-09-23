@implementation PXStoryTransitionFactory

+ (id)effectTransitionWithInfo:(id *)a3 entityManager:(id)a4
{
  id v7;
  PXStoryTransitionRotate *v8;
  void *v9;
  __objc2_class *v10;
  int v11;
  Class *v12;
  void *v13;
  PXStoryTransitionRotate *v14;
  __int128 v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v7 = a4;
  v8 = 0;
  switch(a3->var0)
  {
    case 4:
      v9 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B29D8), "initWithEntityManager:", v7);
      v10 = PXStoryTransitionExposureBleed;
      goto LABEL_8;
    case 5:
      v11 = SBYTE5(a3->var2.var3);
      if ((v11 - 1) < 2)
      {
        v12 = (Class *)&off_1E50B2A48;
        goto LABEL_10;
      }
      if ((v11 - 3) < 2)
      {
        v12 = (Class *)&off_1E50B2DE8;
LABEL_10:
        v9 = (void *)objc_msgSend(objc_alloc(*v12), "initWithEntityManager:", v7);
        goto LABEL_11;
      }
      if (!BYTE5(a3->var2.var3))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryTransition.m"), 1062, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v9 = 0;
LABEL_11:
      v19 = *(_OWORD *)&a3->var2.var1;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v19;
      v24 = *(_QWORD *)&a3->var3;
      +[PXStoryTransitionPan panWithEffect:transitionInfo:](PXStoryTransitionPan, "panWithEffect:transitionInfo:", v9, &v22);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (PXStoryTransitionRotate *)v18;
LABEL_13:

LABEL_14:
      return v8;
    case 7:
      v9 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2C90), "initWithEntityManager:", v7);
      v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2C90), "initWithEntityManager:", v7);
      v14 = [PXStoryTransitionRotate alloc];
      v15 = *(_OWORD *)&a3->var2.var1;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v15;
      v24 = *(_QWORD *)&a3->var3;
      v8 = -[PXStoryTransitionRotate initWithTransitionInfo:effect:auxiliaryEffect:](v14, "initWithTransitionInfo:effect:auxiliaryEffect:", &v22, v9, v13);

      goto LABEL_13;
    case 9:
      v9 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2C58), "initWithEntityManager:", v7);
      v10 = PXStoryTransitionZoom;
LABEL_8:
      v16 = [v10 alloc];
      v17 = *(_OWORD *)&a3->var2.var1;
      v22 = *(_OWORD *)&a3->var0;
      v23 = v17;
      v24 = *(_QWORD *)&a3->var3;
      v18 = objc_msgSend(v16, "initWithTransitionInfo:effect:", &v22, v9);
      goto LABEL_12;
    default:
      goto LABEL_14;
  }
}

+ (id)segmentTransitionWithInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6
{
  id v11;
  NSObject *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  PXStoryTransitionCrossfade *v16;
  __int128 v17;
  __objc2_class *v18;
  void *v19;
  id v20;
  __int128 v21;
  void *v23;
  void *v24;
  const __CFString *v25;
  SEL v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  switch(a3->var0)
  {
    case 0:
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(_OWORD *)&a3->var2.var1;
        v29 = *(_OWORD *)&a3->var0;
        v30 = v13;
        v31 = *(_QWORD *)&a3->var3;
        PXStoryTransitionInfoDescription((unsigned __int8 *)&v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v29) = 138543362;
        *(_QWORD *)((char *)&v29 + 4) = v14;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "Requesting .none transition with transition info: %{public}@", (uint8_t *)&v29, 0xCu);

      }
      goto LABEL_5;
    case 1:
LABEL_5:
      +[PXStoryTransitionCut cut](PXStoryTransitionCut, "cut");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      v16 = [PXStoryTransitionCrossfade alloc];
      v17 = *(_OWORD *)&a3->var2.var1;
      v29 = *(_OWORD *)&a3->var0;
      v30 = v17;
      v31 = *(_QWORD *)&a3->var3;
      v15 = -[PXStoryTransitionCrossfade initWithTransitionInfo:event:clipLayouts:storyTransitionCurveType:](v16, "initWithTransitionInfo:event:clipLayouts:storyTransitionCurveType:", &v29, a4, v11, a6);
      goto LABEL_14;
    case 3:
      v18 = PXStoryTransitionFadeToBlack;
      goto LABEL_13;
    case 4:
      v18 = PXStoryTransitionExposureBleed;
      goto LABEL_13;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = CFSTR("Use +[PXStoryTransitionFactory panTransitionWithConfiguration:] instead.");
      v26 = a2;
      v27 = a1;
      v28 = 1115;
      goto LABEL_19;
    case 6:
      v18 = PXStoryTransitionScale;
      goto LABEL_13;
    case 7:
      v18 = PXStoryTransitionRotate;
      goto LABEL_13;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = CFSTR("Use +[PXStoryTransitionFactory wipeTransitionWithConfiguration:] instead.");
      v26 = a2;
      v27 = a1;
      v28 = 1124;
      goto LABEL_19;
    case 9:
      v18 = PXStoryTransitionZoom;
LABEL_13:
      v20 = [v18 alloc];
      v21 = *(_OWORD *)&a3->var2.var1;
      v29 = *(_OWORD *)&a3->var0;
      v30 = v21;
      v31 = *(_QWORD *)&a3->var3;
      v15 = objc_msgSend(v20, "initWithTransitionInfo:event:clipLayouts:", &v29, a4, v11);
LABEL_14:
      v19 = (void *)v15;
      break;
    case 0xA:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = CFSTR("Not a valid transition.");
      v26 = a2;
      v27 = a1;
      v28 = 1130;
LABEL_19:
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("PXStoryTransition.m"), v28, v25);

      abort();
    default:
      v19 = 0;
      break;
  }

  return v19;
}

+ (id)wipeTransitionWithConfiguration:(id)a3
{
  id v3;
  PXStoryTransitionWipe *v4;

  v3 = a3;
  v4 = -[PXStoryTransitionWipe initWithConfiguration:]([PXStoryTransitionWipe alloc], "initWithConfiguration:", v3);

  return v4;
}

+ (id)panTransitionWithConfiguration:(id)a3
{
  return +[PXStoryTransitionPan panWithConfiguration:](PXStoryTransitionPan, "panWithConfiguration:", a3);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)visibleOrderOutDurationForTransitionInfo:(SEL)a3
{
  unint64_t var0;
  int32_t v7;
  NSObject *v8;
  __int128 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  var0 = a4->var0;
  if (var0 >= 0xA)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_OWORD *)&a4->var2.var1;
      v12 = *(_OWORD *)&a4->var0;
      v13 = v10;
      v14 = *(_QWORD *)&a4->var3;
      PXStoryTransitionInfoDescription((unsigned __int8 *)&v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = 138412290;
      *(_QWORD *)((char *)&v12 + 4) = v11;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "invalid transition info %@", (uint8_t *)&v12, 0xCu);

    }
    v7 = 100;
  }
  else
  {
    v7 = dword_1A7C09498[var0];
  }
  v12 = *(_OWORD *)(&a4->var1 + 3);
  *(_QWORD *)&v13 = *(_QWORD *)&a4->var2.var2;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiplyByRatio((CMTime *)retstr, (CMTime *)&v12, v7, 100);
}

@end
