@implementation PDSequentialTimeNode

- (BOOL)concurrent
{
  return self->mConcurrent;
}

- (void)setConcurrent:(BOOL)a3
{
  self->mConcurrent = a3;
}

- (int)previousAction
{
  return self->mPreviousAction;
}

- (void)setPreviousAction:(int)a3
{
  self->mPreviousAction = a3;
}

- (int)nextAction
{
  return self->mNextAction;
}

- (void)setNextAction:(int)a3
{
  self->mNextAction = a3;
}

- (NSMutableArray)previousConditions
{
  return self->mPreviousConditions;
}

- (void)setPreviousConditions:(id)a3
{
  objc_storeStrong((id *)&self->mPreviousConditions, a3);
}

- (NSMutableArray)nextConditions
{
  return self->mNextConditions;
}

- (void)setNextConditions:(id)a3
{
  objc_storeStrong((id *)&self->mNextConditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNextConditions, 0);
  objc_storeStrong((id *)&self->mPreviousConditions, 0);
}

+ (id)timeNodeUnion:(id)a3 initWithClass:(Class)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_alloc_init(a4);
  if ((Class)objc_opt_class() == a4)
  {
    objc_msgSend(v5, "setBehavior:", v6);
  }
  else if ((Class)objc_opt_class() == a4)
  {
    objc_msgSend(v5, "setCmdBehavior:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PDSequentialTimeNode(PDAnimationInfoAdditions) timeNodeUnion:initWithClass:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Dom/PDAnimationInfo.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 58, 0, "PDSequentialTimeNode::timeNodeUnion unsupported behavior class");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(v5, "commonBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unint64_t)buildPartsFromTarget:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v3 = a3;
  v4 = objc_opt_class();
  TSUDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v5, "drawable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_msgSend(v8, "textBody"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      objc_msgSend(v8, "textBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "nonEmptyParagraphCount");

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3 target:(id)a4
{
  id v4;
  uint64_t v5;
  void **p_vtable;
  PDTimeNodeUnion *v7;
  id v8;
  PDTimeCondition *v9;
  id v10;
  id v11;
  PDTimeNodeUnion *v12;
  id v13;
  id v14;
  id v15;
  PDTimeNodeUnion *v16;
  void *v17;
  void *v18;
  id v19;
  PDTimeCondition *v20;
  id v21;
  id v23;
  id v24;
  PDSequentialTimeNode *v25;
  uint64_t v28;
  void *v29;
  void *v30;
  PDTimeCondition *v31;
  PDTimeNodeUnion *v32;
  PDIterate *v33;
  PDTimeCondition *v34;
  void *v35;

  v24 = a4;
  v25 = objc_alloc_init(PDSequentialTimeNode);
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDTimeNode setStartTimeConditions:](v25, "setStartTimeConditions:", v23);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDTimeNode setChildTimeNodeList:](v25, "setChildTimeNodeList:", v4);
  v5 = objc_msgSend(a1, "buildPartsFromTarget:", v24);
  if (v5)
  {
    p_vtable = PBOfficeArtReaderClient.vtable;
    do
    {
      v7 = objc_alloc_init(PDTimeNodeUnion);
      objc_msgSend(v4, "addObject:", v7);
      v8 = objc_alloc_init((Class)(p_vtable + 497));
      -[PDTimeNodeUnion setParallel:](v7, "setParallel:", v8);
      v9 = objc_alloc_init(PDTimeCondition);
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v10, "addObject:", v9);
      objc_msgSend(v8, "setStartTimeConditions:", v10);
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v8, "setChildTimeNodeList:", v11);
      v12 = objc_alloc_init(PDTimeNodeUnion);
      objc_msgSend(v11, "addObject:", v12);
      v13 = objc_alloc_init((Class)(p_vtable + 497));
      -[PDTimeNodeUnion setParallel:](v12, "setParallel:", v13);
      v33 = objc_alloc_init(PDIterate);
      objc_msgSend(v13, "setIterate:", v33);
      v35 = v13;
      v34 = objc_alloc_init(PDTimeCondition);
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v28 = v5;
      objc_msgSend(v14, "addObject:", v34);
      objc_msgSend(v35, "setStartTimeConditions:", v14);
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v32 = v12;
      objc_msgSend(v35, "setChildTimeNodeList:", v15);
      v16 = objc_alloc_init(PDTimeNodeUnion);
      v30 = v10;
      v31 = v9;
      v29 = v11;
      objc_msgSend(v15, "addObject:", v16);
      objc_msgSend(a1, "timeNodeUnion:initWithClass:", v16, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v19 = v4;
      v20 = objc_alloc_init(PDTimeCondition);
      v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v21, "addObject:", v20);
      objc_msgSend(v17, "setStartTimeConditions:", v21);

      v5 = v28 - 1;
      v4 = v19;
      p_vtable = (void **)(PBOfficeArtReaderClient + 24);
    }
    while (v28 != 1);
  }

  return v25;
}

