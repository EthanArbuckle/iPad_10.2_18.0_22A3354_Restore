@implementation _UITextViewRestorableScrollPosition

+ (id)restorableScrollPositionForTextView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextView:", v4);

  return v5;
}

- (_UITextViewRestorableScrollPosition)initWithTextView:(id)a3
{
  id v4;
  _UITextViewRestorableScrollPosition *v5;
  uint64_t v6;
  NSUInteger v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = -[_UITextViewRestorableScrollPosition init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "_visibleRangeWithLayout:", 1);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      || (v7 = v6, objc_msgSend(v4, "contentOffset"), fabs(v8) <= 2.22044605e-16)
      && (objc_msgSend(v4, "_documentRangeEqualToViewportRange") & 1) != 0)
    {

      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "_rectForScrollToVisible:", v7, 1);
      v10 = v9;
      v5->_range.location = v7;
      v5->_range.length = 1;
      objc_msgSend(v4, "contentOffset");
      v5->_offsetInLine = v11 - v10;
    }
  }

  return v5;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (double)offsetWithinLine
{
  return self->_offsetInLine;
}

+ (id)restorableScrollPositionForStateRestoration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTextViewForStateRestoration:", v4);

  return v5;
}

+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v5;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc_init((Class)a1);
  v5[1] = location;
  v5[2] = length;
  return (_UITextViewRestorableScrollPosition *)v5;
}

+ (_UITextViewRestorableScrollPosition)restorableScrollPositionWithDictionary:(id)a3
{
  id v4;
  double *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  v4 = a3;
  v5 = (double *)objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKey:", CFSTR("UILocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *((_QWORD *)v5 + 1) = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("UILength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *((_QWORD *)v5 + 2) = objc_msgSend(v7, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("UIOffset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "floatValue");
    v5[3] = v9;
  }

  return (_UITextViewRestorableScrollPosition *)v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  double offsetInLine;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_range.location);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("UILocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_range.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("UILength"));

  offsetInLine = self->_offsetInLine;
  *(float *)&offsetInLine = offsetInLine;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", offsetInLine);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("UIOffset"));

  return v3;
}

- (_UITextViewRestorableScrollPosition)initWithTextViewForStateRestoration:(id)a3
{
  id v4;
  _UITextViewRestorableScrollPosition *v5;
  uint64_t v6;
  NSUInteger v7;
  _UITextViewRestorableScrollPosition *v8;
  NSUInteger v9;
  NSUInteger v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = -[_UITextViewRestorableScrollPosition init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_msgSend(v4, "_visibleRangeWithLayout:", 1);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v6;
    v10 = v7;
    objc_msgSend(v4, "_contentOffsetForScrollToVisible:", v6, v7);
    v12 = v11;
    v5->_range.location = v9;
    v5->_range.length = v10;
    objc_msgSend(v4, "contentOffset");
    v5->_offsetInLine = v13 - v12;
LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger location;
  double offsetInLine;
  id v6;

  location = self->_range.location;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", location, CFSTR("UILocation"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_range.length, CFSTR("UILength"));
  offsetInLine = self->_offsetInLine;
  *(float *)&offsetInLine = offsetInLine;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("UIOffset"), offsetInLine);

}

- (_UITextViewRestorableScrollPosition)initWithCoder:(id)a3
{
  id v4;
  _UITextViewRestorableScrollPosition *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewRestorableScrollPosition;
  v5 = -[_UITextViewRestorableScrollPosition init](&v8, sel_init);
  if (v5)
  {
    v5->_range.location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILocation"));
    v5->_range.length = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILength"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIOffset"));
    v5->_offsetInLine = v6;
  }

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  NSRange v9;

  v8.receiver = self;
  v8.super_class = (Class)_UITextViewRestorableScrollPosition;
  -[_UITextViewRestorableScrollPosition debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.location = -[_UITextViewRestorableScrollPosition range](self, "range");
  NSStringFromRange(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextViewRestorableScrollPosition offsetWithinLine](self, "offsetWithinLine");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" { %@ + %f }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
