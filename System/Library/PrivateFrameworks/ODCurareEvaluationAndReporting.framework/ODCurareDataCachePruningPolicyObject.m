@implementation ODCurareDataCachePruningPolicyObject

- (ODCurareDataCachePruningPolicyObject)initWithMaximumNumberOfDays:(int)a3 maximumNumberOfEvents:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  ODCurareDataCachePruningPolicyObject *v6;
  ODCurareDataCachePruningPolicyObject *v7;
  ODCurareDataCachePruningPolicyObject *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ODCurareDataCachePruningPolicyObject;
  v6 = -[ODCurareDataCachePruningPolicyObject init](&v10, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  if ((v5 & 0x80000000) != 0)
  {
    NSLog(CFSTR("[ODCurareDataCachePruningPolicyObject initWithMaximumNumberOfDays:maximumNumberOfEvents:] maximumNumberOfDays was negative: %d, returning nil."), v5);
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if ((v4 & 0x80000000) != 0)
  {
    NSLog(CFSTR("[ODCurareDataCachePruningPolicyObject initWithMaximumNumberOfDays:maximumNumberOfEvents:] maximumNumberOfEvents was negative: %d, returning nil."), v4);
    goto LABEL_8;
  }
  -[ODCurareDataCachePruningPolicyObject setMaximumNumberOfDays:](v6, "setMaximumNumberOfDays:", v5);
  -[ODCurareDataCachePruningPolicyObject setMaximumNumberOfEvents:](v7, "setMaximumNumberOfEvents:", v4);
LABEL_5:
  v8 = v7;
LABEL_9:

  return v8;
}

- (int64_t)maximumNumberOfDays
{
  return self->_maximumNumberOfDays;
}

- (void)setMaximumNumberOfDays:(int64_t)a3
{
  self->_maximumNumberOfDays = a3;
}

- (int64_t)maximumNumberOfEvents
{
  return self->_maximumNumberOfEvents;
}

- (void)setMaximumNumberOfEvents:(int64_t)a3
{
  self->_maximumNumberOfEvents = a3;
}

@end
