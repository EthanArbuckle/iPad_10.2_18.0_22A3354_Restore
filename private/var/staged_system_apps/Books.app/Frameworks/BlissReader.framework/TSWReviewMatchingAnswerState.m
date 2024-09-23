@implementation TSWReviewMatchingAnswerState

- (void)dealloc
{
  objc_super v3;

  self->mPlacardToTargetMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewMatchingAnswerState;
  -[TSWReviewMatchingAnswerState dealloc](&v3, "dealloc");
}

- (TSWReviewMatchingAnswerState)initWithCoder:(id)a3
{
  TSWReviewMatchingAnswerState *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWReviewMatchingAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v7, "initWithCoder:");
  if (v4)
  {
    v5 = objc_opt_class(NSMutableArray);
    v4->mPlacardToTargetMap = (NSMutableArray *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(NSNumber), 0), CFSTR("TSWReviewAnswerStateChoiceForSource"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWReviewMatchingAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  objc_msgSend(a3, "encodeObject:forKey:", self->mPlacardToTargetMap, CFSTR("TSWReviewAnswerStateChoiceForSource"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)targetForPlacard:(unint64_t)a3
{
  NSMutableArray *mPlacardToTargetMap;
  id v6;

  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (mPlacardToTargetMap
    && (unint64_t)-[NSMutableArray count](mPlacardToTargetMap, "count") > a3
    && (v6 = -[NSMutableArray objectAtIndex:](self->mPlacardToTargetMap, "objectAtIndex:", a3)) != 0)
  {
    return (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)placardForTarget:(unint64_t)a3
{
  NSMutableArray *mPlacardToTargetMap;
  unint64_t v6;
  id v7;

  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (!mPlacardToTargetMap || !-[NSMutableArray count](mPlacardToTargetMap, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  while (1)
  {
    v7 = -[NSMutableArray objectAtIndex:](self->mPlacardToTargetMap, "objectAtIndex:", v6);
    if (v7)
    {
      if (objc_msgSend(v7, "unsignedIntegerValue") == (id)a3)
        break;
    }
    if (++v6 >= (unint64_t)-[NSMutableArray count](self->mPlacardToTargetMap, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)setTarget:(unint64_t)a3 forPlacard:(unint64_t)a4
{
  NSMutableArray *mPlacardToTargetMap;
  id v8;
  uint64_t v9;
  unint64_t v10;

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    mPlacardToTargetMap = self->mPlacardToTargetMap;
    if (!mPlacardToTargetMap)
    {
      mPlacardToTargetMap = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->mPlacardToTargetMap = mPlacardToTargetMap;
    }
    if ((unint64_t)-[NSMutableArray count](mPlacardToTargetMap, "count") <= a4)
    {
      v8 = -[NSMutableArray count](self->mPlacardToTargetMap, "count");
      if ((id)(a4 + 1) != v8)
      {
        if (a4 + 1 - (unint64_t)v8 <= 1)
          v9 = 1;
        else
          v9 = a4 + 1 - (_QWORD)v8;
        do
        {
          -[NSMutableArray addObject:](self->mPlacardToTargetMap, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0x7FFFFFFFFFFFFFFFLL));
          --v9;
        }
        while (v9);
      }
    }
    v10 = -[TSWReviewMatchingAnswerState placardForTarget:](self, "placardForTarget:", a3);
    if (v10 != a4)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->mPlacardToTargetMap, "replaceObjectAtIndex:withObject:", v10, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0x7FFFFFFFFFFFFFFFLL));
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->mPlacardToTargetMap, "replaceObjectAtIndex:withObject:", a4, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    }
  }
}

- (void)setPlacardToTargetMap:(id)a3
{

  self->mPlacardToTargetMap = 0;
  self->mPlacardToTargetMap = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
}

- (unint64_t)numSelectedTargets
{
  NSMutableArray *mPlacardToTargetMap;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (!mPlacardToTargetMap)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPlacardToTargetMap, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(mPlacardToTargetMap);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue") != (id)0x7FFFFFFFFFFFFFFFLL)
        ++v5;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPlacardToTargetMap, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)hasUserSelected
{
  NSMutableArray *mPlacardToTargetMap;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (mPlacardToTargetMap)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPlacardToTargetMap, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(mPlacardToTargetMap);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue") != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v3) = 1;
            return (char)v3;
          }
        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mPlacardToTargetMap, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        LOBYTE(v3) = 0;
        if (v4)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (id)description
{
  NSMutableArray *mPlacardToTargetMap;

  mPlacardToTargetMap = self->mPlacardToTargetMap;
  if (mPlacardToTargetMap)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("matchAnswer<<%@>>"), objc_msgSend(-[NSMutableArray arrayPiecewiseTransformedBy:](mPlacardToTargetMap, "arrayPiecewiseTransformedBy:", &stru_4296C0), "componentsJoinedByString:", CFSTR(",")));
  else
    return CFSTR("<matchAnswer<>>");
}

- (NSArray)placardToTargetMap
{
  return &self->mPlacardToTargetMap->super;
}

@end
