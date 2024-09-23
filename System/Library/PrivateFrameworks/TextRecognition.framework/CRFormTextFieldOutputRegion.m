@implementation CRFormTextFieldOutputRegion

- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  CRFormTextFieldOutputRegion *v15;
  uint64_t v17;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  LOBYTE(v17) = 0;
  v15 = -[CRFormTextFieldOutputRegion initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:]([CRFormTextFieldOutputRegion alloc], "initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:", v14, v13, v12, a6, a7, 0, v17);

  return v15;
}

- (CRFormTextFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 contentType:(unint64_t)a6 source:(unint64_t)a7 hasBoundedWidth:(BOOL)a8 hasBoundedHeight:(BOOL)a9
{
  _BOOL8 v9;
  CRFormTextFieldOutputRegion *v11;
  CRFormTextFieldOutputRegion *v12;
  objc_super v14;

  v9 = a8;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  v11 = -[CRFormFieldOutputRegion initWithQuad:labelRegion:subFields:source:](&v14, sel_initWithQuad_labelRegion_subFields_source_, a3, a4, a5, a7);
  v12 = v11;
  if (v11)
  {
    v11->_maxCharacterCount = -1;
    v11->_textContentType = a6;
    v11->_suggestedLineHeight = 0.0;
    -[CRFormFieldOutputRegion setHasBoundedWidth:](v11, "setHasBoundedWidth:", v9);
    -[CRFormFieldOutputRegion setHasBoundedHeight:](v12, "setHasBoundedHeight:", a9);
    v12->_autofillNewContextStart = 1;
  }
  return v12;
}

- (unint64_t)fieldType
{
  return 1;
}

- (NSString)textContentTypeString
{
  return (NSString *)+[CRFormContentTypeUtilities stringFromContentType:](CRFormContentTypeUtilities, "stringFromContentType:", -[CRFormTextFieldOutputRegion textContentType](self, "textContentType"));
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (void)setTextContentType:(unint64_t)a3
{
  self->_textContentType = a3;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_autofillNewContextStart = a3;
}

- (CRFormTextFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRFormTextFieldOutputRegion *v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  v9 = -[CRFormFieldOutputRegion initWithCRCodableDataRepresentation:version:offset:](&v14, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
    if (v10)
    {
      v11 = v10;
      v9->_maxCharacterCount = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
      v9->_textContentType = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
      if (v11 != 1)
      {
        +[CRCodingUtilities cgFloatFromEncodingData:offset:](CRCodingUtilities, "cgFloatFromEncodingData:offset:", v8, a5);
        v9->_suggestedLineHeight = v12;
        if (v11 >= 3)
        {
          v9->_autofillNewContextStart = +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5);
          if (v11 != 3)
          {
            -[CRFormFieldOutputRegion setHasBoundedWidth:](v9, "setHasBoundedWidth:", +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5));
            -[CRFormFieldOutputRegion setHasBoundedHeight:](v9, "setHasBoundedHeight:", +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5));
          }
        }
      }
    }
  }

  return v9;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v7.receiver = self;
  v7.super_class = (Class)CRFormTextFieldOutputRegion;
  -[CRFormFieldOutputRegion crCodableDataRepresentation](&v7, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", 4, v5);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", self->_maxCharacterCount, v5);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", self->_textContentType, v5);
  +[CRCodingUtilities appendCGFloat:toData:](CRCodingUtilities, "appendCGFloat:toData:", v5, self->_suggestedLineHeight);
  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", self->_autofillNewContextStart, v5);
  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", -[CRFormFieldOutputRegion hasBoundedWidth](self, "hasBoundedWidth"), v5);
  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", -[CRFormFieldOutputRegion hasBoundedHeight](self, "hasBoundedHeight"), v5);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRFormTextFieldOutputRegion;
  v7 = -[CRFormFieldOutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v9, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  objc_msgSend(v7, "setMaxCharacterCount:", -[CRFormTextFieldOutputRegion maxCharacterCount](self, "maxCharacterCount"));
  objc_msgSend(v7, "setTextContentType:", -[CRFormTextFieldOutputRegion textContentType](self, "textContentType"));
  -[CRFormTextFieldOutputRegion suggestedLineHeight](self, "suggestedLineHeight");
  objc_msgSend(v7, "setSuggestedLineHeight:");
  objc_msgSend(v7, "setAutofillNewContextStart:", -[CRFormTextFieldOutputRegion autofillNewContextStart](self, "autofillNewContextStart"));
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  int v11;
  _BOOL4 v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRFormTextFieldOutputRegion;
  if (-[CRFormFieldOutputRegion isEqual:](&v14, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[CRFormTextFieldOutputRegion textContentType](self, "textContentType");
    if (v6 == objc_msgSend(v5, "textContentType")
      && (v7 = -[CRFormTextFieldOutputRegion maxCharacterCount](self, "maxCharacterCount"),
          v7 == objc_msgSend(v5, "maxCharacterCount"))
      && (-[CRFormTextFieldOutputRegion suggestedLineHeight](self, "suggestedLineHeight"),
          v9 = v8,
          objc_msgSend(v5, "suggestedLineHeight"),
          v9 == v10))
    {
      v13 = -[CRFormTextFieldOutputRegion autofillNewContextStart](self, "autofillNewContextStart");
      v11 = v13 ^ objc_msgSend(v5, "autofillNewContextStart") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (unint64_t)textContentType
{
  return self->_textContentType;
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (BOOL)autofillNewContextStart
{
  return self->_autofillNewContextStart;
}

@end
