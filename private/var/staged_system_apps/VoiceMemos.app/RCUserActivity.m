@implementation RCUserActivity

- (int64_t)subActivityType
{
  return self->_subActivityType;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (BOOL)transitionToActivityType:(int64_t)a3 subType:(int64_t)a4 withDisplayModel:(id)a5
{
  id v8;

  v8 = a5;
  -[RCUserActivity setActivityType:](self, "setActivityType:", a3);
  -[RCUserActivity setSubActivityType:](self, "setSubActivityType:", a4);
  -[RCUserActivity setDisplayModel:](self, "setDisplayModel:", v8);

  return 1;
}

- (BOOL)isTrim
{
  return (id)-[RCUserActivity subActivityType](self, "subActivityType") == (id)2;
}

- (BOOL)requiresDismissalAtEndOfCapture
{
  return +[RCUserActivity requiresDismissalAtEndOfCaptureForActivityType:subActivityType:](RCUserActivity, "requiresDismissalAtEndOfCaptureForActivityType:subActivityType:", -[RCUserActivity activityType](self, "activityType"), -[RCUserActivity subActivityType](self, "subActivityType"));
}

+ (BOOL)requiresDismissalAtEndOfCaptureForActivityType:(int64_t)a3 subActivityType:(int64_t)a4
{
  return (a4 == 3 || a4 == 5) && a3 == 1;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (void)setSubActivityType:(int64_t)a3
{
  self->_subActivityType = a3;
}

- (RCRecordingDisplayModel)displayModel
{
  return self->_displayModel;
}

- (void)setDisplayModel:(id)a3
{
  objc_storeStrong((id *)&self->_displayModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayModel, 0);
}

@end
