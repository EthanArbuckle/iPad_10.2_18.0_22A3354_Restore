@implementation NSTextList

- (NSInteger)startingItemNumber
{
  return self->_startIndex + 1;
}

- (void)setMarkerTextAttachment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSTextAttachment)markerTextAttachment
{
  return (NSTextAttachment *)objc_getProperty(self, a2, 40, 1);
}

- (NSTextListMarkerFormat)markerFormat
{
  if (self->_markerTextAttachment)
    return (NSTextListMarkerFormat)CFSTR("\uFFFC");
  else
    return self->_markerFormat;
}

- (NSString)markerForItemNumber:(NSInteger)itemNumber
{
  return (NSString *)-[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSTextList markerFormat](self, "markerFormat"), itemNumber, 0, 0, 0, 0, 0);
}

- (NSTextListOptions)listOptions
{
  return self->_listFlags;
}

- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSTextListOptions)options startingItemNumber:(NSInteger)startingItemNumber
{
  NSTextList *v8;
  NSInteger v9;
  objc_super v11;

  if (markerFormat)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSTextList;
    v8 = -[NSTextList init](&v11, sel_init);
    if (v8)
    {
      v8->_markerFormat = (NSString *)-[NSString copy](markerFormat, "copy");
      v8->_listFlags = options & 0xFFFFFFFF0FFFFFFFLL;
      v9 = startingItemNumber - 1;
      if (startingItemNumber <= 0)
        v9 = 0;
      v8->_startIndex = v9;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSUInteger)options
{
  return -[NSTextList initWithMarkerFormat:options:startingItemNumber:](self, "initWithMarkerFormat:options:startingItemNumber:", markerFormat, options, 0);
}

- (id)_markerForMarkerFormat:(id)a3 itemNumber:(int64_t)a4 isNumbered:(BOOL *)a5 substitutionStart:(unint64_t *)a6 end:(unint64_t *)a7 specifierStart:(unint64_t *)a8 end:(unint64_t *)a9
{
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  int64_t v22;
  int64_t v23;
  int v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  const __CFString *v32;
  unint64_t v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  int64_t v37;
  unsigned __int8 *v38;
  int v39;
  int v40;
  int64_t v41;
  unsigned __int8 *v42;
  int64_t v43;
  unsigned __int16 *v44;
  void *v45;
  char v46;
  const __CFString *v48;
  int64_t v49;
  int64_t v50;
  int64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  BOOL *v60;
  char v61;

  v14 = a3;
  v15 = objc_msgSend(a3, "length");
  if (a6)
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a7)
    *a7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a8)
    *a8 = 0x7FFFFFFFFFFFFFFFLL;
  if (a9)
    *a9 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v14, "rangeOfString:", CFSTR("{"));
  if (!v16)
  {
    v46 = 0;
    if (!a5)
      return v14;
    goto LABEL_132;
  }
  v17 = objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = (void *)v17;
  if (!v15)
  {
    v46 = 0;
    v14 = (id)v17;
    if (!a5)
      return v14;
    goto LABEL_132;
  }
  v60 = a5;
  v61 = 0;
  v19 = 0;
  v20 = 0;
  if ((unint64_t)(a4 + 9) >= 0x13)
    v21 = CFSTR("%ld");
  else
    v21 = CFSTR("0%ld");
  v59 = a4;
  v48 = v21;
  v49 = (a4 - 1) % 10;
  v50 = (a4 - 1) % 12;
  v51 = (a4 - 1) % 47;
  v52 = (a4 - 1) % 48;
  if (1 - a4 >= 0)
    v22 = -((1 - a4) & 0x1F);
  else
    LODWORD(v22) = (a4 - 1) & 0x1F;
  v53 = (v22 + 1040);
  v54 = (v22 + 1072);
  v23 = (a4 - 1) % 24;
  if (v23 > 16)
    LODWORD(v23) = v23 + 1;
  v55 = (v23 + 913);
  v56 = (v23 + 945);
  v24 = ((int)a4 - 1) % 26;
  v57 = (v24 + 65);
  v58 = (v24 + 97);
  do
  {
    v25 = objc_msgSend(v14, "characterAtIndex:", v19);
    switch(v25)
    {
      case 123:
        v27 = v19 - v20;
        if (v19 > v20)
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v27));
        if (a6)
          *a6 = v19;
        if (a7)
          *a7 = v15;
        v28 = v19 + 1;
        if (v19 + 1 >= v15)
        {
LABEL_49:
          v31 = v15;
          goto LABEL_50;
        }
        v29 = v19 + 1;
        while (1)
        {
          v30 = objc_msgSend(v14, "characterAtIndex:", v29, v27);
          if (v30 == 125)
          {
            if (a7)
              *a7 = v29 + 1;
            v31 = v29;
            if (v29)
            {
LABEL_48:
              if (!v31)
                goto LABEL_49;
LABEL_50:
              v32 = &stru_1E260C7D0;
              v33 = v31 - v28;
              if (v31 > v28)
                v32 = (const __CFString *)objc_msgSend(v14, "substringWithRange:", v28, v33);
              if (a8)
                *a8 = v28;
              if (a9)
                *a9 = v31;
              if ((objc_msgSend(CFSTR("none"), "isEqualToString:", v32, v33) & 1) != 0)
                goto LABEL_75;
              if (objc_msgSend(CFSTR("box"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("▫");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("check"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("✓");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("circle"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("◦");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("diamond"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("◆");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("disc"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("•");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("hyphen"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("⁃");
                goto LABEL_74;
              }
              if (objc_msgSend(CFSTR("square"), "isEqualToString:", v32))
              {
                v34 = v18;
                v35 = CFSTR("▪");
LABEL_74:
                objc_msgSend(v34, "appendString:", v35);
LABEL_75:
                v19 = v31 + 1;
LABEL_76:
                v20 = v19;
                goto LABEL_77;
              }
              if (objc_msgSend(CFSTR("lower-hexadecimal"), "isEqualToString:", v32))
              {
                objc_msgSend(v18, "appendFormat:", CFSTR("%lx"), v59);
                goto LABEL_89;
              }
              if (objc_msgSend(CFSTR("upper-hexadecimal"), "isEqualToString:", v32))
              {
                objc_msgSend(v18, "appendFormat:", CFSTR("%lX"), v59);
                goto LABEL_89;
              }
              if (objc_msgSend(CFSTR("octal"), "isEqualToString:", v32))
              {
                objc_msgSend(v18, "appendFormat:", CFSTR("%lo"), v59);
                goto LABEL_89;
              }
              if ((objc_msgSend(CFSTR("lower-alpha"), "isEqualToString:", v32) & 1) != 0
                || objc_msgSend(CFSTR("lower-latin"), "isEqualToString:", v32))
              {
                v36 = v58;
                goto LABEL_88;
              }
              if ((objc_msgSend(CFSTR("upper-alpha"), "isEqualToString:", v32) & 1) != 0
                || objc_msgSend(CFSTR("upper-latin"), "isEqualToString:", v32))
              {
                v36 = v57;
                goto LABEL_88;
              }
              if (objc_msgSend(CFSTR("lower-greek"), "isEqualToString:", v32))
              {
                v36 = v56;
                goto LABEL_88;
              }
              if (objc_msgSend(CFSTR("upper-greek"), "isEqualToString:", v32))
              {
                v36 = v55;
                goto LABEL_88;
              }
              if (objc_msgSend(CFSTR("lower-russian"), "isEqualToString:", v32))
              {
                v36 = v54;
                goto LABEL_88;
              }
              if (objc_msgSend(CFSTR("upper-russian"), "isEqualToString:", v32))
              {
                v36 = v53;
                goto LABEL_88;
              }
              if (objc_msgSend(CFSTR("hiragana"), "isEqualToString:", v32))
              {
                v37 = v52;
                v38 = (unsigned __int8 *)&gojuon;
                goto LABEL_105;
              }
              if (objc_msgSend(CFSTR("hiragana-iroha"), "isEqualToString:", v32))
              {
                v37 = v51;
                v38 = (unsigned __int8 *)&iroha;
LABEL_105:
                v39 = v38[v37];
                v40 = 12352;
              }
              else
              {
                if (objc_msgSend(CFSTR("katakana"), "isEqualToString:", v32))
                {
                  v41 = v52;
                  v42 = (unsigned __int8 *)&gojuon;
                }
                else
                {
                  if (!objc_msgSend(CFSTR("katakana-iroha"), "isEqualToString:", v32))
                  {
                    if (objc_msgSend(CFSTR("cjk-earthly-branch"), "isEqualToString:", v32))
                    {
                      v43 = v50;
                      v44 = (unsigned __int16 *)&earthly_branch;
                    }
                    else
                    {
                      if (!objc_msgSend(CFSTR("cjk-heavenly-stem"), "isEqualToString:", v32))
                      {
                        if (objc_msgSend(CFSTR("lower-roman"), "isEqualToString:", v32))
                        {
                          v45 = romanString(v59);
                        }
                        else if (objc_msgSend(CFSTR("upper-roman"), "isEqualToString:", v32))
                        {
                          v45 = (void *)objc_msgSend(romanString(v59), "uppercaseString");
                        }
                        else if (objc_msgSend(CFSTR("cjk-ideographic"), "isEqualToString:", v32))
                        {
                          v45 = cjkString(v59);
                        }
                        else
                        {
                          if (objc_msgSend(CFSTR("decimal-leading-zero"), "isEqualToString:", v32))
                          {
                            objc_msgSend(v18, "appendFormat:", v48, v59);
                            goto LABEL_89;
                          }
                          if (objc_msgSend(CFSTR("arabic-indic"), "isEqualToString:", v32))
                          {
                            v45 = arabicIndicString(v59);
                          }
                          else
                          {
                            if (!objc_msgSend(CFSTR("hebrew"), "isEqualToString:", v32))
                            {
                              objc_msgSend(v18, "appendFormat:", CFSTR("%ld"), v59);
                              goto LABEL_89;
                            }
                            v45 = hebrewString(v59);
                          }
                        }
                        objc_msgSend(v18, "appendFormat:", CFSTR("%@"), v45);
LABEL_89:
                        v61 = 1;
                        goto LABEL_75;
                      }
                      v43 = v49;
                      v44 = (unsigned __int16 *)&heavenly_stem;
                    }
                    v36 = v44[v43];
LABEL_88:
                    objc_msgSend(v18, "appendFormat:", CFSTR("%C"), v36);
                    goto LABEL_89;
                  }
                  v41 = v51;
                  v42 = (unsigned __int8 *)&iroha;
                }
                v39 = v42[v41];
                v40 = 12448;
              }
              v36 = (v39 + v40);
              goto LABEL_88;
            }
          }
          else
          {
            v31 = 0;
            if (v30 == 92)
              ++v29;
          }
          if (++v29 >= v15)
            goto LABEL_48;
        }
      case 92:
        v26 = v19 - v20;
        if (v19 > v20)
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v26));
        if (v19 + 1 < v15 && objc_msgSend(v14, "characterAtIndex:", v19 + 1, v26) != 9)
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v19 + 1, 1));
        v19 += 2;
        goto LABEL_76;
      case 9:
        if (v19 > v20)
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v19 - v20));
        ++v19;
        goto LABEL_76;
    }
    if (++v19 >= v15 && v15 > v20)
      objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v15 - v20));
