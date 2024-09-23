@implementation BCCFI

- (NSString)redactedString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bc_redactedCFIString"));

  return (NSString *)v3;
}

- (BOOL)isRange
{
  unint64_t v3;

  v3 = -[BCCFI numberOfCommonSteps](self, "numberOfCommonSteps");
  return v3 != -[BCCFI numberOfStartSteps](self, "numberOfStartSteps");
}

- (BOOL)isUnknownCFI
{
  return -[NSString isEqualToString:](self->_string, "isEqualToString:", CFSTR("epubcfi_unknownlocation"));
}

- (BOOL)isUpsellCFI
{
  return -[NSString isEqualToString:](self->_string, "isEqualToString:", CFSTR("epubcfi_upselllocation"));
}

- (BOOL)isPageCFI
{
  if (-[BCCFI pageIndexOffset](self, "pageIndexOffset") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return !-[BCCFI isUnknownCFI](self, "isUnknownCFI");
}

+ (id)pageLocationForString:(id)a3 error:(id *)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", a3, a4));
  objc_msgSend(v4, "_setPageIndexOffset:", 0);
  return v4;
}

+ (BCCFI)cfiWithString:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCFI:error:", v6, a4);

  return (BCCFI *)v7;
}

+ (id)deserializeCFIFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BCCFI *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKEpubCFILocation")))
    v5 = -[BCCFI initWithLocationDictionary:]([BCCFI alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

+ (id)unknownCFI
{
  if (qword_30DB80 != -1)
    dispatch_once(&qword_30DB80, &stru_28FF30);
  return (id)qword_30DB78;
}

+ (id)unknownCFIString
{
  return CFSTR("epubcfi_unknownlocation");
}

+ (id)upsellCFI
{
  if (qword_30DB90 != -1)
    dispatch_once(&qword_30DB90, &stru_28FF50);
  return (id)qword_30DB88;
}

+ (id)minimumCFI
{
  if (qword_30DBA0 != -1)
    dispatch_once(&qword_30DBA0, &stru_28FF70);
  return (id)qword_30DB98;
}

+ (id)maximumCFI
{
  if (qword_30DBB0 != -1)
    dispatch_once(&qword_30DBB0, &stru_28FF90);
  return (id)qword_30DBA8;
}

- (BCCFI)initWithCFI:(id)a3 error:(id *)a4
{
  id v6;
  BCCFI *v7;
  BCCFI *v8;
  BCCFI *v9;
  id v10;
  NSObject *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCCFI;
  v7 = -[BCCFI init](&v13, "init");
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  if (-[BCCFI parseCFI:error:](v7, "parseCFI:error:", v6, a4))
  {
    v8->_pageIndexOffset = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
    v9 = v8;
    goto LABEL_8;
  }
  v10 = BCReadingStatisticsLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1B6654((uint64_t)v6, v11);

  v9 = 0;
LABEL_8:

  return v9;
}

- (BCCFI)initWithLocationDictionary:(id)a3
{
  void *v4;
  BCCFI *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("cfi")));
  v5 = -[BCCFI initWithCFI:error:](self, "initWithCFI:error:", v4, 0);

  return v5;
}

- (BCCFI)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BCCFI *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("cfi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[BCCFI initWithCFI:error:](self, "initWithCFI:error:", v6, 0);

  if (v7 && objc_msgSend(v4, "containsValueForKey:", CFSTR("pageIndexOffset")))
    v7->_pageIndexOffset = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageIndexOffset"));

  return v7;
}

- (BCCFI)initWithSteps:(BCCFIStep *)a3 startStepsPtr:(BCCFIStep *)a4 endStepsPtr:(BCCFIStep *)a5 stepsEnd:(BCCFIStep *)a6
{
  BCCFI *v10;
  BCCFI *v11;
  uint64_t v12;
  NSString *string;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BCCFI;
  v10 = -[BCCFI init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    v10->_steps = a3;
    v10->_startStepsPtr = a4;
    v10->_endStepsPtr = a5;
    v10->_stepsEnd = a6;
    v10->_pageIndexOffset = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_claimAutoreleasedReturnValue(-[BCCFI generateCFI](v10, "generateCFI"));
    string = v11->_string;
    v11->_string = (NSString *)v12;

  }
  return v11;
}

- (void)dealloc
{
  BCCFIStep *steps;
  objc_super v4;

  steps = self->_steps;
  if (steps < self->_stepsEnd)
  {
    do
      freeCFIStep((uint64_t)steps++);
    while (steps < self->_stepsEnd);
    steps = self->_steps;
  }
  if (steps)
    free(steps);
  v4.receiver = self;
  v4.super_class = (Class)BCCFI;
  -[BCCFI dealloc](&v4, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  -[BCCFI _copyInto:](self, "_copyInto:", v4);
  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  v7 = (void *)v6;
  if (self->_pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p '%@'%@>"), v5, self, v6, &stru_296430));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" pageOffset:%lu"), self->_pageIndexOffset));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p '%@'%@>"), v5, self, v7, v9));

  }
  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  __CFString *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI generateCFI](self, "generateCFI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  v6 = &stru_296430;
  if ((v5 & 1) == 0)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (generated: '%@')"), v3));
  v7 = (objc_class *)objc_opt_class(self);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  v11 = (void *)v10;
  if (self->_pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p '%@'%@%@>"), v9, self, v10, v6, &stru_296430));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" pageOffset:%lu"), self->_pageIndexOffset));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p '%@'%@%@>"), v9, self, v11, v6, v13));

  }
  return v12;
}

- (unint64_t)numberOfCommonSteps
{
  return self->_startStepsPtr - self->_steps;
}

- (unint64_t)numberOfStartSteps
{
  return self->_endStepsPtr - self->_steps;
}

- (unint64_t)numberOfEndSteps
{
  return self->_stepsEnd - self->_endStepsPtr + self->_startStepsPtr - self->_steps;
}

- (id)serializeLocationToDictionary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("BCCFI"), CFSTR("class"), v2, CFSTR("cfi"), 0));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("cfi"));

  if (self->_pageIndexOffset != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "encodeInteger:forKey:", -[BCCFI pageIndexOffset](self, "pageIndexOffset"), CFSTR("pageIndexOffset"));

}

- (unint64_t)spineIndex
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const BCCFIStep *v6;
  unint64_t var0;

  v3 = -[BCCFI numberOfStartSteps](self, "numberOfStartSteps");
  if (v3 < 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v3;
  v5 = 1;
  while (1)
  {
    v6 = -[BCCFI startStepAtIndex:](self, "startStepAtIndex:", v5);
    if (v6->var0 == 1)
      break;
    if (v4 == ++v5)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  var0 = v6->var1.var0.var0;
  if ((var0 & 1) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return (var0 >> 1) - 1;
}

- (NSString)manifestId
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const BCCFIStep *v6;
  __CFString *v7;

  v3 = -[BCCFI numberOfStartSteps](self, "numberOfStartSteps");
  if (v3 < 2)
  {
LABEL_5:
    v7 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 1;
    while (1)
    {
      v6 = -[BCCFI startStepAtIndex:](self, "startStepAtIndex:", v5);
      if (v6->var0 == 2)
        break;
      if (v4 == ++v5)
        goto LABEL_5;
    }
    v7 = v6->var1.var1.var0;
  }
  return (NSString *)v7;
}

- (const)startStepAtIndex:(unint64_t)a3
{
  return &self->_steps[a3];
}

- (const)endStepAtIndex:(unint64_t)a3
{
  BCCFIStep *startStepsPtr;
  const BCCFIStep *result;

  startStepsPtr = self->_startStepsPtr;
  result = &self->_steps[a3];
  if (result >= startStepsPtr)
    return &self->_endStepsPtr[a3 - -[BCCFI numberOfCommonSteps](self, "numberOfCommonSteps")];
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    v5 = -[BCCFI compare:](self, "compare:", v4) == 0;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  BCCFIStep *steps;
  BCCFIStep *stepsEnd;
  unint64_t v4;
  int var0;
  unint64_t pageIndexOffset;

  steps = self->_steps;
  stepsEnd = self->_stepsEnd;
  v4 = (((char *)self->_endStepsPtr - (char *)self->_startStepsPtr) << 15)
     + (((char *)self->_startStepsPtr - (char *)steps) << 21)
     + (((char *)stepsEnd - (char *)self->_endStepsPtr) << 9);
  while (steps < stepsEnd)
  {
    var0 = steps->var0;
    if (steps->var0 == 5)
    {
      v4 += steps->var1.var0.var0 << 8;
    }
    else if (var0 == 4)
    {
      v4 += 0x10000;
    }
    else if (var0 == 1)
    {
      v4 += steps->var1.var0.var0;
    }
    ++steps;
  }
  pageIndexOffset = self->_pageIndexOffset;
  if (pageIndexOffset == 0x7FFFFFFFFFFFFFFFLL)
    pageIndexOffset = 0;
  return pageIndexOffset ^ v4;
}

- (int64_t)compareCFI:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = sub_9A5C8(self, v4, 1, 1, 0, 0);
  if (!v5)
    v5 = sub_9A5C8(self, v4, 0, 0, 0, 0);

  return v5;
}

