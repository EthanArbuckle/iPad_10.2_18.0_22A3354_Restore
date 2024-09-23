@implementation _UITextFieldCanvasView

- (_UITextFieldCanvasView)init
{
  _UITextFieldCanvasView *v2;
  _UITextFieldCanvasView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldCanvasView;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    _UITextFieldCanvasViewCommonInit(v2);
  return v3;
}

- (_UITextFieldCanvasView)initWithCoder:(id)a3
{
  _UITextFieldCanvasView *v3;
  _UITextFieldCanvasView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldCanvasView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _UITextFieldCanvasViewCommonInit(v3);
  return v4;
}

- (BOOL)_enableAutoConstraining
{
  return 0;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *ContextStack;
  CGContext *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextCanvasView context](self, "context");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "textContainerOrigin");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "ensureLayoutForBoundingRect:inTextContainer:", v8, x, y, width, height);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v51 = CGRectOffset(v50, -v10, -v12);
  v13 = objc_msgSend(v7, "glyphRangeForBoundingRect:inTextContainer:", v8, v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  v15 = v14;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v17 = 0;
  else
    v17 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  if (objc_msgSend(v43, "_isPasscodeStyle"))
  {
    CGContextSaveGState(v17);
    v18 = objc_msgSend(v43, "_unobscuredSecureRange");
    v20 = v18;
    v21 = v19;
    if (v19)
      v22 = v18;
    else
      v22 = v15;
    if (v19)
      v23 = 0;
    else
      v23 = v13;
    v24 = objc_msgSend(v7, "glyphRangeForCharacterRange:actualCharacterRange:", v23, v22, 0);
    v26 = v25;
    v27 = objc_msgSend(v7, "glyphRangeForCharacterRange:actualCharacterRange:", v20, v21, 0);
    v29 = v28;
    objc_msgSend(v43, "_passcodeStyleAlpha");
    CGContextSetAlpha(v17, v30);
    CGContextSetAlpha(v17, 1.0);
    if (v26)
      objc_msgSend(v7, "drawGlyphsForGlyphRange:atPoint:", v24, v26, v10, v12);
    CGContextRestoreGState(v17);
    if (v29)
      objc_msgSend(v7, "drawGlyphsForGlyphRange:atPoint:", v27, v29, v10, v12);
  }
  else if (v15)
  {
    objc_msgSend(v7, "drawBackgroundForGlyphRange:atPoint:", v13, v15, v10, v12);
    objc_msgSend(v7, "usedRectForTextContainer:", v8);
    v53 = CGRectOffset(v52, v10, v12);
    v41 = v53.origin.y;
    v42 = v53.origin.x;
    v31 = v53.size.width;
    v32 = v53.size.height;
    objc_msgSend(v43, "_clipRectForFadedEdges");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __41___UITextFieldCanvasView_drawTextInRect___block_invoke;
    v44[3] = &unk_1E16B20D8;
    v45 = v7;
    v46 = v13;
    v47 = v15;
    v48 = v10;
    v49 = v12;
    _UITextCanvasDrawWithFadedEdgesInContext(v17, v44, v42, v41, v31, v32, v34, v36, v38, v40);

  }
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  char v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextCanvasView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "drawTextInRectIfNeeded:", x, y, width, height);

  if ((v9 & 1) == 0)
    -[_UITextFieldCanvasView drawTextInRect:](self, "drawTextInRect:", x, y, width, height);
}

@end