+ (id)newSequentialTimeNodeGroupForAnimationInfo
{
  return (id)objc_msgSend(a1, "newSequentialTimeNodeGroupForAnimationInfoWithClass:target:", objc_opt_class(), 0);
}

+ (id)newSequentialTimeNodeGroupForAnimationInfoWithClass:(Class)a3
{
  return (id)objc_msgSend(a1, "newSequentialTimeNodeGroupForAnimationInfoWithClass:target:", a3, 0);
}

- (id)level1ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PDTimeNode childTimeNodeList](self, "childTimeNodeList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parallel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)level2ParallelTimeNodeGroupAtNodeIndex:(unint64_t)a3 level1NodeIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PDSequentialTimeNode level1ParallelTimeNodeGroupAtNodeIndex:](self, "level1ParallelTimeNodeGroupAtNodeIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childTimeNodeList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parallel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)level3BehaviorAtNodeIndex:(unint64_t)a3 level2NodeIndex:(unint64_t)a4 level1NodeIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childTimeNodeList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setTarget:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PDAnimationTextTarget *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v4 = objc_opt_class();
  TSUDynamicCast(v4, (uint64_t)v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDTimeNode childTimeNodeList](self, "childTimeNodeList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  if (v19)
  {
    v6 = 0;
    do
    {
      -[PDSequentialTimeNode level1ParallelTimeNodeGroupAtNodeIndex:](self, "level1ParallelTimeNodeGroupAtNodeIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "childTimeNodeList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v8;
      v21 = objc_msgSend(v8, "count");
      if (v21)
      {
        v9 = 0;
        do
        {
          -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", v9, v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "childTimeNodeList");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "count");
          if (v12)
          {
            v13 = 0;
            do
            {
              -[PDSequentialTimeNode level3BehaviorAtNodeIndex:level2NodeIndex:level1NodeIndex:](self, "level3BehaviorAtNodeIndex:level2NodeIndex:level1NodeIndex:", v13, v9, v6);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14)
              {
                if (v5)
                {
                  v16 = objc_alloc_init(PDAnimationTextTarget);
                  -[PDAnimationTextTarget setType:](v16, "setType:", objc_msgSend(v5, "type"));
                  objc_msgSend(v5, "drawable");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PDAnimationShapeTarget setDrawable:](v16, "setDrawable:", v17);

                  -[PDAnimationTextTarget setRange:](v16, "setRange:", v6, 1);
                  objc_msgSend(v15, "setTarget:", v16);

                }
                else
                {
                  objc_msgSend(v14, "setTarget:", v22);
                }
              }

              ++v13;
            }
            while (v12 != v13);
          }

          ++v9;
        }
        while (v9 != v21);
      }

      ++v6;
    }
    while (v6 != v19);
  }

}

