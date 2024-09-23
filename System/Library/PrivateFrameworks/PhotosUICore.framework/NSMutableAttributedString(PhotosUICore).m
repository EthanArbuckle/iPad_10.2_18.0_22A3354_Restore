@implementation NSMutableAttributedString(PhotosUICore)

- (void)px_replaceOccurrencesOfString:()PhotosUICore withTextAttachmentWithImage:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfString:", v26);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = *MEMORY[0x1E0DC1138];
    do
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(v11, "setImage:", v6);
      objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v8, 0, v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      if (v13)
      {
        v15 = v14;
        if (v14 > 0.0)
        {
          objc_msgSend(v13, "descender");
          v17 = v16;
          objc_msgSend(v13, "ascender");
          v19 = v18 - v17;
          objc_msgSend(v6, "size");
          objc_msgSend(v11, "setBounds:", 0.0, v17, v20 * (v19 / v15), v19);
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11, v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:", v8, v10, v21);
      objc_msgSend(a1, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v22, "rangeOfString:options:range:", v26, 0, v8, objc_msgSend(v23, "length") - v8);
      v10 = v24;

    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)px_replaceFontWithFontDescriptor:()PhotosUICore keepingSymbolicTraits:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  int v13;

  v6 = a3;
  v7 = *MEMORY[0x1E0DC1138];
  v8 = objc_msgSend(a1, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__NSMutableAttributedString_PhotosUICore__px_replaceFontWithFontDescriptor_keepingSymbolicTraits___block_invoke;
  v10[3] = &unk_1E511E340;
  v13 = a4;
  v11 = v6;
  v12 = a1;
  v9 = v6;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0x100000, v10);

}

@end
