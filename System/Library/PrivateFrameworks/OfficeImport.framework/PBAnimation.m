@implementation PBAnimation

+ (void)mapAnimationsFromSlide:(id)a3 tgtSlide:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "presentationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hasPpt10Animations:", v12))
    objc_msgSend(a1, "parsePpt10Animation:timings:state:", v12, v11, v9);
  else
    objc_msgSend(a1, "generatePpt10AnimationFromState:timings:", v10, v11);
  objc_msgSend(v10, "resetSlideState");

}

+ (BOOL)hasPpt10Animations:(id)a3
{
  void *v3;
  BOOL v4;

  +[PBProgTag binaryTagDataWithName:inProgTagsParent:](PBProgTag, "binaryTagDataWithName:inProgTagsParent:", L"___PPT10", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)parsePpt10Animation:(id)a3 timings:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  OITSUNoCopyDictionary *v18;
  id v19;

  v19 = a4;
  v8 = a5;
  objc_msgSend(a3, "firstChildOfType:", 5000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "firstChildOfType:", 5002);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "firstChildOfType:", 5003);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "firstChildOfType:", 11008);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "firstChildOfType:", 61764);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (id)objc_msgSend(v19, "addRootTimeNode");
            objc_msgSend(v19, "rootTimeNode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v15, "setChildTimeNodeList:", v16);
            objc_msgSend(a1, "parseTimeNodeContainer:siblings:state:", v13, v16, v8);

          }
          objc_msgSend(v11, "firstChildOfType:", 11010);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = objc_alloc_init(OITSUNoCopyDictionary);
            objc_msgSend(a1, "parseBuildList:buildMap:state:", v17, v18, v8);
            objc_msgSend(v19, "setBuildMap:", v18);

          }
        }
      }

    }
  }

}

+ (void)generatePpt10AnimationFromState:(id)a3 timings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PDBuildMapKey *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PDTimeNodeUnion *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PDTimeNodeUnion *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  OITSUNoCopyDictionary *v40;
  id v41;
  PDBuildMapKey *v42;

  v38 = a3;
  v5 = a4;
  objc_msgSend(v38, "slideState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildOrderMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v5;

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_alloc_init(OITSUNoCopyDictionary);
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v38, "tgtSlide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v39 = v13;
  while (1)
  {
    v15 = v14;
    if (objc_msgSend(v9, "count", v37) <= (unint64_t)v14)
      break;
    objc_msgSend(v9, "objectAtIndex:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    objc_msgSend(v7, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "drawable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "containsObject:", v19))
      goto LABEL_15;
    v20 = [PDBuildMapKey alloc];
    objc_msgSend(v18, "drawable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "data");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "groupId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PDBuildMapKey initWithDrawable:groupId:](v20, "initWithDrawable:groupId:", v21, v23);

    objc_msgSend(v18, "build");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OITSUNoCopyDictionary setObject:forUncopiedKey:](v40, "setObject:forUncopiedKey:", v24, v42);

    v25 = objc_alloc_init(PDTimeNodeUnion);
    objc_msgSend(v18, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDTimeNodeUnion setSequential:](v25, "setSequential:", v26);

    objc_msgSend(v41, "addObject:", v25);
    v27 = objc_opt_class();
    objc_msgSend(v19, "clientData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v27, (uint64_t)v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "animationInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mediaNode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_alloc_init(PDTimeNodeUnion);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PDTimeNodeUnion setVideo:](v32, "setVideo:", v31);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PDTimeNodeUnion setAudio:](v32, "setAudio:", v31);
      }
      -[PDTimeNodeUnion video](v32, "video");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {

        goto LABEL_12;
      }
      -[PDTimeNodeUnion audio](v32, "audio");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
LABEL_12:
        objc_msgSend(v41, "addObject:", v32);

    }
    v13 = v39;
LABEL_15:

    v14 = v15 + 1;
    v7 = v17;
  }
  v35 = (id)objc_msgSend(v37, "addRootTimeNode");
  objc_msgSend(v37, "rootTimeNode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setChildTimeNodeList:", v41);

  objc_msgSend(v37, "setBuildMap:", v40);
}

