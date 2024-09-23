@implementation NSAttributedString(TVMLKitAdditions)

- (id)tv_currentParagraphStyle
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__9;
  v12 = __Block_byref_object_dispose__9;
  v13 = 0;
  if (objc_msgSend(a1, "length"))
  {
    v2 = *MEMORY[0x24BDF6628];
    v3 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke;
    v7[3] = &unk_24EB88248;
    v7[4] = &v8;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v2, 0, 1, 0, v7);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __64__NSAttributedString_TVMLKitAdditions__tv_currentParagraphStyle__block_invoke_2;
    v6[3] = &unk_24EB88248;
    v6[4] = &v8;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v2, objc_msgSend(a1, "length") - 1, 1, 0, v6);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (double)boundingRectWithWidth:()TVMLKitAdditions lines:
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

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6778]), "initWithAttributedString:", a1);
  v7 = objc_alloc_init(MEMORY[0x24BDF6740]);
  objc_msgSend(v6, "addLayoutManager:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6770]), "initWithSize:", a2, 1.79769313e308);
  objc_msgSend(v7, "addTextContainer:", v8);
  objc_msgSend(v8, "setMaximumNumberOfLines:", a4);
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x4010000000;
  v18 = &unk_222E82B8D;
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
  v13[2] = __68__NSAttributedString_TVMLKitAdditions__boundingRectWithWidth_lines___block_invoke;
  v13[3] = &unk_24EB88270;
  v13[4] = v14;
  v13[5] = &v15;
  v13[6] = a4;
  objc_msgSend(v7, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, v13);
  v11 = v16[4];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)tv_defaultAttributes
{
  return objc_getAssociatedObject(a1, "TVDefaultAttributesKey");
}

- (void)tv_setDefaultAttributes:()TVMLKitAdditions
{
  objc_setAssociatedObject(a1, "TVDefaultAttributesKey", a3, (void *)3);
}

@end
