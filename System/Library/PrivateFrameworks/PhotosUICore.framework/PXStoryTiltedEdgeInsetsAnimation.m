@implementation PXStoryTiltedEdgeInsetsAnimation

- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTiltedEdgeInsetsAnimation.m"), 17, CFSTR("%s is not available as initializer"), "-[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:duration:curveInfo:]");

  abort();
}

- (PXStoryTiltedEdgeInsetsAnimation)initWithIdentifier:(id)a3 sourceEdgeInsets:(id *)a4 targetEdgeInsets:(id *)a5 duration:(id *)a6 curveInfo:(id)a7
{
  PXStoryTiltedEdgeInsetsAnimation *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXStoryTiltedEdgeInsetsAnimation;
  v18 = *a6;
  result = -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](&v19, sel_initWithIdentifier_duration_curveInfo_, a3, &v18, a7.var0, *(_QWORD *)&a7.var1.var0);
  if (result)
  {
    v10 = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)&result->_sourceEdgeInsets.top.preRotationInset = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&result->_sourceEdgeInsets.top.postRotationInset = v10;
    v11 = *(_OWORD *)&a4->var3.var1;
    v13 = *(_OWORD *)&a4->var1.var1;
    v12 = *(_OWORD *)&a4->var2.var0;
    *(_OWORD *)&result->_sourceEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a4->var2.var2;
    *(_OWORD *)&result->_sourceEdgeInsets.right.rotationAngle = v11;
    *(_OWORD *)&result->_sourceEdgeInsets.left.rotationAngle = v13;
    *(_OWORD *)&result->_sourceEdgeInsets.bottom.preRotationInset = v12;
    v14 = *(_OWORD *)&a5->var0.var2;
    *(_OWORD *)&result->_targetEdgeInsets.top.preRotationInset = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&result->_targetEdgeInsets.top.postRotationInset = v14;
    v15 = *(_OWORD *)&a5->var3.var1;
    v17 = *(_OWORD *)&a5->var1.var1;
    v16 = *(_OWORD *)&a5->var2.var0;
    *(_OWORD *)&result->_targetEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a5->var2.var2;
    *(_OWORD *)&result->_targetEdgeInsets.right.rotationAngle = v15;
    *(_OWORD *)&result->_targetEdgeInsets.left.rotationAngle = v17;
    *(_OWORD *)&result->_targetEdgeInsets.bottom.preRotationInset = v16;
    *(_OWORD *)&result->_currentEdgeInsets.bottom.postRotationInset = xmmword_1A7C0A4B8;
    *(_OWORD *)&result->_currentEdgeInsets.right.rotationAngle = unk_1A7C0A4C8;
    *(_OWORD *)&result->_currentEdgeInsets.left.rotationAngle = xmmword_1A7C0A498;
    *(_OWORD *)&result->_currentEdgeInsets.bottom.preRotationInset = unk_1A7C0A4A8;
    *(_OWORD *)&result->_currentEdgeInsets.top.preRotationInset = PXStoryTiltedEdgeInsetsNull;
    *(_OWORD *)&result->_currentEdgeInsets.top.postRotationInset = unk_1A7C0A488;
  }
  return result;
}

- (PXStoryTiltedEdgeInsetsAnimation)initWithSourceEdgeInsets:(id *)a3 targetEdgeInsets:(id *)a4 duration:(id *)a5 curveInfo:(id)a6
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  _OWORD v14[6];
  _OWORD v15[6];

  v6 = *(_OWORD *)&a3->var2.var0;
  v15[2] = *(_OWORD *)&a3->var1.var1;
  v15[3] = v6;
  v7 = *(_OWORD *)&a3->var3.var1;
  v15[4] = *(_OWORD *)&a3->var2.var2;
  v15[5] = v7;
  v8 = *(_OWORD *)&a3->var0.var2;
  v15[0] = *(_OWORD *)&a3->var0.var0;
  v15[1] = v8;
  v9 = *(_OWORD *)&a4->var2.var0;
  v14[2] = *(_OWORD *)&a4->var1.var1;
  v14[3] = v9;
  v10 = *(_OWORD *)&a4->var3.var1;
  v14[4] = *(_OWORD *)&a4->var2.var2;
  v14[5] = v10;
  v11 = *(_OWORD *)&a4->var0.var2;
  v14[0] = *(_OWORD *)&a4->var0.var0;
  v14[1] = v11;
  v13 = *a5;
  return -[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:](self, "initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:", 0, v15, v14, &v13, a6.var0, *(_QWORD *)&a6.var1.var0);
}

