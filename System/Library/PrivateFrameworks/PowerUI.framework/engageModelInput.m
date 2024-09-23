@implementation engageModelInput

- (engageModelInput)initWithPlugin_battery_level:(double)a3 time_from_plugin:(double)a4 med_dur_1:(double)a5 med_dur_2:(double)a6 med_dur_4:(double)a7 med_dur_8:(double)a8 med_dur_16:(double)a9 med_dur_24:(double)a10 cnt_dur_1:(double)a11 cnt_dur_2:(double)a12 cnt_dur_4:(double)a13 cnt_dur_8:(double)a14 cnt_dur_16:(double)a15 cnt_dur_24:(double)a16 std_dur_1:(double)a17 std_dur_2:(double)a18 std_dur_4:(double)a19 std_dur_8:(double)a20 std_dur_16:(double)a21 std_dur_24:(double)a22 weekday_med_dur_1:(double)a23 weekday_med_dur_2:(double)a24 weekday_med_dur_4:(double)a25 weekday_med_dur_8:(double)a26 weekday_med_dur_24:(double)a27 weekday_std_dur_4:(double)a28
{
  engageModelInput *result;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)engageModelInput;
  result = -[engageModelInput init](&v37, sel_init);
  if (result)
  {
    result->_plugin_battery_level = a3;
    result->_time_from_plugin = a4;
    result->_med_dur_1 = a5;
    result->_med_dur_2 = a6;
    result->_med_dur_4 = a7;
    result->_med_dur_8 = a8;
    result->_med_dur_16 = a9;
    result->_med_dur_24 = a10;
    result->_cnt_dur_1 = a11;
    result->_cnt_dur_2 = a12;
    result->_cnt_dur_4 = a13;
    result->_cnt_dur_8 = a14;
    result->_cnt_dur_16 = a15;
    result->_cnt_dur_24 = a16;
    result->_std_dur_1 = a17;
    result->_std_dur_2 = a18;
    result->_std_dur_4 = a19;
    result->_std_dur_8 = a20;
    result->_std_dur_16 = a21;
    result->_std_dur_24 = a22;
    result->_weekday_med_dur_1 = a23;
    result->_weekday_med_dur_2 = a24;
    result->_weekday_med_dur_4 = a25;
    result->_weekday_med_dur_8 = a26;
    result->_weekday_med_dur_24 = a27;
    result->_weekday_std_dur_4 = a28;
  }
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D44ACE0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("plugin_battery_level")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput plugin_battery_level](self, "plugin_battery_level");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("time_from_plugin")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput time_from_plugin](self, "time_from_plugin");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_8"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_16"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("med_dur_24")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput med_dur](self, "med_dur");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_8"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_16"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("cnt_dur_24")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput cnt_dur](self, "cnt_dur");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_8"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_16"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("std_dur_24")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput std_dur](self, "std_dur");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_med_dur_1"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_med_dur_2"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_med_dur_4"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_med_dur_8"))
         || objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_med_dur_24")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput weekday_med_dur](self, "weekday_med_dur");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("weekday_std_dur_4")))
    {
      v6 = 0;
      goto LABEL_43;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[engageModelInput weekday_std_dur](self, "weekday_std_dur");
  }
  objc_msgSend(v5, "featureValueWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v6;
}

- (double)plugin_battery_level
{
  return self->_plugin_battery_level;
}

- (void)setPlugin_battery_level:(double)a3
{
  self->_plugin_battery_level = a3;
}

- (double)time_from_plugin
{
  return self->_time_from_plugin;
}

- (void)setTime_from_plugin:(double)a3
{
  self->_time_from_plugin = a3;
}

- (double)med_dur_1
{
  return self->_med_dur_1;
}

- (void)setMed_dur_1:(double)a3
{
  self->_med_dur_1 = a3;
}

- (double)med_dur_2
{
  return self->_med_dur_2;
}

- (void)setMed_dur_2:(double)a3
{
  self->_med_dur_2 = a3;
}

- (double)med_dur_4
{
  return self->_med_dur_4;
}

