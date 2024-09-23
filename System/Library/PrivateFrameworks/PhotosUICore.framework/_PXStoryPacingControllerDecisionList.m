@implementation _PXStoryPacingControllerDecisionList

- (_PXStoryPacingControllerDecisionList)initWithResetReason:(id)a3 targetRemainingDuration:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXStoryPacingControllerDecisionList;
  v7 = -[_PXStoryPacingControllerDecisionList init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 4);
    *((_QWORD *)v7 + 4) = v8;

    v10 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v7 + 7) = a4->var3;
    *(_OWORD *)(v7 + 40) = v10;
    *((_QWORD *)v7 + 1) = 0;
  }

  return (_PXStoryPacingControllerDecisionList *)v7;
}

- (void)appendDecision:(id *)a3
{
  $61187B45F3045697A52F3AF35DA3878B *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  $61187B45F3045697A52F3AF35DA3878B *v17;
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
  __int128 v28;

  if (-[_PXStoryPacingControllerDecisionList decisionsCount](self, "decisionsCount"))
  {
    if (-[_PXStoryPacingControllerDecisionList decisionsCount](self, "decisionsCount") == self->_capacity)
    {
      _PXGArrayResize();
      self->_capacity *= 2;
    }
  }
  else
  {
    v5 = ($61187B45F3045697A52F3AF35DA3878B *)malloc_type_calloc(1uLL, 0xF0uLL, 0x100004052B395BFuLL);
    self->_decisions = v5;
    v7 = *(_OWORD *)&a3->var1.var0.var1;
    v6 = *(_OWORD *)&a3->var1.var1.var0;
    *(_OWORD *)&v5->var0 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v5->var1.var0.var1 = v7;
    *(_OWORD *)&v5->var1.var1.var0 = v6;
    v8 = *(_OWORD *)&a3->var3.var3;
    v10 = *(_OWORD *)&a3->var1.var1.var3;
    v9 = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&v5->var3.var0 = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)&v5->var3.var3 = v8;
    *(_OWORD *)&v5->var1.var1.var3 = v10;
    *(_OWORD *)&v5->var2.var1 = v9;
    v11 = *(_OWORD *)&a3->var6.var3;
    v13 = *(_OWORD *)&a3->var4.var0.var1;
    v12 = *(_OWORD *)&a3->var4.var1;
    *(_OWORD *)&v5->var6.var0 = *(_OWORD *)&a3->var6.var0;
    *(_OWORD *)&v5->var6.var3 = v11;
    *(_OWORD *)&v5->var4.var0.var1 = v13;
    *(_OWORD *)&v5->var4.var1 = v12;
    v14 = *(_OWORD *)&a3->var11.var1;
    v16 = *(_OWORD *)&a3->var8.var0;
    v15 = *(_OWORD *)&a3->var8.var3;
    *(_OWORD *)&v5->var10 = *(_OWORD *)&a3->var10;
    *(_OWORD *)&v5->var11.var1 = v14;
    *(_OWORD *)&v5->var8.var0 = v16;
    *(_OWORD *)&v5->var8.var3 = v15;
    self->_capacity = 1;
  }
  v17 = &self->_decisions[self->_decisionsCount];
  v18 = *(_OWORD *)&a3->var3.var3;
  v20 = *(_OWORD *)&a3->var1.var1.var3;
  v19 = *(_OWORD *)&a3->var2.var1;
  *(_OWORD *)&v17->var3.var0 = *(_OWORD *)&a3->var3.var0;
  *(_OWORD *)&v17->var3.var3 = v18;
  *(_OWORD *)&v17->var1.var1.var3 = v20;
  *(_OWORD *)&v17->var2.var1 = v19;
  v21 = *(_OWORD *)&a3->var6.var3;
  v23 = *(_OWORD *)&a3->var4.var0.var1;
  v22 = *(_OWORD *)&a3->var4.var1;
  *(_OWORD *)&v17->var6.var0 = *(_OWORD *)&a3->var6.var0;
  *(_OWORD *)&v17->var6.var3 = v21;
  *(_OWORD *)&v17->var4.var0.var1 = v23;
  *(_OWORD *)&v17->var4.var1 = v22;
  v24 = *(_OWORD *)&a3->var11.var1;
  v26 = *(_OWORD *)&a3->var8.var0;
  v25 = *(_OWORD *)&a3->var8.var3;
  *(_OWORD *)&v17->var10 = *(_OWORD *)&a3->var10;
  *(_OWORD *)&v17->var11.var1 = v24;
  *(_OWORD *)&v17->var8.var0 = v26;
  *(_OWORD *)&v17->var8.var3 = v25;
  v27 = *(_OWORD *)&a3->var0;
  v28 = *(_OWORD *)&a3->var1.var1.var0;
  *(_OWORD *)&v17->var1.var0.var1 = *(_OWORD *)&a3->var1.var0.var1;
  *(_OWORD *)&v17->var1.var1.var0 = v28;
  *(_OWORD *)&v17->var0 = v27;
  ++self->_decisionsCount;
}

- (void)enumerateDecisionsWithBlock:(id)a3
{
  (*((void (**)(id, int64_t, $61187B45F3045697A52F3AF35DA3878B *))a3 + 2))(a3, self->_decisionsCount, self->_decisions);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_decisions);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryPacingControllerDecisionList;
  -[_PXStoryPacingControllerDecisionList dealloc](&v3, sel_dealloc);
}

- ($61187B45F3045697A52F3AF35DA3878B)decisions
{
  return self->_decisions;
}

- (int64_t)decisionsCount
{
  return self->_decisionsCount;
}

- (NSString)resetReason
{
  return self->_resetReason;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetRemainingDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetReason, 0);
}

@end
