@implementation WBSURLCompletionUserTypedString

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    systemEightBitStringEncoding = CFStringGetFastestEncoding(CFSTR(" "));
}

- (WBSURLCompletionUserTypedString)init
{

  return 0;
}

- (WBSURLCompletionUserTypedString)initWithString:(id)a3
{
  id v4;
  WBSURLCompletionUserTypedString *v5;
  WBSURLCompletionUserTypedString *v6;
  uint64_t v7;
  NSString *string;
  const UniChar *CharactersPtr;
  UniChar *v10;
  const char *CStringPtr;
  char *v12;
  WBSURLCompletionUserTypedString *v13;
  objc_super v15;
  CFRange v16;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSURLCompletionUserTypedString;
  v5 = -[WBSURLCompletionUserTypedString init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "safari_stringByFoldingWideCharactersAndNormalizing");
    v7 = objc_claimAutoreleasedReturnValue();
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v6->_length = CFStringGetLength((CFStringRef)v6->_string);
    v6->_containsAnySpaces = CFStringFind((CFStringRef)v6->_string, CFSTR(" "), 0).location != -1;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)v6->_string);
    v6->_unichars = CharactersPtr;
    if (!CharactersPtr)
    {
      v10 = (UniChar *)operator new[]();
      v6->_unichars = v10;
      v16.length = v6->_length;
      v16.location = 0;
      CFStringGetCharacters((CFStringRef)v6->_string, v16, v10);
      v6->_ownsUnichars = 1;
    }
    CStringPtr = CFStringGetCStringPtr((CFStringRef)v6->_string, systemEightBitStringEncoding);
    v6->_chars = CStringPtr;
    if (!CStringPtr)
    {
      v12 = (char *)operator new[]();
      v6->_chars = v12;
      if (!CFStringGetCString((CFStringRef)v6->_string, v12, v6->_length + 1, systemEightBitStringEncoding))
        bzero((void *)v6->_chars, v6->_length + 1);
      v6->_ownsChars = 1;
    }
    v13 = v6;
  }

  return v6;
}

- (WBSURLCompletionUserTypedString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WBSURLCompletionUserTypedString *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userTypedString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSURLCompletionUserTypedString initWithString:](self, "initWithString:", v5);

  return v6;
}

- (void)dealloc
{
  const unsigned __int16 *unichars;
  const char *chars;
  objc_super v5;

  if (self->_ownsUnichars)
  {
    unichars = self->_unichars;
    if (unichars)
      MEMORY[0x1A85998AC](unichars, 0x1000C40BDFB0063);
  }
  if (self->_ownsChars)
  {
    chars = self->_chars;
    if (chars)
      MEMORY[0x1A85998AC](chars, 0x1000C4077774924);
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSURLCompletionUserTypedString;
  -[WBSURLCompletionUserTypedString dealloc](&v5, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_string, CFSTR("userTypedString"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)searchQueryParameterString
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *searchQueryParameterString;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_searchQueryParameterString)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NSString stringByReplacingOccurrencesOfString:withString:](self->_string, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("q=%@"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    searchQueryParameterString = self->_searchQueryParameterString;
    self->_searchQueryParameterString = v6;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_searchQueryParameterString;
}

- (WBSURLCompletionUserTypedString)stringWithoutWhitespace
{
  os_unfair_lock_s *p_lock;
  NSString *string;
  void *v5;
  NSString *v6;
  NSString *stringWithoutWhitespace;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_stringWithoutWhitespace)
  {
    string = self->_string;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString safari_stringByRemovingCharactersInSet:](string, "safari_stringByRemovingCharactersInSet:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    stringWithoutWhitespace = self->_stringWithoutWhitespace;
    self->_stringWithoutWhitespace = v6;

  }
  os_unfair_lock_unlock(p_lock);
  return (WBSURLCompletionUserTypedString *)self->_stringWithoutWhitespace;
}

- (NSArray)components
{
  os_unfair_lock_s *p_lock;
  NSString *string;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *components;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_components)
  {
    string = self->_string;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString componentsSeparatedByCharactersInSet:](string, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_103);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    components = self->_components;
    self->_components = v7;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_components;
}

BOOL __45__WBSURLCompletionUserTypedString_components__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

- (WBSURLCompletionUserTypedString)typedStringForURLMatching
{
  WBSURLCompletionUserTypedString *v2;
  os_unfair_lock_s *p_lock;
  WBSURLCompletionUserTypedString *typedStringForURLMatching;
  WBSURLCompletionUserTypedString *v5;
  unsigned __int8 v6;
  void *v7;
  WBSURLCompletionUserTypedString *v8;
  WBSURLCompletionUserTypedString *v9;
  WBSURLCompletionUserTypedString *v10;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  typedStringForURLMatching = v2->_typedStringForURLMatching;
  os_unfair_lock_unlock(p_lock);
  if (typedStringForURLMatching)
  {
    v5 = v2->_typedStringForURLMatching;
LABEL_9:
    v10 = v5;
    return v10;
  }
  v6 = atomic_load((unsigned __int8 *)&v2->_stringOnlyContainsWhitespaces);
  if ((v6 & 1) != 0)
  {
    v5 = v2;
    goto LABEL_9;
  }
  -[NSString safari_stringByTrimmingWhitespace](v2->_string, "safari_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    os_unfair_lock_lock(p_lock);
    if (!v2->_typedStringForURLMatching)
    {
      v8 = -[WBSURLCompletionUserTypedString initWithString:]([WBSURLCompletionUserTypedString alloc], "initWithString:", v7);
      v9 = v2->_typedStringForURLMatching;
      v2->_typedStringForURLMatching = v8;

    }
    os_unfair_lock_unlock(p_lock);
    v2 = v2->_typedStringForURLMatching;
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&v2->_stringOnlyContainsWhitespaces);
  }
  v10 = v2;

  return v10;
}

- (NSString)normalizedString
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typedStringForURLMatching, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_stringWithoutWhitespace, 0);
  objc_storeStrong((id *)&self->_searchQueryParameterString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 44) = 0;
  return self;
}

@end