+ (id)parseBehaviorContainer:(id)a3 timeNode:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  PDSetBehavior *v10;
  void *v11;
  PDAnimateScaleBehavior *v12;
  void *v13;
  void *v14;
  const void *v15;
  float32x2_t *v16;
  __int8 v17;
  uint64_t v18;
  id v19;
  PDAnimateTimeBehavior *v20;
  uint64_t v21;
  id v22;
  PDAnimateColorBehavior *v23;
  uint64_t v24;
  id v25;
  void *v26;
  PDAnimateEffectBehavior *v27;
  uint64_t v28;
  id v29;
  void *v30;
  PDAnimateMotionBehavior *v31;
  uint64_t v32;
  id v33;
  void *v34;
  PDAnimateRotateBehavior *v35;
  uint64_t v36;
  id v37;
  void *v38;
  PDCmdBehavior *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v8 = a3;
  v9 = a4;
  v47 = a5;
  objc_msgSend(v8, "firstChildOfType:", 61745);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_alloc_init(PDSetBehavior);
    objc_msgSend(v9, "setBehavior:", v10);

    objc_msgSend(v9, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v48;
  }
  else
  {
    v52 = 0;
    v11 = 0;
  }
  objc_msgSend(v8, "firstChildOfType:", 61744);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_alloc_init(PDAnimateScaleBehavior);
      objc_msgSend(v51, "firstChildOfType:", 61753);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = (const void *)objc_msgSend(v13, "eshObject");
        if (v15)
        else
          v16 = 0;
        v17 = v16[9].i8[1];
        if ((v17 & 1) != 0)
        {
          -[PDAnimateScaleBehavior setBy:](v12, "setBy:", vcvtq_f64_f32(vmul_f32(v16[6], (float32x2_t)vdup_n_s32(0x447A0000u))));
          v17 = v16[9].i8[1];
        }
        if ((v17 & 2) != 0)
        {
          -[PDAnimateScaleBehavior setFrom:](v12, "setFrom:", vcvtq_f64_f32(vmul_f32(v16[8], (float32x2_t)vdup_n_s32(0x447A0000u))));
          v17 = v16[9].i8[1];
        }
        if ((v17 & 4) != 0)
          -[PDAnimateScaleBehavior setTo:](v12, "setTo:", vcvtq_f64_f32(vmul_f32(v16[7], (float32x2_t)vdup_n_s32(0x447A0000u))));
        objc_msgSend(v9, "setScaleBehavior:", v12);
      }

      objc_msgSend(v9, "scaleBehavior");
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = v51;
      v52 = v19;
      v11 = (void *)v18;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61739);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_alloc_init(PDAnimateTimeBehavior);
      objc_msgSend(a1, "parseAnimateBehaviorContainer:animBehavior:timeNode:", v50, v20, v9);

      objc_msgSend(v9, "timeBehavior");
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = v50;
      v52 = v22;
      v11 = (void *)v21;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61740);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = objc_alloc_init(PDAnimateColorBehavior);
      objc_msgSend(a1, "parseColorBehaviorContainer:colorBehavior:timeNode:", v49, v23, v9);

      objc_msgSend(v9, "colorBehavior");
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = v49;
      v52 = v25;
      v11 = (void *)v24;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61741);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = objc_alloc_init(PDAnimateEffectBehavior);
      objc_msgSend(a1, "parseEffectBehaviorContainer:effectBehavior:timeNode:", v26, v27, v9);

      objc_msgSend(v9, "effectBehavior");
      v28 = objc_claimAutoreleasedReturnValue();

      v29 = v26;
      v52 = v29;
      v11 = (void *)v28;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61742);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = objc_alloc_init(PDAnimateMotionBehavior);
      objc_msgSend(a1, "parseMotionBehaviorContainer:motionBehavior:timeNode:", v30, v31, v9);

      objc_msgSend(v9, "motionBehavior");
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = v30;
      v52 = v33;
      v11 = (void *)v32;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61743);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_alloc_init(PDAnimateRotateBehavior);
      objc_msgSend(a1, "parseRotationBehaviorContainer:rotationBehavior:timeNode:", v34, v35, v9);

      objc_msgSend(v9, "rotateBehavior");
      v36 = objc_claimAutoreleasedReturnValue();

      v37 = v34;
      v52 = v37;
      v11 = (void *)v36;
    }
  }
  objc_msgSend(v8, "firstChildOfType:", 61746);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = objc_alloc_init(PDCmdBehavior);
    v40 = a1;
    objc_msgSend(a1, "parseCmdBehaviorContainer:cmdBehavior:timeNode:", v38, v39, v9);

    objc_msgSend(v9, "cmdBehavior");
    v41 = objc_claimAutoreleasedReturnValue();

    v42 = v38;
    v52 = v42;
    v11 = (void *)v41;
  }
  else
  {
    v40 = a1;
  }
  v43 = v9;
  if (v11 && v52)
  {
    objc_msgSend(v52, "firstChildOfType:", 61738);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v40, "parseTargetContainerHolder:setTargetObj:state:", v44, v11, v47);
    }

  }
  v45 = v11;

  return v45;
}

