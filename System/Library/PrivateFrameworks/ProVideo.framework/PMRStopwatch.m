@implementation PMRStopwatch

- (PMRStopwatch)init
{
  return -[PMRStopwatch initWithDomain:](self, "initWithDomain:", 0);
}

- (PMRStopwatch)initWithDomain:(id)a3
{
  PMRStopwatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMRStopwatch;
  v4 = -[PMRStopwatch init](&v6, sel_init);
  if (v4)
  {
    v4->_splitTimes = (NSMutableArray *)objc_opt_new();
    v4->_startTime = mach_absolute_time();
    v4->_domain = (NSString *)objc_msgSend(a3, "copy");
    v4->_maxSplitTimes = 1000;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMRStopwatch;
  -[PMRStopwatch dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  objc_super v6;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)PMRStopwatch;
  v4 = -[PMRStopwatch description](&v6, sel_description);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (startTime=%.3f, splitTimes=%lu, maxSplitTimes=%lu)"), v4, (double)(self->_startTime * (info.numer / info.denom)) / 1000000000.0, -[NSMutableArray count](self->_splitTimes, "count"), self->_maxSplitTimes);
}

- (id)_subtreeDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  NSMutableArray *obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_msgSend(-[PMRStopwatch description](self, "description"), "mutableCopy");
  v15 = objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  if (-[NSMutableArray count](self->_splitTimes, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = self->_splitTimes;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(obj);
          v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "performSelector:", sel__subtreeDescription), "componentsSeparatedByCharactersInSet:", v15);
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v17 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v10);
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v5);
    }
  }
  return v3;
}

+ (id)sharedStopwatch
{
  return (id)__stopwatch;
}

+ (void)setSharedStopwatch:(id)a3
{
  __stopwatch = (uint64_t)a3;
}

- (void)reset
{
  NSMutableArray *v3;

  v3 = self->_splitTimes;
  self->_splitTimes = (NSMutableArray *)objc_opt_new();
  self->_startTime = mach_absolute_time();
}

- (void)_purgeOldestSplitTimeIfNeeded
{
  if (self->_maxSplitTimes)
  {
    if (-[NSMutableArray count](self->_splitTimes, "count") >= self->_maxSplitTimes)
      -[NSMutableArray removeObjectAtIndex:](self->_splitTimes, "removeObjectAtIndex:", 0);
  }
}

- (void)beginTimingGroupForMethod:(SEL)a3 inClass:(Class)a4 comment:(id)a5
{
  id v9;
  NSString *v10;
  PMRSplitTime *v11;
  NSMutableArray *splitTimeStack;
  id v13;

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = NSStringFromClass(a4);
  v13 = (id)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v10, NSStringFromSelector(a3));
  v11 = -[PMRSplitTime initWithKey:comment:level:]([PMRSplitTime alloc], "initWithKey:comment:level:", v13, a5, -[NSMutableArray count](self->_splitTimeStack, "count"));
  if (-[NSMutableArray count](self->_splitTimeStack, "count"))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](self->_splitTimeStack, "lastObject"), "addSplitTimesObject:", v11);
  }
  else
  {
    -[PMRStopwatch _purgeOldestSplitTimeIfNeeded](self, "_purgeOldestSplitTimeIfNeeded");
    -[NSMutableArray addObject:](self->_splitTimes, "addObject:", v11);
  }

  splitTimeStack = self->_splitTimeStack;
  if (!splitTimeStack)
  {
    splitTimeStack = (NSMutableArray *)objc_opt_new();
    self->_splitTimeStack = splitTimeStack;
  }
  -[NSMutableArray addObject:](splitTimeStack, "addObject:", v11);

}

- (void)endTimingGroup
{
  -[NSMutableArray removeLastObject](self->_splitTimeStack, "removeLastObject");
}

