@implementation UILabel

uint64_t __41__UILabel_VideosUI__vui_textSizeForSize___block_invoke(uint64_t a1, double a2, double a3)
{
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfLines") < 2)
    return objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", a2, a3);
  else
    return objc_msgSend(*(id *)(a1 + 32), "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "numberOfLines"), 0.0, 0.0, a2, 3.40282347e38);
}

void __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = a2;
  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v13 = v3;
  objc_msgSend(v3, "capHeight");
  if (v4 < v5)
  {
    objc_msgSend(v13, "ascender");
    v7 = v6;
    objc_msgSend(v13, "capHeight");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v7 - v8;
    objc_msgSend(v13, "capHeight");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
  }
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  objc_msgSend(v13, "descender");
  if (v10 < -v11)
  {
    objc_msgSend(v13, "descender");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = -v12;
  }

}

uint64_t __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