LABEL_77:
    ;
  }
  while (v19 < v15);
  v14 = v18;
  a5 = v60;
  v46 = v61;
  if (v60)
LABEL_132:
    *a5 = v46 & 1;
  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextList setVersion:](NSTextList, "setVersion:", 1);
    __NSTextListClass = (uint64_t)a1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)includesTextListMarkers
{
  if (includesTextListMarkers_onceToken != -1)
    dispatch_once(&includesTextListMarkers_onceToken, &__block_literal_global_24);
  return includesTextListMarkers_includesTextListMarkers;
}

uint64_t __37__NSTextList_includesTextListMarkers__block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if (!(_DWORD)result || (result = _NSTextScalingTypeForCurrentEnvironment(), result == 2))
    includesTextListMarkers_includesTextListMarkers = 1;
  return result;
}

- (NSTextList)init
{
  return -[NSTextList initWithMarkerFormat:options:startingItemNumber:](self, "initWithMarkerFormat:options:startingItemNumber:", &stru_1E260C7D0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextList;
  -[NSTextList dealloc](&v3, sel_dealloc);
}

- (void)setStartingItemNumber:(NSInteger)startingItemNumber
{
  self->_startIndex = startingItemNumber - 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMarkerFormat:options:startingItemNumber:", self->_markerFormat, self->_listFlags, self->_startIndex + 1);
  objc_msgSend(v4, "setMarkerTextAttachment:", -[NSTextList markerTextAttachment](self, "markerTextAttachment"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *markerFormat;
  NSTextListOptions v6;
  NSInteger v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSString *v11;

  markerFormat = self->_markerFormat;
  v11 = markerFormat;
  v6 = -[NSTextList listOptions](self, "listOptions");
  v7 = -[NSTextList startingItemNumber](self, "startingItemNumber");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_markerTextAttachment, CFSTR("NSMarkerTextAttachment"));
    objc_msgSend(a3, "encodeObject:forKey:", markerFormat, CFSTR("NSMarkerFormat"));
    if (v6)
      objc_msgSend(a3, "encodeInteger:forKey:", v6, CFSTR("NSOptions"));
    if (v7 != 1)
      objc_msgSend(a3, "encodeInteger:forKey:", v7, CFSTR("NSStart"));
  }
  else
  {
    v10 = v6 & 0xFFFFFFF;
    if (v7 == 1
      || (v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7), CFSTR("NSStart"))) == 0)
    {
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@I", &v11, &v10);
    }
    else
    {
      v10 = v6 & 0xFFFFFFF | 0x40000000;
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@I", &v11, &v10);
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", &v9, v8);
    }
  }
}