+ (void)benchmarkBlockWithTitle:(id)a3 iterations:(unint64_t)a4 usingBlock:(id)a5 onCompletion:(id)a6
{
  objc_msgSend((id)objc_opt_new(), "benchmarkBlockWithTitle:iterations:currentIteration:usingBlock:onCompletion:", a3, a4, 0, a5, a6);
}

- (void)logToLocation:(id)a3 key:(id)a4
{
  if (a3)
    -[PMRStopwatch writeToFile:key:comment:fileFormat:](self, "writeToFile:key:comment:fileFormat:", a3, a4, 0, 1);
  else
    NSLog(CFSTR("%@"), -[PMRStopwatch descriptionWithFormat:key:comment:](self, "descriptionWithFormat:key:comment:", 1, a4, 0));
}

- (void)addSplit:(id)a3
{
  if (-[NSMutableArray count](self->_splitTimeStack, "count"))
  {
    objc_msgSend((id)-[NSMutableArray lastObject](self->_splitTimeStack, "lastObject"), "addSplitTimesObject:", a3);
  }
  else
  {
    -[PMRStopwatch _purgeOldestSplitTimeIfNeeded](self, "_purgeOldestSplitTimeIfNeeded");
    -[NSMutableArray addObject:](self->_splitTimes, "addObject:", a3);
  }
}

- (void)logEvent:(id)a3 comment:(id)a4
{
  -[PMRStopwatch logEvent:comment:userInfo:](self, "logEvent:comment:userInfo:", a3, a4, 0);
}

- (void)logEvent:(id)a3 comment:(id)a4 userInfo:(id)a5
{
  PMRSplitTime *v6;

  v6 = -[PMRSplitTime initWithKey:comment:level:duration:userInfo:]([PMRSplitTime alloc], "initWithKey:comment:level:duration:userInfo:", a3, a4, -[NSMutableArray count](self->_splitTimeStack, "count"), 0, a5);
  -[PMRStopwatch addSplit:](self, "addSplit:", v6);

}

- (id)descriptionWithFormat:(int)a3 key:(id)a4 comment:(id)a5
{
  NSString *v9;
  const __CFString *v10;
  NSMutableArray *splitTimes;
  unint64_t startTime;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const __CFString *v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  const __CFString *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  mach_timebase_info info;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  info = 0;
  mach_timebase_info(&info);
  if (-[NSMutableArray count](self->_splitTimes, "count"))
  {
    v35 = a5;
    v36 = a4;
    v38 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = -[PMRStopwatch domain](self, "domain");
    v10 = CFSTR("undefined");
    if (v9)
      v10 = (const __CFString *)v9;
    v37 = v10;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    startTime = self->_startTime;
    splitTimes = self->_splitTimes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](splitTimes, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      v16 = 0.0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          v18 = startTime;
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(splitTimes);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          startTime = objc_msgSend(v19, "splitTime");
          v20 = objc_msgSend(v19, "duration");
          v21 = info.numer / info.denom;
          v22 = (double)(unint64_t)(v20 * v21) / 1000000.0;
          if (v22 == 0.0)
            v22 = (double)((startTime - v18) * v21) / 1000000.0;
          v23 = (const __CFString *)objc_msgSend(v19, "comment");
          v24 = -[PMRStopwatch formattedUserInfoForSplitTime:](self, "formattedUserInfoForSplitTime:", v19);
          if (a3 == 1)
          {
            v25 = v24;
            if (!v23)
              v23 = &stru_1E65EDDA0;
            v30 = objc_msgSend(v19, "key");
            objc_msgSend(v38, "appendFormat:", CFSTR("\t<Measurement key=\"%@\" value=\"%.3f\" comment=\"%@\" domain=\"%@\" %@ timestamp=\"%.3f\"/>\n"), v30, *(_QWORD *)&v22, v23, v37, v25, (double)(startTime * (info.numer / info.denom)) / 1000000000.0);
          }
          else if (a3 == 2)
          {
            objc_msgSend(v38, "appendFormat:", CFSTR("%@\t%.3f\n"), objc_msgSend(v19, "key"), *(_QWORD *)&v22, v31, v32, v33, v34);
          }
          v16 = v16 + v22;
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](splitTimes, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.0;
    }
    if (a3 == 1)
    {
      a4 = v36;
      v26 = objc_msgSend(v36, "stringByAppendingString:", CFSTR("sum"));
      objc_msgSend(v38, "appendFormat:", CFSTR("\t<Measurement key=\"%@\" value=\"%.3f\" comment=\"%@\" domain=\"%@\" timestamp=\"%.3f\"/>\n"), v26, *(_QWORD *)&v16, v35, v37, (double)(mach_absolute_time() * (info.numer / info.denom)) / 1000000000.0);
    }
    else
    {
      a4 = v36;
      if (a3 == 2)
        objc_msgSend(v38, "appendFormat:", CFSTR("%@\t%.3f\n"), objc_msgSend(v36, "stringByAppendingString:", CFSTR("sum")), *(_QWORD *)&v16, v31, v32, v33);
    }
  }
  else
  {
    v38 = 0;
  }
  if (-[PMRStopwatch coreAnimationTotalTime](self, "coreAnimationTotalTime"))
  {
    if (!a3)
    {
      v27 = CFSTR("{ key :\"%@coreAnimationSum(ms)\", value : \"%.3f\",\n");
      goto LABEL_31;
    }
    if (a3 == 1)
    {
      v27 = CFSTR("\t<Measurement key=\"%@coreAnimationSum(ms)\" value=\"%.3f\" />\n");
LABEL_31:
      v28 = -[PMRStopwatch coreAnimationTotalTime](self, "coreAnimationTotalTime");
      objc_msgSend(v38, "appendFormat:", v27, a4, (double)(v28 * (info.numer / info.denom)) / 1000000.0);
    }
  }
  return v38;
}

