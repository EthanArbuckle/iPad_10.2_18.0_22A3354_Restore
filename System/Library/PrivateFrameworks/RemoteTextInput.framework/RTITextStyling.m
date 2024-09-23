@implementation RTITextStyling

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  -[RTITextStyling fontName](self, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontName"));

  -[RTITextStyling fontSize](self, "fontSize");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fontSize"));
  -[RTITextStyling fontWeight](self, "fontWeight");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fontWeight"));
  -[RTITextStyling attributes](self, "attributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("attributes"));

}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (RTITextStyling)initWithCoder:(id)a3
{
  id v4;
  RTITextStyling *v5;
  uint64_t v6;
  NSString *fontName;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *attributes;
  objc_super v17;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v17.receiver = self;
  v17.super_class = (Class)RTITextStyling;
  v5 = -[RTITextStyling init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fontName"));
    v6 = objc_claimAutoreleasedReturnValue();
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fontSize"));
    v5->_fontSize = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fontWeight"));
    v5->_fontWeight = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("attributes"));
    v14 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v14;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

+ (id)textStylingWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5
{
  id v8;
  double *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = (double *)objc_alloc_init((Class)a1);
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)*((_QWORD *)v9 + 2);
  *((_QWORD *)v9 + 2) = v10;

  v9[3] = a4;
  v9[4] = a5;
  return v9;
}

- (void)addAttributes:(id)a3
{
  NSMutableDictionary *attributes;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    attributes = self->_attributes;
    if (!attributes)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v6 = self->_attributes;
      self->_attributes = v5;

      attributes = self->_attributes;
    }
    -[NSMutableDictionary addEntriesFromDictionary:](attributes, "addEntriesFromDictionary:", v7);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[RTITextStyling fontName](self, "fontName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTITextStyling fontSize](self, "fontSize");
  v6 = v5;
  -[RTITextStyling fontWeight](self, "fontWeight");
  +[RTITextStyling textStylingWithFontName:fontSize:fontWeight:](RTITextStyling, "textStylingWithFontName:fontSize:fontWeight:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTITextStyling attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttributes:", v9);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTITextStyling *v5;
  RTITextStyling *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;

  v5 = (RTITextStyling *)a3;
  if (v5 == self)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[RTITextStyling fontName](self, "fontName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextStyling fontName](v6, "fontName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v7, "_string:matchesString:", v8, v9);

      if (!(_DWORD)v7
        || (-[RTITextStyling fontSize](self, "fontSize"),
            v11 = v10,
            -[RTITextStyling fontSize](v6, "fontSize"),
            v11 != v12)
        || (-[RTITextStyling fontWeight](self, "fontWeight"),
            v14 = v13,
            -[RTITextStyling fontWeight](v6, "fontWeight"),
            v14 != v15))
      {
        v22 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[RTITextStyling attributes](self, "attributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextStyling attributes](v6, "attributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v17)
      {
        v22 = 1;
LABEL_20:

        goto LABEL_14;
      }
      -[RTITextStyling attributes](self, "attributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      if (v19
        || (-[RTITextStyling attributes](v6, "attributes"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "count")))
      {
        -[RTITextStyling attributes](self, "attributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextStyling attributes](v6, "attributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToDictionary:", v21);

        if (v19)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      else
      {
        v22 = 1;
      }

      goto LABEL_19;
    }
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[RTITextStyling fontName](self, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontName = %@"), v4);

  -[RTITextStyling fontSize](self, "fontSize");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontSize = %f"), v5);
  -[RTITextStyling fontWeight](self, "fontWeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontWeight = %f"), v6);
  -[RTITextStyling attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; attributes = %@"), v7);

  return v3;
}

@end
