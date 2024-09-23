@implementation PXStoryMomentRecipeProvider

- (PXStoryMomentRecipeProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 193, CFSTR("%s is not available as initializer"), "-[PXStoryMomentRecipeProvider init]");

  abort();
}

- (PXStoryMomentRecipeProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXStoryMomentRecipeProvider *v14;
  PXStoryMomentRecipeProvider *v15;
  PXStoryMomentRecipeState *v16;
  PXStoryMomentRecipeState *state;
  uint64_t v18;
  NSMutableDictionary *clipDebugInfos;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryMomentRecipeProvider;
  v14 = -[PXStoryMomentRecipeProvider init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    v15->_songPace = a5;
    objc_storeStrong((id *)&v15->_colorGradeCategory, a4);
    v16 = -[PXStoryMomentRecipeState initWithRandomNumberGenerator:]([PXStoryMomentRecipeState alloc], "initWithRandomNumberGenerator:", v13);
    state = v15->_state;
    v15->_state = v16;

    v18 = objc_opt_new();
    clipDebugInfos = v15->_clipDebugInfos;
    v15->_clipDebugInfos = (NSMutableDictionary *)v18;

  }
  return v15;
}

- (BOOL)_isSongEnergetic
{
  int64_t songPace;
  NSString *colorGradeCategory;
  double v4;

  songPace = self->_songPace;
  if (songPace == 3)
  {
    LOBYTE(colorGradeCategory) = 1;
  }
  else if (songPace == 1)
  {
    LOBYTE(colorGradeCategory) = 0;
  }
  else
  {
    colorGradeCategory = self->_colorGradeCategory;
    if (colorGradeCategory)
    {
      PFStoryColorGradeCategoryGetArousal();
      LOBYTE(colorGradeCategory) = v4 > 0.5;
    }
  }
  return (char)colorGradeCategory;
}

- (int64_t)_incomingTransitionKindForRecipe:(unint64_t)a3
{
  void *v6;

  switch(a3)
  {
    case 0uLL:
      return a3;
    case 1uLL:
    case 6uLL:
      a3 = 6;
      break;
    case 2uLL:
      a3 = 7;
      break;
    case 3uLL:
      a3 = 5;
      break;
    case 4uLL:
    case 7uLL:
    case 8uLL:
      if (-[PXStoryMomentRecipeProvider _isSongEnergetic](self, "_isSongEnergetic"))
        a3 = 4;
      else
        a3 = 3;
      break;
    case 5uLL:
      a3 = 8;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 259, CFSTR("Unhandled case"));

      abort();
  }
  return a3;
}

- (int64_t)_innerTransitionKindForRecipe:(unint64_t)a3
{
  if (a3 == 6)
    return 6;
  else
    return 1;
}

- (int64_t)_motionStyleForRecipe:(unint64_t)a3
{
  void *v6;

  if (a3 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 292, CFSTR("Unhandled case"));

    abort();
  }
  return qword_1A7C09510[a3];
}

