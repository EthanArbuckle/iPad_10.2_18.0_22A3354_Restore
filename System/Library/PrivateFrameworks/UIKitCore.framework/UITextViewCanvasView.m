@implementation UITextViewCanvasView

unint64_t __40___UITextViewCanvasView_drawTextInRect___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 72) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(a1 + 80) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v4 = v3;
  result = objc_msgSend(*(id *)(a1 + 48), "textContainerOrigin");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  if (v4)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "hasNonContiguousLayout");
    v10 = *(void **)(a1 + 32);
    result = v9 ? objc_msgSend(v10, "numberOfGlyphs") : objc_msgSend(v10, "firstUnlaidGlyphIndex");
    if (result > v2)
    {
      if (v2 + v4 <= result)
        v11 = v4;
      else
        v11 = result - v2;
      if (v11)
      {
        v12 = objc_msgSend(*(id *)(a1 + 56), "_extendedGlyphRangeForRange:maxGlyphIndex:", v2, v11, result);
        v14 = v13;
        objc_msgSend(*(id *)(a1 + 32), "drawBackgroundForGlyphRange:atPoint:", v12, v13, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", v12, v14, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      }
    }
  }
  return result;
}

@end