- (NSTextList)initWithCoder:(NSCoder *)coder
{
  NSTextList *v4;
  NSString *v5;
  int v6;
  NSInteger v7;
  uint64_t v8;
  NSInteger v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;
  int v16;
  objc_super v17;
  NSString *v18;

  v17.receiver = self;
  v17.super_class = (Class)NSTextList;
  v18 = 0;
  v4 = -[NSTextList init](&v17, sel_init);
  if (v4)
  {
    if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
    {
      v5 = (NSString *)-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSMarkerFormat"));
      v18 = v5;
      if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSOptions")))
        v6 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSOptions"));
      else
        v6 = 0;
      if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSStart")))
        v8 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSStart"));
      else
        v8 = 1;
      v11 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NSMarkerTextAttachment"));
LABEL_22:
      v4->_markerFormat = v5;
      v4->_listFlags = v6 & 0xFFFFFFF;
      v4->_startIndex = v8 - 1;
      v4->_markerTextAttachment = (NSTextAttachment *)v11;
      return v4;
    }
    v7 = -[NSCoder versionForClassName:](coder, "versionForClassName:", CFSTR("NSTextList"));
    if (v7 == 1)
    {
      v16 = 0;
      v15 = 0;
      -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "@I", &v18, &v16);
      v6 = v16;
      if ((v16 & 0x40000000) != 0)
      {
        -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "@", &v15);
        if (v15
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (v12 = objc_msgSend(v15, "objectForKey:", CFSTR("NSStart"))) != 0
          && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v8 = objc_msgSend(v13, "integerValue");
        }
        else
        {
          v8 = 1;
        }

      }
      else
      {
        v8 = 1;
      }
      v11 = 0;
      v5 = v18;
      goto LABEL_22;
    }
    v9 = v7;
    v10 = _NSFullMethodName();
    NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v10, 1, v9);

    return 0;
  }
  return v4;
}

