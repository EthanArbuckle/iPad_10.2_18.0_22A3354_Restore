@implementation _BKTouchSensitiveButtonEventRecord

- (_BKTouchSensitiveButtonEventRecord)init
{
  _BKTouchSensitiveButtonEventRecord *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *stagesEntered;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BKTouchSensitiveButtonEventRecord;
  v2 = -[_BKTouchSensitiveButtonEventRecord init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    stagesEntered = v2->_stagesEntered;
    v2->_stagesEntered = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_stagesEntered, 0);
}

@end