- (int64_t)compareCFIHead:(id)a3
{
  return sub_9A5C8(self, a3, 1, 1, 0, 0);
}

- (int64_t)compareCFITail:(id)a3
{
  return sub_9A5C8(self, a3, 0, 0, 0, 0);
}

- (int64_t)compareHeadToTail:(id)a3
{
  return sub_9A5C8(self, a3, 1, 0, 0, 0);
}

- (int64_t)compareTailToHead:(id)a3
{
  return sub_9A5C8(self, a3, 0, 1, 0, 0);
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  id v7;

  v4 = a3;
  v5 = -[BCCFI compareCFI:](self, "compareCFI:", v4);
  if (!v5)
  {
    if (-[BCCFI pageIndexOffset](self, "pageIndexOffset") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "pageIndexOffset") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = 0;
    }
    else
    {
      if (-[BCCFI pageIndexOffset](self, "pageIndexOffset") == 0x7FFFFFFFFFFFFFFFLL)
        v6 = 0;
      else
        v6 = -[BCCFI pageIndexOffset](self, "pageIndexOffset");
      if (objc_msgSend(v4, "pageIndexOffset") == (id)0x7FFFFFFFFFFFFFFFLL)
        v7 = 0;
      else
        v7 = objc_msgSend(v4, "pageIndexOffset");
      if (v6 < (unint64_t)v7)
        v5 = -1;
      else
        v5 = v6 > (unint64_t)v7;
    }
  }

  return v5;
}

- (id)intersectWithCFI:(id)a3
{
  return -[BCCFI intersectWithRangeFromHeadOf:toTailOf:](self, "intersectWithRangeFromHeadOf:toTailOf:", a3, a3);
}

- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4
{
  BCCFI *v6;
  BCCFI *v7;
  uint64_t v8;
  uint64_t v9;
  BCCFI *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BCCFI *v14;
  void *v15;
  BCCFI *v16;
  id v17;
  NSObject *v18;
  BCCFI *v19;
  int v21;
  BCCFI *v22;
  __int16 v23;
  BCCFI *v24;
  __int16 v25;
  BCCFI *v26;

  v6 = (BCCFI *)a3;
  v7 = (BCCFI *)a4;
  v8 = sub_9A5C8(self, v6, 0, 1, 0, 0);
  v9 = sub_9A5C8(self, v7, 1, 0, 0, 0);
  v10 = 0;
  if (v8 != -1)
  {
    v11 = v9;
    if (v9 != 1)
    {
      if (v8)
      {
        if (!v9)
        {
LABEL_17:
          v15 = (void *)objc_opt_class(self);
          v16 = self;
          goto LABEL_18;
        }
        v12 = sub_9A5C8(self, v6, 1, 1, 0, 0);
        v13 = sub_9A5C8(self, v7, 0, 0, 0, 0);
        if (v12 <= 1 && (unint64_t)(v13 + 1) <= 1)
        {
          v14 = (BCCFI *)-[BCCFI copy](self, "copy");
LABEL_20:
          v10 = v14;
          goto LABEL_21;
        }
        if (v12 == -1 && v13 == 1)
        {
          v15 = (void *)objc_opt_class(self);
          v16 = v6;
LABEL_18:
          v19 = v7;
          goto LABEL_19;
        }
        if (v12 != -1)
        {
          if (v11 != -1)
          {
            v17 = BCReadingStatisticsLog();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v21 = 138412802;
              v22 = self;
              v23 = 2112;
              v24 = v6;
              v25 = 2112;
              v26 = v7;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Failure to intersect range. Case missing. %@ %@ %@", (uint8_t *)&v21, 0x20u);
            }

            v14 = self;
            goto LABEL_20;
          }
          goto LABEL_17;
        }
      }
      v15 = (void *)objc_opt_class(self);
      v16 = v6;
      v19 = self;
LABEL_19:
      v14 = (BCCFI *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_cfiLocationFromHeadOf:toTailOf:", v16, v19));
      goto LABEL_20;
    }
  }
LABEL_21:

  return v10;
}

- (id)unionWithCFI:(id)a3
{
  BCCFI *v4;
  BCCFI *v5;
  BCCFI *v6;
  BCCFI *v7;
  BCCFI *v8;
  id v9;
  void *v10;

  v4 = (BCCFI *)a3;
  if (sub_9A5C8(self, v4, 1, 1, 0, 0) == -1)
    v5 = self;
  else
    v5 = v4;
  v6 = v5;
  if (sub_9A5C8(self, v4, 0, 0, 0, 0) == -1)
    v7 = v4;
  else
    v7 = self;
  v8 = v7;
  v9 = objc_msgSend((id)objc_opt_class(self), "_cfiLocationFromHeadOf:toTailOf:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)rangeToCFI:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_cfiLocationFromTailOf:toHeadOf:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)rangeIntersectsCFI:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  v5 = -[BCCFI isRange](self, "isRange");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI intersectWithCFI:](self, "intersectWithCFI:", v4));
    v6 = v7 != 0;

  }
  return v6;
}

+ (BOOL)isFragmentEpubCFIFunction:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("epubcfi(")))
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(")"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)parseCFI:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  size_t v23;
  BCCFIStep *v24;
  BCCFIStep **p_startStepsPtr;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  BCCFIStep *steps;
  uint64_t v35;
  BCCFIStep *v36;
  BCCFIStep *endStepsPtr;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  BCCFIStep *v41;
  BCCFIStep *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BCCFIStep *v46;
  BCCFIStep *v47;
  BCCFIStep *v48;
  BCCFIStep *v49;
  __int128 v50;
  BCCFIStep *v51;
  BCCFIStep *v52;
  BCCFIStep *v53;
  uint64_t *v54;
  void *v55;
  int v56;
  void *v57;
  unsigned int v58;
  __CFString *v59;
  int v60;
  void *v61;
  id v62;
  uint64_t v63;
  BCCFIStep *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BCCFIStep *v73;
  id v74;
  BCCFIStep *v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  BCCFIStep *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BCCFIStep *v100;
  id v101;
  __CFDictionary *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  int v110;
  int v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  BOOL v120;
  char v121;
  void *v122;
  void *v123;
  uint64_t v124;
  char *v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id v136;
  BCCFIStep *v137;
  id v138;
  __CFDictionary *v139;
  id v140;
  __CFDictionary *v141;
  __CFDictionary *v142;
  void *v143;
  uint64_t v144;
  BCCFIStep *v145;
  BCCFIStep *v146;
  uint64_t v147;
  void *v148;
  char v149;
  int v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  void *v163;
  unsigned int v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  BCCFIStep *v170;
  void *v171;
  __int128 v172;
  int v173;
  __int128 v174;
  int v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD v179[5];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));

  if (v7)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/CFI/BCCFI.m", 699, (uint64_t)"-[BCCFI parseCFI:error:]", (uint64_t)"self.string == nil", CFSTR("Cannot parse CFI after initialization"), v8, v9, v10, (uint64_t)v148);
    if (v6)
      goto LABEL_3;
