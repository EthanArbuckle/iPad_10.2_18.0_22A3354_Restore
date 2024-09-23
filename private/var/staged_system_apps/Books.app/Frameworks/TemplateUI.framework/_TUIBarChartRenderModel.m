@implementation _TUIBarChartRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  BOOL v24;

  v4 = a3;
  v5 = objc_opt_class(_TUIBarChartRenderModel);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (TUIRenderModelIsEqualToRenderModel(self, v7))
  {
    v8 = -[_TUIBarChartRenderModel columns](self, "columns");
    if (v8 == objc_msgSend(v7, "columns"))
    {
      -[_TUIBarChartRenderModel cornerRadius](self, "cornerRadius");
      v10 = v9;
      objc_msgSend(v7, "cornerRadius");
      if (v10 == v11)
      {
        -[_TUIBarChartRenderModel spacing](self, "spacing");
        v13 = v12;
        objc_msgSend(v7, "spacing");
        if (v13 == v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel chartType](self, "chartType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chartType"));
          if (!objc_msgSend(v15, "isEqualToString:", v16))
          {
            v24 = 0;
LABEL_22:

            goto LABEL_16;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel title](self, "title"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
          if (!objc_msgSend(v17, "isEqualToString:", v18))
          {
            v24 = 0;
LABEL_21:

            goto LABEL_22;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel footer](self, "footer"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "footer"));
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if (v21)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel color](self, "color"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel backgroundColor](self, "backgroundColor"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel shadowColor](self, "shadowColor"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shadowColor"));
            v24 = (v15 == v16 || objc_msgSend(v15, "isEqual:", v16))
               && (v17 == v18 || objc_msgSend(v17, "isEqual:", v18))
               && (v22 == v23 || objc_msgSend(v22, "isEqual:", v23));

            goto LABEL_21;
          }
        }
      }
    }
  }
  v24 = 0;
LABEL_16:

  return v24;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIBarChartRenderModel identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (id)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)chartType
{
  return self->_chartType;
}

- (void)setChartType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chartType, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