- (id)_recipeFromRecipeType:(unint64_t)a3 previousClip:(id)a4
{
  id v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int16 v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned __int16 v19;
  unint64_t v20;
  PXStoryAutoEditMomentRecipe *v21;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD aBlock[4];
  id v29;
  PXStoryMomentRecipeProvider *v30;

  v7 = a4;
  v8 = -[PXStoryMomentRecipeProvider _incomingTransitionKindForRecipe:](self, "_incomingTransitionKindForRecipe:", a3);
  v9 = -[PXStoryMomentRecipeProvider _innerTransitionKindForRecipe:](self, "_innerTransitionKindForRecipe:", a3);
  v10 = -[PXStoryMomentRecipeProvider _motionStyleForRecipe:](self, "_motionStyleForRecipe:", a3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXStoryMomentRecipeProvider__recipeFromRecipeType_previousClip___block_invoke;
  aBlock[3] = &unk_1E511CE30;
  v11 = v7;
  v29 = v11;
  v30 = self;
  v12 = _Block_copy(aBlock);
  v24 = v12;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 319, CFSTR("Undefined moment recipe type"));

      abort();
    case 1uLL:
    case 6uLL:
    case 7uLL:
      v13 = (*((uint64_t (**)(void *))v12 + 2))(v12);
      goto LABEL_8;
    case 2uLL:
      v16 = -[PXStoryMomentRecipeState nextRotateDirection](self->_state, "nextRotateDirection", v12);
      v15 = 0;
      goto LABEL_6;
    case 3uLL:
    case 8uLL:
      v14 = -[PXStoryMomentRecipeState nextPanDirection](self->_state, "nextPanDirection", v12);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_10;
    case 4uLL:
      v13 = -[PXStoryMomentRecipeState nextScaleDirection](self->_state, "nextScaleDirection", v12);
LABEL_8:
      v17 = v13;
      v15 = 0;
      v16 = 0;
      goto LABEL_9;
    case 5uLL:
      v16 = 0;
      v14 = 0;
      v17 = 1;
      v15 = 1;
      goto LABEL_10;
    default:
      v15 = 0;
      v16 = 0;
LABEL_6:
      v17 = 0;
LABEL_9:
      v14 = 0;
LABEL_10:
      switch(v8)
      {
        case 5:
          v18 = v14 & 0xFFFFFFFFFFFF0000;
          v19 = v14;
          break;
        case 6:
          v18 = v17 & 0xFFFFFFFFFFFF0000;
          v19 = v17;
          break;
        case 7:
          v18 = v16 & 0xFFFFFFFFFFFF0000;
          v19 = v16;
          break;
        case 8:
          v18 = 0;
          v19 = v15;
          break;
        default:
          v19 = 0;
          v18 = 0;
          break;
      }
      switch(v9)
      {
        case 5:
          v20 = v14 & 0xFFFFFFFFFFFF0000;
          v15 = v14;
          break;
        case 6:
          v20 = v17 & 0xFFFFFFFFFFFF0000;
          v15 = v17;
          break;
        case 7:
          v20 = v16 & 0xFFFFFFFFFFFF0000;
          v15 = v16;
          break;
        case 8:
          goto LABEL_19;
        default:
          v15 = 0;
LABEL_19:
          v20 = 0;
          break;
      }
      if (v10 == 3)
      {
        v17 = v16;
      }
      else if (v10 != 2)
      {
        if (v10 == 1)
          v17 = v14;
        else
          v17 = 0;
      }
      v27[0] = v8;
      v27[1] = 0;
      v27[2] = v18 | v19;
      v27[3] = 0;
      v26[0] = v9;
      v26[1] = 0;
      v26[2] = v20 | v15;
      v26[3] = 0;
      v25[0] = v10;
      v25[1] = v17;
      v25[2] = 0;
      v21 = -[PXStoryAutoEditMomentRecipe initWithRecipeType:incomingTransition:innerTransition:motion:]([PXStoryAutoEditMomentRecipe alloc], "initWithRecipeType:incomingTransition:innerTransition:motion:", a3, v27, v26, v25);

      return v21;
  }
}