LABEL_203:
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/CFI/BCCFI.m", 700, (uint64_t)"-[BCCFI parseCFI:error:]", (uint64_t)"cfi", CFSTR("Unexpected nil CFI!"), v8, v9, v10, (uint64_t)v148);
    return 0;
  }
  if (!v6)
    goto LABEL_203;
LABEL_3:
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("epubcfi_unknownlocation"))
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("epubcfi_upselllocation")))
  {
    if ((objc_msgSend((id)objc_opt_class(self), "isFragmentEpubCFIFunction:", v6) & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 8, (char *)objc_msgSend(v6, "length") - 9));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v18));

      objc_msgSend(v19, "setCharactersToBeSkipped:", 0);
      v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("/[^:~@!),")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("^]")));
      v178 = 0;
      v179[0] = 0;
      v177 = 0;
      if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
      {
LABEL_9:
        v21 = v179[0];
        v169 = v178;
        v168 = v177;
        v22 = v178 + v179[0] + v177;
        if (v22 <= 1)
          v23 = 1;
        else
          v23 = v178 + v179[0] + v177;
        v24 = (BCCFIStep *)malloc_type_calloc(v23, 0x20uLL, 0x10E204035D40BE2uLL);
        self->_startStepsPtr = 0;
        p_startStepsPtr = &self->_startStepsPtr;
        self->_steps = v24;
        v170 = v24;
        self->_endStepsPtr = 0;
        self->_stepsEnd = &v24[v22];
        objc_msgSend(v19, "setScanLocation:", 0);
        v176 = 0;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("^[](),;=")));

        v27 = objc_msgSend(v19, "scanLocation");
        if ((objc_msgSend(v19, "scanString:intoString:", CFSTR("/"), 0) & 1) == 0
          || (objc_msgSend(v19, "scanInteger:", &v176) & 1) == 0)
        {
          goto LABEL_188;
        }
        if (v176 < 2 || (v176 & 1) != 0)
        {
          v59 = CFSTR("First child must be a node");
          goto LABEL_65;
        }
        v152 = v21;
        v33 = v176;
        steps = self->_steps;
        steps->var0 = 1;
        v161 = v22;
        v162 = v33;
        steps->var1.var0.var0 = v33;
        if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
        {
          v35 = 0;
          v160 = 0;
          v167 = 1;
LABEL_18:
          v36 = &v170[v167];
          self->_stepsEnd = v36;
          endStepsPtr = self->_endStepsPtr;
          if (!endStepsPtr)
          {
            self->_endStepsPtr = v36;
            endStepsPtr = &v170[v167];
          }
          if (!*p_startStepsPtr)
            *p_startStepsPtr = endStepsPtr;
          v38 = v160 - v35;
          if (v160 > v35)
          {
            v39 = v38 + v161;
            if (v38 + v161 <= 1)
              v40 = 1;
            else
              v40 = v38 + v161;
            v41 = (BCCFIStep *)malloc_type_calloc(v40, 0x20uLL, 0x10E204035D40BE2uLL);
            v42 = v41;
            if (v161 < 1)
            {
              v47 = 0;
              v46 = 0;
            }
            else
            {
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v47 = 0;
              do
              {
                v48 = &v41[v45];
                v49 = &self->_steps[v43];
                v50 = *(_OWORD *)&v49->var1.var6.var1;
                *(_OWORD *)&v48->var0 = *(_OWORD *)&v49->var0;
                *(_OWORD *)&v48->var1.var6.var1 = v50;
                v51 = self->_steps;
                v52 = &v51[v43];
                if (&v51[v43] == self->_startStepsPtr)
                  v47 = &v41[v45];
                if (v52 == self->_endStepsPtr)
                  v46 = &v41[v45];
                if (v52->var0 == 1 && (v52->var1.var0.var0 & 1) != 0 && (v44 + 1 >= v161 || v51[v43 + 1].var0 != 5))
                {
                  v53 = &v41[++v45];
                  v53->var0 = 5;
                  *(_QWORD *)(&v53->var0 + 1) = 0;
                  *(void **)((char *)&v53->var1.var6.var1 + 4) = 0;
                  *(_QWORD *)((char *)&v53->var1.var3 + 4) = 0;
                  *((_DWORD *)&v53->var1.var6 + 5) = 0;
                }
                ++v44;
                ++v45;
                ++v43;
              }
              while (v152 + v168 + v169 != v44);
            }
            free(self->_steps);
            if (v46)
              v145 = v46;
            else
              v145 = &v42[v39];
            self->_endStepsPtr = v145;
            self->_stepsEnd = &v42[v39];
            if (v47)
              v146 = v47;
            else
              v146 = v145;
            self->_steps = v42;
            self->_startStepsPtr = v146;
            v147 = objc_claimAutoreleasedReturnValue(-[BCCFI generateCFI](self, "generateCFI"));

            v6 = (id)v147;
          }
          -[BCCFI setString:](self, "setString:", v6);
          v11 = 1;
          goto LABEL_191;
        }
        v159 = 0;
        v160 = 0;
        v35 = 0;
        v60 = 0;
        v158 = 0;
        v167 = 1;
        v164 = 1;
        v163 = v26;
        while (1)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
          v62 = objc_msgSend(v61, "characterAtIndex:", objc_msgSend(v19, "scanLocation"));

          v27 = objc_msgSend(v19, "scanLocation");
          objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
          if ((_DWORD)v62 != 44)
            break;
          if (*p_startStepsPtr)
          {
            if (self->_endStepsPtr)
            {
              sub_9C0A8(v19, -1, a4);
              goto LABEL_183;
            }
            v170 += v167;
            self->_endStepsPtr = v170;
            v162 = v158;
            v60 = v159;
            v164 = HIDWORD(v159);
          }
          else
          {
            v170 += v167;
            *p_startStepsPtr = v170;
            v159 = __PAIR64__(v164, v60);
            v158 = v162;
          }
          v167 = 0;
