@implementation UISegmentedControlOutlineStyleProvider

- (BOOL)useSelectionIndicatorStyling
{
  return 0;
}

- (BOOL)animateSelectionSliding
{
  return 0;
}

- (double)defaultContentPaddingWidth
{
  return 7.0;
}

- (double)defaultTextContentPaddingWidth
{
  return 2.0;
}

- (double)defaultHeightForControlSize:(int)a3
{
  double result;

  result = 28.0;
  if (a3 == 1)
    return 22.0;
  return result;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  if (a3 <= 2)
    v4 = dbl_186684200[a3];
  v5 = *(double *)off_1E167DC70;
  v6 = *(_QWORD *)off_1E167DC48;
  v17[0] = *(_QWORD *)off_1E167DC38;
  v7 = *(_QWORD *)off_1E167DC80;
  v16[0] = v6;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = *MEMORY[0x1E0CA8348];
  v17[1] = v8;
  v17[2] = &unk_1E1A9A380;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(_QWORD *)off_1E167DC10;
  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  if (a4)
    objc_msgSend(a3, "_inheritedInteractionTintColor");
  else
    objc_msgSend(a3, "_disabledColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
