@implementation TLKLabelItem

- (TLKLabelItem)init
{
  TLKLabelItem *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKLabelItem;
  v2 = -[TLKLabelItem init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKLabelItem setSizeCache:](v2, "setSizeCache:", v3);

  }
  return v2;
}

+ (void)initialize
{
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__TLKLabelItem_initialize__block_invoke;
  v5[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v5[4] = a1;
  v4 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("TLKContentSizeCategoryDidChangeNotification"), 0, 0, v5);

  objc_msgSend(a1, "setFontValues");
}

uint64_t __26__TLKLabelItem_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFontValues");
}

+ (void)setFontValues
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  +[TLKFontUtilities preferredFontForTextStyle:maximumContentSizeCategory:](TLKFontUtilities, "preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC48F0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)font;
  font = v2;

  +[TLKLabelItem font](TLKLabelItem, "font");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities scaledValueForValue:withFont:view:](TLKLayoutUtilities, "scaledValueForValue:withFont:view:", v5, 0, 18.0);
  minimumWidthForLabelItem = v4;

}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  void *v2;
  BOOL v3;

  -[TLKLabelItem richText](self, "richText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxLines") != 1;

  return v3;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  void *v2;
  double v3;
  double v4;

  +[TLKLabelItem font](TLKLabelItem, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ascender");
  v4 = v3;

  return v4;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  void *v2;
  double v3;
  double v4;

  +[TLKLabelItem font](TLKLabelItem, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descender");
  v4 = -v3;

  return v4;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  double v4;

  if (a3)
    return 999.0;
  -[TLKLabelItem horizontalCompressionResistance](self, "horizontalCompressionResistance");
  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  double v4;

  if (a3)
    return 999.0;
  -[TLKLabelItem horizontalHuggingPriority](self, "horizontalHuggingPriority");
  return v4;
}

+ (double)minimumWidthForLabelItem
{
  return *(double *)&minimumWidthForLabelItem;
}

- (CGSize)sizeForTargetSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0DC33C8]);
  objc_msgSend(v6, "setWrapsForTruncationMode:", 1);
  -[TLKLabelItem richText](self, "richText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaximumNumberOfLines:", objc_msgSend(v7, "maxLines"));

  -[TLKLabelItem attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingRectWithSize:options:context:", 1, v6, width, height);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)attributedString
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[TLKLabelItem richText](self, "richText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = 0;
  +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:", v2, 0, 0, 4, font, 0, 0.0, v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)font
{
  return (id)font;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;
  CGRect v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)TLKLabelItem;
  -[TLKLabelItem description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKLabelItem attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->columnRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKLabelItem frame](self, "frame");
  NSStringFromCGRect(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->row);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[TLKLabelItem horizontalHuggingPriority](self, "horizontalHuggingPriority");
  objc_msgSend(v9, "numberWithInteger:", (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[TLKLabelItem horizontalCompressionResistance](self, "horizontalCompressionResistance");
  objc_msgSend(v12, "numberWithInteger:", (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ string = %@ range = %@ frame = %@ row = %@ CH = %@ CR = %@"), v4, v5, v6, v7, v8, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->frame.origin.x;
  y = self->frame.origin.y;
  width = self->frame.size.width;
  height = self->frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->frame = a3;
}

- (_NSRange)columnRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->columnRange.length;
  location = self->columnRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->columnRange = a3;
}

- (unint64_t)row
{
  return self->row;
}

- (void)setRow:(unint64_t)a3
{
  self->row = a3;
}

- (double)horizontalHuggingPriority
{
  return self->horizontalHuggingPriority;
}

- (void)setHorizontalHuggingPriority:(double)a3
{
  self->horizontalHuggingPriority = a3;
}

- (double)horizontalCompressionResistance
{
  return self->horizontalCompressionResistance;
}

- (void)setHorizontalCompressionResistance:(double)a3
{
  self->horizontalCompressionResistance = a3;
}

- (NUISizeCache)sizeCache
{
  return self->sizeCache;
}

- (void)setSizeCache:(id)a3
{
  objc_storeStrong((id *)&self->sizeCache, a3);
}

- (TLKRichText)richText
{
  return self->_richText;
}

- (void)setRichText:(id)a3
{
  objc_storeStrong((id *)&self->_richText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richText, 0);
  objc_storeStrong((id *)&self->sizeCache, 0);
}

@end