LABEL_183:
          if (objc_msgSend(v19, "isAtEnd"))
            goto LABEL_18;
        }
        if ((_DWORD)v62 == 41)
          goto LABEL_188;
        if ((objc_msgSend(v171, "characterIsMember:", v62) & 1) == 0)
        {
          v143 = v19;
          v144 = -1;
          goto LABEL_189;
        }
        if ((int)v62 <= 63)
        {
          if ((_DWORD)v62 == 33)
          {
            if ((v60 & 1) != 0)
            {
              v59 = CFSTR("Indirection not allowed after terminating step");
              goto LABEL_65;
            }
            if (v164 - 3 >= 0xFFFFFFFE && (v162 & 1) != 0)
            {
              v59 = CFSTR("Indirection not allowed after text node");
              goto LABEL_65;
            }
            v60 = 0;
            v75 = &v170[v167];
            v76 = v167 + 1;
            memset(&v179[1], 0, 28);
            v164 = 4;
            v75->var0 = 4;
            v77 = *(_OWORD *)&v179[1];
            *(_OWORD *)&v75->var1.var6.var1 = *(_OWORD *)((char *)&v179[2] + 4);
            *(_OWORD *)(&v75->var0 + 1) = v77;
LABEL_101:
            v167 = v76;
            goto LABEL_183;
          }
          if ((_DWORD)v62 != 47)
          {
            if ((_DWORD)v62 != 58)
              goto LABEL_183;
            if (v164 - 3 <= 0xFFFFFFFD)
            {
              v59 = CFSTR("Character offset terminating step only allowed after child node step");
              goto LABEL_65;
            }
            if ((objc_msgSend(v19, "scanInteger:", &v176) & 1) != 0)
            {
              v63 = v176;
              if ((v176 & 0x8000000000000000) == 0)
              {
                v64 = &v170[v167];
                v164 = 5;
                v64->var0 = 5;
                v64->var1.var0.var0 = v63;
                ++v35;
                v60 = 1;
                ++v167;
                goto LABEL_183;
              }
              v59 = CFSTR("Character offset must be a non-negative integer");
LABEL_65:
              sub_9BF90(a4, (uint64_t)v27, v59, v28, v29, v30, v31, v32, (uint64_t)v148);
              goto LABEL_190;
            }
            goto LABEL_188;
          }
          if ((v60 & 1) != 0)
          {
            v59 = CFSTR("Child node step not allowed after a terminating step");
            goto LABEL_65;
          }
          if (v164 - 3 >= 0xFFFFFFFE && (v162 & 1) != 0)
          {
            v59 = CFSTR("Child node step not allowed after text node");
            goto LABEL_65;
          }
          if ((objc_msgSend(v19, "scanInteger:", &v176) & 1) != 0)
          {
            if (v176 <= 0)
            {
              v59 = CFSTR("Child node index must be a positive number");
              goto LABEL_65;
            }
            v60 = 0;
            v78 = v176;
            v79 = &v170[v167];
            v76 = v167 + 1;
            v164 = 1;
            v79->var0 = 1;
            v162 = v78;
            v79->var1.var0.var0 = v78;
            v160 += v176 & 1;
            goto LABEL_101;
          }
LABEL_188:
          v143 = v19;
          v144 = 0;
LABEL_189:
          sub_9C0A8(v143, v144, a4);
          goto LABEL_190;
        }
        if ((_DWORD)v62 != 64)
        {
          if ((_DWORD)v62 != 91)
          {
            if ((_DWORD)v62 != 126)
              goto LABEL_183;
            if (v164 - 3 <= 0xFFFFFFFD)
            {
              v59 = CFSTR("Temporal offset terminating step only allowed after child node step");
              goto LABEL_65;
            }
            v174 = 0uLL;
            v175 = 0;
            if ((objc_msgSend(v19, "scanDecimal:", &v174) & 1) == 0)
              goto LABEL_188;
            v172 = v174;
            v173 = v175;
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithDecimal:](NSDecimalNumber, "decimalNumberWithDecimal:", &v172));
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
            v67 = objc_msgSend(v65, "compare:", v66);

            if (v67 != (id)-1)
            {
              v73 = &v170[v167];
              v74 = v65;
              v164 = 6;
              v73->var0 = 6;
              v73->var1.var0.var0 = (unint64_t)v74;

              v60 = 1;
              ++v167;
LABEL_112:
              v26 = v163;
              goto LABEL_183;
            }
            sub_9BF90(a4, (uint64_t)v27, CFSTR("Temporal offset must be a non-negative number"), v68, v69, v70, v71, v72, (uint64_t)v148);

            goto LABEL_220;
          }
          if (v164 == 1)
          {
            if ((v162 & 1) != 0)
            {
              v59 = CFSTR("ID assertion cannot follow a text node");
              goto LABEL_65;
            }
          }
          else if (v164 != 5)
          {
            v59 = CFSTR("Assertion only allowed after child step or character offset step");
            goto LABEL_65;
          }
          v154 = v35;
          v156 = 0;
          v157 = (uint64_t)objc_msgSend(v19, "scanLocation");
          v149 = 0;
          v150 = v60;
          v103 = 0;
          v155 = 0;
          v151 = 0;
          while (1)
          {
            if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
              goto LABEL_163;
            objc_msgSend(v19, "scanUpToCharactersFromSet:intoString:", v26, 0);
            if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
              goto LABEL_163;
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
            v110 = objc_msgSend(v109, "characterAtIndex:", objc_msgSend(v19, "scanLocation"));

            objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
            if (v110 == 94)
            {
              if (objc_msgSend(v19, "isAtEnd"))
              {
                v26 = v163;
                goto LABEL_163;
              }
              objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
              v111 = 0;
            }
            else
            {
              v111 = 0;
              if (v110 > 60)
              {
                if (v110 == 61)
                {
                  if (!v103)
                    goto LABEL_185;
                  v122 = v103;
                  v125 = (char *)objc_msgSend(v19, "scanLocation") + ~v157;
                  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
                  v127 = objc_msgSend(v126, "rangeOfString:options:range:", CFSTR(" "), 0, v157, v125);

                  if (v127 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    sub_9BF90(a4, (uint64_t)v127, CFSTR("Unexpected space found in key of assertion parameter list"), v128, v129, v130, v131, v132, (uint64_t)v148);

                    goto LABEL_187;
                  }
                  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
                  v134 = objc_claimAutoreleasedReturnValue(+[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v133, v157, v125));

                  v157 = (uint64_t)objc_msgSend(v19, "scanLocation");
                  v111 = 0;
                  v155 = (void *)v134;
                  goto LABEL_145;
                }
                if (v110 == 93)
                {
LABEL_130:
                  v112 = v103;
                  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
                  objc_msgSend(v19, "scanLocation");
                  v114 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v113));

                  v103 = v112;
                  if (v112)
                  {
                    if (!v155)
                    {
                      sub_9BF90(a4, v157, CFSTR("Assertion found with keyless value"), v115, v116, v117, v118, v119, (uint64_t)v148);
                      v155 = 0;
                      v111 = 1;
LABEL_156:
                      v26 = v163;

                      goto LABEL_159;
                    }
                    objc_msgSend(v112, "setObject:forKey:", v114, v155);

                    v155 = 0;
                    if (v110 != 93)
                      goto LABEL_158;
LABEL_155:
                    v111 = 15;
                    v149 = 1;
                    goto LABEL_156;
                  }
                  if (v156)
                  {
                    if (v164 == 1 || (v135 = v114, v151))
                    {
LABEL_154:
                      if (v110 != 93)
                      {
                        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
LABEL_158:
                        v26 = v163;
                        v157 = (uint64_t)objc_msgSend(v19, "scanLocation");

                        v111 = 0;
                        goto LABEL_159;
                      }
                      goto LABEL_155;
                    }
                  }
                  else
                  {
                    v135 = v151;
                    v156 = v114;
                  }
                  v136 = v114;
                  v151 = v135;
                  goto LABEL_154;
                }
              }
              else
              {
                if (v110 == 44)
                {
                  v120 = v164 != 1 && v156 == 0;
                  v121 = v120;
                  v122 = v103;
                  if (!v103 && (v121 & 1) == 0)
                  {
LABEL_185:
                    sub_9C0A8(v19, -1, a4);
LABEL_187:
                    v111 = 1;
                    v26 = v163;
                    v60 = v150;
                    goto LABEL_179;
                  }
                  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
                  objc_msgSend(v19, "scanLocation");
                  v124 = objc_claimAutoreleasedReturnValue(+[BCCFI substringByUnescapingString:inRange:](BCCFI, "substringByUnescapingString:inRange:", v123));

                  v156 = (void *)v124;
                  v157 = (uint64_t)objc_msgSend(v19, "scanLocation");
                  v111 = 0;
LABEL_145:
                  v26 = v163;
                  v103 = v122;
                  v60 = v150;
                  goto LABEL_159;
                }
                if (v110 == 59)
                  goto LABEL_130;
              }
            }
            v26 = v163;