- (id)formattedUserInfoForSplitTime:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@=\"%@\" "), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)logWithFormat:(int)a3
{
  puts((const char *)objc_msgSend(-[PMRStopwatch descriptionWithFormat:key:comment:](self, "descriptionWithFormat:key:comment:", *(_QWORD *)&a3, 0, 0), "UTF8String"));
}

- (void)writeToFile:(id)a3 key:(id)a4 comment:(id)a5 fileFormat:(int)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = 0;
  v8 = -[PMRStopwatch descriptionWithFormat:key:comment:](self, "descriptionWithFormat:key:comment:", *(_QWORD *)&a6, a4, a5);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((objc_msgSend(a3, "hasPrefix:", CFSTR("/")) & 1) != 0)
    {
      v11 = objc_msgSend(a3, "stringByExpandingTildeInPath");
    }
    else
    {
      v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
      v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("~/Library/Logs/%@/"), v12), "stringByExpandingTildeInPath");
      objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 0, 0, 0);
      v11 = objc_msgSend(v13, "stringByAppendingPathComponent:", a3);
    }
    v14 = v11;
    if ((objc_msgSend(v10, "fileExistsAtPath:", v11) & 1) != 0)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v14);
      objc_msgSend(v15, "seekToEndOfFile");
      objc_msgSend(v15, "writeData:", objc_msgSend(v9, "dataUsingEncoding:", 4));
    }
    else
    {
      objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v14, 1, 4, &v16);
    }
  }
  -[NSMutableArray removeAllObjects](self->_splitTimes, "removeAllObjects");
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSArray)splitTimes
{
  return &self->_splitTimes->super;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)maxSplitTimes
{
  return self->_maxSplitTimes;
}

- (void)setMaxSplitTimes:(unint64_t)a3
{
  self->_maxSplitTimes = a3;
}

- (unint64_t)coreAnimationTotalTime
{
  return self->_coreAnimationTotalTime;
}

- (void)setCoreAnimationTotalTime:(unint64_t)a3
{
  self->_coreAnimationTotalTime = a3;
}

@end
