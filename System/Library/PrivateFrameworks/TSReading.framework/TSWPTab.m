@implementation TSWPTab

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _kTabStopAlignmentStringLeft = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Left"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopAlignmentStringCenter = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Center"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopAlignmentStringRight = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Right"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopAlignmentStringDecimal = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Decimal"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopDisplayStringNone = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopDisplayStringPoint = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("....."), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopDisplayStringDash = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("-----"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopDisplayStringUnderscore = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("_____"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopDisplayStringArrow = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("→→→"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopLeaderStringPoint = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("."), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopLeaderStringDash = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopLeaderStringUnderscore = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("_"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopLeaderStringArrow = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("→"), &stru_24D82FEB0, CFSTR("TSText"));
    _kTabStopLeaderStringArrowRTL = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("←"), &stru_24D82FEB0, CFSTR("TSText"));
  }
}

+ (id)kTabStopAlignmentStringLeft
{
  return (id)_kTabStopAlignmentStringLeft;
}

+ (id)kTabStopAlignmentStringCenter
{
  return (id)_kTabStopAlignmentStringCenter;
}

+ (id)kTabStopAlignmentStringRight
{
  return (id)_kTabStopAlignmentStringRight;
}

+ (id)kTabStopAlignmentStringDecimal
{
  return (id)_kTabStopAlignmentStringDecimal;
}

+ (id)kTabStopDisplayStringNone
{
  return (id)_kTabStopDisplayStringNone;
}

+ (id)kTabStopDisplayStringPoint
{
  return (id)_kTabStopDisplayStringPoint;
}

+ (id)kTabStopDisplayStringDash
{
  return (id)_kTabStopDisplayStringDash;
}

+ (id)kTabStopDisplayStringUnderscore
{
  return (id)_kTabStopDisplayStringUnderscore;
}

+ (id)kTabStopDisplayStringArrow
{
  return (id)_kTabStopDisplayStringArrow;
}

+ (id)kTabStopLeaderStringPoint
{
  return (id)_kTabStopLeaderStringPoint;
}

+ (id)kTabStopLeaderStringDash
{
  return (id)_kTabStopLeaderStringDash;
}

+ (id)kTabStopLeaderStringUnderscore
{
  return (id)_kTabStopLeaderStringUnderscore;
}

+ (id)kTabStopLeaderStringArrow
{
  return (id)_kTabStopLeaderStringArrow;
}

+ (id)kTabStopLeaderStringArrowRTL
{
  return (id)_kTabStopLeaderStringArrowRTL;
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
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopDisplayStringPoint))
    return (id)_kTabStopLeaderStringPoint;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopDisplayStringDash))
    return (id)_kTabStopLeaderStringDash;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopDisplayStringUnderscore))
    return (id)_kTabStopLeaderStringUnderscore;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopDisplayStringArrow))
    return (id)_kTabStopLeaderStringArrow;
  return 0;
}

+ (int)tabAlignmentFromString:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;

  v4 = a4;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopAlignmentStringLeft))
  {
    if (v4)
      return 2;
    else
      return 0;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", _kTabStopAlignmentStringCenter) & 1) != 0)
  {
    return 1;
  }
  else if (objc_msgSend(a3, "isEqualToString:", _kTabStopAlignmentStringRight))
  {
    if (v4)
      return 0;
    else
      return 2;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", _kTabStopAlignmentStringDecimal) & 1) != 0)
  {
    return 3;
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPTab tabAlignmentFromString:isRTL:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTabs.mm"), 207, CFSTR("Unrecognized tab alignment string. Returning kTabAlignmentLeft by default."));
    return 0;
  }
}

+ (id)stringFromTabAlignment:(int)a3 isRTL:(BOOL)a4
{
  uint64_t *v4;
  uint64_t *v5;
  id result;

  switch(a3)
  {
    case 0:
      v4 = &_kTabStopAlignmentStringRight;
      v5 = &_kTabStopAlignmentStringLeft;
      goto LABEL_6;
    case 1:
      result = (id)_kTabStopAlignmentStringCenter;
      break;
    case 2:
      v4 = &_kTabStopAlignmentStringLeft;
      v5 = &_kTabStopAlignmentStringRight;
LABEL_6:
      if (!a4)
        v4 = v5;
      result = (id)*v4;
      break;
    case 3:
      result = (id)_kTabStopAlignmentStringDecimal;
      break;
    default:
      result = &stru_24D82FEB0;
      break;
  }
  return result;
}

+ (id)displayStringFromTabLeader:(id)a3
{
  void *v4;

  v4 = (void *)_kTabStopDisplayStringNone;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopLeaderStringPoint))
    return (id)_kTabStopDisplayStringPoint;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopLeaderStringDash))
    return (id)_kTabStopDisplayStringDash;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopLeaderStringUnderscore))
    return (id)_kTabStopDisplayStringUnderscore;
  if (objc_msgSend(a3, "isEqualToString:", _kTabStopLeaderStringArrow))
    return (id)_kTabStopDisplayStringArrow;
  return v4;
}

+ (id)tab
{
  return objc_alloc_init(TSWPTab);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTab;
  -[TSWPTab dealloc](&v3, sel_dealloc);
}

- (TSWPTab)init
{
  return -[TSWPTab initWithPosition:alignment:leader:](self, "initWithPosition:alignment:leader:", 0, 0, 0.0);
}

- (TSWPTab)initWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  TSWPTab *v8;
  TSWPTab *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPTab;
  v8 = -[TSWPTab init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_position = a3;
    v8->_alignment = a4;
    v8->_leader = (NSString *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPosition:alignment:leader:", self->_alignment, self->_leader, self->_position);
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
  if (!a3)
    return -1;
  objc_msgSend(a3, "position");
  return -[TSWPTab compareToPosition:](self, "compareToPosition:");
}

- (BOOL)isEqualToPosition:(double)a3
{
  return vabdd_f64(self->_position, a3) <= 0.0000999999975;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  double position;
  double v7;
  int alignment;
  NSString *leader;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
    return 0;
  v5 = v4;
  position = self->_position;
  objc_msgSend(v4, "position");
  if (vabdd_f64(position, v7) > 0.0000999999975)
    return 0;
  alignment = self->_alignment;
  if (alignment != objc_msgSend(v5, "alignment"))
    return 0;
  leader = self->_leader;
  v10 = objc_msgSend(v5, "leader");
  if (leader)
    v11 = (__CFString *)leader;
  else
    v11 = CFSTR(" ");
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR(" ");
  return -[__CFString isEqualToString:](v11, "isEqualToString:", v12);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: pos=%f; align=%d; leader=\"%@\">"),
               NSStringFromClass(v4),
               *(_QWORD *)&self->_position,
               self->_alignment,
               self->_leader);
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

@end