LABEL_159:
            if (v111)
            {
              if (v111 != 15)
              {

                goto LABEL_179;
              }
LABEL_163:
              if ((v149 & 1) != 0)
              {
                v137 = &v170[v167];
                v138 = objc_msgSend(v156, "copy");
                if (v164 == 1)
                {
                  if (objc_msgSend(v103, "count"))
                  {
                    v141 = (__CFDictionary *)objc_msgSend(v103, "copy");
                    v164 = 2;
                    v137->var0 = 2;
                    v137->var1.var0.var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v141;

                  }
                  else
                  {
                    v164 = 2;
                    v137->var0 = 2;
                    v137->var1.var0.var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = 0;
                  }
                }
                else
                {
                  v166 = objc_msgSend(v151, "length");
                  if (v166)
                  {
                    v139 = (__CFDictionary *)objc_msgSend(v151, "copy");
                    v140 = objc_msgSend(v103, "count", v139);
                  }
                  else
                  {
                    v139 = 0;
                    v140 = objc_msgSend(v103, "count", v148);
                  }
                  if (v140)
                  {
                    v142 = (__CFDictionary *)objc_msgSend(v103, "copy");
                    v137->var0 = 3;
                    v137->var1.var0.var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v139;
                    v137->var1.var2.var2 = v142;

                  }
                  else
                  {
                    v137->var0 = 3;
                    v137->var1.var0.var0 = (unint64_t)v138;
                    v137->var1.var1.var1 = v139;
                    v137->var1.var2.var2 = 0;
                  }
                  v26 = v163;
                  if (v166)

                  v164 = 3;
                  v60 = v150;
                }

                ++v167;
                v111 = 0;
              }
              else
              {
                sub_9BF90(a4, -1, CFSTR("Encountered end of string while parsing CFI assertion"), v104, v105, v106, v107, v108, (uint64_t)v148);

                v111 = 1;
              }
LABEL_179:

              if (v111)
              {
                v120 = v111 == 10;
                v35 = v154;
                if (!v120)
                {
LABEL_190:
                  v11 = 0;
                  goto LABEL_191;
                }
              }
              else
              {
                v35 = v154;
              }
              goto LABEL_183;
            }
          }
        }
        if (v164 > 6 || ((1 << v164) & 0x46) == 0)
        {
          sub_9BF90(a4, (uint64_t)v27, CFSTR("Spatial offset terminating step only allowed after child node step or temporal offset terminating step"), v28, v29, v30, v31, v32, (uint64_t)v148);
          goto LABEL_220;
        }
        v174 = 0uLL;
        v175 = 0;
        if ((objc_msgSend(v19, "scanDecimal:", &v174) & 1) == 0)
        {
          sub_9C0A8(v19, 0, a4);
          goto LABEL_220;
        }
        v172 = v174;
        v173 = v175;
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithDecimal:](NSDecimalNumber, "decimalNumberWithDecimal:", &v172));
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
        if (objc_msgSend(v80, "compare:", v81) == (id)-1)
        {

        }
        else
        {
          v153 = v35;
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithMantissa:exponent:isNegative:](NSDecimalNumber, "decimalNumberWithMantissa:exponent:isNegative:", 100, 0, 0));
          v83 = v80;
          v84 = (char *)objc_msgSend(v80, "compare:", v82);

          v120 = v84 == (_BYTE *)&dword_0 + 1;
          v80 = v83;
          if (!v120)
          {
            v90 = objc_msgSend(v19, "scanLocation");
            v26 = v163;
            if ((objc_msgSend(v19, "scanString:intoString:", CFSTR(":"), 0) & 1) != 0
              && (objc_msgSend(v19, "scanDecimal:", &v174) & 1) != 0)
            {
              v165 = (uint64_t)v90;
              v172 = v174;
              v173 = v175;
              v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithDecimal:](NSDecimalNumber, "decimalNumberWithDecimal:", &v172));
              v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber zero](NSDecimalNumber, "zero"));
              if (objc_msgSend(v91, "compare:", v92) == (id)-1)
              {

              }
              else
              {
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber decimalNumberWithMantissa:exponent:isNegative:](NSDecimalNumber, "decimalNumberWithMantissa:exponent:isNegative:", 100, 0, 0));
                v94 = (char *)objc_msgSend(v91, "compare:", v93);

                if (v94 != (_BYTE *)&dword_0 + 1)
                {
                  v100 = &v170[v167];
                  v101 = v83;
                  v102 = v91;
                  v164 = 7;
                  v100->var0 = 7;
                  v100->var1.var0.var0 = (unint64_t)v101;
                  v100->var1.var1.var1 = v102;

                  v60 = 1;
                  ++v167;
                  v35 = v153;
                  goto LABEL_112;
                }
              }
              sub_9BF90(a4, v165, CFSTR("Temporal offset parameter must be a number between 0 and 100"), v95, v96, v97, v98, v99, (uint64_t)v148);

LABEL_220:
              v11 = 0;
              v26 = v163;
LABEL_191:

              return v11;
            }
            sub_9C0A8(v19, 0, a4);
LABEL_214:

            goto LABEL_190;
          }
        }
        sub_9BF90(a4, (uint64_t)v27, CFSTR("Temporal offset parameter must be a number between 0 and 100"), v85, v86, v87, v88, v89, (uint64_t)v148);
        v26 = v163;
        goto LABEL_214;
      }
      v54 = v179;
      while (1)
      {
        objc_msgSend(v19, "scanUpToCharactersFromSet:intoString:", v171, 0);
        if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
          goto LABEL_9;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
        v56 = objc_msgSend(v55, "characterAtIndex:", objc_msgSend(v19, "scanLocation"));

        objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
        if (v56 <= 90)
        {
          if (v56 == 44)
          {
            if (v54 == v179)
            {
              v54 = &v178;
            }
            else
            {
              if (v54 != &v178)
                goto LABEL_9;
              v54 = &v177;
            }
            goto LABEL_61;
          }
          if (v56 == 41)
            goto LABEL_9;
        }
        else
        {
          if (v56 == 94)
          {
            if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
              goto LABEL_9;
            objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
            goto LABEL_61;
          }
          if (v56 == 91 && (objc_msgSend(v19, "isAtEnd") & 1) == 0)
          {
            do
            {
              objc_msgSend(v19, "scanUpToCharactersFromSet:intoString:", v20, 0);
              if ((objc_msgSend(v19, "isAtEnd") & 1) != 0)
                break;
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "string"));
              v58 = objc_msgSend(v57, "characterAtIndex:", objc_msgSend(v19, "scanLocation"));

              objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
              if (v58 != 94)
                break;
              if ((objc_msgSend(v19, "isAtEnd") & 1) == 0)
                objc_msgSend(v19, "setScanLocation:", (char *)objc_msgSend(v19, "scanLocation") + 1);
            }
            while (!objc_msgSend(v19, "isAtEnd"));
          }
        }
        ++*v54;
LABEL_61:
        if (objc_msgSend(v19, "isAtEnd"))
          goto LABEL_9;
      }
    }
    sub_9BF90(a4, -1, CFSTR("CFI was not of the form epubCFI(...)"), v13, v14, v15, v16, v17, (uint64_t)v148);

    return 0;
  }
  -[BCCFI setString:](self, "setString:", v6);

  return 1;
}

- (id)generateCFI
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
  sub_9C1D0(v3, (unint64_t)self->_steps, (unint64_t)self->_startStepsPtr);
  if (self->_stepsEnd > self->_startStepsPtr)
  {
    objc_msgSend(v3, "appendString:", CFSTR(","));
    sub_9C1D0(v3, (unint64_t)self->_startStepsPtr, (unint64_t)self->_endStepsPtr);
    objc_msgSend(v3, "appendString:", CFSTR(","));
    sub_9C1D0(v3, (unint64_t)self->_endStepsPtr, (unint64_t)self->_stepsEnd);
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

+ (id)stringByEscapingString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _WORD *v10;
  id v11;
  uint64_t v12;
  _BYTE *v13;
  id v14;
  id v15;
  uint64_t v16;
  _BYTE *v17;
  int64_t v18;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("^[](),;=")));
    v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v4, 2);
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v3;
    }
    else
    {
      v8 = v5;
      v9 = v6;
      v10 = malloc_type_malloc(4 * ((_BYTE *)objc_msgSend(v3, "length") - ((_BYTE *)v8 + v6)) + 2 * (_QWORD)v8, 0x1000040BDFB0063uLL);
      if (v8)
        objc_msgSend(v3, "getCharacters:range:", v10, 0, v8);
      v11 = v8;
      do
      {
        v12 = (uint64_t)v11 + 1;
        v10[(_QWORD)v11] = 94;
        v13 = objc_msgSend(v3, "length");
        v14 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v4, 2, (char *)v8 + v9, (_BYTE *)objc_msgSend(v3, "length") - ((_BYTE *)v8 + v9));
        v15 = v14;
        v9 = v16;
        if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
          v17 = v13;
        else
          v17 = v14;
        v18 = v17 - (_BYTE *)v8;
        objc_msgSend(v3, "getCharacters:range:", &v10[v12], v8, v17 - (_BYTE *)v8);
        v11 = (id)(v18 + v12);
        v8 = v15;
      }
      while (v15 != (id)0x7FFFFFFFFFFFFFFFLL);
      v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharactersNoCopy:length:freeWhenDone:", v10, v11, 1);
      if (!v7)
        free(v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)substringByUnescapingString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const __CFString *v6;
  __CFString *v7;
  const char *CStringPtr;
  id v9;
  _WORD *v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UniChar v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  CFRange v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v37;
  NSUInteger v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;

  length = a4.length;
  location = a4.location;
  v6 = (const __CFString *)a3;
  v7 = (__CFString *)v6;
  if (v6)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    theString = v6;
    v38 = location;
    v39 = length;
    CharactersPtr = CFStringGetCharactersPtr(v6);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    v40 = 0;
    v41 = 0;
    v37 = CStringPtr;
    v10 = malloc_type_malloc(2 * length, 0x1000040BDFB0063uLL);
    if (length)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 64;
      while (1)
      {
        if ((unint64_t)v13 >= 4)
          v16 = 4;
        else
          v16 = v13;
        if (v13 < 0 || v39 <= v13)
        {
          v17 = 0;
        }
        else
        {
          if (CharactersPtr)
          {
            v17 = CharactersPtr[v13 + v38];
          }
          else if (v37)
          {
            v17 = v37[v38 + v13];
          }
          else
          {
            if (v41 <= v13 || v12 > v13)
            {
              v18 = -v16;
              v19 = v16 + v11;
              v20 = v15 - v16;
              v21 = v13 + v18;
              v22 = v21 + 64;
              if (v21 + 64 >= v39)
                v22 = v39;
              v40 = v21;
              v41 = v22;
              v23.location = v21 + v38;
              if (v39 >= v20)
                v24 = v20;
              else
                v24 = v39;
              v23.length = v24 + v19;
              CFStringGetCharacters(theString, v23, (UniChar *)&v27);
              v12 = v40;
            }
            v17 = *((_WORD *)&v27 + v13 - v12);
          }
          if (v17 == 94)
            goto LABEL_17;
        }
        v10[v14++] = v17;
LABEL_17:
        ++v13;
        --v11;
        ++v15;
        if (length == v13)
          goto LABEL_33;
      }
    }
    v14 = 0;
