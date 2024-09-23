@implementation NSTextSelection

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  NSDictionary *v5;

  objc_sync_enter(self);
  v5 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", typingAttributes);

  self->_typingAttributes = v5;
  objc_sync_exit(self);
}

- (BOOL)isEqualToTextSelection:(id)a3
{
  int v5;
  int64_t granularity;
  int64_t affinity;
  int transient;
  int logical;
  double anchorPositionOffset;
  double v11;
  NSTextLocation *secondarySelectionLocation;
  NSDictionary *typingAttributes;
  NSTextLocation *selectionAnchorLocation;

  if (self == a3)
    goto LABEL_14;
  v5 = -[NSArray isEqualToArray:](self->_textRanges, "isEqualToArray:", objc_msgSend(a3, "textRanges"));
  if (v5)
  {
    granularity = self->_granularity;
    if (granularity != objc_msgSend(a3, "granularity")
      || (affinity = self->_affinity, affinity != objc_msgSend(a3, "affinity"))
      || (transient = self->_transient, transient != objc_msgSend(a3, "isTransient"))
      || (logical = self->_logical, logical != objc_msgSend(a3, "isLogical"))
      || (anchorPositionOffset = self->_anchorPositionOffset,
          objc_msgSend(a3, "anchorPositionOffset"),
          anchorPositionOffset != v11))
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    secondarySelectionLocation = self->_secondarySelectionLocation;
    if (secondarySelectionLocation == (NSTextLocation *)objc_msgSend(a3, "secondarySelectionLocation")
      || (v5 = -[NSTextLocation isEqual:](self->_secondarySelectionLocation, "isEqual:", objc_msgSend(a3, "secondarySelectionLocation"))) != 0)
    {
      typingAttributes = self->_typingAttributes;
      if (typingAttributes == (NSDictionary *)objc_msgSend(a3, "typingAttributes")
        || (v5 = -[NSDictionary isEqualToDictionary:](self->_typingAttributes, "isEqualToDictionary:", objc_msgSend(a3, "typingAttributes"))) != 0)
      {
        selectionAnchorLocation = self->_selectionAnchorLocation;
        if (selectionAnchorLocation != (NSTextLocation *)objc_msgSend(a3, "selectionAnchorLocation"))
        {
          LOBYTE(v5) = -[NSTextLocation isEqual:](self->_selectionAnchorLocation, "isEqual:", objc_msgSend(a3, "selectionAnchorLocation"));
          return v5;
        }
LABEL_14:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (NSArray)textRanges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)typingAttributes
{
  return self->_typingAttributes;
}

- (id)secondarySelectionLocation
{
  return objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (BOOL)isLogical
{
  return self->_logical;
}

- (NSTextSelectionGranularity)granularity
{
  return self->_granularity;
}

- (CGFloat)anchorPositionOffset
{
  return self->_anchorPositionOffset;
}

- (NSTextSelectionAffinity)affinity
{
  return self->_affinity;
}

- (NSTextLocation)selectionAnchorLocation
{
  return (NSTextLocation *)objc_getProperty(self, a2, 64, 1);
}

- (id)textRangeContainingLocation:(id)a3
{
  NSArray *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v4 = -[NSTextSelection textRanges](self, "textRanges");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  v13 = 0;
  if ((objc_msgSend(-[NSArray firstObject](v4, "firstObject"), "isEmpty") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__NSTextSelection_textRangeContainingLocation___block_invoke;
    v7[3] = &unk_1E26037E0;
    v7[4] = a3;
    v7[5] = &v8;
    -[NSArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", v7);
  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSTextSelection)initWithRange:(NSTextRange *)range affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity
{
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = range;
  return -[NSTextSelection initWithRanges:affinity:granularity:](self, "initWithRanges:affinity:granularity:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1), affinity, granularity);
}

- (NSTextSelection)initWithRanges:(NSArray *)textRanges affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity
{
  NSTextSelection *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSTextSelection;
  v8 = -[NSTextSelection init](&v11, sel_init);
  if (v8)
  {
    v9 = -[NSArray copy](textRanges, "copy");
    v8->_granularity = granularity;
    v8->_affinity = affinity;
    v8->_textRanges = (NSArray *)v9;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextSelection;
  -[NSTextSelection dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSTextSelection isEqualToTextSelection:](self, "isEqualToTextSelection:", a3);
}

- (NSTextSelection)initWithLocation:(id)location affinity:(NSTextSelectionAffinity)affinity
{
  return -[NSTextSelection initWithRange:affinity:granularity:](self, "initWithRange:affinity:granularity:", -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", location), affinity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextSelection)initWithCoder:(NSCoder *)coder
{
  __int16 v5;
  double v6;

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v5 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NS.flags"));
    self->_textRanges = (NSArray *)-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.textRanges"));
    self->_granularity = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NS.granularity"));
    -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NS.anchorPositionOffset"));
    self->_anchorPositionOffset = v6;
    self->_secondarySelectionLocation = (NSTextLocation *)-[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NS.secondarySelectionLocation"));
    self->_affinity = v5 & 0xF;
    self->_transient = HIBYTE(v5) & 1;
    self->_logical = (v5 & 0x200) != 0;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", self->_affinity & 0xF | ((unint64_t)self->_transient << 8) | ((unint64_t)self->_logical << 9), CFSTR("NS.flags"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_textRanges, CFSTR("NS.textRanges"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_granularity, CFSTR("NS.granularity"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.anchorPositionOffset"), self->_anchorPositionOffset);
    objc_msgSend(a3, "encodeObject:forKey:", self->_secondarySelectionLocation, CFSTR("NS.secondarySelectionLocation"));
  }
}

id __47__NSTextSelection_textRangeContainingLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a2, "endLocation"));
  if (result == (id)-1)
  {
    result = (id)objc_msgSend((id)objc_msgSend(a2, "location"), "compare:", *(_QWORD *)(a1 + 32));
    if (result == (id)1)
      return result;
    result = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  *a4 = 1;
  return result;
}

- (BOOL)containsLocation:(id)a3
{
  return -[NSTextSelection textRangeContainingLocation:](self, "textRangeContainingLocation:", a3) != 0;
}

- (NSTextSelection)textSelectionWithTextRanges:(NSArray *)textRanges
{
  NSTextSelection *v4;
  NSTextSelection *v5;

  v4 = self;
  if (!-[NSArray isEqualToArray:](textRanges, "isEqualToArray:", -[NSTextSelection textRanges](self, "textRanges")))
  {
    v5 = -[NSTextSelection initWithRanges:affinity:granularity:]([NSTextSelection alloc], "initWithRanges:affinity:granularity:", textRanges, -[NSTextSelection affinity](v4, "affinity"), -[NSTextSelection granularity](v4, "granularity"));
    -[NSTextSelection setLogical:](v5, "setLogical:", -[NSTextSelection isLogical](v4, "isLogical"));
    -[NSTextSelection setSecondarySelectionLocation:](v5, "setSecondarySelectionLocation:", -[NSTextSelection secondarySelectionLocation](v4, "secondarySelectionLocation"));
    -[NSTextSelection setTypingAttributes:](v5, "setTypingAttributes:", -[NSTextSelection typingAttributes](v4, "typingAttributes"));
    -[NSTextSelection setSelectionAnchorLocation:](v5, "setSelectionAnchorLocation:", -[NSTextSelection selectionAnchorLocation](v4, "selectionAnchorLocation"));
    return v5;
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_textRanges, "hash");
  v4 = -[NSTextLocation hash](self->_secondarySelectionLocation, "hash") + v3;
  v5 = -[NSDictionary hash](self->_typingAttributes, "hash");
  return v4 + v5 + -[NSTextLocation hash](self->_selectionAnchorLocation, "hash") + self->_affinity + self->_granularity;
}

+ (id)descriptionForGranularity:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("unknown");
  else
    return off_1E260C208[a3];
}

+ (id)descriptionForAffinity:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("downstream");
  if (a3)
    return (id)v3;
  else
    return CFSTR("upstream");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 transient;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_msgSend((id)objc_opt_class(), "descriptionForGranularity:", self->_granularity);
  v6 = objc_msgSend((id)objc_opt_class(), "descriptionForAffinity:", self->_affinity);
  transient = self->_transient;
  if (self->_anchorPositionOffset == 0.0)
    v8 = &stru_1E260C7D0;
  else
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", anchor position offset=%f"), *(_QWORD *)&self->_anchorPositionOffset);
  if (self->_selectionAnchorLocation)
    v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", anchor location %@"), self->_selectionAnchorLocation);
  else
    v9 = &stru_1E260C7D0;
  v10 = CFSTR(", transient");
  if (!transient)
    v10 = &stru_1E260C7D0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:<%p> granularity=%@, affinity=%@%@%@%@, textRanges=%@"), v4, self, v5, v6, v10, v8, v9, self->_textRanges);
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void)setAnchorPositionOffset:(CGFloat)anchorPositionOffset
{
  self->_anchorPositionOffset = anchorPositionOffset;
}

- (void)setLogical:(BOOL)logical
{
  self->_logical = logical;
}

- (void)setSecondarySelectionLocation:(id)secondarySelectionLocation
{
  objc_setProperty_atomic(self, a2, secondarySelectionLocation, 56);
}

- (void)setSelectionAnchorLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