- (id)_nextBaseMomentRecipeWithPreviousClip:(id)a3
{
  PXStoryMomentRecipeState *state;
  id v5;
  void *v6;

  state = self->_state;
  v5 = a3;
  -[PXStoryMomentRecipeProvider _recipeFromRecipeType:previousClip:](self, "_recipeFromRecipeType:previousClip:", -[PXStoryMomentRecipeState nextBaseMomentRecipe](state, "nextBaseMomentRecipe"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_nextNUpRevealRecipeWithPreviousClip:(id)a3
{
  return -[PXStoryMomentRecipeProvider _recipeFromRecipeType:previousClip:](self, "_recipeFromRecipeType:previousClip:", 5, a3);
}

- (id)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4
{
  NSUInteger length;
  char *location;
  id v7;
  unint64_t v8;
  void *v9;

  length = a3.length;
  location = (char *)a3.location;
  v7 = a4;
  v8 = -[PXStoryMomentRecipeState _nextModuleRecipeWithModuleClipRange:clipCatalog:](self->_state, "_nextModuleRecipeWithModuleClipRange:clipCatalog:", location, length, v7);
  if (location)
  {
    objc_msgSend(v7, "clipAtIndex:", location - 1);
    location = (char *)objc_claimAutoreleasedReturnValue();
  }
  -[PXStoryMomentRecipeProvider _recipeFromRecipeType:previousClip:](self, "_recipeFromRecipeType:previousClip:", v8, location);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_nextSingleAssetRecipeWithPreviousClip:(id)a3
{
  PXStoryMomentRecipeState *state;
  id v5;
  void *v6;

  state = self->_state;
  v5 = a3;
  -[PXStoryMomentRecipeProvider _recipeFromRecipeType:previousClip:](self, "_recipeFromRecipeType:previousClip:", -[PXStoryMomentRecipeState nextSingleAssetMomentRecipe](state, "nextSingleAssetMomentRecipe"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- ($CB94F14F4A03AD88347CF1141E14C943)_nextEmptySpaceBreakTransitionForMotion:(SEL)a3
{
  $CB94F14F4A03AD88347CF1141E14C943 *result;
  $5767588AEF0F8E3E6A6260ECEE6A0599 var1;
  int64_t v10;
  unint64_t var0;
  int64_t v12;
  void *v13;

  result = ($CB94F14F4A03AD88347CF1141E14C943 *)-[PXStoryMomentRecipeProvider _isSongEnergetic](self, "_isSongEnergetic");
  if ((_DWORD)result)
  {
    switch(a4->var0)
    {
      case 0:
      case 1:
        var1 = a4->var1;
        *(_OWORD *)&retstr->var0 = xmmword_1A7BE9010;
        retstr->var2 = ($68806D11CD65D8BE2A2DEF98801EDCF4)var1;
        return result;
      case 2:
        var0 = a4->var1.var0.var0;
        v12 = 6;
        goto LABEL_9;
      case 3:
        var0 = a4->var1.var0.var0;
        v12 = 7;
LABEL_9:
        retstr->var0 = v12;
        retstr->var1 = 0.0;
        retstr->var2.var0.var0 = var0;
        retstr->var2.var0.var1 = 0;
        return result;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryMomentRecipeProvider.m"), 399, CFSTR("Invalid motion style"));

        abort();
      default:
        v10 = 0;
        goto LABEL_5;
    }
  }
  v10 = 2;
LABEL_5:
  retstr->var0 = v10;
  retstr->var1 = 0.0;
  retstr->var2.var0.var0 = 0;
  retstr->var2.var0.var1 = 0;
  return result;
}

- (_NSRange)_rangeOfLength:(int64_t)a3 centeredOnIndex:(int64_t)a4 withinRange:(_NSRange)a5
{
  NSUInteger length;
  int64_t location;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  if (a4 < a5.location || a4 - a5.location >= a5.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSLocationInRange(centerIdx, range)"));

  }
  v11 = location + length;
  if (a3 >= 0)
    v12 = a3;
  else
    v12 = a3 + 1;
  v13 = a4 - (v12 >> 1);
  if (v13 <= location)
    v14 = location;
  else
    v14 = v13;
  if (v13 + a3 < v11)
    v11 = v13 + a3;
  v15 = v11 - v14;
  result.length = v15;
  result.location = v14;
  return result;
}

- (void)provideRecipeForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSUInteger v34;
  void *v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  void *v41;
  void *v42;
  unint64_t v43;
  __CFString *v44;
  __CFString *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  _BOOL8 v56;
  _BOOL8 v57;
  unint64_t v58;
  char v59;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  __CFString *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  __CFString *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSUInteger v82;
  void *v83;
  char v84;
  void *v85;
  __CFString *v86;
  unint64_t v87;
  __CFString *v88;
  __CFString *v89;
  NSUInteger v90;
  void *v91;
  unint64_t v92;
  __CFString *v93;
  _BOOL4 v94;
  unint64_t v95;
  __CFString *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  PXStoryMomentRecipeState *state;
  void *v101;
  uint64_t v102;
  __int16 v103;
  NSObject *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSMutableDictionary *clipDebugInfos;
  void *v114;
  void (*v115)(_QWORD *, _QWORD *, uint8_t *, uint64_t, NSUInteger);
  void *v116;
  const __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  _QWORD *v124;
  id v125;
  void *v126;
  __CFString *v127;
  __CFString *v128;
  _BOOL4 v129;
  void *v130;
  _BOOL4 v131;
  unint64_t v132;
  void *v133;
  _BOOL4 v134;
  NSUInteger v135;
  void *v137;
  unint64_t v138;
  char v139;
  _BOOL4 v140;
  void *v141;
  _BOOL4 v142;
  void *v143;
  NSUInteger v144;
  NSUInteger v145;
  _QWORD v146[3];
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint8_t buf[16];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[2];
  _QWORD v156[4];

  length = a3.length;
  location = a3.location;
  v156[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v124 = a5;
  if (!length)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentClipRange.length > 0"));

  }
  objc_msgSend(v9, "clipAtIndex:", location);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (location)
  {
    objc_msgSend(v9, "clipAtIndex:", location - 1);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = 0;
  }
  v145 = location - 1 + length;
  v125 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v122 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = (void *)objc_opt_new();
  v126 = v9;
  v135 = location;
  if (length == 1
    && (objc_msgSend(v10, "displayAssets"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13 == 1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@(momentClipRange.length)", v14, 476);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "displayAssets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@(firstClip.displayAssets.count)", v17, 476);

    -[PXStoryMomentRecipeProvider _nextSingleAssetRecipeWithPreviousClip:](self, "_nextSingleAssetRecipeWithPreviousClip:", v121);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
  }
  else
  {
    if (location)
    {
      objc_msgSend(v9, "clipAtIndex:", location - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayAssets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count") == 2;

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v10, "displayAssets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    v134 = 0;
    if (v21 && v23 == 1)
    {
      objc_msgSend(v10, "displayAssets");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = +[PXStoryRecipeClipUtilities assetHasHighCurationScore:](PXStoryRecipeClipUtilities, "assetHasHighCurationScore:", v26);

      v10 = v25;
      location = v135;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", location != 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@(previousIsValid)", v27, 484);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@(previousIs2Up)", v28, 484);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 == 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@(firstIs1Up)", v29, 484);

    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "displayAssets");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithBool:", +[PXStoryRecipeClipUtilities assetHasHighCurationScore:](PXStoryRecipeClipUtilities, "assetHasHighCurationScore:", v32));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    addToPapertrail(v11, (uint64_t)"@([PXStoryRecipeClipUtilities assetHasHighCurationScore:firstClip.displayAssets[0]])", v33, 484);

    if (v134)
      -[PXStoryMomentRecipeProvider _nextNUpRevealRecipeWithPreviousClip:](self, "_nextNUpRevealRecipeWithPreviousClip:", v121);
    else
      -[PXStoryMomentRecipeProvider _nextBaseMomentRecipeWithPreviousClip:](self, "_nextBaseMomentRecipeWithPreviousClip:", v121);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    location = v135;
    if (v135 <= v145)
    {
      v34 = v135;
      do
      {
        objc_msgSend(v9, "clipAtIndex:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "moduleInfo");
        if ((v36 & 0x100) != 0)
        {
          v37 = -[PXStoryMomentRecipeState nextEmptySpaceStrategy](self->_state, "nextEmptySpaceStrategy");
          switch(v37)
          {
            case 1:
              objc_msgSend(v122, "addIndex:", v34);
              break;
            case 2:
              v38 = -[PXStoryMomentRecipeProvider _rangeOfLength:centeredOnIndex:withinRange:](self, "_rangeOfLength:centeredOnIndex:withinRange:", length / 3 + 1, v34, v135, length);
              objc_msgSend(v125, "addIndexesInRange:", v38, v39);
              break;
            case 0:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMomentRecipeProvider.m"), 510, CFSTR("Undefined empty space strategy"));

              abort();
          }
        }

        ++v34;
      }
      while (v34 <= v145);
    }
  }
  addToPapertrail(v11, (uint64_t)"baseMomentRecipe", v18, 516);
  v123 = (void *)objc_msgSend(v11, "copy");
  if (location <= v145)
  {
    v120 = v10;
    v141 = 0;
    v127 = v18;
    v128 = 0;
    v40 = location;
    while (1)
    {
      v41 = v11;
      v11 = (void *)objc_msgSend(v123, "mutableCopy");

      v42 = (void *)MEMORY[0x1E0CB37A0];
      v43 = -[__CFString recipeType](v18, "recipeType");
      v44 = CFSTR("??");
      if (v43 <= 8)
        v44 = off_1E511F1F0[v43];
      v45 = v44;
      objc_msgSend(v42, "stringWithFormat:", CFSTR("Base recipe: %@\n"), v45);
      v46 = objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v9, "numberOfClips");
      v130 = (void *)v46;
      if (v40)
      {
        objc_msgSend(v9, "clipAtIndex:", v40 - 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      v49 = v40 + 1;
      objc_msgSend(v9, "clipAtIndex:", v40);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40 + 1 >= v47)
      {
        v51 = 0;
      }
      else
      {
        objc_msgSend(v9, "clipAtIndex:", v40 + 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v144 = v40;
      if (v40)
      {
        objc_msgSend(v48, "displayAssets");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = (unint64_t)objc_msgSend(v52, "count") > 1;

      }
      else
      {
        v140 = 0;
      }
      objc_msgSend(v50, "displayAssets");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      v143 = v48;
      if (v49 >= v47)
      {
        v56 = 0;
      }
      else
      {
        objc_msgSend(v51, "displayAssets");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (unint64_t)objc_msgSend(v55, "count") > 1;

      }
      v132 = v54;
      v142 = v54 > 1;
      v138 = v49;
      v57 = v49 < v47;
      v58 = objc_msgSend(v50, "moduleInfo");
      objc_msgSend(v50, "moduleInfo");
      v139 = v59;
      v61 = (v59 & 1) == 0 && v58 != 0;
      v129 = v61;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v135);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(firstIndex)", v62, 544);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v144);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(idx)", v63, 544);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v145);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(lastIndex)", v64, 544);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v144 != 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(previousIsValid)", v65, 545);

      v66 = v58;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(nextIsValid)", v67, 545);

      addToPapertrail(v11, (uint64_t)"previousClip", v143, 546);
      v137 = v50;
      addToPapertrail(v11, (uint64_t)"currentClip", v50, 546);
      addToPapertrail(v11, (uint64_t)"nextClip", v51, 546);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v140);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(previousIsNUp)", v68, 547);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v142);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(currentIsNUp)", v69, 547);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v56);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(nextIsNUp)", v70, 547);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v134);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(useRevealRecipe)", v71, 547);

      v72 = CFSTR("??");
      if (v58 <= 3)
        v72 = off_1E511F160[v58];
      v141 = v130;
      v73 = v72;
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditModuleTypeName(moduleType)", v73, 548);

      v74 = v144 == v135 && v134;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v144 == v135);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(isFirstClipOfMoment)", v75, 548);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v139 & 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(isStartOfModule)", v76, 548);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v129);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(isMidModule)", v77, 548);

      v153 = 0u;
      v154 = 0u;
      v131 = v74;
      v133 = v51;
      if (v74)
      {
        v78 = v127;

        if (v127)
        {
          -[__CFString incomingTransition](v78, "incomingTransition");
          v153 = *(_OWORD *)buf;
          v154 = v152;
          -[__CFString motion](v78, "motion");
          v80 = *(_QWORD *)buf;
          v79 = *(_QWORD *)&buf[8];
          v81 = v152;
        }
        else
        {
          v81 = 0;
          v79 = 0;
          v80 = 0;
          v153 = 0u;
          v154 = 0u;
        }
        v85 = v141;
        v86 = v78;
      }
      else
      {
        if ((v139 & 1) != 0)
        {
          v82 = v138;
          if (v138 <= v145)
          {
            v82 = v138;
            while (1)
            {
              objc_msgSend(v126, "clipAtIndex:", v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "moduleInfo");
              if ((v84 & 1) != 0 || objc_msgSend(v83, "moduleInfo") != v58)
                break;
              ++v82;

              if (v82 > v145)
                goto LABEL_77;
            }

          }
LABEL_77:
          v90 = v82 - v144;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v144, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          addToPapertrail(v11, (uint64_t)"[NSValue valueWithRange:moduleClipRange]", v91, 570);

          -[PXStoryMomentRecipeProvider _nextModuleRecipeWithModuleClipRange:clipCatalog:](self, "_nextModuleRecipeWithModuleClipRange:clipCatalog:", v144, v90, v126);
          v78 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            -[__CFString incomingTransition](v78, "incomingTransition");
            v153 = *(_OWORD *)buf;
            v154 = v152;
            -[__CFString motion](v78, "motion");
            v80 = *(_QWORD *)buf;
            v79 = *(_QWORD *)&buf[8];
            v81 = v152;
          }
          else
          {
            v81 = 0;
            v79 = 0;
            v80 = 0;
            v153 = 0u;
            v154 = 0u;
          }
          v85 = v141;
          v92 = -[__CFString recipeType](v78, "recipeType");
          v93 = CFSTR("??");
          if (v92 <= 8)
            v93 = off_1E511F1F0[v92];
          v89 = v93;
          objc_msgSend(v141, "appendFormat:", CFSTR("Starting module %@\n"), v89);
          goto LABEL_83;
        }
        if (v58)
        {
          v85 = v141;
          if (v128)
          {
            -[__CFString innerTransition](v128, "innerTransition");
            v153 = *(_OWORD *)buf;
            v154 = v152;
            -[__CFString motion](v128, "motion");
            v80 = *(_QWORD *)buf;
            v79 = *(_QWORD *)&buf[8];
            v81 = v152;
          }
          else
          {
            v81 = 0;
            v79 = 0;
            v80 = 0;
            v153 = 0uLL;
            v154 = 0uLL;
          }
          v95 = -[__CFString recipeType](v128, "recipeType");
          v96 = CFSTR("??");
          if (v95 <= 8)
            v96 = off_1E511F1F0[v95];
          v78 = v96;
          objc_msgSend(v141, "appendFormat:", CFSTR("Mid-module %@\n"), v78);
          v94 = v140;
          goto LABEL_91;
        }
        v85 = v141;
        if (v144 != v135)
        {
          if (v127)
          {
            -[__CFString motion](v127, "motion");
            v80 = *(_QWORD *)buf;
            v79 = *(_QWORD *)&buf[8];
            v81 = v152;
            if (!objc_msgSend(v122, "containsIndex:", v144))
            {
              -[__CFString innerTransition](v127, "innerTransition");
              goto LABEL_130;
            }
LABEL_128:
            v78 = v128;
            v94 = v140;
            *(_QWORD *)buf = v80;
            *(_QWORD *)&buf[8] = v79;
            *(_QWORD *)&v152 = v81;
            -[PXStoryMomentRecipeProvider _nextEmptySpaceBreakTransitionForMotion:](self, "_nextEmptySpaceBreakTransitionForMotion:", buf);
            v116 = v141;
            v117 = CFSTR("Transition to break up empty space, motion from base\n");
          }
          else
          {
            if ((objc_msgSend(v122, "containsIndex:", v144) & 1) != 0)
            {
              v80 = 0;
              v79 = 0;
              v81 = 0;
              goto LABEL_128;
            }
            v81 = 0;
            v79 = 0;
            v80 = 0;
            *(_OWORD *)buf = 0u;
            v152 = 0u;
LABEL_130:
            v78 = v128;
            v94 = v140;
            v153 = *(_OWORD *)buf;
            v154 = v152;
            v116 = v141;
            v117 = CFSTR("Transition and motion from base\n");
          }
          objc_msgSend(v116, "appendString:", v117);
          goto LABEL_84;
        }
        if (v127)
        {
          -[__CFString incomingTransition](v127, "incomingTransition");
          v153 = *(_OWORD *)buf;
          v154 = v152;
          -[__CFString motion](v127, "motion");
          v80 = *(_QWORD *)buf;
          v79 = *(_QWORD *)&buf[8];
          v86 = v127;
          v81 = v152;
        }
        else
        {
          v81 = 0;
          v86 = 0;
          v79 = 0;
          v80 = 0;
          v153 = 0uLL;
          v154 = 0uLL;
        }
        v78 = v128;
      }
      v87 = -[__CFString recipeType](v86, "recipeType");
      v88 = CFSTR("??");
      if (v87 <= 8)
        v88 = off_1E511F1F0[v87];
      v89 = v88;
      objc_msgSend(v85, "appendFormat:", CFSTR("Transition and motion from base, first %@\n"), v89);
LABEL_83:

      v94 = v140;
LABEL_84:
      if (v139 & 1 | v66)
      {
        v128 = v78;
        goto LABEL_92;
      }
      v128 = 0;
LABEL_91:

LABEL_92:
      v97 = v94;
      if (v132 > 1)
        v97 = v94 + 1;
      v98 = v97 + v56;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"@(numNUps)", v99, 603);

      v9 = v126;
      if (v132 < 2)
      {
        if (v94 && !v131)
        {
          if (v80 == 1)
          {
            v102 = v79;
            if (v79)
              goto LABEL_100;
LABEL_110:
            PXAssertGetLog();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1A6789000, v104, OS_LOG_TYPE_ERROR, "Invalid split wipe transition direction", buf, 2u);
            }

            v103 = 2;
            goto LABEL_118;
          }
          if (!v143)
          {
            v148 = 0;
            v149 = 0;
            v103 = 258;
            v150 = 0;
            goto LABEL_118;
          }
          objc_msgSend(v143, "motionInfo");
          if (v148 == 1)
          {
            objc_msgSend(v143, "motionInfo");
            v102 = v147;
            if (!v147)
              goto LABEL_110;
LABEL_100:
            if (v102 != 4 && v102 != 1)
            {
              v103 = 514;
LABEL_118:
              *((_QWORD *)&v154 + 1) = 0;
              *(_QWORD *)((char *)&v154 + 2) = 0;
              v153 = 8uLL;
              LOWORD(v154) = v103;
              objc_msgSend(v85, "appendString:", CFSTR("Overriding transition with wipe because of nearby N-up\n"));
              goto LABEL_119;
            }
          }
          v103 = 258;
          goto LABEL_118;
        }
      }
      else
      {
        if (v98 == 1)
        {
          state = self->_state;
          objc_msgSend(v137, "displayAssets");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = -[PXStoryMomentRecipeState nextNUpPanRelativeMotionWithN:](state, "nextNUpPanRelativeMotionWithN:", objc_msgSend(v101, "count"));

        }
        else
        {
          v81 = 2;
        }
        objc_msgSend(v85, "appendString:", CFSTR("Overriding motion for this N-up\n"));
        if (!v131)
        {
          v103 = 514;
          v79 = 2;
          v80 = 1;
          goto LABEL_118;
        }
        v79 = 2;
        v80 = 1;
      }