LABEL_33:
    v25 = objc_alloc((Class)NSString);
    v9 = objc_msgSend(v25, "initWithCharactersNoCopy:length:freeWhenDone:", v10, v14, 1, v27, v28, v29, v30, v31, v32, v33, v34);
    if (!v9)
      free(v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)rebaseCFIWithHead:(id)a3
{
  id v4;
  BCCFI *v5;
  BCCFI *v6;
  BCCFI *v7;
  _QWORD *v8;
  unint64_t v9;
  BCCFIStep *steps;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  _DWORD *v14;
  char *v15;
  BCCFIStep *endStepsPtr;
  unint64_t stepsEnd;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  _DWORD *v22;
  void *v24;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  _QWORD *v33;
  __int16 v34;
  BCCFI *v35;

  v4 = a3;
  v5 = self;
  v6 = v5;
  if (v4)
  {
    v7 = (BCCFI *)objc_claimAutoreleasedReturnValue(-[BCCFI _simplifiedVersion](v5, "_simplifiedVersion"));
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_simplifiedVersion"));
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    sub_9A5C8(v7, v8, 1, 1, (char **)&v31, 0);
    sub_9A5C8(v7, v8, 0, 1, (char **)&v30, 0);
    v9 = 0;
    steps = v7->_steps;
    if (steps < v7->_endStepsPtr)
    {
      v9 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = (_DWORD *)v8[1];
      v15 = (char *)v31;
      do
      {
        if ((unint64_t)v14 >= v8[3] || v11 > (unint64_t)v15)
          break;
        if (v13)
        {
          if (v12)
          {
            if (!steps)
              break;
            if (steps->var0 == 1)
            {
              if (!v14 || *v14 != 1)
                break;
            }
            else if (steps->var0 != 5 || !v14 || *v14 != 5)
            {
              break;
            }
            if (!-[BCCFI _subtractStep:fromStep:](v6, "_subtractStep:fromStep:", v14, steps, v30))
            {
              v26 = BCReadingStatisticsLog();
              v27 = objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v33 = v8;
                v34 = 2112;
                v35 = v7;
                _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Failed to subtract %@ from %@.", buf, 0x16u);
              }

              break;
            }
            v13 = 1;
            v15 = (char *)v31;
            v12 = 1;
          }
          else
          {
            v12 = steps->var0 == 1;
            v13 = 1;
          }
        }
        else
        {
          v13 = steps->var0 == 4;
        }
        if (v11 <= (unint64_t)v15 && steps->var0 != 5 && steps < v7->_startStepsPtr)
          ++v9;
        ++v11;
        ++steps;
        v14 += 8;
      }
      while (steps < v7->_endStepsPtr);
    }
    endStepsPtr = v7->_steps;
    stepsEnd = (unint64_t)v7->_stepsEnd;
    if ((unint64_t)endStepsPtr < stepsEnd)
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = (_DWORD *)v8[1];
      do
      {
        if ((unint64_t)v22 >= v8[3] || v19 > v30)
          break;
        if (endStepsPtr == v7->_startStepsPtr)
        {
          endStepsPtr = v7->_endStepsPtr;
          if (!v21)
          {
LABEL_45:
            v21 = endStepsPtr->var0 == 4;
            goto LABEL_52;
          }
        }
        else if (!v21)
        {
          goto LABEL_45;
        }
        if (v20)
        {
          if (v19 >= v9)
          {
            if (v19 >= v30)
            {
              if (!endStepsPtr)
                break;
              if (endStepsPtr->var0 == 1)
              {
                if (!v22 || *v22 != 1)
                  break;
              }
              else if (endStepsPtr->var0 != 5 || !v22 || *v22 != 5)
              {
                break;
              }
            }
            if (!-[BCCFI _subtractStep:fromStep:](v6, "_subtractStep:fromStep:", v22, endStepsPtr, v30))
            {
              v28 = BCReadingStatisticsLog();
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v33 = v8;
                v34 = 2112;
                v35 = v7;
                _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Failed to subtract %@ from %@.", buf, 0x16u);
              }

              break;
            }
            stepsEnd = (unint64_t)v7->_stepsEnd;
          }
          v21 = 1;
          v20 = 1;
        }
        else
        {
          v20 = endStepsPtr->var0 == 1;
          v21 = 1;
        }
LABEL_52:
        ++v19;
        ++endStepsPtr;
        v22 += 8;
      }
      while ((unint64_t)endStepsPtr < stepsEnd);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI generateCFI](v7, "generateCFI", v30));
    -[BCCFI setString:](v7, "setString:", v24);

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (BCCFI)cfiWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4
{
  _QWORD *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[8];
  NSErrorUserInfoKey v22;
  void *v23;

  v7 = -[BCCFI copy](self, "copy");
  v8 = v7;
  v9 = v7[1];
  v10 = v7[2];
  if (v9 < v10)
  {
    v11 = 0;
    do
    {
      if (*(_DWORD *)v9 == 1)
      {
        v12 = *(_QWORD *)(v9 + 8);
        if ((v12 & 1) == 0 && ++v11 == 2)
        {
          if (v12 + a3 < 0)
          {

            if (a4)
            {
              v22 = NSLocalizedDescriptionKey;
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid offset. Offsetting {%@} by %ld would produce a negative spine index."), v18, a3));
              v23 = v19;
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
              *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKEpubCFIErrorDomain"), 2, v20));

            }
            v8 = 0;
            break;
          }
          *(_QWORD *)(v9 + 8) = v12 + 2 * a3;
          v10 = v7[2];
          v11 = 2;
        }
      }
      else if (*(_DWORD *)v9 == 4)
      {
        goto LABEL_14;
      }
      v9 += 32;
    }
    while (v9 < v10);
  }
  v13 = BCReadingStatisticsLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "ERROR: No indirection available in CFI so unable to offset spine element.", buf, 2u);
  }

  v8 = 0;
LABEL_14:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "generateCFI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v15, a4));

  return (BCCFI *)v16;
}

