@implementation SimpleContaineeAction

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  NSString *accessibilityIdentifier;
  NSString *labelAccessibilityIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

  accessibilityIdentifier = self->_accessibilityIdentifier;
  self->_accessibilityIdentifier = 0;

  labelAccessibilityIdentifier = self->_labelAccessibilityIdentifier;
  self->_labelAccessibilityIdentifier = 0;

}

- (NSString)accessibilityIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *accessibilityIdentifier;

  if (!self->_accessibilityIdentifier)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](self, "title"));
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](self, "title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1011EB268));

      v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Action"), v6));
      accessibilityIdentifier = self->_accessibilityIdentifier;
      self->_accessibilityIdentifier = v7;

    }
  }
  return self->_accessibilityIdentifier;
}

- (NSString)labelAccessibilityIdentifier
{
  void *v3;
  id v4;
  NSString *v5;
  NSString *labelAccessibilityIdentifier;

  if (!self->_labelAccessibilityIdentifier)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](self, "title"));
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](self, "title"));
      labelAccessibilityIdentifier = self->_labelAccessibilityIdentifier;
      self->_labelAccessibilityIdentifier = v5;

    }
  }
  return self->_labelAccessibilityIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)glyphStyle
{
  return self->_glyphStyle;
}

- (void)setGlyphStyle:(unint64_t)a3
{
  self->_glyphStyle = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLabelAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
