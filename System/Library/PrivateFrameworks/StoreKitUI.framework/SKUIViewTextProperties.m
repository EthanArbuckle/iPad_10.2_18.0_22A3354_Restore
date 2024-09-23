@implementation SKUIViewTextProperties

- (SKUIViewTextProperties)initWithStringLayout:(id)a3
{
  id v4;
  SKUIViewTextProperties *v5;
  double v6;
  double v7;
  void *v8;
  double LineHeight;
  double v10;
  double v11;
  double v12;
  float v13;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewTextProperties initWithStringLayout:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIViewTextProperties;
  v5 = -[SKUIViewTextProperties init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "firstBaselineOffset");
    v7 = v6;
    -[SKUIViewTextProperties setFirstBaselineOffset:](v5, "setFirstBaselineOffset:");
    objc_msgSend(v4, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LineHeight = SKUIAttributedStringGetLineHeight(v8);

    objc_msgSend(v4, "boundingSize");
    v11 = v10;
    objc_msgSend(v4, "baselineOffset");
    *(float *)&v12 = v11 - v12;
    -[SKUIViewTextProperties setBaselineOffsetFromBottom:](v5, "setBaselineOffsetFromBottom:", roundf(*(float *)&v12));
    v13 = LineHeight - v7;
    -[SKUIViewTextProperties setDesiredOffsetTop:](v5, "setDesiredOffsetTop:", roundf(v13));
  }

  return v5;
}

- (SKUIViewTextProperties)initWithTextLayout:(id)a3 isExpanded:(BOOL)a4
{
  id v5;
  SKUIViewTextProperties *v6;
  const __CTFrame *v7;
  const __CFArray *Lines;
  CFIndex Count;
  CFIndex v10;
  uint64_t v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  uint64_t v19;
  objc_super v20;
  uint64_t v21;
  CFRange v22;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewTextProperties initWithTextLayout:isExpanded:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIViewTextProperties;
  v6 = -[SKUIViewTextProperties init](&v20, sel_init);
  if (v6)
  {
    v7 = (const __CTFrame *)objc_msgSend(v5, "textFrame");
    Lines = CTFrameGetLines(v7);
    Count = CFArrayGetCount(Lines);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = objc_msgSend(v5, "textSize");
      v13 = v12;
      MEMORY[0x1E0C80A78](v11);
      v22.location = 0;
      v22.length = v10;
      CTFrameGetLineOrigins(v7, v22, (CGPoint *)&v19 - v10);
      v14 = *((double *)&v19 - 1);
      -[SKUIViewTextProperties setBaselineOffsetFromBottom:](v6, "setBaselineOffsetFromBottom:", roundf(v14));
      v15 = v13 - ((double *)&v19 - 2 * v10)[1];
      v16 = roundf(v15);
      -[SKUIViewTextProperties setFirstBaselineOffset:](v6, "setFirstBaselineOffset:", v16);
      objc_msgSend(v5, "lineHeight");
      -[SKUIViewTextProperties setDesiredOffsetTop:](v6, "setDesiredOffsetTop:", v17 - v16);
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SKUIViewTextProperties baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
  objc_msgSend(v4, "setBaselineOffsetFromBottom:");
  -[SKUIViewTextProperties desiredOffsetTop](self, "desiredOffsetTop");
  objc_msgSend(v4, "setDesiredOffsetTop:");
  -[SKUIViewTextProperties firstBaselineOffset](self, "firstBaselineOffset");
  objc_msgSend(v4, "setFirstBaselineOffset:");
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SKUIViewTextProperties;
  -[SKUIViewTextProperties description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewTextProperties baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
  v6 = v5;
  -[SKUIViewTextProperties firstBaselineOffset](self, "firstBaselineOffset");
  v8 = v7;
  -[SKUIViewTextProperties desiredOffsetTop](self, "desiredOffsetTop");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [Bottom: %.2f, First Baseline: %.2f, Offset Top: %.2f]"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (void)setBaselineOffsetFromBottom:(double)a3
{
  self->_baselineOffsetFromBottom = a3;
}

- (double)desiredOffsetTop
{
  return self->_desiredOffsetTop;
}

- (void)setDesiredOffsetTop:(double)a3
{
  self->_desiredOffsetTop = a3;
}

- (double)firstBaselineOffset
{
  return self->_firstBaselineOffset;
}

- (void)setFirstBaselineOffset:(double)a3
{
  self->_firstBaselineOffset = a3;
}

- (void)initWithStringLayout:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewTextProperties initWithStringLayout:]";
}

- (void)initWithTextLayout:isExpanded:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIViewTextProperties initWithTextLayout:isExpanded:]";
}

@end