+ (void)parseTimeNodeContainer:(id)a3 siblings:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const void *v12;
  _DWORD *v13;
  unsigned int v14;
  PDParallelTimeNode *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PDTimeNodeUnion *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v24 = objc_alloc_init(PDTimeNodeUnion);
  objc_msgSend(v25, "firstChildOfType:", 61735);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if (v11)
  {
    v12 = (const void *)objc_msgSend(v11, "eshObject");
    if (v12)
    else
      v13 = 0;
    v15 = 0;
    v14 = v13[14];
    switch(v14)
    {
      case 0u:
        v15 = objc_alloc_init(PDParallelTimeNode);
        -[PDTimeNodeUnion setParallel:](v24, "setParallel:", v15);
        goto LABEL_9;
      case 1u:
        v15 = objc_alloc_init(PDSequentialTimeNode);
        -[PDTimeNodeUnion setSequential:](v24, "setSequential:", v15);
LABEL_9:
        if (!v15)
          break;
        goto LABEL_14;
      case 3u:
        objc_msgSend(a1, "parseBehaviorContainer:timeNode:state:", v25, v24, v9);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 4u:
        objc_msgSend(a1, "parseMediaContainer:timeNode:state:", v25, v24, v9);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v15 = (PDParallelTimeNode *)v16;
        if (v16)
        {
LABEL_14:
          if ((v13[16] & 0x10) != 0)
            -[PDTimeNode setDuration:](v15, "setDuration:", (double)(int)v13[12]);
        }
        break;
      default:
        break;
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(v25, "firstChildOfType:", 61757);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if (!((v14 > 1) | ((objc_opt_isKindOfClass() & 1) == 0)))
      objc_msgSend(a1, "parseTimeNodeVariants:commonData:", v17, v15);
  }
  objc_msgSend(v25, "firstChildOfType:", 61733);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "parseTimeConditionsHolder:commonData:", v25, v15);
  }
  if (v15)
  {
    -[PDTimeNode childTimeNodeList](v15, "childTimeNodeList");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[PDTimeNode setChildTimeNodeList:](v15, "setChildTimeNodeList:", v19);
    }
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v25, "firstChildOfType:", 61764);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && v20)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(a1, "parseTimeNodeContainer:siblings:state:", v21, v19, v9);
      objc_msgSend(v25, "firstChildOfType:afterChild:", 61764, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v22;
    }
    while (v22);
    v8 = v10;
  }
  objc_msgSend(v8, "addObject:", v24);

}

+ (id)parseMediaContainer:(id)a3 timeNode:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PDAudioNode *v16;
  PDVideoNode *v18;
  CsString v19;
  CsString v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstChildOfType:", 61757);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstChildOfType:", 61756);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v12, "firstChildOfType:", 11003);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (v15 == 4)
  {
    v18 = objc_alloc_init(PDVideoNode);
    objc_msgSend(v9, "setVideo:", v18);
    v16 = v18;
    BYTE1(v19.var1) = 0;
    if (getVariantVal(v8, 26, 0, (CsString *)((char *)&v19.var1 + 1)))
      -[PDAudioNode setIsFullScreen:](v16, "setIsFullScreen:", BYTE1(v19.var1));

    goto LABEL_13;
  }
  if (v15 != 3)
  {
LABEL_7:

LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  v16 = objc_alloc_init(PDAudioNode);
  objc_msgSend(v9, "setAudio:", v16);
LABEL_13:

  if (v16)
  {
    if (v11)
    {
      LOBYTE(v20.var0) = 0;
      if (getVariantVal(v8, 18, 0, &v20))
        -[PDMediaNode setIsShowWhenStopped:](v16, "setIsShowWhenStopped:", LOBYTE(v20.var0) == 0);
      *(unsigned __int16 **)((char *)&v19.var1 + 1) = 0;
      if (getVariantVal(v8, 15, 1, (CsString *)((char *)&v19.var1 + 1)))
        -[PDMediaNode setNumberOfSlides:](v16, "setNumberOfSlides:", *(unsigned __int16 **)((char *)&v19.var1 + 1));
      *(void ***)((char *)&v19.var0 + 1) = 0;
      if (getVariantVal(v8, 22, 2, (CsString *)((char *)&v19.var0 + 1)))
        -[PDMediaNode setVolume:](v16, "setVolume:", (uint64_t)*(double *)((char *)&v19.var0 + 1));
      LOBYTE(v19.var0) = 0;
      if (getVariantVal(v8, 23, 0, &v19))
        -[PDMediaNode setIsMuted:](v16, "setIsMuted:", LOBYTE(v19.var0));
    }
    objc_msgSend(a1, "parseTargetContainerHolder:setTargetObj:state:", v8, v16, v10);
  }
LABEL_9:

  return v16;
}

