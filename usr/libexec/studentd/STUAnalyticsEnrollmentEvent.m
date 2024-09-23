@implementation STUAnalyticsEnrollmentEvent

- (STUAnalyticsEnrollmentEvent)initWithConfigurationType:(unint64_t)a3 courseCount:(unint64_t)a4
{
  STUAnalyticsEnrollmentEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUAnalyticsEnrollmentEvent;
  result = -[STUAnalyticsEnrollmentEvent init](&v7, "init");
  if (result)
  {
    result->_configurationType = a3;
    result->_courseCount = a4;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.classroom.student.enrollment");
}

- (NSDictionary)dictionaryValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("ConfigurationType");
  v3 = CRKStringForConfigurationType(-[STUAnalyticsEnrollmentEvent configurationType](self, "configurationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v8[1] = CFSTR("CourseCount");
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUAnalyticsEnrollmentEvent courseCount](self, "courseCount")));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return (NSDictionary *)v6;
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (unint64_t)courseCount
{
  return self->_courseCount;
}

@end
