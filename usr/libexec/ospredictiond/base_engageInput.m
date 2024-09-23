@implementation base_engageInput

- (base_engageInput)initWithClassic_time_between_uses_med_dur_1:(double)a3 classic_time_between_uses_med_dur_2:(double)a4 classic_time_between_uses_med_dur_4:(double)a5 classic_time_between_uses_med_dur_24:(double)a6 classic_time_between_uses_std_dur_1:(double)a7 classic_time_between_uses_std_dur_2:(double)a8 classic_time_between_uses_std_dur_4:(double)a9 classic_time_between_uses_std_dur_24:(double)a10 hour:(double)a11 is_weekend:(double)a12 hour_plus_0:(double)a13 hour_plus_1:(double)a14 hour_plus_2:(double)a15 hour_plus_3:(double)a16 hour_plus_4:(double)a17 hour_plus_5:(double)a18 hours_until_use:(double)a19 meaningful_undercharge_rolling_average:(double)a20
{
  base_engageInput *result;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)base_engageInput;
  result = -[base_engageInput init](&v29, "init");
  if (result)
  {
    result->_classic_time_between_uses_med_dur_1 = a3;
    result->_classic_time_between_uses_med_dur_2 = a4;
    result->_classic_time_between_uses_med_dur_4 = a5;
    result->_classic_time_between_uses_med_dur_24 = a6;
    result->_classic_time_between_uses_std_dur_1 = a7;
    result->_classic_time_between_uses_std_dur_2 = a8;
    result->_classic_time_between_uses_std_dur_4 = a9;
    result->_classic_time_between_uses_std_dur_24 = a10;
    result->_hour = a11;
    result->_is_weekend = a12;
    result->_hour_plus_0 = a13;
    result->_hour_plus_1 = a14;
    result->_hour_plus_2 = a15;
    result->_hour_plus_3 = a16;
    result->_hour_plus_4 = a17;
    result->_hour_plus_5 = a18;
    result->_hours_until_use = a19;
    result->_meaningful_undercharge_rolling_average = a20;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000659F8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_med_dur_1"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_med_dur_2"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_med_dur_4"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_med_dur_24")))
  {
    -[base_engageInput classic_time_between_uses_med_dur](self, "classic_time_between_uses_med_dur");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_std_dur_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_std_dur_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_std_dur_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("classic_time_between_uses_std_dur_24")))
  {
    -[base_engageInput classic_time_between_uses_std_dur](self, "classic_time_between_uses_std_dur");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hour")))
  {
    -[base_engageInput hour](self, "hour");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("is_weekend")))
  {
    -[base_engageInput is_weekend](self, "is_weekend");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_0"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_3"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("hour_plus_5")))
  {
    -[base_engageInput hour_plus](self, "hour_plus");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("hours_until_use")))
  {
    -[base_engageInput hours_until_use](self, "hours_until_use");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("meaningful_undercharge_rolling_average")))
    {
      v5 = 0;
      goto LABEL_31;
    }
    -[base_engageInput meaningful_undercharge_rolling_average](self, "meaningful_undercharge_rolling_average");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:"));
LABEL_31:

  return v5;
}

- (double)classic_time_between_uses_med_dur_1
{
  return self->_classic_time_between_uses_med_dur_1;
}

- (void)setClassic_time_between_uses_med_dur_1:(double)a3
{
  self->_classic_time_between_uses_med_dur_1 = a3;
}

- (double)classic_time_between_uses_med_dur_2
{
  return self->_classic_time_between_uses_med_dur_2;
}

- (void)setClassic_time_between_uses_med_dur_2:(double)a3
{
  self->_classic_time_between_uses_med_dur_2 = a3;
}

- (double)classic_time_between_uses_med_dur_4
{
  return self->_classic_time_between_uses_med_dur_4;
}

- (void)setClassic_time_between_uses_med_dur_4:(double)a3
{
  self->_classic_time_between_uses_med_dur_4 = a3;
}

- (double)classic_time_between_uses_med_dur_24
{
  return self->_classic_time_between_uses_med_dur_24;
}

- (void)setClassic_time_between_uses_med_dur_24:(double)a3
{
  self->_classic_time_between_uses_med_dur_24 = a3;
}

- (double)classic_time_between_uses_std_dur_1
{
  return self->_classic_time_between_uses_std_dur_1;
}

- (void)setClassic_time_between_uses_std_dur_1:(double)a3
{
  self->_classic_time_between_uses_std_dur_1 = a3;
}

- (double)classic_time_between_uses_std_dur_2
{
  return self->_classic_time_between_uses_std_dur_2;
}

- (void)setClassic_time_between_uses_std_dur_2:(double)a3
{
  self->_classic_time_between_uses_std_dur_2 = a3;
}

- (double)classic_time_between_uses_std_dur_4
{
  return self->_classic_time_between_uses_std_dur_4;
}

- (void)setClassic_time_between_uses_std_dur_4:(double)a3
{
  self->_classic_time_between_uses_std_dur_4 = a3;
}

- (double)classic_time_between_uses_std_dur_24
{
  return self->_classic_time_between_uses_std_dur_24;
}

- (void)setClassic_time_between_uses_std_dur_24:(double)a3
{
  self->_classic_time_between_uses_std_dur_24 = a3;
}

- (double)hour
{
  return self->_hour;
}

- (void)setHour:(double)a3
{
  self->_hour = a3;
}

- (double)is_weekend
{
  return self->_is_weekend;
}

- (void)setIs_weekend:(double)a3
{
  self->_is_weekend = a3;
}

- (double)hour_plus_0
{
  return self->_hour_plus_0;
}

- (void)setHour_plus_0:(double)a3
{
  self->_hour_plus_0 = a3;
}

- (double)hour_plus_1
{
  return self->_hour_plus_1;
}

- (void)setHour_plus_1:(double)a3
{
  self->_hour_plus_1 = a3;
}

- (double)hour_plus_2
{
  return self->_hour_plus_2;
}

- (void)setHour_plus_2:(double)a3
{
  self->_hour_plus_2 = a3;
}

- (double)hour_plus_3
{
  return self->_hour_plus_3;
}

- (void)setHour_plus_3:(double)a3
{
  self->_hour_plus_3 = a3;
}

- (double)hour_plus_4
{
  return self->_hour_plus_4;
}

- (void)setHour_plus_4:(double)a3
{
  self->_hour_plus_4 = a3;
}

- (double)hour_plus_5
{
  return self->_hour_plus_5;
}

- (void)setHour_plus_5:(double)a3
{
  self->_hour_plus_5 = a3;
}

- (double)hours_until_use
{
  return self->_hours_until_use;
}

- (void)setHours_until_use:(double)a3
{
  self->_hours_until_use = a3;
}

- (double)meaningful_undercharge_rolling_average
{
  return self->_meaningful_undercharge_rolling_average;
}

- (void)setMeaningful_undercharge_rolling_average:(double)a3
{
  self->_meaningful_undercharge_rolling_average = a3;
}

@end