+ (void)parseTimeConditionsHolder:(id)a3 commonData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  PDTimeCondition *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v15 = a4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v16, "firstChildOfType:", 61733);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v6, "firstChildOfType:", 61736);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v10 = v9[13];
        v11 = v9[15];
        v12 = objc_alloc_init(PDTimeCondition);
        -[PDTimeCondition setTriggerEvent:](v12, "setTriggerEvent:", v10);
        -[PDTimeCondition setDelay:](v12, "setDelay:", v11);
        objc_msgSend(v5, "addObject:", v12);

      }
      objc_msgSend(v16, "firstChildOfType:afterChild:", 61733, v6, v15);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    while (v13);
  }
  v14 = v15;
  objc_msgSend(v15, "setStartTimeConditions:", v5, v15);

}

+ (void)parseAnimateBehaviorContainer:(id)a3 animBehavior:(id)a4 timeNode:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61748);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setTimeBehavior:", v9);

}

+ (id)newColorFromBehaviorColor:(PptAnimColorBehavior_Color_Struct *)a3
{
  unsigned int var0;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  OADRgbColor *v8;
  double v9;
  double v10;
  double v11;
  float v13;
  uint64_t v14;

  var0 = a3->var0;
  if (!a3->var0)
    goto LABEL_5;
  if (var0 == 2)
    return -[OADIndexedColor initWithIndex:]([OADIndexedColor alloc], "initWithIndex:", a3->var1);
  if (var0 == 1)
  {
    v14 = 0;
    v13 = 0.0;
    convertHslToRgb((float)a3->var1, (float)a3->var2, (float)a3->var3, (float *)&v14 + 1, (float *)&v14, &v13);
    v5 = *((float *)&v14 + 1);
    v6 = *(float *)&v14;
    a3->var0 = 0;
    a3->var1 = v5;
    v7 = v13;
    a3->var2 = v6;
    a3->var3 = v7;
LABEL_5:
    v8 = [OADRgbColor alloc];
    *(float *)&v9 = (float)a3->var1;
    *(float *)&v10 = (float)a3->var2;
    *(float *)&v11 = (float)a3->var3;
    return -[OADRgbColor initWithRed:green:blue:](v8, "initWithRed:green:blue:", v9, v10, v11);
  }
  return 0;
}

+ (void)parseColorBehaviorContainer:(id)a3 colorBehavior:(id)a4 timeNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const void *v13;
  _BYTE *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CsString v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstChildOfType:", 61749);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (const void *)objc_msgSend(v11, "eshObject");
    if (v13)
    else
      v14 = 0;
    v15 = v14[45];
    if ((v15 & 2) != 0)
    {
      *(_OWORD *)((char *)&v19.var0 + 4) = *((_OWORD *)v14 + 4);
      v17 = objc_msgSend(a1, "newColorFromBehaviorColor:", (char *)&v19.var0 + 4);
      objc_msgSend(v9, "setFrom:", v17);
      v15 = v14[45];
      v16 = (void *)v17;
      if ((v15 & 4) == 0)
      {
LABEL_7:
        if ((v15 & 8) == 0)
          goto LABEL_8;
        goto LABEL_12;
      }
    }
    else
    {
      v16 = 0;
      if ((v14[45] & 4) == 0)
        goto LABEL_7;
    }
    *(_OWORD *)((char *)&v19.var0 + 4) = *((_OWORD *)v14 + 5);
    v18 = objc_msgSend(a1, "newColorFromBehaviorColor:", (char *)&v19.var0 + 4);

    objc_msgSend(v9, "setTo:", v18);
    v15 = v14[45];
    v16 = (void *)v18;
    if ((v15 & 8) == 0)
    {
LABEL_8:
      if ((v15 & 0x10) == 0)
      {
LABEL_17:
        objc_msgSend(v10, "setColorBehavior:", v9);

        goto LABEL_18;
      }
LABEL_15:
      LODWORD(v19.var0) = 0;
      if (getVariantVal(v8, 5, 1, &v19))
        objc_msgSend(v9, "setDirection:", LODWORD(v19.var0));
      goto LABEL_17;
    }
