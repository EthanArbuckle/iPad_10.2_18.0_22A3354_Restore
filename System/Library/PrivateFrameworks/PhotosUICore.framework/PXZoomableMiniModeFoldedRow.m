@implementation PXZoomableMiniModeFoldedRow

- (PXZoomableMiniModeFoldedRow)initWithCollapseProgress:(id *)a3 yPosition:(double)a4
{
  PXZoomableMiniModeFoldedRow *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXZoomableMiniModeFoldedRow;
  result = -[PXZoomableMiniModeFoldedRow init](&v9, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0;
    v8 = *(_OWORD *)&a3->var4;
    *(_OWORD *)&result->_collapseProgress.translation = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_collapseProgress.blur = v8;
    *(_OWORD *)&result->_collapseProgress.alpha = v7;
    result->_yPosition = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; collapseProgress.blur:%.2f yPosition:%.2f"),
    v5,
    self,
    *(_QWORD *)&self->_collapseProgress.blur,
    *(_QWORD *)&self->_yPosition);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)collapseProgress
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  return self;
}

- (double)yPosition
{
  return self->_yPosition;
}

@end
