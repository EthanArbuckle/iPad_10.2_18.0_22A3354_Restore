@implementation UITextView

void __70__UITextView_IC__ic_shouldEnableBlockQuoteForAttachmentsOnlySelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (v12 && (v7 = objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v12), v8 = v12, (v7 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(v10, "ic_range:onlyContainsCharacterSet:", a3, a4, v11) ^ 1;

    v8 = v12;
  }

}

void __34__UITextView_IC__ic_rectForRange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "ensureGlyphsForCharacterRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v2 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_range");
  v8 = v7;

  if (v5 <= v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "ensureLayoutForGlyphRange:", v2, v4);
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", v2, v4, *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
    v9[4] = v10;
    v9[5] = v11;
    v9[6] = v12;
    v9[7] = v13;
  }
}

uint64_t __35__UITextView_IC__ic_imageForRange___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;

  result = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  if (v3)
  {
    v4 = result;
    v5 = v3;
    v6 = -*(double *)(a1 + 56);
    v7 = -*(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", result, v3, v6, v7);
    return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", v4, v5, v6, v7);
  }
  return result;
}

@end
