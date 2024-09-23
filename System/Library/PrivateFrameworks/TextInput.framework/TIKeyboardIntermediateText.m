@implementation TIKeyboardIntermediateText

- (TIKeyboardIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(unint64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TIKeyboardIntermediateText *v21;
  uint64_t v22;
  NSString *inputString;
  uint64_t v24;
  NSString *lastInputString;
  uint64_t v26;
  NSString *displayString;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSString *searchString;
  uint64_t v32;
  NSArray *liveConversionSegments;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a10;
  v35.receiver = self;
  v35.super_class = (Class)TIKeyboardIntermediateText;
  v21 = -[TIKeyboardIntermediateText init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    inputString = v21->_inputString;
    v21->_inputString = (NSString *)v22;

    v24 = objc_msgSend(v20, "copy");
    lastInputString = v21->_lastInputString;
    v21->_lastInputString = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    displayString = v21->_displayString;
    v21->_displayString = (NSString *)v26;

    v28 = -[NSString length](v21->_displayString, "length");
    v29 = v28 - a5;
    if (v28 < a5)
      v29 = 0;
    v21->_selectionOffset = v29;
    v30 = objc_msgSend(v18, "copy");
    searchString = v21->_searchString;
    v21->_searchString = (NSString *)v30;

    v21->_candidateOffset = a7;
    v32 = objc_msgSend(v19, "copy");
    liveConversionSegments = v21->_liveConversionSegments;
    v21->_liveConversionSegments = (NSArray *)v32;

    v21->_highlightSegmentIndex = a9;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_inputString, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSString copyWithZone:](self->_lastInputString, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_displayString, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v5[1] = self->_selectionOffset;
    v12 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
    v13 = (void *)v5[8];
    v5[8] = v12;

    v5[5] = self->_candidateOffset;
    v14 = -[NSArray copyWithZone:](self->_liveConversionSegments, "copyWithZone:", a3);
    v15 = (void *)v5[6];
    v5[6] = v14;

    v5[7] = self->_highlightSegmentIndex;
  }
  return v5;
}

- (TIKeyboardIntermediateText)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardIntermediateText *v5;
  void *v6;
  uint64_t v7;
  NSString *inputString;
  void *v9;
  uint64_t v10;
  NSString *lastInputString;
  void *v12;
  uint64_t v13;
  NSString *displayString;
  void *v15;
  uint64_t v16;
  NSString *searchString;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *liveConversionSegments;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIKeyboardIntermediateText;
  v5 = -[TIKeyboardIntermediateText init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastInputString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    lastInputString = v5->_lastInputString;
    v5->_lastInputString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v13;

    v5->_selectionOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectionOffset"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v16;

    v5->_candidateOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("candidateOffset"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("liveConversionSegments"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    liveConversionSegments = v5->_liveConversionSegments;
    v5->_liveConversionSegments = (NSArray *)v22;

    v5->_highlightSegmentIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("highlightSegmentIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *inputString;
  NSString *lastInputString;
  NSString *displayString;
  unint64_t selectionOffset;
  NSString *searchString;
  int64_t candidateOffset;
  NSArray *liveConversionSegments;
  int64_t highlightSegmentIndex;
  id v13;

  v4 = a3;
  inputString = self->_inputString;
  v13 = v4;
  if (inputString)
  {
    objc_msgSend(v4, "encodeObject:forKey:", inputString, CFSTR("inputString"));
    v4 = v13;
  }
  lastInputString = self->_lastInputString;
  if (lastInputString)
  {
    objc_msgSend(v13, "encodeObject:forKey:", lastInputString, CFSTR("lastInputString"));
    v4 = v13;
  }
  displayString = self->_displayString;
  if (displayString)
  {
    objc_msgSend(v13, "encodeObject:forKey:", displayString, CFSTR("displayString"));
    v4 = v13;
  }
  selectionOffset = self->_selectionOffset;
  if (selectionOffset)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", selectionOffset, CFSTR("selectionOffset"));
    v4 = v13;
  }
  searchString = self->_searchString;
  if (searchString)
  {
    objc_msgSend(v13, "encodeObject:forKey:", searchString, CFSTR("searchString"));
    v4 = v13;
  }
  candidateOffset = self->_candidateOffset;
  if (candidateOffset)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", candidateOffset, CFSTR("candidateOffset"));
    v4 = v13;
  }
  liveConversionSegments = self->_liveConversionSegments;
  if (liveConversionSegments)
  {
    objc_msgSend(v13, "encodeObject:forKey:", liveConversionSegments, CFSTR("liveConversionSegments"));
    v4 = v13;
  }
  highlightSegmentIndex = self->_highlightSegmentIndex;
  if (highlightSegmentIndex)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", highlightSegmentIndex, CFSTR("highlightSegmentIndex"));
    v4 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int64_t v43;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIKeyboardIntermediateText inputString](self, "inputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputString");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TIKeyboardIntermediateText inputString](self, "inputString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_24;
    }
    -[TIKeyboardIntermediateText lastInputString](self, "lastInputString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastInputString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[TIKeyboardIntermediateText lastInputString](self, "lastInputString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastInputString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_24;
    }
    -[TIKeyboardIntermediateText displayString](self, "displayString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayString");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[TIKeyboardIntermediateText displayString](self, "displayString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
        goto LABEL_24;
    }
    -[TIKeyboardIntermediateText searchString](self, "searchString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchString");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[TIKeyboardIntermediateText searchString](self, "searchString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if (!v30)
        goto LABEL_24;
    }
    v31 = -[TIKeyboardIntermediateText selectedRange](self, "selectedRange");
    v33 = v32;
    v12 = 0;
    if (v31 != objc_msgSend(v5, "selectedRange") || v33 != v34)
      goto LABEL_25;
    v35 = -[TIKeyboardIntermediateText candidateOffset](self, "candidateOffset");
    if (v35 != objc_msgSend(v5, "candidateOffset"))
      goto LABEL_24;
    -[TIKeyboardIntermediateText liveConversionSegments](self, "liveConversionSegments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "liveConversionSegments");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v36 == (void *)v37)
    {

    }
    else
    {
      v38 = (void *)v37;
      -[TIKeyboardIntermediateText liveConversionSegments](self, "liveConversionSegments");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "liveConversionSegments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqual:", v40);

      if (!v41)
      {
LABEL_24:
        v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v43 = -[TIKeyboardIntermediateText highlightSegmentIndex](self, "highlightSegmentIndex");
    v12 = v43 == objc_msgSend(v5, "highlightSegmentIndex");
    goto LABEL_25;
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  int64_t v14;

  -[TIKeyboardIntermediateText inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TIKeyboardIntermediateText lastInputString](self, "lastInputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 257 * v4;

  -[TIKeyboardIntermediateText displayString](self, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 257 * v6;

  -[TIKeyboardIntermediateText searchString](self, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") + 257 * v8;

  v11 = 257 * (-[TIKeyboardIntermediateText selectedRange](self, "selectedRange") + 257 * v10);
  v12 = 257 * (v11 + -[TIKeyboardIntermediateText candidateOffset](self, "candidateOffset"));
  -[TIKeyboardIntermediateText liveConversionSegments](self, "liveConversionSegments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 + objc_msgSend(v13, "hash");

  return 257 * v14 + -[TIKeyboardIntermediateText highlightSegmentIndex](self, "highlightSegmentIndex");
}

- (_NSRange)selectedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSString length](self->_displayString, "length") - self->_selectionOffset;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIKeyboardIntermediateText displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardIntermediateText inputString](self, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardIntermediateText lastInputString](self, "lastInputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@ (%@) %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (NSString)lastInputString
{
  return self->_lastInputString;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (int64_t)candidateOffset
{
  return self->_candidateOffset;
}

- (NSArray)liveConversionSegments
{
  return self->_liveConversionSegments;
}

- (int64_t)highlightSegmentIndex
{
  return self->_highlightSegmentIndex;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_liveConversionSegments, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_lastInputString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v6, v5, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

  return (TIKeyboardIntermediateText *)v7;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 lastInputString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v9, v8, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, v7);

  return (TIKeyboardIntermediateText *)v10;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 lastInputString:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v11, v10, a5, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, v9);

  return (TIKeyboardIntermediateText *)v12;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 lastInputString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v14, v13, a5, v12, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, v11);

  return (TIKeyboardIntermediateText *)v15;
}

+ (TIKeyboardIntermediateText)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6 candidateOffset:(int64_t)a7 liveConversionSegments:(id)a8 highlightSegmentIndex:(int64_t)a9 lastInputString:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v16 = a10;
  v17 = a8;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v20, v19, a5, v18, a7, v17, a9, v16);

  return (TIKeyboardIntermediateText *)v21;
}

@end
