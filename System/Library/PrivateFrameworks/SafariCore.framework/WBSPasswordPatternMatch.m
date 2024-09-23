@implementation WBSPasswordPatternMatch

- (WBSPasswordPatternMatch)initWithType:(unint64_t)a3 matchedSubstring:(id)a4 range:(_NSRange)a5 guessesRequired:(double)a6 userInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  WBSPasswordPatternMatch *v15;
  WBSPasswordPatternMatch *v16;
  uint64_t v17;
  NSString *matchedSubstring;
  uint64_t v19;
  NSDictionary *userInfo;
  WBSPasswordPatternMatch *v21;
  objc_super v23;

  length = a5.length;
  location = a5.location;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordPatternMatch;
  v15 = -[WBSPasswordPatternMatch init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v17 = objc_msgSend(v13, "copy");
    matchedSubstring = v16->_matchedSubstring;
    v16->_matchedSubstring = (NSString *)v17;

    v16->_range.location = location;
    v16->_range.length = length;
    v16->_guessesRequired = a6;
    v19 = objc_msgSend(v14, "copy");
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v19;

    v21 = v16;
  }

  return v16;
}

- (id)initExhaustiveSearchPatternWithMatchedSubstring:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  double v7;
  id v8;
  WBSPasswordPatternMatch *v9;

  length = a4.length;
  location = a4.location;
  v7 = (double)a4.length;
  v8 = a3;
  v9 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:](self, "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 0, v8, location, length, 0, __exp10(v7));

  return v9;
}

- (unint64_t)endIndex
{
  return self->_range.location + self->_range.length - 1;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordPatternMatch *v4;
  WBSPasswordPatternMatch *v5;
  uint64_t v6;
  unint64_t type;
  NSString *matchedSubstring;
  void *v9;
  uint64_t v10;
  char v11;
  double guessesRequired;
  double v13;
  NSDictionary *userInfo;

  v4 = (WBSPasswordPatternMatch *)a3;
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
      -[WBSPasswordPatternMatch userInfo](v5, "userInfo");
      v6 = objc_claimAutoreleasedReturnValue();
      type = self->_type;
      if (type != -[WBSPasswordPatternMatch type](v5, "type"))
      {
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
      matchedSubstring = self->_matchedSubstring;
      -[WBSPasswordPatternMatch matchedSubstring](v5, "matchedSubstring");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](matchedSubstring, "isEqualToString:", v9))
        goto LABEL_13;
      v11 = 0;
      if (self->_range.location != -[WBSPasswordPatternMatch range](v5, "range") || self->_range.length != v10)
        goto LABEL_14;
      guessesRequired = self->_guessesRequired;
      -[WBSPasswordPatternMatch guessesRequired](v5, "guessesRequired");
      if (guessesRequired == v13)
      {
        userInfo = self->_userInfo;
        if ((unint64_t)userInfo | v6)
          v11 = -[NSDictionary isEqual:](userInfo, "isEqual:", v6);
        else
          v11 = 1;
      }
      else
      {
LABEL_13:
        v11 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_matchedSubstring, "hash");
  return -[NSDictionary hash](self->_userInfo, "hash") ^ v3 ^ self->_range.location;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  NSString *matchedSubstring;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_type - 1;
  if (v6 > 4)
    v7 = CFSTR("ExhaustiveSearch");
  else
    v7 = off_1E649E0C0[v6];
  matchedSubstring = self->_matchedSubstring;
  NSStringFromRange(self->_range);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %@; matchedString = %@; range = %@; guessesRequired = %.0lf; userInfo = %@>"),
    v5,
    self,
    v7,
    matchedSubstring,
    v9,
    *(_QWORD *)&self->_guessesRequired,
    self->_userInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)compactDescriptionWithMatchedStringColumnWidth:(unint64_t)a3
{
  NSUInteger location;
  id v6;
  NSDictionary *userInfo;
  id v8;
  __CFString *v9;
  void *v10;
  const char *v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  location = self->_range.location;
  if (self->_userInfo)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    userInfo = self->_userInfo;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__WBSPasswordPatternMatch_compactDescriptionWithMatchedStringColumnWidth___block_invoke;
    v16[3] = &unk_1E649E0A0;
    v17 = v6;
    v8 = v6;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](userInfo, "enumerateKeysAndObjectsUsingBlock:", v16);
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E64A2498;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = -[NSString UTF8String](self->_matchedSubstring, "UTF8String");
  v12 = self->_type - 1;
  if (v12 > 4)
    v13 = CFSTR("ExhaustiveSearch");
  else
    v13 = off_1E649E0C0[v12];
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%*s%-*s | %-16s | %12lg | %@"), location, ", a3 - location, v11, -[__CFString UTF8String](v13, "UTF8String"), *(_QWORD *)&self->_guessesRequired, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __74__WBSPasswordPatternMatch_compactDescriptionWithMatchedStringColumnWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)matchedSubstring
{
  return self->_matchedSubstring;
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

- (double)guessesRequired
{
  return self->_guessesRequired;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_matchedSubstring, 0);
}

@end
