@implementation CRLWPTab

+ (id)tabStopAlignmentStringTop
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Top"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringMiddle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Middle"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringBottom
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Bottom"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringLeft
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Left"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringCenter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Center"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringRight
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Right"), 0, 0));

  return v3;
}

+ (id)tabStopAlignmentStringDecimal
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Decimal"), 0, 0));

  return v3;
}

+ (id)tabStopDisplayStringNone
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NONE_LEADER_DISPLAY"), CFSTR("None"), 0));

  return v3;
}

+ (id)tabStopDisplayStringPoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("....."), 0, 0));

  return v3;
}

+ (id)tabStopDisplayStringDash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("-----"), 0, 0));

  return v3;
}

+ (id)tabStopDisplayStringUnderscore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("_____"), 0, 0));

  return v3;
}

+ (id)tabStopDisplayStringArrow
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("→→→"), 0, 0));

  return v3;
}

+ (id)tabStopLeaderStringPoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("."), 0, 0));

  return v3;
}

+ (id)tabStopLeaderStringDash
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("-"), 0, 0));

  return v3;
}

+ (id)tabStopLeaderStringUnderscore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("_"), 0, 0));

  return v3;
}

+ (id)tabStopLeaderStringArrow
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("→"), 0, 0));

  return v3;
}

+ (id)tabStopLeaderStringArrowRTL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("←"), 0, 0));

  return v3;
}

- (double)positionInInches
{
  return self->_position / 72.0;
}

- (void)setPositionInInches:(double)a3
{
  self->_position = 72.0 * a3;
}

+ (id)tabLeaderFromDisplayString:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringPoint"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringPoint"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringDash"));
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

    if (v9)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringDash"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringUnderscore"));
      v11 = objc_msgSend(v4, "isEqualToString:", v10);

      if (v11)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringUnderscore"));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringArrow"));
        v13 = objc_msgSend(v4, "isEqualToString:", v12);

        if (!v13)
        {
          v14 = 0;
          goto LABEL_10;
        }
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringArrow"));
      }
    }
  }
  v14 = (void *)v7;
LABEL_10:

  return v14;
}

+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t v29[24];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringLeft"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    if (v4)
      v9 = 2;
    else
      v9 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringCenter"));
  v11 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
  {
LABEL_6:
    v9 = 1;
    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringRight"));
  v13 = objc_msgSend(v6, "isEqualToString:", v12);

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringDecimal"));
    v15 = objc_msgSend(v6, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
    {
      v9 = 3;
      goto LABEL_15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringTop"));
    v17 = objc_msgSend(v6, "isEqualToString:", v16);

    if ((v17 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringMiddle"));
      v20 = objc_msgSend(v6, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
        goto LABEL_6;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringBottom"));
      v22 = objc_msgSend(v6, "isEqualToString:", v21);

      if ((v22 & 1) != 0)
      {
        v9 = 2;
        goto LABEL_15;
      }
      v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E498);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E02894(v23, v24);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E4B8);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E02830(v26, v29, v23, (os_log_t)v25);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPTab tabAlignmentFromString:isRTL:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPTabs.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 154, 0, "Unrecognized tab alignment string. Returning kTabAlignmentLeft by default.");

    }
    v9 = 0;
    goto LABEL_15;
  }
  if (v4)
    v9 = 0;
  else
    v9 = 2;
LABEL_15:

  return v9;
}

+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4 isVertical:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;

  switch(a3)
  {
    case 0:
      if (!a5)
      {
        if (!a4)
          goto LABEL_14;
        goto LABEL_12;
      }
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringTop", v5, v6));
      break;
    case 1:
      if (a5)
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringMiddle", v5, v6));
      else
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringCenter", v5, v6));
      break;
    case 2:
      if (a5)
      {
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringBottom", v5, v6));
      }
      else if (a4)
      {
LABEL_14:
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringLeft", v5, v6));
      }
      else
      {
LABEL_12:
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringRight", v5, v6));
      }
      break;
    case 3:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopAlignmentStringDecimal", v5, v6));
      break;
    default:
      v7 = &stru_1012A72B0;
      break;
  }
  return v7;
}

+ (id)displayStringFromTabLeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringNone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringPoint"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringPoint"));
LABEL_9:
    v15 = (void *)v8;

    v5 = v15;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringDash"));
  v10 = objc_msgSend(v4, "isEqualToString:", v9);

  if (v10)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringDash"));
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringUnderscore"));
  v12 = objc_msgSend(v4, "isEqualToString:", v11);

  if (v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringUnderscore"));
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopLeaderStringArrow"));
  v14 = objc_msgSend(v4, "isEqualToString:", v13);

  if (v14)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tabStopDisplayStringArrow"));
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

+ (id)tab
{
  return objc_alloc_init(CRLWPTab);
}

- (CRLWPTab)init
{
  return -[CRLWPTab initWithPosition:alignment:leader:](self, "initWithPosition:alignment:leader:", 0, 0, 0.0);
}

- (CRLWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  id v8;
  CRLWPTab *v9;
  CRLWPTab *v10;
  NSString *v11;
  NSString *leader;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRLWPTab;
  v9 = -[CRLWPTab init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_position = a3;
    v9->_alignment = a4;
    v11 = (NSString *)objc_msgSend(v8, "copy");
    leader = v10->_leader;
    v10->_leader = v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class(self, a2));
  return _objc_msgSend(v4, "initWithPosition:alignment:leader:", self->_alignment, self->_leader, self->_position);
}

- (NSString)leader
{
  if (self->_leader)
    return self->_leader;
  else
    return (NSString *)CFSTR(" ");
}

- (int64_t)compareToPosition:(double)a3
{
  double position;

  position = self->_position;
  if (position < a3)
    return -1;
  else
    return position > a3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "position");
    v6 = -[CRLWPTab compareToPosition:](self, "compareToPosition:");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (BOOL)isEqualToPosition:(double)a3
{
  double position;

  position = self->_position;
  return position == a3 || vabdd_f64(position, a3) < fabs(a3 * 0.000000999999997);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  double position;
  double v11;
  int alignment;
  NSString *leader;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  unsigned __int8 v19;

  v4 = a3;
  objc_opt_class(self, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8
    && ((position = self->_position, objc_msgSend(v8, "position"), position == v11)
     || vabdd_f64(position, v11) < fabs(v11 * 0.000000999999997))
    && (alignment = self->_alignment, alignment == objc_msgSend(v9, "alignment")))
  {
    leader = self->_leader;
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leader"));
    v15 = leader;
    if (v15)
      v16 = v15;
    else
      v16 = CFSTR(" ");
    if (v14)
      v17 = v14;
    else
      v17 = CFSTR(" ");
    v18 = v14;
    v19 = -[__CFString isEqualToString:](v16, "isEqualToString:", v17);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  return self->_alignment;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: pos=%f; align=%d; leader='%@'>"),
                   v5,
                   *(_QWORD *)&self->_position,
                   self->_alignment,
                   self->_leader));

  return v6;
}

- (double)position
{
  return self->_position;
}

- (void)setPosition:(double)a3
{
  self->_position = a3;
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
}

- (void)setLeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leader, 0);
}

@end
