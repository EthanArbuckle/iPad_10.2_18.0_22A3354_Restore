@implementation TUIStatsFeedEntryCollector

- (TUIStatsFeedEntryCollector)initWithMode:(unint64_t)a3 uid:(id)a4
{
  id v6;
  TUIStatsFeedEntryCollector *v7;
  TUIStatsFeedEntryCollector *v8;
  NSString *v9;
  NSString *uid;
  NSMutableArray *v11;
  NSMutableArray *passes;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIStatsFeedEntryCollector;
  v7 = -[TUIStatsFeedEntryCollector init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_mode = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    uid = v8->_uid;
    v8->_uid = v9;

    v8->_eventCount[28] = 0;
    *(_OWORD *)&v8->_eventCount[24] = 0u;
    *(_OWORD *)&v8->_eventCount[26] = 0u;
    *(_OWORD *)&v8->_eventCount[20] = 0u;
    *(_OWORD *)&v8->_eventCount[22] = 0u;
    *(_OWORD *)&v8->_eventCount[16] = 0u;
    *(_OWORD *)&v8->_eventCount[18] = 0u;
    *(_OWORD *)&v8->_eventCount[12] = 0u;
    *(_OWORD *)&v8->_eventCount[14] = 0u;
    *(_OWORD *)&v8->_eventCount[8] = 0u;
    *(_OWORD *)&v8->_eventCount[10] = 0u;
    *(_OWORD *)&v8->_eventCount[4] = 0u;
    *(_OWORD *)&v8->_eventCount[6] = 0u;
    *(_OWORD *)v8->_eventCount = 0u;
    *(_OWORD *)&v8->_eventCount[2] = 0u;
    *(_OWORD *)v8->_elapsedTime = 0u;
    *(_OWORD *)&v8->_elapsedTime[2] = 0u;
    v8->_elapsedTime[4] = 0.0;
    if ((v8->_mode & 2) != 0)
    {
      v11 = objc_opt_new(NSMutableArray);
      passes = v8->_passes;
      v8->_passes = v11;

    }
  }

  return v8;
}

- (void)updateWithPass:(id)a3
{
  id v4;
  unint64_t mode;
  uint64_t j;
  double v7;
  uint64_t i;
  id v9;
  id v10;

  v4 = a3;
  mode = self->_mode;
  v10 = v4;
  if ((mode & 4) == 0)
  {
    if ((mode & 8) == 0)
      goto LABEL_3;
LABEL_9:
    for (i = 0; i != 29; ++i)
    {
      v9 = objc_msgSend(v4, "countForEvent:", i);
      v4 = v10;
      self->_eventCount[i] += (unint64_t)v9;
    }
    if ((self->_mode & 2) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  for (j = 0; j != 5; ++j)
  {
    objc_msgSend(v4, "elapsedTimeForPhase:", j);
    v4 = v10;
    self->_elapsedTime[j] = v7 + self->_elapsedTime[j];
  }
  mode = self->_mode;
  if ((mode & 8) != 0)
    goto LABEL_9;
LABEL_3:
  if ((mode & 2) != 0)
  {
LABEL_4:
    -[NSMutableArray addObject:](self->_passes, "addObject:", v10);
    v4 = v10;
  }
LABEL_5:

}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSMutableArray)passes
{
  return self->_passes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end
