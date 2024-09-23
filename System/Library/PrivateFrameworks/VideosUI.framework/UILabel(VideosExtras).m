@implementation UILabel(VideosExtras)

- (uint64_t)_textAlignmentFromElementAlignment:()VideosExtras
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 3);
}

- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:
{
  return objc_msgSend(a1, "configureForIKTextElement:fontDescriptor:textStyle:capitalize:", a3, a4, a5, 0);
}

- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:
{
  return objc_msgSend(a1, "configureForIKTextElement:fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:", a3, a4, a5, a6, 0);
}

- (void)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0DC1358];
  v16 = a4;
  objc_msgSend(v15, "preferredFontDescriptorWithTextStyle:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "fontDescriptorByAddingAttributes:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v19;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v21 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v14, "preferredContentSizeCategory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_preferredFontForTextStyle:maximumContentSizeCategory:", v13, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }
  objc_msgSend(a1, "setFont:", v20);
  v24 = objc_msgSend(v12, "maxLines");
  objc_msgSend(a1, "setNumberOfLines:", v24 & ~(v24 >> 63));
  objc_msgSend(v12, "color");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(a1, "setTextColor:", v25);
  objc_msgSend(a1, "setTextAlignment:", objc_msgSend(a1, "_textAlignmentFromElementAlignment:", objc_msgSend(v12, "alignment")));
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithTextElement:baseFont:", v12, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v26);
    objc_msgSend(v26, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uppercaseString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "replaceCharactersInRange:withString:", 0, objc_msgSend(v29, "length"), v29);
    v26 = v27;
  }
  if (v14)
  {
    v30 = objc_msgSend(v26, "length");
    v34 = *MEMORY[0x1E0DC1138];
    v35[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v26, "mutableCopy");
    objc_msgSend(v32, "addAttributes:range:", v31, 0, v30);

    v26 = v32;
  }
  objc_msgSend(a1, "setAttributedText:", v26);

}

@end