LABEL_12:
    LODWORD(v19.var0) = 0;
    if (getVariantVal(v8, 4, 1, &v19))
      objc_msgSend(v9, "setColorSpace:", LODWORD(v19.var0));
    if ((v14[45] & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_18:

}

+ (void)parseEffectBehaviorContainer:(id)a3 effectBehavior:(id)a4 timeNode:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61750);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (unsigned int *)objc_msgSend(v8, "eshObject");
    if (v10)
    if ((*((_BYTE *)v10 + 45) & 1) != 0)
      objc_msgSend(v11, "setTransition:", v10[12]);
    objc_msgSend(v7, "setEffectBehavior:", v11);
  }

}

+ (void)parseMotionBehaviorContainer:(id)a3 motionBehavior:(id)a4 timeNode:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  const void *v11;
  float *v12;
  char v13;
  void *v14;
  void *v15;
  const void *v16;
  EshRecord *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  PptAnimVariantAtom *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v26, "firstChildOfType:", 61751);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_33;
  v11 = (const void *)objc_msgSend(v9, "eshObject");
  if (v11)
  else
    v12 = 0;
  v13 = *((_BYTE *)v12 + 45);
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v7, "setBy:", v12[12], v12[13]);
    v13 = *((_BYTE *)v12 + 45);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(v7, "setFrom:", v12[14], v12[15]);
    v13 = *((_BYTE *)v12 + 45);
  }
  if ((v13 & 4) != 0)
  {
    objc_msgSend(v7, "setTo:", v12[16], v12[16]);
    v13 = *((_BYTE *)v12 + 45);
  }
  if ((v13 & 8) != 0)
    objc_msgSend(v7, "setOriginType:", *((_DWORD *)v12 + 17) != 2);
  objc_msgSend(v26, "firstChildOfType:", 61762);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (const void *)objc_msgSend(v14, "eshObject");
    if (v16)
    {

      if (!v17 || EshRecord::getInstance(v17) != 1 || *((_DWORD *)v17 + 12) != 3)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", getStreamInfo((uint64_t)v17));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PDAnimateMotionBehavior bezierPathFromNSString:](PDAnimateMotionBehavior, "bezierPathFromNSString:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", v18);

    }
  }

LABEL_20:
  v19 = *((_BYTE *)v12 + 45);
  if ((v19 & 0x40) != 0)
  {
    objc_msgSend(v26, "firstChildOfType:", 61757);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "childOfType:instance:", 61762, 7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(PptAnimVariantAtom *))(*(_QWORD *)v22 + 16))(v22) == 2)
          objc_msgSend(v7, "setAngle:", PptAnimVariantAtom::getReal(v22));

      }
    }

    v19 = *((_BYTE *)v12 + 45);
  }
  if (v19 < 0)
  {
    objc_msgSend(v26, "firstChildOfType:", 61757);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "childOfType:instance:", 61762, 10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void *))(*(_QWORD *)v25 + 16))(v25);

      }
    }

  }
  objc_msgSend(v8, "setMotionBehavior:", v7);
LABEL_33:

}

+ (void)parseRotationBehaviorContainer:(id)a3 rotationBehavior:(id)a4 timeNode:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  float *v11;
  char v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61752);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (const void *)objc_msgSend(v8, "eshObject");
    if (v10)
    else
      v11 = 0;
    v12 = *((_BYTE *)v11 + 45);
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v13, "setBy:", (float)(v11[12] * 60000.0));
      v12 = *((_BYTE *)v11 + 45);
    }
    if ((v12 & 2) != 0)
    {
      objc_msgSend(v13, "setFrom:", (float)(v11[13] * 60000.0));
      v12 = *((_BYTE *)v11 + 45);
    }
    if ((v12 & 4) != 0)
      objc_msgSend(v13, "setTo:", (float)(v11[14] * 60000.0));
    objc_msgSend(v7, "setRotateBehavior:", v13);
  }

}