- (PDAnimationTarget)target
{
  void *v2;
  void *v3;

  -[PDSequentialTimeNode level3BehaviorAtNodeIndex:level2NodeIndex:level1NodeIndex:](self, "level3BehaviorAtNodeIndex:level2NodeIndex:level1NodeIndex:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PDAnimationTarget *)v3;
}

- (void)setLevel2ParallelAttribute:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a3;
  -[PDTimeNode childTimeNodeList](self, "childTimeNodeList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = 0;
    do
    {
      -[PDSequentialTimeNode level1ParallelTimeNodeGroupAtNodeIndex:](self, "level1ParallelTimeNodeGroupAtNodeIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "childTimeNodeList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "count");
      if (v9)
      {
        v10 = 0;
        do
        {
          -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", v10, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v11);

          ++v10;
        }
        while (v9 != v10);
      }

      ++v6;
    }
    while (v6 != v5);
  }

}

- (void)setPresetClass:(int)a3
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetClass___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  v4 = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

uint64_t __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimationPresetClass:", *(unsigned int *)(a1 + 32));
}

- (int)presetClass
{
  void *v2;
  int v3;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "animationPresetClass");

  return v3;
}

- (void)setPresetId:(int)a3
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetId___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  v4 = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

uint64_t __62__PDSequentialTimeNode_PDAnimationInfoAdditions__setPresetId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresetId:", *(unsigned int *)(a1 + 32));
}

- (int)presetId
{
  void *v2;
  int v3;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presetId");

  return v3;
}

- (void)setTriggerType:(int)a3
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setTriggerType___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  v4 = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

uint64_t __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setTriggerType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setType:", *(unsigned int *)(a1 + 32));
}

- (int)triggerType
{
  void *v2;
  int v3;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)setIterateType:(int)a3
{
  _QWORD v3[4];
  int v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setIterateType___block_invoke;
  v3[3] = &__block_descriptor_36_e28_v16__0__PDParallelTimeNode_8l;
  v4 = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

void __65__PDSequentialTimeNode_PDAnimationInfoAdditions__setIterateType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(unsigned int *)(a1 + 32);
  objc_msgSend(a2, "iterate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setType:", v2);

}

- (int)iterateType
{
  void *v2;
  void *v3;
  int v4;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iterate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  return v4;
}

- (void)setDelay:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__PDSequentialTimeNode_PDAnimationInfoAdditions__setDelay___block_invoke;
  v3[3] = &__block_descriptor_40_e28_v16__0__PDParallelTimeNode_8l;
  *(double *)&v3[4] = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

void __59__PDSequentialTimeNode_PDAnimationInfoAdditions__setDelay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "startTimeConditions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelay:", (int)*(double *)(a1 + 32));

}

- (double)delay
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimeConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(int)objc_msgSend(v4, "delay");

  return v5;
}

- (void)setDirection:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__PDSequentialTimeNode_PDAnimationInfoAdditions__setDirection___block_invoke;
  v3[3] = &__block_descriptor_40_e28_v16__0__PDParallelTimeNode_8l;
  *(double *)&v3[4] = a3;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v3);
}

uint64_t __63__PDSequentialTimeNode_PDAnimationInfoAdditions__setDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresetSubType:", (int)*(double *)(a1 + 32));
}

- (double)direction
{
  void *v2;
  double v3;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(int)objc_msgSend(v2, "presetSubType");

  return v3;
}

- (void)setGroupId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__PDSequentialTimeNode_PDAnimationInfoAdditions__setGroupId___block_invoke;
  v6[3] = &unk_24F3B4F10;
  v7 = v4;
  v5 = v4;
  -[PDSequentialTimeNode setLevel2ParallelAttribute:](self, "setLevel2ParallelAttribute:", v6);

}

uint64_t __61__PDSequentialTimeNode_PDAnimationInfoAdditions__setGroupId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGroupId:", *(_QWORD *)(a1 + 32));
}

- (NSString)groupId
{
  void *v2;
  void *v3;

  -[PDSequentialTimeNode level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:](self, "level2ParallelTimeNodeGroupAtNodeIndex:level1NodeIndex:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
