@implementation RTIStyledIntermediateText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:", v6, v5, 0x7FFFFFFFFFFFFFFFLL, 0);

  return v7;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:", v8, v7, a5, 0);

  return v9;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputString:displayString:selectionLocation:searchString:", v11, v10, a5, v9);

  return v12;
}

- (RTIStyledIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6
{
  id v10;
  id v11;
  id v12;
  RTIStyledIntermediateText *v13;
  uint64_t v14;
  NSString *inputString;
  void *v16;
  uint64_t v17;
  NSAttributedString *displayString;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSString *searchString;
  objc_super v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RTIStyledIntermediateText;
  v13 = -[RTIStyledIntermediateText init](&v24, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    inputString = v13->_inputString;
    v13->_inputString = (NSString *)v14;

    v25[0] = CFSTR("NSUnderline");
    v25[1] = CFSTR("NSUnderlineColor");
    v25[2] = CFSTR("NSMarkedClauseSegment");
    v25[3] = CFSTR("NSColor");
    v25[4] = CFSTR("NSBackgroundColor");
    v25[5] = CFSTR("NSTextAnimation");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTIUtilities _codableAttributedString:validAttributes:](RTIUtilities, "_codableAttributedString:validAttributes:", v11, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    displayString = v13->_displayString;
    v13->_displayString = (NSAttributedString *)v17;

    v19 = -[NSAttributedString length](v13->_displayString, "length");
    v20 = v19 - a5;
    if (v19 < a5)
      v20 = 0;
    v13->_selectionOffset = v20;
    v21 = objc_msgSend(v12, "copy");
    searchString = v13->_searchString;
    v13->_searchString = (NSString *)v21;

  }
  return v13;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_inputString, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSAttributedString copyWithZone:](self->_displayString, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v5[1] = self->_selectionOffset;
    v10 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v5[5] = self->_cursorVisibility;
  }
  return v5;
}

+ (id)_attributedStringAllowedClasses
{
  if (_attributedStringAllowedClasses_onceToken != -1)
    dispatch_once(&_attributedStringAllowedClasses_onceToken, &__block_literal_global);
  return (id)_attributedStringAllowedClasses_allowedClasses;
}

void __60__RTIStyledIntermediateText__attributedStringAllowedClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_attributedStringAllowedClasses_allowedClasses;
  _attributedStringAllowedClasses_allowedClasses = v2;

}

- (RTIStyledIntermediateText)initWithCoder:(id)a3
{
  id v4;
  RTIStyledIntermediateText *v5;
  void *v6;
  uint64_t v7;
  NSString *inputString;
  void *v9;
  void *v10;
  uint64_t v11;
  NSAttributedString *displayString;
  void *v13;
  uint64_t v14;
  NSString *searchString;
  objc_super v17;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v17.receiver = self;
  v17.super_class = (Class)RTIStyledIntermediateText;
  v5 = -[RTIStyledIntermediateText init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v7;

    objc_msgSend((id)objc_opt_class(), "_attributedStringAllowedClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("styledDisplayString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    displayString = v5->_displayString;
    v5->_displayString = (NSAttributedString *)v11;

    v5->_selectionOffset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectionOffset"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v14;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("cursorVisibility")))
      v5->_cursorVisibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cursorVisibility"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *inputString;
  NSAttributedString *displayString;
  void *v6;
  unint64_t selectionOffset;
  NSString *searchString;
  int64_t cursorVisibility;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  inputString = self->_inputString;
  if (inputString)
    objc_msgSend(v10, "encodeObject:forKey:", inputString, CFSTR("inputString"));
  displayString = self->_displayString;
  v6 = v10;
  if (displayString)
  {
    objc_msgSend(v10, "encodeObject:forKey:", displayString, CFSTR("styledDisplayString"));
    v6 = v10;
  }
  selectionOffset = self->_selectionOffset;
  if (selectionOffset)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", selectionOffset, CFSTR("selectionOffset"));
    v6 = v10;
  }
  searchString = self->_searchString;
  if (searchString)
  {
    objc_msgSend(v10, "encodeObject:forKey:", searchString, CFSTR("searchString"));
    v6 = v10;
  }
  cursorVisibility = self->_cursorVisibility;
  if (cursorVisibility)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", cursorVisibility, CFSTR("cursorVisibility"));
    v6 = v10;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[RTIStyledIntermediateText inputString](self, "inputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputString");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[RTIStyledIntermediateText inputString](self, "inputString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[RTIStyledIntermediateText displayString](self, "displayString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[RTIStyledIntermediateText displayString](self, "displayString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToAttributedString:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[RTIStyledIntermediateText searchString](self, "searchString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchString");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[RTIStyledIntermediateText searchString](self, "searchString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    v25 = -[RTIStyledIntermediateText selectedRange](self, "selectedRange");
    v27 = v26;
    v12 = 0;
    if (v25 == objc_msgSend(v5, "selectedRange") && v27 == v28)
    {
      v29 = -[RTIStyledIntermediateText cursorVisibility](self, "cursorVisibility");
      v12 = v29 == objc_msgSend(v5, "cursorVisibility");
    }
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

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
  unint64_t v9;

  -[RTIStyledIntermediateText inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[RTIStyledIntermediateText displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 257 * v4;

  -[RTIStyledIntermediateText searchString](self, "searchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 257 * v6;

  v9 = -[RTIStyledIntermediateText selectedRange](self, "selectedRange") + 257 * v8;
  if (-[RTIStyledIntermediateText cursorVisibility](self, "cursorVisibility"))
    return -[RTIStyledIntermediateText cursorVisibility](self, "cursorVisibility") + 257 * v9;
  return v9;
}

- (_NSRange)selectedRange
{
  unint64_t selectionOffset;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  selectionOffset = self->_selectionOffset;
  if (selectionOffset > -[NSAttributedString length](self->_displayString, "length"))
    -[RTIStyledIntermediateText selectedRange].cold.1();
  v4 = -[NSAttributedString length](self->_displayString, "length") - self->_selectionOffset;
  v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (NSAttributedString)displayString
{
  return self->_displayString;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int64_t)cursorVisibility
{
  return self->_cursorVisibility;
}

- (void)setCursorVisibility:(int64_t)a3
{
  self->_cursorVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
}

- (void)selectedRange
{
  __assert_rtn("-[RTIStyledIntermediateText selectedRange]", "RTIStyledIntermediateText.m", 157, "_selectionOffset <= [_displayString length]");
}

@end
