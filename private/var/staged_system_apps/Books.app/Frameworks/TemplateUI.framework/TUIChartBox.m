@implementation TUIChartBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIChartBoxLayout, a2);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox chartType](self, "chartType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox title](self, "title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox footer](self, "footer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[TUIChartBox columns](self, "columns")));
  -[TUIChartBox cornerRadius](self, "cornerRadius");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[TUIChartBox progress](self, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[TUIChartBox spacing](self, "spacing");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox color](self, "color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox backgroundColor](self, "backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox shadowColor](self, "shadowColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox fontSpec](self, "fontSpec"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIChartBox fontAttributes](self, "fontAttributes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) type=\"%@\" title=\"%@\" footer=\"%@\" columns=%@ cornerRadius=%@ progress=%@ spacing=%@ color=%@ backgroundColor=%@ shadowColor=%@ fontSpec=%@ fontAttributes=%@ >"), v18, self, v17, v19, v16, v15, v14, v13, v5, v6, v7, v8, v9, v10));

  return v11;
}

- (NSString)chartType
{
  return self->_chartType;
}

- (void)setChartType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(int64_t)a3
{
  self->_columns = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
  objc_storeStrong((id *)&self->_fontSpec, a3);
}

- (NSDictionary)fontAttributes
{
  return self->_fontAttributes;
}

- (void)setFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_fontAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chartType, 0);
}

@end