- (BCCFI)cfiWithSpineIndexAdjustedUsingAssertionBlock:(id)a3
{
  uint64_t (**v4)(id, uint64_t, _QWORD);
  BCCFI *v5;
  BCCFIStep *stepsEnd;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = (uint64_t (**)(id, uint64_t, _QWORD))a3;
  v5 = self;
  stepsEnd = v5->_stepsEnd;
  v7 = (unint64_t)&v5->_steps[1];
  while (v7 < (unint64_t)stepsEnd)
  {
    v8 = *(_DWORD *)v7;
    v7 += 32;
    if (v8 == 1)
    {
      if (v7 < (unint64_t)stepsEnd && *(_DWORD *)v7 == 2)
      {
        v9 = *(_QWORD *)(v7 - 24);
        v10 = v4[2](v4, v9, *(_QWORD *)(v7 + 8));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10)
        {
          v12 = objc_claimAutoreleasedReturnValue(-[BCCFI cfiWithAdjustedSpineIndex:error:](v5, "cfiWithAdjustedSpineIndex:error:", v10, 0));

          v5 = (BCCFI *)v12;
        }
      }
      break;
    }
  }

  return v5;
}

- (id)headCFI
{
  void *v3;
  BCCFIStep *i;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
  for (i = self->_steps; i < self->_endStepsPtr; ++i)
    sub_9CDDC(v3, (uint64_t)i);
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v3, &v13));
  v6 = v13;
  if (v6)
  {
    v7 = BCReadingStatisticsLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }

  }
  if (!v5)
  {
    v9 = BCReadingStatisticsLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI description](self, "description"));
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Failed to create head CFI from %@", buf, 0xCu);

    }
  }

  return v5;
}

- (id)tailCFI
{
  void *v3;
  BCCFIStep *i;
  BCCFIStep *j;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
  for (i = self->_steps; i < self->_startStepsPtr; ++i)
    sub_9CDDC(v3, (uint64_t)i);
  for (j = self->_endStepsPtr; j < self->_stepsEnd; ++j)
    sub_9CDDC(v3, (uint64_t)j);
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v14 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v3, &v14));
  v7 = v14;
  if (v7)
  {
    v8 = BCReadingStatisticsLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }

  }
  if (!v6)
  {
    v10 = BCReadingStatisticsLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI description](self, "description"));
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Failed to create tail CFI from %@", buf, 0xCu);

    }
  }

  return v6;
}

- (id)ensureRange
{
  BCCFI *v2;
  void *v3;
  unint64_t steps;
  const __CFString *v5;
  char v6;
  uint64_t v7;
  __int128 v9;
  _OWORD v10[2];

  v2 = self;
  if (!-[BCCFI isRange](v2, "isRange"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
    steps = (unint64_t)v2->_steps;
    v5 = CFSTR("/1,:0,:1");
    if ((BCCFIStep *)steps < v2->_startStepsPtr)
    {
      v6 = 0;
      while (2)
      {
        switch(*(_DWORD *)steps)
        {
          case 1:
            sub_9CDDC(v3, steps);
            v6 |= *(_BYTE *)(steps + 8);
            goto LABEL_7;
          case 2:
          case 4:
            sub_9CDDC(v3, steps);
            goto LABEL_7;
          case 5:
            objc_msgSend(v3, "appendString:", CFSTR(","));
            sub_9CDDC(v3, steps);
            objc_msgSend(v3, "appendString:", CFSTR(","));
            v9 = *(_OWORD *)(steps + 16);
            v10[0] = *(_OWORD *)steps;
            v10[1] = v9;
            *((_QWORD *)&v10[0] + 1) = *(_QWORD *)(steps + 8) + 1;
            sub_9CDDC(v3, (uint64_t)v10);
            if ((v6 & 1) != 0)
              goto LABEL_11;
            v5 = CFSTR("/1,:0,:1");
            break;
          default:
LABEL_7:
            steps += 32;
            if ((BCCFIStep *)steps < v2->_startStepsPtr)
              continue;
            if ((v6 & 1) != 0)
              v5 = CFSTR(",:0,:1");
            break;
        }
        break;
      }
    }
    objc_msgSend(v3, "appendString:", v5);
LABEL_11:
    objc_msgSend(v3, "appendString:", CFSTR(")"));
    v7 = objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v3, 0));

    v2 = (BCCFI *)v7;
  }
  return v2;
}

- (unint64_t)characterCountIfComputable
{
  BCCFIStep *endStepsPtr;
  BCCFIStep *startStepsPtr;
  int var0;
  unint64_t result;
  unint64_t v7;
  BCCFIStep *stepsEnd;
  int v9;
  unint64_t v10;

  if (!-[BCCFI isRange](self, "isRange"))
    return 0;
  startStepsPtr = self->_startStepsPtr;
  endStepsPtr = self->_endStepsPtr;
  if (startStepsPtr >= endStepsPtr)
    return 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    var0 = startStepsPtr->var0;
    if (startStepsPtr->var0 <= 7u)
    {
      if (((1 << var0) & 0xD2) != 0)
        return 0x7FFFFFFFFFFFFFFFLL;
      if (var0 == 5)
        break;
    }
    if (++startStepsPtr >= endStepsPtr)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = startStepsPtr->var1.var0.var0;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    stepsEnd = self->_stepsEnd;
    if (endStepsPtr < stepsEnd)
    {
      while (1)
      {
        v9 = endStepsPtr->var0;
        if (endStepsPtr->var0 <= 7u)
        {
          if (((1 << v9) & 0xD2) != 0)
            return 0x7FFFFFFFFFFFFFFFLL;
          if (v9 == 5)
            break;
        }
        if (++endStepsPtr >= stepsEnd)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      v10 = endStepsPtr->var1.var0.var0;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        return v10 - v7;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_copyInto:(id)a3
{
  void *v4;
  size_t v5;
  char *v6;
  unint64_t v7;
  unint64_t i;
  id v9;
  id v10;
  id v11;
  id v12;
  const void *v13;
  _QWORD *v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI string](self, "string"));
  objc_msgSend(v14, "setString:", v4);

  v5 = (char *)self->_stepsEnd - (char *)self->_steps;
  v6 = (char *)malloc_type_malloc(v5, 0xBE537BBDuLL);
  v14[1] = v6;
  v14[2] = &v6[(unint64_t)((char *)self->_startStepsPtr - (char *)self->_steps)];
  v14[3] = &v6[(unint64_t)((char *)self->_endStepsPtr - (char *)self->_steps)];
  v14[4] = &v6[(unint64_t)((char *)self->_stepsEnd - (char *)self->_steps)];
  v14[6] = self->_pageIndexOffset;
  memmove(v6, self->_steps, v5);
  v7 = v14[1];
  for (i = v14[4]; v7 < i; v7 += 32)
  {
    switch(*(_DWORD *)v7)
    {
      case 2:
        v9 = objc_msgSend(*(id *)(v7 + 8), "copy");
        *(_QWORD *)(v7 + 8) = v9;

        v10 = objc_msgSend(*(id *)(v7 + 16), "copy");
        *(_QWORD *)(v7 + 16) = v10;
        goto LABEL_5;
      case 3:
        v11 = objc_msgSend(*(id *)(v7 + 8), "copy");
        *(_QWORD *)(v7 + 8) = v11;

        v12 = objc_msgSend(*(id *)(v7 + 16), "copy");
        *(_QWORD *)(v7 + 16) = v12;

        v10 = objc_msgSend(*(id *)(v7 + 24), "copy");
        *(_QWORD *)(v7 + 24) = v10;
LABEL_5:

        continue;
      case 6:
        v13 = *(const void **)(v7 + 8);
        goto LABEL_8;
      case 7:
        CFRetain(*(CFTypeRef *)(v7 + 8));
        v13 = *(const void **)(v7 + 16);
LABEL_8:
        CFRetain(v13);
        break;
      default:
        continue;
    }
  }

}

- (id)_simplifiedVersion
{
  void *v3;
  BCCFIStep *i;
  BCCFIStep *steps;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
  steps = self->_steps;
  for (i = self->_startStepsPtr; steps < i; ++steps)
  {
    if (steps->var0 <= 5u && ((1 << steps->var0) & 0x32) != 0)
    {
      sub_9CDDC(v3, (uint64_t)steps);
      i = self->_startStepsPtr;
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR(","));
  sub_9C1D0(v3, (unint64_t)self->_startStepsPtr, (unint64_t)self->_endStepsPtr);
  objc_msgSend(v3, "appendString:", CFSTR(","));
  sub_9C1D0(v3, (unint64_t)self->_endStepsPtr, (unint64_t)self->_stepsEnd);
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v3, 0));

  return v7;
}

