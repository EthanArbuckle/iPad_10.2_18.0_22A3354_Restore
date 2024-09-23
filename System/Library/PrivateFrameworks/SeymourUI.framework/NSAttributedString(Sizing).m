@implementation NSAttributedString(Sizing)

- (double)boundingRectWithWidth:()Sizing lines:
{
  void *v6;
  id v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  double v11;
  _QWORD v13[7];
  _QWORD v14[4];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB508]), "initWithAttributedString:", a1);
  v7 = objc_alloc_init(MEMORY[0x24BEBB488]);
  objc_msgSend(v6, "addLayoutManager:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", a2, 1.79769313e308);
  objc_msgSend(v7, "addTextContainer:", v8);
  objc_msgSend(v8, "setMaximumNumberOfLines:", a4);
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x4010000000;
  v18 = &unk_22BC04CFF;
  v9 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v19 = *MEMORY[0x24BDBF090];
  v20 = v9;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v10 = objc_msgSend(v7, "numberOfGlyphs");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__NSAttributedString_Sizing__boundingRectWithWidth_lines___block_invoke;
  v13[3] = &unk_24F555CF0;
  v13[4] = v14;
  v13[5] = &v15;
  v13[6] = a4;
  objc_msgSend(v7, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, v13);
  v11 = v16[4];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v11;
}

@end
