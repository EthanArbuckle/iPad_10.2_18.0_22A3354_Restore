@implementation NSTextAlternatives

- (NSTextAlternatives)initWithPrimaryString:(NSString *)primaryString alternativeStrings:(NSArray *)alternativeStrings
{
  _QWORD *v7;
  NSTextAlternatives *v8;
  objc_super v10;

  v7 = (_QWORD *)MEMORY[0x1E0C99778];
  if (primaryString)
  {
    if (!alternativeStrings)
      goto LABEL_6;
LABEL_5:
    if (-[NSArray count](alternativeStrings, "count"))
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: must have original text"), _NSFullMethodName());
  if (alternativeStrings)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("%@: must have alternatives"), _NSFullMethodName());
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)NSTextAlternatives;
  v8 = -[NSTextAlternatives init](&v10, sel_init);
  if (v8)
  {
    v8->_primaryString = (NSString *)-[NSString copy](primaryString, "copy");
    v8->_alternativeStrings = (NSArray *)-[NSArray copy](alternativeStrings, "copy");
    v8->_isLowConfidence = 1;
  }
  return v8;
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 isLowConfidence:(BOOL)a5
{
  NSTextAlternatives *result;

  result = -[NSTextAlternatives initWithPrimaryString:alternativeStrings:](self, "initWithPrimaryString:alternativeStrings:", a3, a4);
  if (result)
    result->_isLowConfidence = a5;
  return result;
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5
{
  return -[NSTextAlternatives initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:](self, "initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:", a3, a4, a5, 1);
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5 isLowConfidence:(BOOL)a6
{
  NSTextAlternatives *v7;

  v7 = -[NSTextAlternatives initWithPrimaryString:alternativeStrings:isLowConfidence:](self, "initWithPrimaryString:alternativeStrings:isLowConfidence:", a3, a4, a6);
  if (v7)
    v7->_internal = (id)objc_msgSend(a5, "copy");
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextAlternatives;
  -[NSTextAlternatives dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextAlternatives;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ primary <%@> alternatives %@"), -[NSTextAlternatives description](&v3, sel_description), -[NSTextAlternatives primaryString](self, "primaryString"), -[NSTextAlternatives alternativeStrings](self, "alternativeStrings"));
}

- (void)encodeWithCoder:(id)a3
{
  NSString *v5;
  id v6;
  NSArray *v7;

  v5 = -[NSTextAlternatives primaryString](self, "primaryString");
  v6 = -[NSTextAlternatives identifier](self, "identifier");
  v7 = -[NSTextAlternatives alternativeStrings](self, "alternativeStrings");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("NSPrimary"));
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("NSAlternatives"));
    objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("NSIdentifier"));
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowConfidence), CFSTR("NSLowConfidence"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
    objc_msgSend(a3, "encodeObject:", v7);
    objc_msgSend(a3, "encodeObject:", v6);
  }
}

- (NSTextAlternatives)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPrimary"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("NSAlternatives"));
    v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSIdentifier"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSLowConfidence")))
    {
      v10 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSLowConfidence")), "BOOLValue");
      return -[NSTextAlternatives initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:](self, "initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:", v5, v8, v9, v10);
    }
LABEL_6:
    v10 = 1;
    return -[NSTextAlternatives initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:](self, "initWithPrimaryString:alternativeStrings:identifier:isLowConfidence:", v5, v8, v9, v10);
  }
  v11 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSTextAlternatives"));
  if (v11 == 1)
  {
    v5 = objc_msgSend(a3, "decodeObject");
    v8 = objc_msgSend(a3, "decodeObject");
    v9 = objc_msgSend(a3, "decodeObject");
    goto LABEL_6;
  }
  v13 = v11;
  v14 = _NSFullMethodName();
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v14, 1, v13);
  -[NSTextAlternatives dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSArray)alternativeStrings
{
  return self->_alternativeStrings;
}

- (void)noteSelectedAlternativeString:(NSString *)alternativeString
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("NSTextAlternativesSelectedAlternativeStringNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", alternativeString, CFSTR("NSAlternativeString"), 0));
}

- (id)originalText
{
  return self->_primaryString;
}

- (unint64_t)numberOfAlternatives
{
  return -[NSArray count](self->_alternativeStrings, "count");
}

- (id)alternatives
{
  return self->_alternativeStrings;
}

- (id)alternativeAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_alternativeStrings, "objectAtIndex:", a3);
}

- (id)identifier
{
  return self->_internal;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_isLowConfidence = a3;
}

@end
