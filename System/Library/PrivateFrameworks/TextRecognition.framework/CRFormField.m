@implementation CRFormField

- (CRFormField)initWithQuad:(id)a3 type:(unint64_t)a4 source:(unint64_t)a5 value:(id)a6 contentType:(unint64_t)a7 maxCharacterCount:(unint64_t)a8
{
  id v15;
  id v16;
  CRFormField *v17;
  CRFormField *v18;
  CRNormalizedQuad *originalQuad;
  CRFormFieldProviding *originalField;
  objc_super v22;

  v15 = a3;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRFormField;
  v17 = -[CRFormField init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_boundingQuad, a3);
    originalQuad = v18->_originalQuad;
    v18->_originalQuad = 0;

    v18->_fieldType = a4;
    v18->_fieldSource = a5;
    objc_storeStrong((id *)&v18->_fieldValue, a6);
    v18->_maxCharacterCount = a8;
    v18->_textContentType = a7;
    originalField = v18->_originalField;
    v18->_suggestedLineHeight = 0.0;
    v18->_originalField = 0;
    *(_WORD *)&v18->_hasBoundedWidth = 0;

  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  CRFormField *v4;
  CRFormField *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  char v19;
  void *v21;
  void *v22;

  v4 = (CRFormField *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CRFormField boundingQuad](self, "boundingQuad");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRFormField boundingQuad](v5, "boundingQuad");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
        goto LABEL_10;
      -[CRFormField originalQuad](self, "originalQuad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRFormField originalQuad](v5, "originalQuad");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_10;
      v12 = -[CRFormField fieldType](self, "fieldType");
      if (v12 == -[CRFormField fieldType](v5, "fieldType")
        && (v13 = -[CRFormField fieldSource](self, "fieldSource"), v13 == -[CRFormField fieldSource](v5, "fieldSource"))
        && (v14 = -[CRFormField textContentType](self, "textContentType"),
            v14 == -[CRFormField textContentType](v5, "textContentType"))
        && (v15 = -[CRFormField maxCharacterCount](self, "maxCharacterCount"),
            v15 == -[CRFormField maxCharacterCount](v5, "maxCharacterCount"))
        && (-[CRFormField suggestedLineHeight](self, "suggestedLineHeight"),
            v17 = v16,
            -[CRFormField suggestedLineHeight](v5, "suggestedLineHeight"),
            v17 == v18))
      {
        -[CRFormField fieldValue](self, "fieldValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRFormField fieldValue](v5, "fieldValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v21, "isEqualToString:", v22);

      }
      else
      {
LABEL_10:
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (BOOL)hasMoved
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[CRFormField originalQuad](self, "originalQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CRFormField originalQuad](self, "originalQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRFormField boundingQuad](self, "boundingQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)layoutDirection
{
  return self->layoutDirection;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (CRNormalizedQuad)originalQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOriginalQuad:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (void)setFieldSource:(unint64_t)a3
{
  self->_fieldSource = a3;
}

- (NSString)fieldValue
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFieldValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (unint64_t)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(unint64_t)a3
{
  self->_textContentType = a3;
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (BOOL)hasBoundedWidth
{
  return self->_hasBoundedWidth;
}

- (void)setHasBoundedWidth:(BOOL)a3
{
  self->_hasBoundedWidth = a3;
}

- (BOOL)hasBoundedHeight
{
  return self->_hasBoundedHeight;
}

- (void)setHasBoundedHeight:(BOOL)a3
{
  self->_hasBoundedHeight = a3;
}

- (CRFormFieldProviding)originalField
{
  return (CRFormFieldProviding *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOriginalField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalField, 0);
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_originalQuad, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end