- (id)description
{
  NSInteger v3;
  NSTextListOptions v4;
  void *v5;
  NSString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = -[NSTextList startingItemNumber](self, "startingItemNumber");
  v4 = -[NSTextList listOptions](self, "listOptions");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[NSTextList markerFormat](self, "markerFormat");
  if (v4)
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" options 0x%lx"), v4);
  else
    v7 = &stru_1E260C7D0;
  if (v3 == 1)
    v8 = &stru_1E260C7D0;
  else
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" start at %ld"), v3);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("NSTextList %p format <%@>%@%@"), self, v6, v7, v8);
}

- (BOOL)isOrdered
{
  BOOL v3;

  v3 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSTextList markerFormat](self, "markerFormat"), 1, &v3, 0, 0, 0, 0);
  return v3;
}

- (id)_markerTitle
{
  id v3;
  char v5;

  v5 = 0;
  v3 = -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSTextList markerFormat](self, "markerFormat"), 1, &v5, 0, 0, 0, 0);
  if (v5)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@  %@…"), v3, -[NSTextList markerForItemNumber:](self, "markerForItemNumber:", 2), -[NSTextList markerForItemNumber:](self, "markerForItemNumber:", 3));
  return v3;
}

- (id)_markerPrefix
{
  NSString *v3;
  uint64_t v5;

  v3 = -[NSTextList markerFormat](self, "markerFormat");
  v5 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v3, 1, 0, &v5, 0, 0, 0);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5)
      return -[NSString substringWithRange:](v3, "substringWithRange:", 0);
    else
      return &stru_1E260C7D0;
  }
  return v3;
}