+ (void)parseCmdBehaviorContainer:(id)a3 cmdBehavior:(id)a4 timeNode:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61755);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (unsigned int *)objc_msgSend(v8, "eshObject");
    if (v10)
    if ((*((_BYTE *)v10 + 45) & 1) != 0)
      objc_msgSend(v11, "setBehaviorType:", v10[12]);
    objc_msgSend(v7, "setCmdBehavior:", v11);
  }

}

+ (void)parseTimeNodeVariants:(id)a3 commonData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PptAnimVariantAtom *v8;
  void *v9;
  void *v10;
  PptAnimVariantAtom *v11;
  void *v12;
  void *v13;
  PptAnimVariantAtom *v14;
  void *v15;
  void *v16;
  PptAnimVariantAtom *v17;
  void *v18;
  void *v19;
  PptAnimVariantAtom *v20;
  id v21;

  v21 = a3;
  v5 = a4;
  objc_msgSend(v21, "childOfType:instance:", 61762, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (*((_DWORD *)v8 + 12) == 1)
      objc_msgSend(v5, "setPresetId:", PptAnimVariantAtom::getInteger(v8));
  }
  objc_msgSend(v21, "childOfType:instance:", 61762, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (*((_DWORD *)v11 + 12) == 1)
      objc_msgSend(v5, "setPresetSubType:", PptAnimVariantAtom::getInteger(v11));
  }
  objc_msgSend(v21, "childOfType:instance:", 61762, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (*((_DWORD *)v14 + 12) == 1)
      objc_msgSend(v5, "setAnimationPresetClass:", PptAnimVariantAtom::getInteger(v14));
  }
  objc_msgSend(v21, "childOfType:instance:", 61762, 19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (*((_DWORD *)v17 + 12) == 1)
      objc_msgSend(v5, "setGroupIdValue:", PptAnimVariantAtom::getInteger(v17));
  }
  objc_msgSend(v21, "childOfType:instance:", 61762, 20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if (*((_DWORD *)v20 + 12) == 1)
      objc_msgSend(v5, "setType:", PptAnimVariantAtom::getInteger(v20));
  }

}

+ (unint64_t)paragraphIndexFromBinaryTextBytesCharacterIndex:(unint64_t)a3 srcDrawable:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t i;
  void *v12;

  v5 = a4;
  v6 = objc_opt_class();
  TSUDynamicCast(v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "textBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    for (i = 0; i < objc_msgSend(v9, "paragraphCount") && v10 <= a3; ++i)
    {
      objc_msgSend(v9, "paragraphAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 += objc_msgSend(v12, "characterCount") + 1;

    }
  }
  else
  {
    i = 0;
  }

  return i - 1;
}

+ (void)parseTargetContainerHolder:(id)a3 setTargetObj:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  _DWORD *v13;
  PDAnimationTextTarget *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61756);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "firstChildOfType:", 11003);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = (const void *)objc_msgSend(v10, "eshObject");
        if (v12)
        else
          v13 = 0;
        v14 = 0;
        v15 = v13[12];
        v16 = v13[14];
        switch(v15)
        {
          case 0:
          case 4:
          case 6:
            objc_msgSend(v8, "drawableOnTgtSlideForShapeId:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_17;
            v14 = objc_alloc_init(PDAnimationShapeTarget);
            -[PDAnimationShapeTarget setDrawable:](v14, "setDrawable:", v17);
            goto LABEL_18;
          case 1:
            v14 = objc_alloc_init(PDSlideTarget);
            if (!v14)
              break;
            goto LABEL_19;
          case 2:
          case 8:
            objc_msgSend(v8, "drawableOnTgtSlideForShapeId:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_17;
            v14 = objc_alloc_init(PDAnimationTextTarget);
            -[PDAnimationShapeTarget setDrawable:](v14, "setDrawable:", v17);
            if (v15 == 2)
              -[PDAnimationTextTarget setRange:](v14, "setRange:", objc_msgSend(a1, "paragraphIndexFromBinaryTextBytesCharacterIndex:srcDrawable:", v13[15], v17), 1);
            goto LABEL_18;
          case 3:
            objc_msgSend(v8, "drawableOnTgtSlideForShapeId:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_17;
            v14 = objc_alloc_init(PDAnimationSoundTarget);
            -[PDAnimationShapeTarget setDrawable:](v14, "setDrawable:", v17);
            goto LABEL_18;
          case 5:
            objc_msgSend(v8, "drawableOnTgtSlideForShapeId:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v14 = objc_alloc_init(PDAnimationOleChartTarget);
              -[PDAnimationShapeTarget setDrawable:](v14, "setDrawable:", v17);
              -[PDAnimationTextTarget setLevel:](v14, "setLevel:", v13[16]);
              -[PDAnimationTextTarget setChartSubElementType:](v14, "setChartSubElementType:", v13[15]);
            }
            else
            {
LABEL_17:
              v14 = 0;
            }
LABEL_18:

            if (v14)
            {
LABEL_19:
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v18, "performSelector:withObject:", sel_setTarget_, v14);
            }
            break;
          default:
            break;
        }

      }
    }
  }

}

