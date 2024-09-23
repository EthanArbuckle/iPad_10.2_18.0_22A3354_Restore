@implementation PXLeafLayoutPerformer

- (CGSize)performLayout
{
  void *v3;
  double v4;
  double v5;
  CGSize result;

  -[PXLeafLayoutPerformer layoutInput](self, "layoutInput");
  -[PXLeafLayoutPerformer layoutOutput](self, "layoutOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendLayoutRect:", (unsigned __int128)0, (unsigned __int128)0);

  v4 = 0.0;
  v5 = 0.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)children
{
  return self->children;
}

- (id)layoutOutput
{
  return self->layoutOutput;
}

- (void)setLayoutOutput:(id)a3
{
  objc_storeStrong((id *)&self->layoutOutput, a3);
}

- ($FCB1BE82783D26D31A14EDA92AE53F2D)layoutInput
{
  CGSize size;
  CGSize v4;

  size = self[2].var0.size;
  *(CGPoint *)&retstr->var1 = self[2].var0.origin;
  *(CGSize *)&retstr->var2.var1 = size;
  retstr->var2.var3 = *(_QWORD *)&self[2].var1;
  v4 = *(CGSize *)&self[1].var2.var2;
  retstr->var0.origin = *(CGPoint *)&self[1].var2.var0;
  retstr->var0.size = v4;
  return self;
}

- (void)setLayoutInput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  CGSize size;

  self->layoutInput.layoutRect.origin = a3->var0.origin;
  v4 = *(_OWORD *)&a3->var1;
  v3 = *(_OWORD *)&a3->var2.var1;
  size = a3->var0.size;
  self->layoutInput.layoutAttributes.layoutOrientation = a3->var2.var3;
  *(_OWORD *)&self->layoutInput.onlyCalculateSize = v4;
  *(_OWORD *)&self->layoutInput.layoutAttributes.layoutDirection = v3;
  self->layoutInput.layoutRect.size = size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layoutOutput, 0);
  objc_storeStrong((id *)&self->children, 0);
}

@end
