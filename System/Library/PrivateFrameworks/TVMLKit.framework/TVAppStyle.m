@implementation TVAppStyle

- (id)valueForStyle:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_valuesByStyle, "objectForKeyedSubscript:", a3);
}

- (void)setWidth:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_width.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_width.var0.insetValue.top = v4;
  *((_OWORD *)&self->_width.var0.doubleValue + 1) = v5;
  self->_width.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("width"));

}

- (void)setMinWidth:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_minWidth.isValueSet = *(_QWORD *)&a3->var1;
  *((_OWORD *)&self->_minWidth.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_minWidth.var0.insetValue.top = v4;
  self->_minWidth.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("min-width"));

}

- (void)setMaxWidth:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_maxWidth.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_maxWidth.var0.insetValue.top = v4;
  *((_OWORD *)&self->_maxWidth.var0.doubleValue + 1) = v5;
  self->_maxWidth.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("max-width"));

}

- (void)setHeight:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_height.isValueSet = *(_QWORD *)&a3->var1;
  *((_OWORD *)&self->_height.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_height.var0.insetValue.top = v4;
  self->_height.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("height"));

}

- (void)setMinHeight:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_minHeight.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_minHeight.var0.insetValue.top = v4;
  *((_OWORD *)&self->_minHeight.var0.doubleValue + 1) = v5;
  self->_minHeight.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("min-height"));

}

- (void)setMaxHeight:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_maxHeight.isValueSet = *(_QWORD *)&a3->var1;
  *((_OWORD *)&self->_maxHeight.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_maxHeight.var0.insetValue.top = v4;
  self->_maxHeight.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("max-height"));

}

- (void)setPadding:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_padding.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_padding.var0.insetValue.top = v4;
  *((_OWORD *)&self->_padding.var0.doubleValue + 1) = v5;
  self->_padding.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3->var0.var0.top, a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.right);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("padding"));

}

- (void)setMargin:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_margin.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_margin.var0.insetValue.top = v4;
  *((_OWORD *)&self->_margin.var0.doubleValue + 1) = v5;
  self->_margin.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3->var0.var0.top, a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.right);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("margin"));

}

- (void)setInteritemSpacing:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_interitemSpacing.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_interitemSpacing.var0.insetValue.top = v4;
  *((_OWORD *)&self->_interitemSpacing.var0.doubleValue + 1) = v5;
  self->_interitemSpacing.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("tv-interitem-spacing"));

}

- (void)setFontSize:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_fontSize.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_fontSize.var0.insetValue.top = v4;
  *((_OWORD *)&self->_fontSize.var0.doubleValue + 1) = v5;
  self->_fontSize.isValueSet = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->var0.var0.top);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("font-size"));

}

- (void)setBackgroundColor:(id)a3
{
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", a3, CFSTR("background-color"));
}

- (void)setBorderRadius:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;

  v4 = *(_OWORD *)&a3->var0.var0.top;
  v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(_QWORD *)&self->_borderRadius.isValueSet = *(_QWORD *)&a3->var1;
  *(_OWORD *)&self->_borderRadius.var0.insetValue.top = v4;
  *((_OWORD *)&self->_borderRadius.var0.doubleValue + 1) = v5;
  self->_borderRadius.isValueSet = 1;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE519A0]), "initWithCornerRadii:", a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.top, a3->var0.var0.right);
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v6, CFSTR("border-radius"));

}

- (void)setPrototype:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_prototype, a3);
  v5 = a3;
  -[TVAppStyle _setValue:forStyle:](self, "_setValue:forStyle:", v5, *MEMORY[0x24BE518F8]);

}

- (void)_setValue:(id)a3 forStyle:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *valuesByStyle;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_valuesByStyle)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    valuesByStyle = self->_valuesByStyle;
    self->_valuesByStyle = v7;

  }
  v9 = self->_valuesByStyle;
  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);

}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)width
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[1].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self->var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[1].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)minWidth
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[2].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[1].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[2].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxWidth
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[3].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[2].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[3].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)height
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[4].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[3].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[4].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)minHeight
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[5].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[4].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[5].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxHeight
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[6].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[5].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[6].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)padding
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[7].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[6].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[7].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)margin
{
  __int128 v3;

  *(CGFloat *)&retstr->var1 = self[8].var0.var0.right;
  v3 = *(_OWORD *)(&self[8].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[7].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)interitemSpacing
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[9].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[8].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[9].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)fontSize
{
  __int128 v3;

  *(CGFloat *)&retstr->var1 = self[10].var0.var0.right;
  v3 = *(_OWORD *)(&self[10].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[9].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)borderRadius
{
  __int128 v3;

  v3 = *(_OWORD *)(&self[11].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[10].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[11].var0.var0.right;
  return self;
}

- (IKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)prototype
{
  return self->_prototype;
}

- (NSMutableDictionary)valuesByStyle
{
  return self->_valuesByStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByStyle, 0);
  objc_storeStrong((id *)&self->_prototype, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