- (BOOL)_subtractStep:(const BCCFIStep *)a3 fromStep:(BCCFIStep *)a4
{
  int var0;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  void *v21;
  const char *v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  NSObject *v26;
  unint64_t v27;
  id v28;
  objc_class *v29;
  NSString *v30;
  NSString *v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;

  var0 = a4->var0;
  if (a4->var0 != a3->var0)
  {
    v15 = BCReadingStatisticsLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class(self);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v33 = 138412546;
      v34 = v19;
      v35 = 2112;
      v36 = v21;
      v22 = "Unexpected state in %@ %@.";
LABEL_21:
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v33, 0x16u);

    }
LABEL_22:

    return 0;
  }
  if (var0 == 5)
  {
    v23 = a4->var1.var0.var0;
    v24 = a3->var1.var0.var0;
    if (v24 > v23)
    {
      v25 = BCReadingStatisticsLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Subtracting an offset that is too large.", (uint8_t *)&v33, 2u);
      }

      v24 = v23;
    }
    v27 = v23 - v24;
    goto LABEL_25;
  }
  if (var0 != 1)
  {
    v28 = BCReadingStatisticsLog();
    v16 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class(self);
      v30 = NSStringFromClass(v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v31 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = 138412546;
      v34 = v19;
      v35 = 2112;
      v36 = v21;
      v22 = "Unexpected step type in %@ %@.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v9 = a4->var1.var0.var0;
  v10 = a3->var1.var0.var0;
  if (v10 > v9)
  {
    v11 = BCReadingStatisticsLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Subtracting an index that is too large.", (uint8_t *)&v33, 2u);
    }

    v10 = v9;
  }
  v13 = v9 - v10;
  a4->var1.var0.var0 = v13;
  if (a3->var0 == 1)
  {
    v14 = 1;
    if ((a3->var1.var0.var0 & 1) == 0)
      v14 = 2;
  }
  else
  {
    v14 = 1;
  }
  v27 = v14 + v13;
LABEL_25:
  a4->var1.var0.var0 = v27;
  return 1;
}

+ (id)_cfiLocationFromHeadOf:(id)a3 toTailOf:(id)a4
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  _QWORD *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v30;
  unint64_t v31;
  char *v32;
  uint8_t buf[4];
  _QWORD *v34;
  __int16 v35;
  _QWORD *v36;

  v5 = a3;
  v6 = a4;
  v31 = 0;
  v32 = 0;
  sub_9A5C8(v5, v6, 1, 0, &v32, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
  v9 = v5[1];
  v8 = v5[2];
  v10 = 0;
  if (v9 < v8 && v32 != 0)
  {
    do
    {
      sub_9CDDC(v7, v9);
      ++v10;
      v9 += 32;
      v8 = v5[2];
    }
    while (v9 < v8 && v10 < (unint64_t)v32);
  }
  v13 = v5[3];
  while (v8 < v13)
  {
    if (v10 < (unint64_t)v32)
    {
      sub_9CDDC(v7, v8);
      v13 = v5[3];
    }
    ++v10;
    v8 += 32;
  }
  objc_msgSend(v7, "appendString:", CFSTR(","));
  v15 = v5[1];
  v14 = v5[2];
  if (v15 >= v14)
  {
    v16 = 0;
  }
  else
  {
    v16 = 0;
    do
    {
      if (v16 >= (unint64_t)v32)
      {
        sub_9CDDC(v7, v15);
        v14 = v5[2];
      }
      ++v16;
      v15 += 32;
    }
    while (v15 < v14);
  }
  v17 = v5[3];
  while (v14 < v17)
  {
    if (v16 >= (unint64_t)v32)
    {
      sub_9CDDC(v7, v14);
      v17 = v5[3];
    }
    ++v16;
    v14 += 32;
  }
  objc_msgSend(v7, "appendString:", CFSTR(","));
  v19 = v6[1];
  v18 = v6[2];
  if (v19 >= v18)
  {
    v20 = 0;
  }
  else
  {
    v20 = 0;
    do
    {
      if (v20 >= v31)
      {
        sub_9CDDC(v7, v19);
        v18 = v6[2];
      }
      ++v20;
      v19 += 32;
    }
    while (v19 < v18);
  }
  v22 = v6[3];
  v21 = v6[4];
  while (v22 < v21)
  {
    if (v20 >= v31)
    {
      sub_9CDDC(v7, v22);
      v21 = v6[4];
    }
    ++v20;
    v22 += 32;
  }
  objc_msgSend(v7, "appendString:", CFSTR(")"));
  v30 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v7, &v30));
  v24 = v30;
  if (v24)
  {
    v25 = BCReadingStatisticsLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v24;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
    }

  }
  if (!v23)
  {
    v27 = BCReadingStatisticsLog();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v5;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Failed to create CFI from %@ to %@", buf, 0x16u);
    }

  }
  return v23;
}

+ (id)_cfiLocationFromTailOf:(id)a3 toHeadOf:(id)a4
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v30;
  unint64_t v31;
  char *v32;
  uint8_t buf[4];
  _QWORD *v34;
  __int16 v35;
  _QWORD *v36;

  v5 = a3;
  v6 = a4;
  v31 = 0;
  v32 = 0;
  v7 = 0;
  if (sub_9A5C8(v5, v6, 0, 1, &v32, &v31) != 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("epubcfi(")));
    v9 = v5[1];
    v10 = 0;
    if (v9 < v5[2] && v32 != 0)
    {
      do
      {
        sub_9CDDC(v8, v9);
        ++v10;
        v9 += 32;
      }
      while (v9 < v5[2] && v10 < (unint64_t)v32);
    }
    v14 = v5[3];
    v13 = v5[4];
    while (v14 < v13)
    {
      if (v10 < (unint64_t)v32)
      {
        sub_9CDDC(v8, v14);
        v13 = v5[4];
      }
      ++v10;
      v14 += 32;
    }
    objc_msgSend(v8, "appendString:", CFSTR(","));
    v16 = v5[1];
    v15 = v5[2];
    if (v16 >= v15)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      do
      {
        if (v17 >= (unint64_t)v32)
        {
          sub_9CDDC(v8, v16);
          v15 = v5[2];
        }
        ++v17;
        v16 += 32;
      }
      while (v16 < v15);
    }
    v19 = v5[3];
    v18 = v5[4];
    while (v19 < v18)
    {
      if (v17 >= (unint64_t)v32)
      {
        sub_9CDDC(v8, v19);
        v18 = v5[4];
      }
      ++v17;
      v19 += 32;
    }
    objc_msgSend(v8, "appendString:", CFSTR(","));
    v21 = v6[1];
    v20 = v6[2];
    if (v21 >= v20)
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      do
      {
        if (v22 >= v31)
        {
          sub_9CDDC(v8, v21);
          v20 = v6[2];
        }
        ++v22;
        v21 += 32;
      }
      while (v21 < v20);
    }
    v23 = v6[3];
    while (v20 < v23)
    {
      if (v22 >= v31)
      {
        sub_9CDDC(v8, v20);
        v23 = v6[3];
      }
      ++v22;
      v20 += 32;
    }
    objc_msgSend(v8, "appendString:", CFSTR(")"));
    v30 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v8, &v30));
    v24 = v30;
    if (v24)
    {
      v25 = BCReadingStatisticsLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Failed to create CFI. %@", buf, 0xCu);
      }

    }
    if (!v7)
    {
      v27 = BCReadingStatisticsLog();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v5;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Failed to create CFI from %@ to %@", buf, 0x16u);
      }

    }
  }

  return v7;
}

- (void)_setPageIndexOffset:(unint64_t)a3
{
  self->_pageIndexOffset = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)pageIndexOffset
{
  return self->_pageIndexOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
