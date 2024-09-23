@implementation __NSMarkedTextUnderlineRenderer

- (uint64_t)processMarkedTextUnderline:(void *)a3 textRange:(uint64_t)a4 adjustmentCallback:
{
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  id v21;

  if (!a1)
    return 0;
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSUnderline"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSMarkedTextSelectionAttributeName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v10, "BOOLValue");
  else
    v11 = (v9 & 3) != 1;
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_16;
  if (v9
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "location"), "isEqual:", objc_msgSend(a3, "endLocation")) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "endLocation"), "isEqual:", objc_msgSend(a3, "location")) & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 64), "intersectsWithTextRange:", a3))
  {
    v16 = -[__NSMarkedTextUnderlineRenderer renderUnderline:](a1, a4);
    goto LABEL_19;
  }
  v12 = (void *)objc_msgSend(*(id *)(a1 + 64), "textRangeByFormingUnionWithTextRange:", a3);

  *(_QWORD *)(a1 + 64) = v12;
  if (v11)
  {
    v13 = *(void **)(a1 + 72);
    if (v13)
    {
      v14 = (void *)objc_msgSend(v13, "textRangeByFormingUnionWithTextRange:", a3);
      v15 = *(void **)(a1 + 72);
    }
    else
    {
      v15 = 0;
      v14 = a3;
    }

    v17 = v14;
    v16 = 0;
    *(_QWORD *)(a1 + 72) = v17;
  }
  else
  {
LABEL_16:
    v16 = 0;
  }
LABEL_19:
  if (!*(_QWORD *)(a1 + 48) && v9)
  {
    v18 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSUnderlineColor"));
    if (!v18)
    {
      v18 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSColor"));
      if (!v18)
      {
        v19 = objc_msgSend(*(id *)(a1 + 8), "applicationFrameworkContext");
        if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
        {
          v20 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v19);
        }
        else
        {
          v20 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
        }
        v18 = (void *)-[objc_class blackColor](v20, "blackColor");
      }
    }
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = v18;
    v21 = a3;
    *(_QWORD *)(a1 + 64) = v21;
    if (v11)
      *(_QWORD *)(a1 + 72) = v21;
  }
  return v16;
}

- (uint64_t)renderUnderline:(uint64_t)a1
{
  int v4;
  uint64_t v5;
  int v6;
  double v7;
  uint64_t v8;

  if (!a1 || !*(_QWORD *)(a1 + 48))
    return 0;
  v4 = objc_msgSend(*(id *)(a1 + 72), "isEqual:", *(_QWORD *)(a1 + 64));
  if ((v4 & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 64);
    v6 = objc_msgSend(*(id *)(a1 + 72), "isNotEmpty");
    v7 = 0.35;
    if (!v6)
      v7 = 1.0;
    objc_msgSend((id)a1, "_renderUnderlineInTextRange:alphaValue:adjustmentCallback:", v5, a2, v7);
  }
  if (objc_msgSend(*(id *)(a1 + 72), "isNotEmpty"))
  {
    objc_msgSend((id)a1, "_renderUnderlineInTextRange:alphaValue:adjustmentCallback:", *(_QWORD *)(a1 + 72), a2, 1.0);
    v8 = 1;
  }
  else
  {
    v8 = v4 ^ 1u;
  }
  *(_QWORD *)(a1 + 48) = 0;

  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSMarkedTextUnderlineRenderer;
  -[__NSMarkedTextUnderlineRenderer dealloc](&v3, sel_dealloc);
}

- (void)_renderUnderlineInTextRange:(id)a3 alphaValue:(double)a4 adjustmentCallback:(id)a5
{
  uint64_t v9;
  char v10;
  NSTextLineFragment *textLineFragment;
  _QWORD v12[8];
  char v13;

  v9 = -[NSTextGraphicsContext CGContext](self->_graphicsContext, "CGContext");
  v10 = -[NSTextGraphicsContext isFlipped](self->_graphicsContext, "isFlipped");
  if (v9)
  {
    textLineFragment = self->_textLineFragment;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93____NSMarkedTextUnderlineRenderer__renderUnderlineInTextRange_alphaValue_adjustmentCallback___block_invoke;
    v12[3] = &unk_1E26052F0;
    v12[4] = self;
    v12[5] = a5;
    v13 = v10;
    v12[6] = v9;
    *(double *)&v12[7] = a4;
    -[NSTextLineFragment enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:](textLineFragment, "enumerateTextSegmentBoundsInTextRange:dataSourceLocationsOnly:usingBlock:", a3, 1, v12);
  }
}

@end
