@implementation NSSingleCompletionCheckingResult

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5 isPromoted:(BOOL)a6
{
  NSSingleCompletionCheckingResult *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSingleCompletionCheckingResult;
  v8 = -[NSSubstitutionCheckingResult initWithRange:replacementString:](&v10, sel_initWithRange_replacementString_, a3.location, a3.length, a4);
  if (v8)
  {
    v8->_completeWordIndexes = (NSIndexSet *)objc_msgSend(a5, "copy");
    v8->_isPromoted = a6;
  }
  return v8;
}

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 completeWordIndexes:(id)a5
{
  return -[NSSingleCompletionCheckingResult initWithRange:replacementString:completeWordIndexes:isPromoted:](self, "initWithRange:replacementString:completeWordIndexes:isPromoted:", a3.location, a3.length, a4, a5, 0);
}

- (NSSingleCompletionCheckingResult)initWithRange:(_NSRange)a3 replacementString:(id)a4 stopCompletingIndex:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;

  length = a3.length;
  location = a3.location;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a5);
  return -[NSSingleCompletionCheckingResult initWithRange:replacementString:completeWordIndexes:](self, "initWithRange:replacementString:completeWordIndexes:", location, length, a4, v9);
}

- (void)dealloc
{
  NSIndexSet *completeWordIndexes;
  objc_super v4;

  completeWordIndexes = self->_completeWordIndexes;
  if (completeWordIndexes)
  {

    self->_completeWordIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSSingleCompletionCheckingResult;
  -[NSSubstitutionCheckingResult dealloc](&v4, sel_dealloc);
}

- (unint64_t)stopCompletingIndex
{
  if (-[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"))
    return -[NSIndexSet firstIndex](-[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"), "firstIndex");
  else
    return objc_msgSend(-[NSSubstitutionCheckingResult replacementString](self, "replacementString"), "length");
}

- (id)description
{
  void *v3;
  id v4;
  unint64_t v5;
  _BOOL4 v6;
  const __CFString *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)NSSingleCompletionCheckingResult;
  v4 = -[NSSubstitutionCheckingResult description](&v9, sel_description);
  v5 = -[NSSingleCompletionCheckingResult stopCompletingIndex](self, "stopCompletingIndex");
  v6 = -[NSSingleCompletionCheckingResult isPromoted](self, "isPromoted");
  v7 = &stru_1EA8D8440;
  if (v6)
    v7 = CFSTR("+");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%u%@"), v4, v5, v7);
}

- (unint64_t)resultType
{
  return 0x20000000;
}

- (BOOL)isSingleCompletion
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSingleCompletionCheckingResult;
  -[NSSubstitutionCheckingResult encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"), CFSTR("NSCompleteWordIndexes"));
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSSingleCompletionCheckingResult stopCompletingIndex](self, "stopCompletingIndex"), CFSTR("NSStopCompletingIndex"));
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSSingleCompletionCheckingResult isPromoted](self, "isPromoted")), CFSTR("NSIsPromoted"));
  }
}

- (NSSingleCompletionCheckingResult)initWithCoder:(id)a3
{
  NSSingleCompletionCheckingResult *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSingleCompletionCheckingResult;
  v4 = -[NSSubstitutionCheckingResult initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSCompleteWordIndexes"));
      if (!v5)
      {
        v9 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSStopCompletingIndex"));
        if (v9)
        {
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
            v5 = (void *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v9);
        }
      }
      v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSIsPromoted"));
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    v4->_completeWordIndexes = (NSIndexSet *)objc_msgSend(v5, "copy");
    if (v6)
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 0;
    v4->_isPromoted = v7;
  }
  return v4;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  NSRange v5;
  NSUInteger v6;
  void *v8;

  v5.location = -[NSSubstitutionCheckingResult range](self, "range");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v5.location < -a3)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld invalid offset for range %@"), a3, NSStringFromRange(v5)), 0);
      objc_exception_throw(v8);
    }
    v6 = v5.location + a3;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:replacementString:completeWordIndexes:isPromoted:", v6, v5.length, -[NSSubstitutionCheckingResult replacementString](self, "replacementString"), -[NSSingleCompletionCheckingResult completeWordIndexes](self, "completeWordIndexes"), -[NSSingleCompletionCheckingResult isPromoted](self, "isPromoted"));
}

- (NSIndexSet)completeWordIndexes
{
  return (NSIndexSet *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isPromoted
{
  return self->_isPromoted;
}

@end
