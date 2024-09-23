@implementation CMStyle

- (CMStyle)init
{
  CMStyle *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;
  NSMutableString *v5;
  NSMutableString *mStyleString;
  CMStyle *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMStyle;
  v2 = -[CMStyle init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->properties;
    v2->properties = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mStyleString = v2->mStyleString;
    v2->mStyleString = v5;

    v7 = v2;
  }

  return v2;
}

- (void)appendPropertyForName:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v7);
  -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(":"));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v6);
  -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(";"));

}

- (id)cssStyleString
{
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;

  -[CMStyle addPropertiesToCSSStyleString:](self, "addPropertiesToCSSStyleString:", self->mStyleString);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  properties = self->properties;
  self->properties = v3;

  return self->mStyleString;
}

- (void)appendPositionInfoFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", CFSTR("top:%d; left:%d; width:%d; height:%d;"),
    (int)y,
    (int)x,
    (int)width,
    (int)height);
}

- (void)appendPropertyForName:(id)a3 stringWithColons:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v7);
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v6);

}

- (void)appendPropertyForName:(id)a3 length:(double)a4 unit:(int)a5
{
  uint64_t v5;
  NSMutableString *mStyleString;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v10);
  mStyleString = self->mStyleString;
  +[CMLengthProperty cssStringValue:unit:](CMLengthProperty, "cssStringValue:unit:", v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](mStyleString, "appendString:", v9);

}

- (void)appendSizeInfoFromRect:(CGRect)a3
{
  double height;
  double width;

  height = a3.size.height;
  width = a3.size.width;
  if (-[NSMutableString length](self->mStyleString, "length", a3.origin.x, a3.origin.y))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", CFSTR("width:%d; height:%d;"),
    (int)width,
    (int)height);
}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4
{
  -[CMStyle appendPropertyForName:oadTextSpacing:unit:](self, "appendPropertyForName:oadTextSpacing:unit:", a3, a4, 1);
}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 unit:(int)a5
{
  uint64_t v5;
  id v8;
  float v9;
  float v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v11 = a3;
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "percent");
      v10 = v9 / 100.0;
      if (v10 != 1.0)
        -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v11, 8, (float)(v10 * 1.2));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v11, v5, (double)(int)objc_msgSend(v8, "points"));
    }
  }

}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 lineHeight:(float)a5 unit:(int)a6
{
  uint64_t v6;
  id v10;
  float v11;
  id v12;

  v6 = *(_QWORD *)&a6;
  v12 = a3;
  v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!objc_msgSend(v10, "points"))
        goto LABEL_7;
      -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v12, v6, (double)(int)objc_msgSend(v10, "points"));
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "percent");
      -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v12, 1, (float)((float)(v11 / 100.0) * a5));
    }
  }
LABEL_7:

}

- (void)addProperty:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->properties, "setObject:forKey:", a3, a4);
}

- (void)appendPropertyForName:(id)a3 intValue:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v6);
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", CFSTR(": %d;"), v4);

}

- (id)attributeForName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)properties
{
  return self->properties;
}

- (id)propertyForName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)appendDefaultBorderStyle
{
  -[CMStyle appendPropertyForName:stringWithColons:](self, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(":1px solid black;"));
}

- (void)appendPropertyForName:(id)a3 color:(id)a4
{
  id v6;
  NSMutableString *mStyleString;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v9);
  mStyleString = self->mStyleString;
  +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](mStyleString, "appendString:", v8);

}

- (void)appendPropertyString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (-[NSMutableString length](self->mStyleString, "length"))
      -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
    -[NSMutableString appendString:](self->mStyleString, "appendString:", v4);
  }

}

- (void)appendPropertyForName:(id)a3 floatValue:(float)a4
{
  id v6;

  v6 = a3;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendString:](self->mStyleString, "appendString:", v6);
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", CFSTR(": %f;"), a4);

}

- (CMStyle)initWithStyle:(id)a3
{
  _QWORD *v4;
  CMStyle *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *properties;
  NSMutableString *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableString *mStyleString;
  CMStyle *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMStyle;
  v5 = -[CMStyle init](&v16, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_alloc(MEMORY[0x24BDBCED8]);
      objc_msgSend(v4, "properties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithDictionary:", v7);
      properties = v5->properties;
      v5->properties = (NSMutableDictionary *)v8;

      v10 = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v4[2]);
    }
    else
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v12 = v5->properties;
      v5->properties = v11;

      v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    }
    mStyleString = v5->mStyleString;
    v5->mStyleString = v10;

    v14 = v5;
  }

  return v5;
}

- (void)addPropertiesToCSSStyleString:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->properties;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cssStringForName:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendString:", CFSTR(" "));
          objc_msgSend(v4, "appendString:", v12);
        }

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)cacheFriendlyCSSStyleString
{
  void *v3;

  v3 = (void *)-[NSMutableString mutableCopy](self->mStyleString, "mutableCopy");
  -[CMStyle addPropertiesToCSSStyleString:](self, "addPropertiesToCSSStyleString:", v3);
  return v3;
}

- (void)appendOriginInfoFromPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[NSMutableString length](self->mStyleString, "length"))
    -[NSMutableString appendString:](self->mStyleString, "appendString:", CFSTR(" "));
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", CFSTR("top:%d; left:%d;"),
    (int)y,
    (int)x);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:", self);
}

- (BOOL)isEqual:(id)a3
{
  CMStyle *v4;
  CMStyle *v5;
  char v6;

  v4 = (CMStyle *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSMutableDictionary isEqual:](self->properties, "isEqual:", v5->properties))
        v6 = -[NSMutableString isEqualToString:](self->mStyleString, "isEqualToString:", v5->mStyleString);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->properties, "hash");
  return -[NSMutableString hash](self->mStyleString, "hash") ^ (v3 << 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleString, 0);
  objc_storeStrong((id *)&self->properties, 0);
}

@end
