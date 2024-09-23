@implementation CHASAdvancedGoalViewFactory

+ (id)makeViewWithGoalSchedule:(id)a3 goalDaysModel:(id)a4 wheelchairUser:(BOOL)a5 goalType:(int64_t)a6 formattingManager:(id)a7 showFooter:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  void *v16;

  v8 = a8;
  v11 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = (void *)sub_100449C34(v14, v11, a6, (uint64_t)v15, v8);

  return v16;
}

- (CHASAdvancedGoalViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AdvancedGoalViewFactory();
  return -[CHASAdvancedGoalViewFactory init](&v3, "init");
}

@end
