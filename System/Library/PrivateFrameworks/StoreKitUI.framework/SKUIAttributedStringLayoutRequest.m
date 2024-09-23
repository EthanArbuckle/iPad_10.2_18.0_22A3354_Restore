@implementation SKUIAttributedStringLayoutRequest

- (SKUIAttributedStringLayoutRequest)initWithAttributedString:(id)a3
{
  id v4;
  SKUIAttributedStringLayoutRequest *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIAttributedStringLayoutRequest initWithAttributedString:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIAttributedStringLayoutRequest;
  v5 = -[SKUIAttributedStringLayoutRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAttributedString:", self->_attributedString);
  *((_QWORD *)result + 2) = self->_numberOfLines;
  *((_BYTE *)result + 24) = self->_wantsBaselineOffset;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_width;
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (BOOL)wantsBaselineOffset
{
  return self->_wantsBaselineOffset;
}

- (void)setWantsBaselineOffset:(BOOL)a3
{
  self->_wantsBaselineOffset = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (void)initWithAttributedString:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAttributedStringLayoutRequest initWithAttributedString:]";
}

@end
