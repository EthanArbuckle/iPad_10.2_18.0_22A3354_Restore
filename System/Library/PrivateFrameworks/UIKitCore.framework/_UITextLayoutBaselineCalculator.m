@implementation _UITextLayoutBaselineCalculator

- (double)lastBaselineOffsetFromBottom
{
  void *v3;
  double v4;
  double v5;
  UICoordinateSpace *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MaxY;
  double v16;
  CGRect v18;
  CGRect v19;

  -[_UITextLayoutController endOfDocument](self->_textLayoutController, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutBaselineCalculator _baselineOffsetAtPosition:](self, "_baselineOffsetAtPosition:", v3);
  v5 = v4;

  v6 = self->_coordinateSpace;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v6);
  else
    -[UICoordinateSpace bounds](v6, "bounds");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v18.origin.x = v11;
  v18.origin.y = v12;
  v18.size.width = v13;
  v18.size.height = v14;
  MaxY = CGRectGetMaxY(v18);
  -[UICoordinateSpace bounds](self->_coordinateSpace, "bounds");
  v16 = CGRectGetHeight(v19) - MaxY;
  if (v16 < 0.0)
    v16 = 0.0;
  if (self->_usesLineFragmentOrigin)
    v16 = -0.0;
  return MaxY - v5 + v16;
}

- (_UITextLayoutBaselineCalculator)initWithTextLayoutController:(id)a3 typingAttributes:(id)a4 usesLineFragmentOrigin:(BOOL)a5 coordinateSpace:(id)a6 scale:(double)a7 fallbackTextContainerOrigin:(CGPoint)a8
{
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  _UITextLayoutBaselineCalculator *v19;
  _UITextLayoutBaselineCalculator *v20;
  objc_super v22;

  y = a8.y;
  x = a8.x;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UITextLayoutBaselineCalculator;
  v19 = -[_UITextLayoutBaselineCalculator init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_textLayoutController, a3);
    objc_storeStrong((id *)&v20->_typingAttributes, a4);
    objc_storeStrong((id *)&v20->_coordinateSpace, a6);
    v20->_scale = a7;
    v20->_usesLineFragmentOrigin = a5;
    v20->_fallbackTextContainerOrigin.x = x;
    v20->_fallbackTextContainerOrigin.y = y;
  }

  return v20;
}

- (double)firstBaselineOffsetFromTop
{
  void *v3;
  double v4;
  double v5;
  UICoordinateSpace *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v16;

  -[_UITextLayoutController beginningOfDocument](self->_textLayoutController, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutBaselineCalculator _baselineOffsetAtPosition:](self, "_baselineOffsetAtPosition:", v3);
  v5 = v4;

  v6 = self->_coordinateSpace;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v6);
  else
    -[UICoordinateSpace bounds](v6, "bounds");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v16.origin.x = v11;
  v16.origin.y = v12;
  v16.size.width = v13;
  v16.size.height = v14;
  return v5 + CGRectGetMinY(v16);
}

- (double)_convertOffset:(double)a3
{
  UICoordinateSpace *v5;
  void *v6;
  double v7;
  double result;

  if (self->_coordinateSpace)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (-[UICoordinateSpace _baselineCalculatorSourceCoordinateSpace](self->_coordinateSpace, "_baselineCalculatorSourceCoordinateSpace"), (v5 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue()) != 0)|| (-[_UITextLayoutController firstTextContainer](self->_textLayoutController, "firstTextContainer"), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "textView"), v5 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue(), v6, v5))
    {
      if (v5 != self->_coordinateSpace)
      {
        -[UICoordinateSpace convertPoint:toCoordinateSpace:](v5, "convertPoint:toCoordinateSpace:", 0.0, a3);
        a3 = v7;
      }
    }

  }
  UIRoundToScale(a3, self->_scale);
  return result;
}

- (double)_baselineOffsetAtPosition:(id)a3
{
  id v4;
  __int128 v5;
  _UITextLayoutController *textLayoutController;
  NSDictionary *typingAttributes;
  UICoordinateSpace *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *p_x;
  UICoordinateSpace *v18;
  char v19;
  UICoordinateSpace *coordinateSpace;
  void *v21;
  double MinY;
  double v23;
  double y;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGRect *v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;

  v4 = a3;
  v42 = 0;
  v43 = (CGRect *)&v42;
  v44 = 0x4010000000;
  v45 = &unk_18685B0AF;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v46 = *MEMORY[0x1E0C9D648];
  v47 = v5;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__86;
  v36 = __Block_byref_object_dispose__86;
  v37 = 0;
  textLayoutController = self->_textLayoutController;
  typingAttributes = self->_typingAttributes;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61___UITextLayoutBaselineCalculator__baselineOffsetAtPosition___block_invoke;
  v31[3] = &unk_1E16C6648;
  v31[4] = &v32;
  v31[5] = &v42;
  v31[6] = &v38;
  -[_UITextLayoutController requestTextGeometryAtPosition:typingAttributes:resultBlock:](textLayoutController, "requestTextGeometryAtPosition:typingAttributes:resultBlock:", v4, typingAttributes, v31);
  if (CGRectIsNull(v43[1]))
  {
    v8 = self->_coordinateSpace;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = _UIBaselineLayoutBoundsConsultingContentSizeConstraints(v8);
    else
      -[UICoordinateSpace bounds](v8, "bounds");
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;

    p_x = (_QWORD *)&v43->origin.x;
    v43[1].origin.x = v13;
    p_x[5] = v14;
    p_x[6] = v15;
    p_x[7] = v16;
  }
  if (v39[3] == 0.0)
  {
    -[_UITextLayoutController textStorage](self->_textLayoutController, "textStorage");
    v18 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();
    coordinateSpace = v18;
    if ((v19 & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_11;
      coordinateSpace = self->_coordinateSpace;
    }
    -[UICoordinateSpace font](coordinateSpace, "font");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
LABEL_12:
      MinY = CGRectGetMinY(v43[1]);
      objc_msgSend(v21, "ascender");
      v39[3] = MinY + v23;

      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend((id)v33[5], "size");
  y = 0.0;
  if (v25 > 0.0)
  {
    objc_msgSend((id)v33[5], "textView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend((id)v33[5], "textContainerOrigin");
      y = v27;
    }
    else
    {
      y = self->_fallbackTextContainerOrigin.y;
    }

  }
  -[_UITextLayoutBaselineCalculator _convertOffset:](self, "_convertOffset:", y + CGRectGetMinY(v43[1]) + v39[3]);
  v29 = v28;
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
}

@end
