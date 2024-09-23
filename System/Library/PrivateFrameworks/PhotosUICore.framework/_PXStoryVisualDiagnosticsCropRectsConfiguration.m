@implementation _PXStoryVisualDiagnosticsCropRectsConfiguration

- ($AB3D63EC4C35981312A8019AE867EE27)kenBurnsAnimationInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var1.var0.c = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var1.var0.tx = v3;
  retstr->var2 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self[1].var0.var0.b;
  v4 = *(_OWORD *)&self->var1.var0.a;
  *(_OWORD *)&retstr->var0.var0.a = *(_OWORD *)&self->var0.var0.tx;
  *(_OWORD *)&retstr->var0.var0.c = v4;
  v5 = *(_OWORD *)&self->var1.var0.tx;
  *(_OWORD *)&retstr->var0.var0.tx = *(_OWORD *)&self->var1.var0.c;
  *(_OWORD *)&retstr->var1.var0.a = v5;
  return self;
}

- (void)setKenBurnsAnimationInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->var0.var0.a;
  v4 = *(_OWORD *)&a3->var0.var0.c;
  v5 = *(_OWORD *)&a3->var1.var0.a;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.tx = *(_OWORD *)&a3->var0.var0.tx;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.a = v5;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.a = v3;
  *(_OWORD *)&self->kenBurnsAnimationInfo.sourceContentsRect.t.c = v4;
  v6 = *(_OWORD *)&a3->var1.var0.c;
  v7 = *(_OWORD *)&a3->var1.var0.tx;
  v8 = *(_OWORD *)&a3->var2.var0;
  self->kenBurnsAnimationInfo.duration.epoch = a3->var2.var3;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.tx = v7;
  *(_OWORD *)&self->kenBurnsAnimationInfo.duration.value = v8;
  *(_OWORD *)&self->kenBurnsAnimationInfo.targetContentsRect.t.c = v6;
}

- (PXStoryMovieHighlight)movieHighlight
{
  return self->movieHighlight;
}

- (void)setMovieHighlight:(id)a3
{
  objc_storeStrong((id *)&self->movieHighlight, a3);
}

- (CGSize)TVPreviewSize
{
  double width;
  double height;
  CGSize result;

  width = self->TVPreviewSize.width;
  height = self->TVPreviewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTVPreviewSize:(CGSize)a3
{
  self->TVPreviewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->movieHighlight, 0);
}

@end
