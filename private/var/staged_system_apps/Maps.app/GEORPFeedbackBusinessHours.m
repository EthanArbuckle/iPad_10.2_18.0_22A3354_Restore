@implementation GEORPFeedbackBusinessHours

- (id)initWithHoursType:(int)a3
{
  uint64_t v3;
  GEORPFeedbackBusinessHours *v4;
  GEORPFeedbackBusinessHours *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackBusinessHours;
  v4 = -[GEORPFeedbackBusinessHours init](&v7, "init");
  v5 = v4;
  if (v4)
    -[GEORPFeedbackBusinessHours setHoursType:](v4, "setHoursType:", v3);
  return v5;
}

@end
