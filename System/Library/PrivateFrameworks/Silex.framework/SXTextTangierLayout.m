@implementation SXTextTangierLayout

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (Class)repClassForTextLayout:(id)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (CGSize)initialTextSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[TSDLayout info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;

  v6 = 10000000.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)shouldHyphenateTextLayout:(id)a3
{
  return 1;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SXTextTangierLayout;
  -[TSDLayout invalidate](&v16, sel_invalidate);
  -[SXTextTangierLayout setTextWrapper:](self, "setTextWrapper:", 0);
  -[TSDAbstractLayout children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[TSDAbstractLayout children](self, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierLayout invalidate]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierLayout.mm");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 77, CFSTR("TSWPLayout expected here"));

    }
    objc_opt_class();
    -[TSDAbstractLayout children](self, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (int)*MEMORY[0x24BEB3B88];
    v15 = *((unsigned __int8 *)&self->super.super.super.super.isa + v14);
    if ((v15 & 2) != 0)
    {
      objc_msgSend(v13, "invalidateTextLayout");
      v15 = *((unsigned __int8 *)&self->super.super.super.super.isa + v14);
    }
    if ((~v15 & 3) == 0)
      objc_msgSend(v13, "invalidateFrame");

  }
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  return 0.0;
}

- (CGSize)adjustedInsets
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)textWrapperForExteriorWrap
{
  void *v3;
  SXTextTangierTextWrapper *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SXTextTangierLayout textWrapper](self, "textWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(SXTextTangierTextWrapper);
    -[SXTextTangierLayout setTextWrapper:](self, "setTextWrapper:", v4);

    -[TSDLayout info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fixedExclusionPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextTangierLayout textWrapper](self, "textWrapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExclusionPaths:", v7);

  }
  return -[SXTextTangierLayout textWrapper](self, "textWrapper");
}

- (id)additionalReliedOnLayoutsForTextWrap
{
  return 0;
}

- (SXTextTangierTextWrapper)textWrapper
{
  return self->_textWrapper;
}

- (void)setTextWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_textWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textWrapper, 0);
}

@end
