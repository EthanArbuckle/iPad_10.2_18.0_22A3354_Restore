@implementation _UICascadingTextStorage

- (UIFont)font
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!-[NSConcreteTextStorage length](self, "length"))
  {
    v4 = *(_QWORD *)off_1E1678D90;
LABEL_6:
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return (UIFont *)v3;
  }
  -[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F78, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = *(_QWORD *)off_1E1678D90;
    -[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D90, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_6;
  }
  return (UIFont *)v3;
}

- (id)_defaultAttributes
{
  NSMutableDictionary *defaultAttributes;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  defaultAttributes = self->_defaultAttributes;
  if (!defaultAttributes)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    v6 = self->_defaultAttributes;
    self->_defaultAttributes = v5;

    defaultAttributes = self->_defaultAttributes;
  }
  return defaultAttributes;
}

- (int64_t)_ui_resolvedTextAlignment
{
  _UICascadingTextStorage *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;

  v2 = self;
  v3 = -[NSConcreteTextStorage length](v2, "length");
  v4 = *(_QWORD *)off_1E1678F98;
  if (!v3
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](v2, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](v2, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v5, "alignment");
  if (!v5 || (v8 = objc_msgSend(v5, "baseWritingDirection"), v8 == -1))
    v8 = objc_msgSend(off_1E1679C48, "defaultWritingDirectionForLanguage:", 0);
  if ((unint64_t)(v7 - 3) < 2)
    v7 = 2 * (v8 == 1);

  return v7;
}

- (double)shadowBlur
{
  void *v2;
  double v3;
  double v4;

  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowBlurRadius");
  v4 = v3;

  return v4;
}

- (id)_shadow
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[NSConcreteTextStorage length](self, "length");
  v4 = *(_QWORD *)off_1E1679048;
  if (!v3
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1679048, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UICascadingTextStorage;
  -[NSConcreteTextStorage attribute:atIndex:effectiveRange:](&v14, sel_attribute_atIndex_effectiveRange_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_defaultAttributes, "objectForKey:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)setTextColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _UICascadingTextStorage *v22;
  SEL v23;
  uint64_t v24;
  unint64_t v25;

  v5 = a3;
  if (!v5)
  {
    -[_UITextAttributeDefaults _textColor](self->_defaults, "_textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  v9 = -[NSConcreteTextStorage length](self, "length");
  v24 = 0;
  v25 = 0;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)off_1E1678D98;
    -[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D98, 0, &v24);
    v12 = objc_claimAutoreleasedReturnValue();
    if ((id)v12 != v5 || v25 < v10)
      goto LABEL_15;
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v5;
    if (v15 != v5)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke_2;
      v18[3] = &unk_1E16B6830;
      v18[4] = self;
      v16 = v5;
      v19 = v16;
      -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", v18);

    }
  }
  else
  {
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *(_QWORD *)off_1E1678D98);
    v12 = objc_claimAutoreleasedReturnValue();

    v16 = v5;
    if ((id)v12 != v5)
    {
LABEL_15:
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke;
      v20[3] = &unk_1E16B6858;
      v22 = self;
      v23 = a2;
      v21 = v5;
      -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", v20);

      v16 = (id)v12;
    }
  }

}

- (_UICascadingTextStorage)init
{
  return -[_UICascadingTextStorage initWithDefaults:](self, "initWithDefaults:", 0);
}

- (_UICascadingTextStorage)initWithDefaults:(id)a3
{
  id v4;
  _UICascadingTextStorage *v5;
  _UICascadingTextStorage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICascadingTextStorage;
  v5 = -[NSConcreteTextStorage init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UICascadingTextStorage _setDefaults:](v5, "_setDefaults:", v4);

  return v6;
}

- (void)_setDefaults:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    +[_UITextAttributeDefaults _unspecifiedDefaults](_UITextAttributeDefaults, "_unspecifiedDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_textField");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_defaults, v5);
  v6 = v7;
  if (!v7)
  {

    v6 = 0;
  }

}

- (void)setDefaultAttributes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___UICascadingTextStorage_setDefaultAttributes___block_invoke;
  v6[3] = &unk_1E16B6830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", v6);

}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UICascadingTextStorage;
  -[NSConcreteTextStorage attributesAtIndex:effectiveRange:](&v9, sel_attributesAtIndex_effectiveRange_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICascadingTextStorage defaultAttributes](self, "defaultAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addEntriesFromDictionary:", v5);
  return v7;
}

- (void)setFont:(id)a3
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _UICascadingTextStorage *v17;
  SEL v18;
  uint64_t v19;
  unint64_t v20;

  v5 = a3;
  if (v5
    || (-[_UITextAttributeDefaults _font](self->_defaults, "_font"),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = 0;
    v20 = 0;
    if (-[NSConcreteTextStorage length](self, "length"))
    {
      -[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D90, 0, &v19);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1678D90);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v6 != v5 || (v8 = v20, v8 < -[NSConcreteTextStorage length](self, "length")))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46___UICascadingTextStorage_Accessors__setFont___block_invoke;
      v15[3] = &unk_1E16B6858;
      v17 = self;
      v18 = a2;
      v16 = v5;
      -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", v15);

    }
  }
  else
  {
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    -[_UICascadingTextStorage font](self, "font");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICascadingTextStorage font](self, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pointSize");
    NSLog(CFSTR("nil passed to [%@ setFont:] and [%@ defaultFont] is also nil. Don't know what to do, so leaving font as %@ %f"), v9, v10, v11, v13);

  }
}

