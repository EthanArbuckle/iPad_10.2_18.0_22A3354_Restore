@implementation NSCountableTextLocation

- (unint64_t)hash
{
  return self->_characterIndex;
}

- (NSString)type
{
  return (NSString *)NSTextLocationTypeCountable;
}

- (unint64_t)characterIndex
{
  return self->_characterIndex;
}

- (BOOL)isEndOfDocument
{
  return self->_characterIndex > 0x7FFFFFFFFFFFFFFELL;
}

- (int64_t)compare:(id)a3
{
  uint64_t v6;
  int64_t characterIndex;
  BOOL v9;
  BOOL v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (self == a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *((_QWORD *)a3 + 1);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      v14 = objc_opt_class();
      objc_msgSend(v12, "raise:format:", v13, CFSTR("-[%@ %@] receiving unmatching type %@"), v14, NSStringFromSelector(a2), a3);
      return 0;
    }
    v6 = objc_msgSend(a3, "characterIndex");
  }
  characterIndex = self->_characterIndex;
  v9 = characterIndex == v6;
  v10 = characterIndex < v6;
  v11 = -1;
  if (!v10)
    v11 = 1;
  if (v9)
    return 0;
  else
    return v11;
}

- (NSCountableTextLocation)initWithIndex:(unint64_t)a3
{
  NSCountableTextLocation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSCountableTextLocation;
  result = -[NSCountableTextLocation init](&v5, sel_init);
  if (result)
    result->_characterIndex = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;
  int v6;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self->_characterIndex == *((_QWORD *)a3 + 1);
    }
    else
    {
      v6 = objc_msgSend(a3, "conformsToProtocol:", &unk_1EE07B5E0);
      if (!v6)
        return v6;
      v5 = -[NSCountableTextLocation compare:](self, "compare:", a3) == 0;
    }
    LOBYTE(v6) = v5;
  }
  return v6;
}

+ (NSCountableTextLocation)endOfDocumentLocation
{
  if (endOfDocumentLocation_onceToken != -1)
    dispatch_once(&endOfDocumentLocation_onceToken, &__block_literal_global_67);
  return (NSCountableTextLocation *)endOfDocumentLocation_textLocation;
}

NSCountableTextLocation *__48__NSCountableTextLocation_endOfDocumentLocation__block_invoke()
{
  NSCountableTextLocation *result;

  result = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", 0x7FFFFFFFFFFFFFFFLL);
  endOfDocumentLocation_textLocation = (uint64_t)result;
  return result;
}

- (NSString)debugDescription
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[NSCountableTextLocation isEndOfDocument](self, "isEndOfDocument"))
    v4 = CFSTR("%@: <EOD>");
  else
    v4 = CFSTR("%@: %lu");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", v4, objc_opt_class(), -[NSCountableTextLocation characterIndex](self, "characterIndex"));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSCountableTextLocation characterIndex](self, "characterIndex"));
}

- (BOOL)isEqualToTextLocation:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return self->_characterIndex == *((_QWORD *)a3 + 1);
  else
    return -[NSCountableTextLocation compare:](self, "compare:", a3) == 0;
}

- (void)setCharacterIndex:(unint64_t)a3
{
  self->_characterIndex = a3;
}

@end
