@implementation TSWPLineStyling

+ (id)lineStylingWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLineCount:options:additionalCharacterStylePropertyMap:overrideCharacterStylePropertyMap:", a3, a4, a5, a6);
}

- (TSWPLineStyling)initWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6
{
  TSWPLineStyling *v10;
  TSWPLineStyling *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSWPLineStyling;
  v10 = -[TSWPLineStyling init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lineCount = a3;
    v10->_options = a4;
    v10->_additionalCharacterStylePropertyMap = (TSSPropertyMap *)objc_msgSend(a5, "copy");
    v11->_overrideCharacterStylePropertyMap = (TSSPropertyMap *)objc_msgSend(a6, "copy");
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPLineStyling;
  -[TSWPLineStyling dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLineCount:options:additionalCharacterStylePropertyMap:overrideCharacterStylePropertyMap:", self->_lineCount, self->_options, self->_additionalCharacterStylePropertyMap, self->_overrideCharacterStylePropertyMap);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  TSSPropertyMap *v8;
  TSSPropertyMap *v9;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSWPLineStyling lineCount](self, "lineCount");
    if (v6 == objc_msgSend(v5, "lineCount")
      && (v7 = -[TSWPLineStyling options](self, "options"), v7 == objc_msgSend(v5, "options")))
    {
      v8 = -[TSWPLineStyling additionalCharacterStylePropertyMap](self, "additionalCharacterStylePropertyMap");
      if (v8 == (TSSPropertyMap *)objc_msgSend(v5, "additionalCharacterStylePropertyMap")
        || (LODWORD(v4) = -[TSSPropertyMap isEqual:](-[TSWPLineStyling additionalCharacterStylePropertyMap](self, "additionalCharacterStylePropertyMap"), "isEqual:", objc_msgSend(v5, "additionalCharacterStylePropertyMap")), (_DWORD)v4))
      {
        v9 = -[TSWPLineStyling overrideCharacterStylePropertyMap](self, "overrideCharacterStylePropertyMap");
        LOBYTE(v4) = v9 == (TSSPropertyMap *)objc_msgSend(v5, "overrideCharacterStylePropertyMap")
                  || -[TSSPropertyMap isEqual:](-[TSWPLineStyling overrideCharacterStylePropertyMap](self, "overrideCharacterStylePropertyMap"), "isEqual:", objc_msgSend(v5, "overrideCharacterStylePropertyMap"));
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[TSWPLineStyling lineCount](self, "lineCount");
  v4 = -[TSWPLineStyling options](self, "options") ^ v3;
  v5 = v4 ^ (4
           * -[TSSPropertyMap hash](-[TSWPLineStyling additionalCharacterStylePropertyMap](self, "additionalCharacterStylePropertyMap"), "hash"));
  return v5 ^ (-[TSSPropertyMap hash](-[TSWPLineStyling overrideCharacterStylePropertyMap](self, "overrideCharacterStylePropertyMap"), "hash") << 10);
}

- (id)_optionsDescription
{
  char v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = -[TSWPLineStyling options](self, "options");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = v3;
  if ((v2 & 1) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("LM+"));
  if ((v2 & 2) != 0)
    objc_msgSend(v4, "appendString:", CFSTR("W+"));
  v5 = objc_msgSend(v4, "length");
  if (v5)
    objc_msgSend(v4, "deleteCharactersInRange:", v5 - 1, 1);
  else
    objc_msgSend(v4, "appendString:", CFSTR("none"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("autoresize = %@; "), v4);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; lineCount=%lu options=%@ additionalMap=%@ overrideMap=%@>"),
               v5,
               objc_opt_class(),
               self->_lineCount,
               -[TSWPLineStyling _optionsDescription](self, "_optionsDescription"),
               self->_additionalCharacterStylePropertyMap,
               self->_overrideCharacterStylePropertyMap);
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (unint64_t)options
{
  return self->_options;
}

- (TSSPropertyMap)additionalCharacterStylePropertyMap
{
  return self->_additionalCharacterStylePropertyMap;
}

- (TSSPropertyMap)overrideCharacterStylePropertyMap
{
  return self->_overrideCharacterStylePropertyMap;
}

@end