- (id)_markerSpecifier
{
  NSString *v3;
  unint64_t v7;
  unint64_t v8;

  v3 = -[NSTextList markerFormat](self, "markerFormat");
  v7 = 0;
  v8 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v3, 1, 0, 0, 0, &v8, &v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL && v7 > v8)
    return -[NSString substringWithRange:](v3, "substringWithRange:", v8, v7 - v8);
  else
    return &stru_1E260C7D0;
}

- (id)_markerSpecifierAsCSSValue
{
  id v2;
  void *v3;
  id result;

  v2 = -[NSTextList _markerSpecifier](self, "_markerSpecifier");
  if (!v2)
    return &stru_1E260C7D0;
  v3 = v2;
  result = (id)objc_msgSend(&unk_1E26316F8, "objectForKey:", v2);
  if (!result)
    return v3;
  return result;
}

- (id)_unaffixedMarkerFormat
{
  NSString *v3;
  unint64_t v7;
  unint64_t v8;

  v3 = -[NSTextList markerFormat](self, "markerFormat");
  v7 = 0;
  v8 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v3, 1, 0, &v8, &v7, 0, 0);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL && v7 > v8)
    return -[NSString substringWithRange:](v3, "substringWithRange:", v8, v7 - v8);
  else
    return &stru_1E260C7D0;
}

- (id)_unaffixedMarkerForItemNumber:(int64_t)a3
{
  NSString *v5;
  unint64_t v9;
  unint64_t v10;

  v5 = -[NSTextList markerFormat](self, "markerFormat");
  v9 = 0;
  v10 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v5, a3, 0, &v10, &v9, 0, 0);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v9 > v10)
    return -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSString substringWithRange:](v5, "substringWithRange:", v10, v9 - v10), a3, 0, 0, 0, 0, 0);
  else
    return &stru_1E260C7D0;
}

- (id)_unaffixedMarkerTitle
{
  NSString *v3;
  id v6;
  unint64_t v8;
  unint64_t v9;
  char v10;

  v3 = -[NSTextList markerFormat](self, "markerFormat");
  v10 = 0;
  v8 = 0;
  v9 = 0;
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v3, 1, &v10, &v9, &v8, 0, 0);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL || v8 <= v9)
    return &stru_1E260C7D0;
  v6 = -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSString substringWithRange:](v3, "substringWithRange:", v9, v8 - v9), 1, 0, 0, 0, 0, 0);
  if (v10)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  %@  %@…"), v6, -[NSTextList _unaffixedMarkerForItemNumber:](self, "_unaffixedMarkerForItemNumber:", 2), -[NSTextList _unaffixedMarkerForItemNumber:](self, "_unaffixedMarkerForItemNumber:", 3));
  return v6;
}

- (id)_markerSuffix
{
  NSString *v3;
  unint64_t v4;
  unint64_t v7;

  v3 = -[NSTextList markerFormat](self, "markerFormat");
  v7 = 0;
  v4 = -[NSString length](v3, "length");
  -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", v3, 1, 0, 0, &v7, 0, 0);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v4 > v7)
    return -[NSString substringWithRange:](v3, "substringWithRange:", v7, v4 - v7);
  else
    return &stru_1E260C7D0;
}

- (id)_markerAtIndex:(unint64_t)a3 inText:(id)a4
{
  uint64_t v7;
  NSString *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v7 = objc_msgSend(a4, "itemNumberInTextList:atIndex:", self, a3);
  if (v7 < 1)
    return &stru_1E260C7D0;
  v8 = -[NSTextList markerForItemNumber:](self, "markerForItemNumber:", v7);
  if ((self->_listFlags & 1) == 0)
    return v8;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a3, 0), "textLists");
  v10 = objc_msgSend(v9, "count");
  if (v10 < 2)
    return v8;
  v11 = v10;
  v12 = 1;
  while ((NSTextList *)objc_msgSend(v9, "objectAtIndex:", v12) != self)
  {
    if (v11 == ++v12)
      return v8;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v12 - 1), "_markerAtIndex:inText:", a3, a4), v8);
}

+ (id)_standardMarkerAttributesForAttributes:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("NSFont"));
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("NSFont"));
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("NSParagraphStyle"));
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("NSParagraphStyle"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("NSColor"));
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("NSColor"));
  v8 = objc_msgSend(a3, "objectForKey:", CFSTR("NSBackgroundColor"));
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("NSBackgroundColor"));
  return v4;
}

@end
