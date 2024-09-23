@implementation PXStoryMemoryFeedPlayButtonSpec

- (UIEdgeInsets)labelPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  PXEdgeInsetsMake();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)labelAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[PXStoryMemoryFeedPlayButtonSpec labelAttributesCache](self, "labelAttributesCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "setAlignment:", 0);
    v10[0] = *MEMORY[0x1E0DC1138];
    PXFontWithTextStyleSymbolicTraits();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v10[1] = *MEMORY[0x1E0DC1140];
    -[PXStoryChromeButtonSpec defaultTintColor](self, "defaultTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = *MEMORY[0x1E0DC1178];
    v11[1] = v7;
    v11[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryMemoryFeedPlayButtonSpec setLabelAttributesCache:](self, "setLabelAttributesCache:", v8);

  }
  -[PXStoryMemoryFeedPlayButtonSpec labelAttributesCache](self, "labelAttributesCache");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)backgroundStyle
{
  return 1;
}

- (NSDictionary)labelAttributesCache
{
  return self->_labelAttributesCache;
}

- (void)setLabelAttributesCache:(id)a3
{
  objc_storeStrong((id *)&self->_labelAttributesCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAttributesCache, 0);
}

@end