- (int64_t)textAlignment
{
  _UICascadingTextStorage *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  v2 = self;
  v3 = -[NSConcreteTextStorage length](v2, "length");
  v4 = *(_QWORD *)off_1E1678F98;
  if (!v3
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](v2, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](v2, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v5, "alignment");

  return v7;
}

- (void)setTextAlignment:(int64_t)a3
{
  _UICascadingTextStorage *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UICascadingTextStorage *v14;
  SEL v15;

  v5 = self;
  v6 = -[NSConcreteTextStorage length](v5, "length");
  v7 = *(_QWORD *)off_1E1678F98;
  if (!v6
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0), (v11 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](v5, "_defaultAttributes", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v11, "alignment") != a3)
  {
    v9 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v9, "setAlignment:", a3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55___UICascadingTextStorage_Accessors__setTextAlignment___block_invoke;
    v12[3] = &unk_1E16B6858;
    v14 = v5;
    v15 = a2;
    v13 = v9;
    v10 = v9;
    -[_UICascadingTextStorage coordinateEditing:](v5, "coordinateEditing:", v12);

  }
}

- (UIColor)textColor
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[NSConcreteTextStorage length](self, "length");
  v4 = *(_QWORD *)off_1E1678D98;
  if (!v3
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D98, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIColor *)v5;
}

- (void)setLineBreakMode:(int64_t)a3
{
  _UICascadingTextStorage *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _UICascadingTextStorage *v14;
  SEL v15;

  v5 = self;
  v6 = -[NSConcreteTextStorage length](v5, "length");
  v7 = *(_QWORD *)off_1E1678F98;
  if (!v6
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](v5, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0), (v11 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](v5, "_defaultAttributes", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v11, "lineBreakMode") != a3)
  {
    v9 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v9, "setLineBreakMode:", a3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55___UICascadingTextStorage_Accessors__setLineBreakMode___block_invoke;
    v12[3] = &unk_1E16B6858;
    v14 = v5;
    v15 = a2;
    v13 = v9;
    v10 = v9;
    -[_UICascadingTextStorage coordinateEditing:](v5, "coordinateEditing:", v12);

  }
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICascadingTextStorage;
  -[NSConcreteTextStorage attribute:atIndex:longestEffectiveRange:inRange:](&v17, sel_attribute_atIndex_longestEffectiveRange_inRange_, v11, a4, a5, location, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_defaultAttributes, "objectForKey:", v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (void)setDefaultBaseWritingDirection:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)off_1E1678F98;
  -[NSMutableDictionary objectForKey:](self->_defaultAttributes, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "baseWritingDirection") != a3)
  {
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v6, "setBaseWritingDirection:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_defaultAttributes, "setObject:forKeyedSubscript:", v6, v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UICascadingTextStorage;
  -[NSConcreteTextStorage attributesAtIndex:longestEffectiveRange:inRange:](&v10, sel_attributesAtIndex_longestEffectiveRange_inRange_, a3, a4, a5.location, a5.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICascadingTextStorage defaultAttributes](self, "defaultAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v6);
  return v8;
}

- (int64_t)defaultBaseWritingDirection
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_defaultAttributes, "objectForKey:", *(_QWORD *)off_1E1678F98);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "baseWritingDirection");

  return v3;
}

+ (id)defaultFont
{
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (void)_restoreOriginalFontAttribute
{
  -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", &__block_literal_global_576);
}

- (_UITextAttributeDefaults)_defaults
{
  return self->_defaults;
}

- (void)_setShadow:(id)a3
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint64_t v12;
  unint64_t v13;

  v5 = a3;
  v12 = 0;
  v13 = 0;
  if (-[NSConcreteTextStorage length](self, "length"))
  {
    -[_UICascadingTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1679048, 0, &v12);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UICascadingTextStorage _defaultAttributes](self, "_defaultAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E1679048);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v6 != v5 || (v8 = v13, v8 < -[NSConcreteTextStorage length](self, "length")))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49___UICascadingTextStorage_Accessors___setShadow___block_invoke;
    v9[3] = &unk_1E16B6858;
    v9[4] = self;
    v10 = v5;
    v11 = a2;
    -[_UICascadingTextStorage coordinateEditing:](self, "coordinateEditing:", v9);

  }
}

- (void)setShadowColor:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "shadowColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(v5, "setShadowColor:", v7);
    -[_UICascadingTextStorage _setShadow:](self, "_setShadow:", v5);
  }

}

- (UIColor)shadowColor
{
  void *v2;
  void *v3;

  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  id v10;

  height = a3.height;
  width = a3.width;
  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v10, "shadowOffset");
  if (v8 != width || v7 != height)
  {
    objc_msgSend(v10, "setShadowOffset:", width, height);
    -[_UICascadingTextStorage _setShadow:](self, "_setShadow:", v10);
  }

}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowBlur:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[_UICascadingTextStorage _shadow](self, "_shadow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v7, "shadowBlurRadius");
  if (v6 != a3)
  {
    objc_msgSend(v7, "setShadowBlurRadius:", a3);
    -[_UICascadingTextStorage _setShadow:](self, "_setShadow:", v7);
  }

}

- (int64_t)lineBreakMode
{
  _UICascadingTextStorage *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  v2 = self;
  v3 = -[NSConcreteTextStorage length](v2, "length");
  v4 = *(_QWORD *)off_1E1678F98;
  if (!v3
    || (-[_UICascadingTextStorage attribute:atIndex:effectiveRange:](v2, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F98, 0, 0), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_UICascadingTextStorage _defaultAttributes](v2, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v5, "lineBreakMode");

  return v7;
}

@end
