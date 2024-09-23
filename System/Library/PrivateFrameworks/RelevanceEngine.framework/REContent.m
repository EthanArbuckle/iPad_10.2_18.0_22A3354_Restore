@implementation REContent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REContent)init
{
  REContent *v2;
  uint64_t v3;
  NSMutableDictionary *contents;
  uint64_t v5;
  NSTimeZone *timeZone;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REContent;
  v2 = -[REContent init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    contents = v2->_contents;
    v2->_contents = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
    v5 = objc_claimAutoreleasedReturnValue();
    timeZone = v2->_timeZone;
    v2->_timeZone = (NSTimeZone *)v5;

    -[REContent setObject:forKey:](v2, "setObject:forKey:", CFSTR("REElementInteractionDefault"), CFSTR("REContentInteractionKey"));
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSMutableDictionary *contents;
  uint64_t v14;
  id v15;

  v15 = a3;
  v12 = a4;
  if (v12)
  {
    contents = self->_contents;
    if (v15)
      -[NSMutableDictionary setObject:forKey:](contents, "setObject:forKey:", v15, v12);
    else
      -[NSMutableDictionary removeObjectForKey:](contents, "removeObjectForKey:", v12);
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Key cannot be nil"), v6, v7, v8, v9, v10, v11, v14);
  }

}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", a3);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->_contents, "hash");
  return -[NSTimeZone hash](self->_timeZone, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  REContent *v4;
  REContent *v5;
  NSTimeZone *timeZone;
  NSTimeZone *v7;
  NSTimeZone *v8;
  NSTimeZone *v9;
  int v10;
  char v11;
  NSMutableDictionary *contents;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;

  v4 = (REContent *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timeZone = self->_timeZone;
      v7 = v5->_timeZone;
      if (timeZone == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = timeZone;
        v10 = -[NSTimeZone isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      contents = self->_contents;
      v13 = v5->_contents;
      v14 = contents;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[NSMutableDictionary isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", self->_contents, 1);
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_timeZone);
  return (id)v4;
}

- (REContent)initWithCoder:(id)a3
{
  id v4;
  REContent *v5;
  uint64_t v6;
  NSMutableDictionary *contents;
  uint64_t v8;
  NSTimeZone *timeZone;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REContent;
  v5 = -[REContent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("content"));
    v6 = objc_claimAutoreleasedReturnValue();
    contents = v5->_contents;
    v5->_contents = (NSMutableDictionary *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("timezone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *contents;
  id v5;

  contents = self->_contents;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contents, CFSTR("content"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timezone"));

}

- (NSDictionary)loggingContentValues
{
  void *v3;
  NSMutableDictionary *contents;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_contents, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contents = self->_contents;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__REContent_loggingContentValues__block_invoke;
  v8[3] = &unk_24CF8A8B8;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](contents, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v6;
}

void __33__REContent_loggingContentValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  REDescriptionForExportedObject(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR(" "));
    objc_msgSend(v5, "contentEncodedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v9);

}

- (void)setOverrideHeaderImage:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentHeaderImageKey"));
}

- (UIImage)overrideHeaderImage
{
  return (UIImage *)-[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentHeaderImageKey"));
}

- (void)setOverrideBodyImage:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentBodyImageKey"));
}

- (UIImage)overrideBodyImage
{
  return (UIImage *)-[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentBodyImageKey"));
}

- (void)setBodyImageCompositingFilter:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentBodyImageCompositingFilterKey"));
}

- (NSString)bodyImageCompositingFilter
{
  return (NSString *)-[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentBodyImageCompositingFilterKey"));
}

- (void)setHeaderTextContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentHeaderTextKey"));
}

- (RETextContentProvider)headerTextContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentHeaderTextKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RETextContentProvider *)v3;
}

- (void)setHeaderImageContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentHeaderImageKey"));
}

- (REImageContentProvider)headerImageContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentHeaderImageKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REImageContentProvider *)v3;
}

- (void)setBodyImageContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentBodyImageKey"));
}

- (REImageContentProvider)bodyImageContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentBodyImageKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REImageContentProvider *)v3;
}

- (void)setDescription1TextContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentDescription1TextKey"));
}

- (RETextContentProvider)description1TextContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription1TextKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RETextContentProvider *)v3;
}

- (void)setDescription2TextContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentDescription2TextKey"));
}

- (RETextContentProvider)description2TextContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription2TextKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RETextContentProvider *)v3;
}

- (void)setDescription3TextContentProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentDescription3TextKey"));
}

- (RETextContentProvider)description3TextContentProvider
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription3TextKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RETextContentProvider *)v3;
}

- (void)setPunchThrough:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentPunchThroughKey"));

}

- (unint64_t)punchThrough
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentPunchThroughKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setTintColor:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentTintColorKey"));
}

- (UIColor)tintColor
{
  return (UIColor *)-[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentTintColorKey"));
}

- (void)setStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentStyleKey"));

}

- (unint64_t)style
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentStyleKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setUseMonospaceFont:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentUseMonospacedFontKey"));

}

- (BOOL)useMonospaceFont
{
  void *v2;
  void *v3;
  char v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentUseMonospacedFontKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setHeaderFontStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentHeaderFontStyleKey"));

}

- (unint64_t)headerFontStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentHeaderFontStyleKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 2;

  return v4;
}

- (void)setDescription1FontStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentDescription1FontStyleKey"));

}

- (unint64_t)description1FontStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription1FontStyleKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDescription2FontStyle:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentDescription2FontStyleKey"));

}

- (unint64_t)description2FontStyle
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription2FontStyleKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 1;

  return v4;
}

- (void)setTintColorAffectsHeader:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentTintColorAffectsHeaderKey"));

}

