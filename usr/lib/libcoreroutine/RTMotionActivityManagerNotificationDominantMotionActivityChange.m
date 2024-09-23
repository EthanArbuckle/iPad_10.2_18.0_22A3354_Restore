@implementation RTMotionActivityManagerNotificationDominantMotionActivityChange

- (RTMotionActivityManagerNotificationDominantMotionActivityChange)initWithDominantMotionActivity:(id)a3
{
  id v4;
  RTMotionActivityManagerNotificationDominantMotionActivityChange *v5;
  uint64_t v6;
  RTMotionActivity *dominantMotionActivity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityManagerNotificationDominantMotionActivityChange;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dominantMotionActivity = v5->_dominantMotionActivity;
    v5->_dominantMotionActivity = (RTMotionActivity *)v6;

  }
  return v5;
}

- (RTMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantMotionActivity, 0);
}

@end
