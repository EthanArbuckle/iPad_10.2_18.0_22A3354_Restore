@implementation _UITextAttributeDefaults

+ (_UITextAttributeDefaultCategories)_unspecifiedDefaults
{
  if (qword_1ECD7CEE8 != -1)
    dispatch_once(&qword_1ECD7CEE8, &__block_literal_global_110);
  return (_UITextAttributeDefaultCategories *)(id)qword_1ECD7CEE0;
}

- (UIColor)_textColor
{
  return (UIColor *)-[_UIMutableTextAttributeDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
}

- (UIFont)_font
{
  return (UIFont *)-[_UIMutableTextAttributeDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
}

- (_UITextAttributeDictionary)_attributes
{
  return (_UITextAttributeDictionary *)(id)-[_UIMutableTextAttributeDictionary copy](self->_attributes, "copy");
}

- (void)_setShadow:(id)a3
{
  -[_UIMutableTextAttributeDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, *(_QWORD *)off_1E1679048);
}

- (id)_initWithFallback:(id)a3
{
  id v4;
  _UITextAttributeDefaults *v5;
  void *v6;
  uint64_t v7;
  _UIMutableTextAttributeDictionary *attributes;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextAttributeDefaults;
  v5 = -[_UITextAttributeDefaults init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    attributes = v5->_attributes;
    v5->_attributes = (_UIMutableTextAttributeDictionary *)v7;

  }
  return v5;
}

- (void)_setTextColor:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDefaults.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textColor"));

    v5 = 0;
  }
  -[_UIMutableTextAttributeDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", v5, *(_QWORD *)off_1E1678D98);

}

- (void)_setParagraphStyle:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDefaults.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paragraphStyle"));

    v5 = 0;
  }
  -[_UIMutableTextAttributeDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", v5, *(_QWORD *)off_1E1678F98);

}

- (id)_init
{
  _UITextAttributeDefaults *v2;
  uint64_t v3;
  _UIMutableTextAttributeDictionary *attributes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextAttributeDefaults;
  v2 = -[_UITextAttributeDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    attributes = v2->_attributes;
    v2->_attributes = (_UIMutableTextAttributeDictionary *)v3;

  }
  return v2;
}

+ (void)_getFontSizesForUserInterfaceIdiom:(int64_t)a3 labelFontSize:(double *)a4 buttonFontSize:(double *)a5 systemFontSize:(double *)a6 smallSystemFontSize:(double *)a7
{
  double v7;
  double v8;
  double v9;
  double v10;

  v7 = 17.0;
  if (a3 == 5)
    v7 = 13.0;
  *a4 = v7;
  v8 = 18.0;
  if (a3 == 5)
    v8 = 14.0;
  *a5 = v8;
  v9 = 10.0;
  if (a3 != 5)
    v9 = 14.0;
  *a6 = v9;
  v10 = 12.0;
  if (a3 == 5)
    v10 = 9.0;
  *a7 = v10;
}

- (void)_setFont:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDefaults.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("font"));

    v5 = 0;
  }
  -[_UIMutableTextAttributeDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", v5, *(_QWORD *)off_1E1678D90);

}

+ (id)_defaultsForUserInterfaceIdiom:(int64_t)a3
{
  return -[_UITextAttributeDefaultCategories initWithUserInterfaceIdiom:]([_UITextAttributeDefaultCategories alloc], "initWithUserInterfaceIdiom:", a3);
}

- (NSParagraphStyle)_paragraphStyle
{
  return (NSParagraphStyle *)-[_UIMutableTextAttributeDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F98);
}

- (NSShadow)_shadow
{
  return (NSShadow *)-[_UIMutableTextAttributeDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679048);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_opt_new();
  v5 = -[_UIMutableTextAttributeDictionary mutableCopy](self->_attributes, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("attributes");
  -[_UITextAttributeDefaults _attributes](self, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _UITextAttributeDefaults *v4;
  _UITextAttributeDefaults *v5;
  _UIMutableTextAttributeDictionary *attributes;
  void *v7;
  _UIMutableTextAttributeDictionary *v8;
  _UIMutableTextAttributeDictionary *v9;
  _UIMutableTextAttributeDictionary *v10;
  char v11;

  v4 = (_UITextAttributeDefaults *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (v4 == self)
  {
    v11 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    attributes = self->_attributes;
    -[_UITextAttributeDefaults _attributes](v5, "_attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = attributes;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = -[_UIMutableTextAttributeDictionary isEqual:](v8, "isEqual:", v9);
    }

  }
  else
  {
LABEL_8:
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  return -[_UIMutableTextAttributeDictionary hash](self->_attributes, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