+ (id)newParaBuild:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  _BYTE *v6;
  _BYTE *v7;
  PDParagraphBuild *v8;
  PDParagraphBuild *v9;
  double v10;
  int v11;
  uint64_t v12;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = (const void *)objc_msgSend(v3, "eshObject")) != 0
  {
    v7 = v6;
    v8 = objc_alloc_init(PDParagraphBuild);
    v9 = v8;
    v10 = 0.0;
    if (v7[59])
      v10 = 1.0;
    -[PDParagraphBuild setAutoAdvanceTime:](v8, "setAutoAdvanceTime:", v10);
    -[PDParagraphBuild setIsReversedParagraphOrder:](v9, "setIsReversedParagraphOrder:", v7[57]);
    -[PDParagraphBuild setBuildLevel:](v9, "setBuildLevel:", *((unsigned int *)v7 + 13));
    v11 = *((_DWORD *)v7 + 12);
    if (v11 == 1)
      v12 = 2;
    else
      v12 = v11 == 2;
    -[PDParagraphBuild setType:](v9, "setType:", v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newChartBuild:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  unsigned int *v6;
  unsigned int *v7;
  PDChartBuild *v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && (v5 = (const void *)objc_msgSend(v3, "eshObject")) != 0
  {
    v7 = v6;
    v8 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", v6[12]);
    -[PDBuild setIsAnimateBackground:](v8, "setIsAnimateBackground:", *((unsigned __int8 *)v7 + 52));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)parseBuildList:(id)a3 buildMap:(id)a4 state:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  unsigned int *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PDBuildMapKey *v23;
  void *v24;
  void *v25;
  PDBuildMapKey *v26;
  id v27;
  id v28;
  id v30;

  v30 = a3;
  v28 = a4;
  v7 = a5;
  v27 = v7;
  v8 = objc_msgSend(v30, "childCount");
  if (v8)
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v30, "childAt:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
LABEL_22:

      if (v8 == ++v9)
        goto LABEL_23;
    }
    v11 = objc_msgSend(v10, "eshObject");
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11);
    if (v12 == 11012)
    {
      objc_msgSend(v10, "firstChildOfType:", 11013);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(a1, "newChartBuild:", v13);
    }
    else
    {
      if (v12 != 11016)
      {
        v15 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v10, "firstChildOfType:", 11017);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(a1, "newParaBuild:", v13);
    }
    v15 = (void *)v14;

LABEL_11:
    objc_msgSend(v10, "firstChildOfType:", 11011);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = (const void *)objc_msgSend(v16, "eshObject");
      if (v18)
      else
        v19 = 0;
      objc_msgSend(v7, "drawableForShapeId:", v19[12]);
      v21 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v21;
      if (v15 && v21)
      {
        v22 = v19[14];
        if ((v22 & 0x80000000) == 0)
        {
          v23 = [PDBuildMapKey alloc];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PDBuildMapKey initWithDrawable:groupId:](v23, "initWithDrawable:groupId:", v20, v25);

          objc_msgSend(v28, "setObject:forUncopiedKey:", v15, v26);
        }
        v7 = v27;
      }
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_22;
  }
LABEL_23:

}

@end
