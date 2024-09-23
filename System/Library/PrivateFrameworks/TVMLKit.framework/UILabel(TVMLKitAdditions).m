@implementation UILabel(TVMLKitAdditions)

- (double)tv_heightToFirstBaseline
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

- (double)tv_scaledValueForValue:()TVMLKitAdditions
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", a2);
  v5 = v4;

  return v5;
}

- (uint64_t)tv_textSizeForWidth:()TVMLKitAdditions
{
  return objc_msgSend(a1, "tv_textSizeForSize:", a3, 0.0);
}

- (double)tv_textSizeForSize:()TVMLKitAdditions
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke;
  v14[3] = &unk_24EB850E0;
  v14[4] = a1;
  v7 = (void *)MEMORY[0x22767F470](v14);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke_2;
  v13[3] = &unk_24EB850E0;
  v13[4] = a1;
  v8 = (void *)MEMORY[0x22767F470](v13);
  if (objc_msgSend(a1, "tv_isPrototypeView"))
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v9, a2, a3);
  v11 = v10;

  return v11;
}

- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions
{
  __int128 v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double *v10;
  double v11;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[6];
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
  v20 = &unk_222E82B8D;
  v2 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v21 = *MEMORY[0x24BDF7718];
  v22 = v2;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke;
  v15[3] = &unk_24EB85180;
  v15[4] = v16;
  v15[5] = &v17;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v15);
  objc_msgSend(a1, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "length");
    v7 = *MEMORY[0x24BDF65F8];
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke_2;
    v13[3] = &unk_24EB851A8;
    v14 = v4;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
    v8 = v14;
  }
  else
  {
    objc_msgSend(a1, "_defaultAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v9);

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