LABEL_119:
      if (objc_msgSend(v125, "containsIndex:", v144))
        v105 = 2;
      else
        v105 = 0;
      *(_QWORD *)buf = v80;
      *(_QWORD *)&buf[8] = v79;
      *(_QWORD *)&v152 = v81;
      PXStoryAutoEditClipMotionInfoDescription((__int128 *)buf);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditClipMotionInfoDescription(motionInfo)", v106, 651);

      *(_OWORD *)buf = v153;
      v152 = v154;
      PXStoryAutoEditClipTransitionInfoDescription((uint64_t)buf);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditClipTransitionInfoDescription(transitionInfo)", v107, 651);

      *(_OWORD *)buf = v153;
      v152 = v154;
      PXStoryAutoEditClipTransitionInfoDescription((uint64_t)buf);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v80;
      *(_QWORD *)&buf[8] = v79;
      *(_QWORD *)&v152 = v81;
      PXStoryAutoEditClipMotionInfoDescription((__int128 *)buf);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "appendFormat:", CFSTR("Requested Incoming Transition: %@\nRequested Motion: %@\n"), v108, v109);

      addToPapertrail(v11, (uint64_t)"momentRecipeChoices", v85, 653);
      v155[0] = CFSTR("Moment Recipe Choices");
      v110 = (void *)objc_msgSend(v85, "copy");
      v155[1] = CFSTR("Papertrail");
      v156[0] = v110;
      v111 = (void *)objc_msgSend(v11, "copy");
      v156[1] = v111;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 2);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      clipDebugInfos = self->_clipDebugInfos;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v144);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](clipDebugInfos, "setObject:forKeyedSubscript:", v112, v114);

      v115 = (void (*)(_QWORD *, _QWORD *, uint8_t *, uint64_t, NSUInteger))v124[2];
      v146[0] = v80;
      v146[1] = v79;
      v146[2] = v81;
      *(_OWORD *)buf = v153;
      v152 = v154;
      v115(v124, v146, buf, v105, v144);

      v40 = v138;
      v18 = v127;
      if (v138 > v145)
      {

        v10 = v120;
        break;
      }
    }
  }

}

- (void)provideDebugInfoForClip:(unint64_t)a3 usingBlock:(id)a4
{
  NSMutableDictionary *clipDebugInfos;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a4;
  clipDebugInfos = self->_clipDebugInfos;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clipDebugInfos, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_clipDebugInfos;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipDebugInfos, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
}

void *__66__PXStoryMomentRecipeProvider__recipeFromRecipeType_previousClip___block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  if (!v2)
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "nextScaleDirection");
  objc_msgSend(v2, "motionInfo");
  if (v5 != 2)
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "nextScaleDirection");
  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "motionInfo");
    return (void *)v4;
  }
  return result;
}

@end
