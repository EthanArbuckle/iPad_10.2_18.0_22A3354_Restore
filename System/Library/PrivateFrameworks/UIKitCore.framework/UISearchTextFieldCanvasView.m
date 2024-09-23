@implementation UISearchTextFieldCanvasView

void __49___UISearchTextFieldCanvasView__updateTokenViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double y;
  double width;
  double height;
  double MinX;
  double MaxX;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double rect;
  id rect_8;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  rect_8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 32), "lineFragmentRectForGlyphAtIndex:effectiveRange:", v7, 0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "locationForGlyphAtIndex:", v7);
    objc_msgSend(rect_8, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v16, a3, v9, v11, v13, v15, v17, v18);
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    rect = v42.origin.x;
    MinX = CGRectGetMinX(v42);
    v43.origin.x = v9;
    v43.origin.y = v11;
    v43.size.width = v13;
    v43.size.height = v15;
    if (MinX < CGRectGetMaxX(v43))
    {
      v44.origin.x = rect;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      MaxX = CGRectGetMaxX(v44);
      v45.origin.x = v9;
      v45.origin.y = v11;
      v45.size.width = v13;
      v45.size.height = v15;
      if (MaxX > CGRectGetMinX(v45))
      {
        v39 = v11;
        objc_msgSend(rect_8, "_viewProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "removeObject:", v25);
        v26 = *(_QWORD **)(a1 + 56);
        if (!v26[57])
        {
          v27 = objc_opt_new();
          v28 = *(_QWORD *)(a1 + 56);
          v29 = *(void **)(v28 + 456);
          *(_QWORD *)(v28 + 456) = v27;

          v26 = *(_QWORD **)(a1 + 56);
        }
        objc_msgSend(v26, "addSubview:", v25);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 456), "addObject:", v25);
        v30 = UIRectIntegralWithScale(rect, y, width, height, *(double *)(a1 + 64));
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(v25, "frame");
        if (v34 != v38 || v36 != v37)
        {
          objc_msgSend(v25, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v34, v36);
          objc_msgSend(v25, "layoutSubviews");
        }
        objc_msgSend(v25, "setFrame:", UIPointRoundToScale(v30 + *(double *)(a1 + 72), v39 + 0.0 + *(double *)(a1 + 80), *(double *)(a1 + 64)));
        objc_msgSend(v25, "updateMaskLayerForAttachmentRect:lineFragment:", v30, v32, v34, v36, v9, v39, v13, v15);

      }
    }
  }

}

@end