- (BOOL)tintColorAffectsHeader
{
  void *v2;
  void *v3;
  char v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentTintColorAffectsHeaderKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setBodyImageShouldStretch:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentBodyImageShouldStretchKey"));

}

- (BOOL)bodyImageShouldStretch
{
  void *v2;
  void *v3;
  char v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentBodyImageShouldStretchKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setHeaderImageEdge:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentHeaderImageEdgeKey"));

}

- (unsigned)headerImageEdge
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentHeaderImageEdgeKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDescriptionAccessory:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentDescriptionAccessoryKey"));

}

- (REAccessoryDescription)descriptionAccessory
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescriptionAccessoryKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REAccessoryDescription *)v3;
}

- (void)setImageAccessory:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentImageAccessoryKey"));

}

- (REAccessoryImage)imageAccessory
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentImageAccessoryKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REAccessoryImage *)v3;
}

- (void)setMatchupAccessory:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentMatchupAccessoryKey"));
}

- (REAccessoryMatchup)matchupAccessory
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentMatchupAccessoryKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REAccessoryMatchup *)v3;
}

- (void)setImageFocusRect:(CGRect)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1968], "re_valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REContent setObject:forKey:](self, "setObject:forKey:", v4, CFSTR("REContentImageFocusRectKey"));

}

- (CGRect)imageFocusRect
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentImageFocusRectKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "re_CGRectValue");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v9 = 0.0;
    *(double *)&v5 = INFINITY;
    *(double *)&v7 = INFINITY;
    v11 = 0.0;
  }

  v12 = *(double *)&v5;
  v13 = *(double *)&v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setOverrideBodyString:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentOverrideBodyStringKey"));
}

- (NSString)overrideBodyString
{
  void *v2;
  void *v3;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentOverrideBodyStringKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDescription1Text:(id)a3
{
  id v4;

  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[REContent setDescription1TextContentProvider:](self, "setDescription1TextContentProvider:", v4);

  }
  else
  {
    -[REContent setDescription1TextContentProvider:](self, "setDescription1TextContentProvider:");
  }
}

- (NSAttributedString)description1Text
{
  void *v2;
  void *v3;
  void *v4;

  -[REContent description1TextContentProvider](self, "description1TextContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (void)setDescription2Text:(id)a3
{
  id v4;

  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[REContent setDescription2TextContentProvider:](self, "setDescription2TextContentProvider:", v4);

  }
  else
  {
    -[REContent setDescription2TextContentProvider:](self, "setDescription2TextContentProvider:");
  }
}

- (NSAttributedString)description2Text
{
  void *v2;
  void *v3;
  void *v4;

  -[REContent description2TextContentProvider](self, "description2TextContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (void)setDescription3Text:(id)a3
{
  id v4;

  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[REContent setDescription3TextContentProvider:](self, "setDescription3TextContentProvider:", v4);

  }
  else
  {
    -[REContent setDescription3TextContentProvider:](self, "setDescription3TextContentProvider:");
  }
}

- (NSAttributedString)description3Text
{
  void *v2;
  void *v3;
  void *v4;

  -[REContent description3TextContentProvider](self, "description3TextContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (void)setHeaderText:(id)a3
{
  id v4;

  if (a3)
  {
    +[RETextContentProvider contentProviderFromAttributedString:](RESimpleTextContentProvider, "contentProviderFromAttributedString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[REContent setHeaderTextContentProvider:](self, "setHeaderTextContentProvider:", v4);

  }
  else
  {
    -[REContent setHeaderTextContentProvider:](self, "setHeaderTextContentProvider:");
  }
}

- (NSAttributedString)headerText
{
  void *v2;
  void *v3;
  void *v4;

  -[REContent headerTextContentProvider](self, "headerTextContentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  REValidateObjectOfClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedStringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (UIImage)headerImage
{
  return 0;
}

- (UIImage)bodyImage
{
  return 0;
}

- (CLKTextProvider)description1TextProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKDescription1TextKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent description1TextContentProvider](self, "description1TextContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitTextProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription1TextProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKDescription1TextKey"));
}

- (CLKTextProvider)description2TextProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKDescription2TextKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent description2TextContentProvider](self, "description2TextContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitTextProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription2TextProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKDescription2TextKey"));
}

- (CLKTextProvider)description3TextProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKDescription3TextKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent description3TextContentProvider](self, "description3TextContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitTextProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKTextProvider *)v5;
}

- (void)setDescription3TextProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKDescription3TextKey"));
}

- (CLKTextProvider)headerTextProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKHeaderTextKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent headerTextContentProvider](self, "headerTextContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitTextProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKTextProvider *)v5;
}

- (void)setHeaderTextProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKHeaderTextKey"));
}

- (CLKImageProvider)bodyImageProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKBodyImageKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent bodyImageContentProvider](self, "bodyImageContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitImageProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKImageProvider *)v5;
}

- (void)setBodyImageProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKBodyImageKey"));
}

- (CLKImageProvider)headerImageProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentCLKHeaderImageKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[REContent headerImageContentProvider](self, "headerImageContentProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clockKitImageProviderRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (CLKImageProvider *)v5;
}

- (void)setHeaderImageProvider:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentCLKHeaderImageKey"));
}

- (NSNumber)description1Opacity
{
  return (NSNumber *)-[REContent objectForKey:](self, "objectForKey:", CFSTR("REContentDescription1OpacityKey"));
}

- (void)setDescription1Opacity:(id)a3
{
  -[REContent setObject:forKey:](self, "setObject:forKey:", a3, CFSTR("REContentDescription1OpacityKey"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