- (void)setMed_dur_4:(double)a3
{
  self->_med_dur_4 = a3;
}

- (double)med_dur_8
{
  return self->_med_dur_8;
}

- (void)setMed_dur_8:(double)a3
{
  self->_med_dur_8 = a3;
}

- (double)med_dur_16
{
  return self->_med_dur_16;
}

- (void)setMed_dur_16:(double)a3
{
  self->_med_dur_16 = a3;
}

- (double)med_dur_24
{
  return self->_med_dur_24;
}

- (void)setMed_dur_24:(double)a3
{
  self->_med_dur_24 = a3;
}

- (double)cnt_dur_1
{
  return self->_cnt_dur_1;
}

- (void)setCnt_dur_1:(double)a3
{
  self->_cnt_dur_1 = a3;
}

- (double)cnt_dur_2
{
  return self->_cnt_dur_2;
}

- (void)setCnt_dur_2:(double)a3
{
  self->_cnt_dur_2 = a3;
}

- (double)cnt_dur_4
{
  return self->_cnt_dur_4;
}

- (void)setCnt_dur_4:(double)a3
{
  self->_cnt_dur_4 = a3;
}

- (double)cnt_dur_8
{
  return self->_cnt_dur_8;
}

- (void)setCnt_dur_8:(double)a3
{
  self->_cnt_dur_8 = a3;
}

- (double)cnt_dur_16
{
  return self->_cnt_dur_16;
}

- (void)setCnt_dur_16:(double)a3
{
  self->_cnt_dur_16 = a3;
}

- (double)cnt_dur_24
{
  return self->_cnt_dur_24;
}

- (void)setCnt_dur_24:(double)a3
{
  self->_cnt_dur_24 = a3;
}

- (double)std_dur_1
{
  return self->_std_dur_1;
}

- (void)setStd_dur_1:(double)a3
{
  self->_std_dur_1 = a3;
}

- (double)std_dur_2
{
  return self->_std_dur_2;
}

- (void)setStd_dur_2:(double)a3
{
  self->_std_dur_2 = a3;
}

- (double)std_dur_4
{
  return self->_std_dur_4;
}

- (void)setStd_dur_4:(double)a3
{
  self->_std_dur_4 = a3;
}

- (double)std_dur_8
{
  return self->_std_dur_8;
}

- (void)setStd_dur_8:(double)a3
{
  self->_std_dur_8 = a3;
}

- (double)std_dur_16
{
  return self->_std_dur_16;
}

- (void)setStd_dur_16:(double)a3
{
  self->_std_dur_16 = a3;
}

- (double)std_dur_24
{
  return self->_std_dur_24;
}

- (void)setStd_dur_24:(double)a3
{
  self->_std_dur_24 = a3;
}

- (double)weekday_med_dur_1
{
  return self->_weekday_med_dur_1;
}

- (void)setWeekday_med_dur_1:(double)a3
{
  self->_weekday_med_dur_1 = a3;
}

- (double)weekday_med_dur_2
{
  return self->_weekday_med_dur_2;
}

- (void)setWeekday_med_dur_2:(double)a3
{
  self->_weekday_med_dur_2 = a3;
}

- (double)weekday_med_dur_4
{
  return self->_weekday_med_dur_4;
}

- (void)setWeekday_med_dur_4:(double)a3
{
  self->_weekday_med_dur_4 = a3;
}

- (double)weekday_med_dur_8
{
  return self->_weekday_med_dur_8;
}

- (void)setWeekday_med_dur_8:(double)a3
{
  self->_weekday_med_dur_8 = a3;
}

- (double)weekday_med_dur_24
{
  return self->_weekday_med_dur_24;
}

- (void)setWeekday_med_dur_24:(double)a3
{
  self->_weekday_med_dur_24 = a3;
}

- (double)weekday_std_dur_4
{
  return self->_weekday_std_dur_4;
}

- (void)setWeekday_std_dur_4:(double)a3
{
  self->_weekday_std_dur_4 = a3;
}

@end
