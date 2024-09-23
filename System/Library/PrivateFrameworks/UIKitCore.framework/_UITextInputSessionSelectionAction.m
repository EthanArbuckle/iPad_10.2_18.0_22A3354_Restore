@implementation _UITextInputSessionSelectionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;

  v4 = a3;
  v5 = -[_UITextInputSessionAction source](self, "source");
  if (v5 == objc_msgSend(v4, "source")
    && (v6 = -[_UITextInputSessionAction flagOptions](self, "flagOptions"), v6 == objc_msgSend(v4, "flagOptions")))
  {
    objc_msgSend(v4, "asSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && ((-[_UITextInputSessionSelectionAction rangeAfter](self, "rangeAfter"), !v8)
       && (-[_UITextInputSessionAction relativeRangeBefore](self, "relativeRangeBefore"), !v9)
       && (objc_msgSend(v7, "rangeAfter"), !v10)
       || (-[_UITextInputSessionSelectionAction rangeAfter](self, "rangeAfter"), v11)
       && (-[_UITextInputSessionAction relativeRangeBefore](self, "relativeRangeBefore"), v12)
       && (objc_msgSend(v7, "rangeAfter"), v13)))
    {
      v14 = objc_msgSend(v7, "rangeAfter");
      -[_UITextInputSessionSelectionAction setRangeAfter:](self, "setRangeAfter:", v14, v15);
      -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ objc_msgSend(v7, "inputActionCount"));
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  NSRange v12;

  v11.receiver = self;
  v11.super_class = (Class)_UITextInputSessionSelectionAction;
  -[_UITextInputSessionAction description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v12.location = -[_UITextInputSessionSelectionAction rangeAfter](self, "rangeAfter");
  NSStringFromRange(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("rangeAfter=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)textInputActionsType
{
  uint64_t v2;

  -[_UITextInputSessionSelectionAction rangeAfter](self, "rangeAfter");
  if (v2)
    return 9;
  else
    return 8;
}

- (_NSRange)rangeAfter
{
  _NSRange *p_rangeAfter;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeAfter = &self->_rangeAfter;
  location = self->_rangeAfter.location;
  length = p_rangeAfter->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeAfter:(_NSRange)a3
{
  self->_rangeAfter = a3;
}

@end
