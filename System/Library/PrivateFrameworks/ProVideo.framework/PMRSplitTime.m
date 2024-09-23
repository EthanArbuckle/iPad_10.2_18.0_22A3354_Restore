@implementation PMRSplitTime

- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5
{
  return -[PMRSplitTime initWithKey:comment:level:duration:userInfo:](self, "initWithKey:comment:level:duration:userInfo:", a3, a4, a5, 0, 0);
}

- (PMRSplitTime)initWithKey:(id)a3 comment:(id)a4 level:(int64_t)a5 duration:(unint64_t)a6 userInfo:(id)a7
{
  PMRSplitTime *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PMRSplitTime;
  v12 = -[PMRSplitTime init](&v14, sel_init);
  if (v12)
  {
    v12->_key = (NSString *)objc_msgSend(a3, "copy");
    v12->_comment = (NSString *)objc_msgSend(a4, "copy");
    v12->_splitTime = mach_absolute_time();
    v12->_level = a5;
    v12->_duration = a6;
    v12->_userInfo = (NSDictionary *)objc_msgSend(a7, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMRSplitTime;
  -[PMRSplitTime dealloc](&v3, sel_dealloc);
}

- (id)description
{
  NSString *comment;
  const __CFString *v4;
  unint64_t v5;
  void *v6;
  id v7;
  NSString *key;
  unint64_t v9;
  id v11;
  objc_super v12;
  objc_super v13;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  comment = self->_comment;
  if (comment)
    v4 = -[NSArray objectAtIndex:](-[NSString componentsSeparatedByCharactersInSet:](comment, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet")), "objectAtIndex:", 0);
  else
    v4 = &stru_1E65EDDA0;
  v5 = -[PMRSplitTime duration](self, "duration");
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)PMRSplitTime;
    v7 = -[PMRSplitTime description](&v13, sel_description);
    key = self->_key;
    v9 = -[PMRSplitTime duration](self, "duration");
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ key: %@, duration: %.3f, splitTimes=%li, comment: %@"), v7, key, (double)(v9 * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), v4);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PMRSplitTime;
    v11 = -[PMRSplitTime description](&v12, sel_description);
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ key: %@, timestamp: %.3f, splitTimes=%li, comment: %@"), v11, self->_key, (double)(self->_splitTime * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), v4);
  }
}

- (id)_subtreeDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self, 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  while (objc_msgSend(v2, "count"))
  {
    v4 = (void *)objc_msgSend(v2, "objectAtIndex:", 0);
    objc_msgSend(v2, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v4, "level") >= 1)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v3, "appendString:", CFSTR("    "));
        ++v5;
      }
      while (v5 < objc_msgSend(v4, "level"));
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), objc_msgSend(v4, "description"));
    objc_msgSend(v2, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, objc_msgSend(v4, "splitTimes"));
  }

  return v3;
}

- (id)dumpTraceLog
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self, 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  while (objc_msgSend(v2, "count"))
  {
    v4 = (void *)objc_msgSend(v2, "objectAtIndex:", 0);
    objc_msgSend(v2, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v4, "level") >= 1)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v3, "appendString:", CFSTR("  "));
        ++v5;
      }
      while (v5 < objc_msgSend(v4, "level"));
    }
    if (objc_msgSend(v4, "comment"))
    {
      v6 = (void *)objc_msgSend(v4, "comment");
      v7 = (const __CFString *)objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet")), "objectAtIndex:", 0);
    }
    else
    {
      v7 = &stru_1E65EDDA0;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), objc_msgSend(v4, "key"), v7));
    objc_msgSend(v2, "replaceObjectsInRange:withObjectsFromArray:", 0, 0, objc_msgSend(v4, "splitTimes"));
  }

  return v3;
}

- (void)addSplitTimesObject:(id)a3
{
  NSMutableArray *splitTimes;

  if (a3)
  {
    splitTimes = self->_splitTimes;
    if (!splitTimes)
    {
      splitTimes = (NSMutableArray *)objc_opt_new();
      self->_splitTimes = splitTimes;
    }
    -[NSMutableArray addObject:](splitTimes, "addObject:", a3);
  }
}

- (void)removeSplitTimesObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_splitTimes, "removeObject:", a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (unint64_t)splitTime
{
  return self->_splitTime;
}

- (void)setSplitTime:(unint64_t)a3
{
  self->_splitTime = a3;
}

- (NSArray)splitTimes
{
  return &self->_splitTimes->super;
}

- (void)setSplitTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
