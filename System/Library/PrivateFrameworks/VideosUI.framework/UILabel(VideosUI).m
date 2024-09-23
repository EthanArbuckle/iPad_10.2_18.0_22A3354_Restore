@implementation UILabel(VideosUI)

- (double)vui_heightToBaseline
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "font");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lineHeight");
  v3 = v2;
  objc_msgSend(v1, "descender");
  v5 = v3 + v4;

  return v5;
}

- (double)vui_textSizeForSize:()VideosUI
{
  void *v6;
  double v7;
  double v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UILabel_VideosUI__vui_textSizeForSize___block_invoke;
  aBlock[3] = &unk_1E9F9A4C0;
  aBlock[4] = a1;
  v6 = _Block_copy(aBlock);
  objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v6, a2, a3);
  v8 = v7;

  return v8;
}

- (double)vui_alignmentInsetsForExpectedWidth:()VideosUI
{
  __int128 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double *v10;
  double v11;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[6];
  _QWORD v16[4];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x4010000000;
  v20 = &unk_1DA394075;
  v2 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v21 = *MEMORY[0x1E0DC49E8];
  v22 = v2;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke;
  aBlock[3] = &unk_1E9F9EF58;
  aBlock[4] = v16;
  aBlock[5] = &v17;
  v4 = _Block_copy(aBlock);
  objc_msgSend(a1, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "length");
    v7 = *MEMORY[0x1E0DC1138];
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke_2;
    v13[3] = &unk_1E9F9EF80;
    v14 = v4;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
    v8 = v14;
  }
  else
  {
    objc_msgSend(a1, "_defaultAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v4 + 2))(v4, v9);

  }
  v10 = v18;
  v11 = floor(v18[4]);
  v18[4] = v11;
  v10[6] = floor(v10[6]);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
  return v11;
}

@end
