@implementation SSMetricsMutableEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  SSMetricsMutableEvent *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_C3BAD0(a3, v8, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

+ (id)Topic
{
  return String._bridgeToObjectiveC()();
}

@end
