@implementation _PXStoryPacingControllerDecisionHistory

- (_PXStoryPacingControllerDecisionHistory)init
{
  _PXStoryPacingControllerDecisionHistory *v2;
  NSMutableArray *v3;
  NSMutableArray *decisionHistory;
  NSMutableArray *v5;
  _PXStoryPacingControllerDecisionList *v6;
  _PXStoryPacingControllerDecisionList *v7;
  __int128 v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_PXStoryPacingControllerDecisionHistory;
  v2 = -[_PXStoryPacingControllerDecisionHistory init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    decisionHistory = v2->_decisionHistory;
    v2->_decisionHistory = v3;

    v5 = v2->_decisionHistory;
    v6 = [_PXStoryPacingControllerDecisionList alloc];
    v9 = *MEMORY[0x1E0CA2E18];
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v7 = -[_PXStoryPacingControllerDecisionList initWithResetReason:targetRemainingDuration:](v6, "initWithResetReason:targetRemainingDuration:", CFSTR("Initial"), &v9);
    -[NSMutableArray addObject:](v5, "addObject:", v7);

  }
  return v2;
}

- ($61187B45F3045697A52F3AF35DA3878B)firstPacingDecisionAfterTime:(SEL)a3
{
  void *v6;
  uint64_t *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  $61187B45F3045697A52F3AF35DA3878B *result;
  _QWORD v16[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v18 = 0;
  v19 = &v18;
  v20 = 0x11010000000;
  v21 = &unk_1A7E74EE7;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSMutableArray lastObject](self->_decisionHistory, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72___PXStoryPacingControllerDecisionHistory_firstPacingDecisionAfterTime___block_invoke;
  v16[3] = &unk_1E5142F58;
  v17 = *a4;
  v16[4] = &v18;
  objc_msgSend(v6, "enumerateDecisionsWithBlock:", v16);

  v7 = v19;
  v8 = *((_OWORD *)v19 + 15);
  *(_OWORD *)&retstr->var8.var3 = *((_OWORD *)v19 + 14);
  *(_OWORD *)&retstr->var10 = v8;
  *(_OWORD *)&retstr->var11.var1 = *((_OWORD *)v7 + 16);
  v9 = *((_OWORD *)v7 + 11);
  *(_OWORD *)&retstr->var4.var1 = *((_OWORD *)v7 + 10);
  *(_OWORD *)&retstr->var6.var0 = v9;
  v10 = *((_OWORD *)v7 + 13);
  *(_OWORD *)&retstr->var6.var3 = *((_OWORD *)v7 + 12);
  *(_OWORD *)&retstr->var8.var0 = v10;
  v11 = *((_OWORD *)v7 + 7);
  *(_OWORD *)&retstr->var2.var1 = *((_OWORD *)v7 + 6);
  *(_OWORD *)&retstr->var3.var0 = v11;
  v12 = *((_OWORD *)v7 + 9);
  *(_OWORD *)&retstr->var3.var3 = *((_OWORD *)v7 + 8);
  *(_OWORD *)&retstr->var4.var0.var1 = v12;
  v13 = *((_OWORD *)v7 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v7 + 2);
  *(_OWORD *)&retstr->var1.var0.var1 = v13;
  v14 = *((_OWORD *)v7 + 5);
  *(_OWORD *)&retstr->var1.var1.var0 = *((_OWORD *)v7 + 4);
  *(_OWORD *)&retstr->var1.var1.var3 = v14;
  _Block_object_dispose(&v18, 8);
  return result;
}

- (void)resetWithTargetDuration:(id *)a3 reason:(id)a4
{
  id v6;
  _PXStoryPacingControllerDecisionList *v7;
  _PXStoryPacingControllerDecisionList *v8;
  void *v9;
  uint64_t v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v6 = a4;
  v7 = [_PXStoryPacingControllerDecisionList alloc];
  v11 = *a3;
  v8 = -[_PXStoryPacingControllerDecisionList initWithResetReason:targetRemainingDuration:](v7, "initWithResetReason:targetRemainingDuration:", v6, &v11);

  -[NSMutableArray lastObject](self->_decisionHistory, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "decisionsCount");

  if (!v10)
    -[NSMutableArray removeLastObject](self->_decisionHistory, "removeLastObject");
  -[NSMutableArray addObject:](self->_decisionHistory, "addObject:", v8);

}

- (void)recordDecision:(id *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int64_t decisionCount;
  double v14;
  _OWORD v15[15];

  -[NSMutableArray lastObject](self->_decisionHistory, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var10;
  v15[12] = *(_OWORD *)&a3->var8.var3;
  v15[13] = v6;
  v15[14] = *(_OWORD *)&a3->var11.var1;
  v7 = *(_OWORD *)&a3->var6.var0;
  v15[8] = *(_OWORD *)&a3->var4.var1;
  v15[9] = v7;
  v8 = *(_OWORD *)&a3->var8.var0;
  v15[10] = *(_OWORD *)&a3->var6.var3;
  v15[11] = v8;
  v9 = *(_OWORD *)&a3->var3.var0;
  v15[4] = *(_OWORD *)&a3->var2.var1;
  v15[5] = v9;
  v10 = *(_OWORD *)&a3->var4.var0.var1;
  v15[6] = *(_OWORD *)&a3->var3.var3;
  v15[7] = v10;
  v11 = *(_OWORD *)&a3->var1.var0.var1;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v11;
  v12 = *(_OWORD *)&a3->var1.var1.var3;
  v15[2] = *(_OWORD *)&a3->var1.var1.var0;
  v15[3] = v12;
  objc_msgSend(v5, "appendDecision:", v15);

  decisionCount = self->_decisionCount;
  self->_decisionCount = decisionCount + 1;
  if (a3->var4.var1 >= 2)
    ++self->_onBarCount;
  if (decisionCount < 0)
    v14 = 0.0;
  else
    v14 = (double)self->_onBarCount / (double)(decisionCount + 1) * 100.0;
  self->_onBarPercentage = v14;
}

- (id)descriptionWithShortStyle:(BOOL)a3
{
  id v5;
  NSMutableArray *decisionHistory;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  BOOL v15;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  decisionHistory = self->_decisionHistory;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __69___PXStoryPacingControllerDecisionHistory_descriptionWithShortStyle___block_invoke;
  v13 = &unk_1E5142F80;
  v15 = a3;
  v14 = v5;
  v7 = v5;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](decisionHistory, "enumerateObjectsWithOptions:usingBlock:", 2, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentError
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v16;
  CMTime v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTime v32;
  CMTime rhs;
  CMTime lhs;

  v32.epoch = 0;
  *(_OWORD *)&v32.value = PXStoryTimeZero;
  -[NSMutableArray lastObject](self->_decisionHistory, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "decisionsCount") >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v4, "decisions");
      v8 = *(_OWORD *)(v7 + v5 + 208);
      v29 = *(_OWORD *)(v7 + v5 + 192);
      v30 = v8;
      v31 = *(_OWORD *)(v7 + v5 + 224);
      v9 = *(_OWORD *)(v7 + v5 + 144);
      v25 = *(_OWORD *)(v7 + v5 + 128);
      v26 = v9;
      v10 = *(_OWORD *)(v7 + v5 + 176);
      v27 = *(_OWORD *)(v7 + v5 + 160);
      v28 = v10;
      v11 = *(_OWORD *)(v7 + v5 + 80);
      *(_OWORD *)&v21[16] = *(_OWORD *)(v7 + v5 + 64);
      v22 = v11;
      v12 = *(_OWORD *)(v7 + v5 + 112);
      v23 = *(_OWORD *)(v7 + v5 + 96);
      v24 = v12;
      v13 = *(_OWORD *)(v7 + v5 + 16);
      v18 = *(_OWORD *)(v7 + v5);
      v19 = v13;
      v14 = *(_OWORD *)(v7 + v5 + 48);
      v20 = *(_OWORD *)(v7 + v5 + 32);
      *(_OWORD *)v21 = v14;
      *(_OWORD *)&lhs.value = v22;
      lhs.epoch = v23;
      rhs = *(CMTime *)&v21[8];
      CMTimeSubtract(&v16, &lhs, &rhs);
      lhs = v32;
      rhs = v16;
      CMTimeAdd(&v17, &lhs, &rhs);
      v32 = v17;
      ++v6;
      v5 += 240;
    }
    while (objc_msgSend(v4, "decisionsCount") > v6);
  }
  *(CMTime *)retstr = v32;

  return result;
}

- (int64_t)onBarCount
{
  return self->_onBarCount;
}

- (int64_t)decisionCount
{
  return self->_decisionCount;
}

- (double)onBarPercentage
{
  return self->_onBarPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisionHistory, 0);
}

@end