- (void)updateCurrentValueWithProgress:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[12];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PXStoryTiltedEdgeInsetsAnimation sourceEdgeInsets](self, "sourceEdgeInsets");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXStoryTiltedEdgeInsetsAnimation targetEdgeInsets](self, "targetEdgeInsets");
  PXFloatByLinearlyInterpolatingFloats();
  v26 = v4;
  PXFloatByLinearlyInterpolatingFloats();
  v25 = v5;
  PXFloatByLinearlyInterpolatingFloats();
  v24 = v6;
  PXFloatByLinearlyInterpolatingFloats();
  v23 = v7;
  PXFloatByLinearlyInterpolatingFloats();
  v9 = v8;
  PXFloatByLinearlyInterpolatingFloats();
  v11 = v10;
  PXFloatByLinearlyInterpolatingFloats();
  v13 = v12;
  PXFloatByLinearlyInterpolatingFloats();
  v15 = v14;
  PXFloatByLinearlyInterpolatingFloats();
  v17 = v16;
  PXFloatByLinearlyInterpolatingFloats();
  v19 = v18;
  PXFloatByLinearlyInterpolatingFloats();
  v21 = v20;
  PXFloatByLinearlyInterpolatingFloats();
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v9;
  v27[5] = v11;
  v27[6] = v13;
  v27[7] = v15;
  v27[8] = v17;
  v27[9] = v19;
  v27[10] = v21;
  v27[11] = v22;
  -[PXStoryTiltedEdgeInsetsAnimation setCurrentEdgeInsets:](self, "setCurrentEdgeInsets:", v27);
}

- (void)setCurrentEdgeInsets:(id *)a3
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (a3->var0.var0 != self->_currentEdgeInsets.top.preRotationInset
    || a3->var0.var1 != self->_currentEdgeInsets.top.rotationAngle
    || a3->var0.var2 != self->_currentEdgeInsets.top.postRotationInset)
  {
    goto LABEL_34;
  }
  v5 = a3->var1.var0 == self->_currentEdgeInsets.left.preRotationInset
    && a3->var1.var1 == self->_currentEdgeInsets.left.rotationAngle;
  v6 = v5 && a3->var1.var2 == self->_currentEdgeInsets.left.postRotationInset;
  v7 = v6 && a3->var2.var0 == self->_currentEdgeInsets.bottom.preRotationInset;
  v8 = v7 && a3->var2.var1 == self->_currentEdgeInsets.bottom.rotationAngle;
  v9 = v8 && a3->var2.var2 == self->_currentEdgeInsets.bottom.postRotationInset;
  v10 = v9 && a3->var3.var0 == self->_currentEdgeInsets.right.preRotationInset;
  v11 = v10 && a3->var3.var1 == self->_currentEdgeInsets.right.rotationAngle;
  if (!v11 || a3->var3.var2 != self->_currentEdgeInsets.right.postRotationInset)
  {
LABEL_34:
    v13 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)&self->_currentEdgeInsets.top.preRotationInset = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_currentEdgeInsets.top.postRotationInset = v13;
    v14 = *(_OWORD *)&a3->var1.var1;
    v15 = *(_OWORD *)&a3->var2.var0;
    v16 = *(_OWORD *)&a3->var3.var1;
    *(_OWORD *)&self->_currentEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)&self->_currentEdgeInsets.right.rotationAngle = v16;
    *(_OWORD *)&self->_currentEdgeInsets.left.rotationAngle = v14;
    *(_OWORD *)&self->_currentEdgeInsets.bottom.preRotationInset = v15;
    -[PXStoryTiltedEdgeInsetsAnimation signalChange:](self, "signalChange:", 4);
  }
}

- ($AFFB3261E48324223FE33B3CF9FC7872)sourceEdgeInsets
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  v4 = *(_OWORD *)&self[3].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[3].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  v5 = *(_OWORD *)&self[2].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)targetEdgeInsets
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[4].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  v4 = *(_OWORD *)&self[4].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[4].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  v5 = *(_OWORD *)&self[3].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)currentEdgeInsets
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[5].var1.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var1;
  *(_OWORD *)&retstr->var2.var0 = v3;
  v4 = *(_OWORD *)&self[5].var2.var1;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[5].var1.var2;
  *(_OWORD *)&retstr->var3.var1 = v4;
  v5 = *(_OWORD *)&self[4].var3.var2;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var3.var0;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

@end
