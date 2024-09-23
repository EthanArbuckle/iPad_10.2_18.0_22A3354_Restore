@implementation TSWPDropCap

- (TSWPDropCap)initWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5
{
  TSWPDropCap *v8;
  TSWPDropCap *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPDropCap;
  v8 = -[TSWPDropCap init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_charCount = a3;
    v8->_characterStyleOverridePropertyMap = (TSSPropertyMap *)objc_msgSend(a4, "copy");
    v9->_spacings = (NSArray *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCap;
  -[TSWPDropCap dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCharCount:characterStyleOverridePropertyMap:spacings:", self->_charCount, self->_characterStyleOverridePropertyMap, self->_spacings);
}

- (unint64_t)computedFlagsForSpacing:(id)a3
{
  return objc_msgSend(a3, "computedFlagsWithPropertyMap:", self->_characterStyleOverridePropertyMap);
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 lineCount:(unint64_t)a5
{
  id v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc((Class)a1);
  v10[0] = +[TSWPDropCapSpacing dropCapSpacingWithLineCount:elevatedLineCount:](TSWPDropCapSpacing, "dropCapSpacingWithLineCount:elevatedLineCount:", a5, 0);
  return (id)objc_msgSend(v8, "initWithCharCount:characterStyleOverridePropertyMap:spacings:", a3, a4, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1));
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacing:(id)a5
{
  id v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v8 = objc_alloc((Class)a1);
  if (a5)
  {
    v11[0] = a5;
    v9 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  }
  else
  {
    v9 = 0;
  }
  return (id)objc_msgSend(v8, "initWithCharCount:characterStyleOverridePropertyMap:spacings:", a3, a4, v9);
}

+ (id)dropCapWithCharCount:(unint64_t)a3 characterStyleOverridePropertyMap:(id)a4 spacings:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCharCount:characterStyleOverridePropertyMap:spacings:", a3, a4, objc_msgSend(a5, "tsu_map:", &__block_literal_global_75));
}

id __79__TSWPDropCap_dropCapWithCharCount_characterStyleOverridePropertyMap_spacings___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  TSSPropertyMap *v7;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TSWPDropCap charCount](self, "charCount");
    if (v6 == objc_msgSend(v5, "charCount"))
    {
      LODWORD(v4) = -[NSArray isEqualToArray:](-[TSWPDropCap spacings](self, "spacings"), "isEqualToArray:", objc_msgSend(v5, "spacings"));
      if ((_DWORD)v4)
      {
        v7 = -[TSWPDropCap characterStyleOverridePropertyMap](self, "characterStyleOverridePropertyMap");
        LOBYTE(v4) = v7 == (TSSPropertyMap *)objc_msgSend(v5, "characterStyleOverridePropertyMap")
                  || -[TSSPropertyMap isEqual:](-[TSWPDropCap characterStyleOverridePropertyMap](self, "characterStyleOverridePropertyMap"), "isEqual:", objc_msgSend(v5, "characterStyleOverridePropertyMap"));
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
  unint64_t v3;
  unint64_t v4;

  v3 = -[TSWPDropCap charCount](self, "charCount");
  v4 = v3 ^ (4
           * -[TSSPropertyMap hash](-[TSWPDropCap characterStyleOverridePropertyMap](self, "characterStyleOverridePropertyMap"), "hash"));
  return v4 ^ (-[NSArray hash](-[TSWPDropCap spacings](self, "spacings"), "hash") << 10);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: charCount=%lu map=%@ spacings=%@>"), NSStringFromClass(v4), self->_charCount, self->_characterStyleOverridePropertyMap, self->_spacings);
}

- (unint64_t)charCount
{
  return self->_charCount;
}

- (TSSPropertyMap)characterStyleOverridePropertyMap
{
  return self->_characterStyleOverridePropertyMap;
}

- (NSArray)spacings
{
  return self->_spacings;
}

@end
