@implementation _SOAlarmMutation

- (_SOAlarmMutation)initWithBase:(id)a3
{
  id v5;
  _SOAlarmMutation *v6;
  _SOAlarmMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOAlarmMutation;
  v6 = -[_SOAlarmMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getAlarmID
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_alarmID;
  }
  else
  {
    -[SOAlarm alarmID](self->_base, "alarmID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmID, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAlarmURL
{
  NSURL *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmURL;
  }
  else
  {
    -[SOAlarm alarmURL](self->_base, "alarmURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmURL:(id)a3
{
  objc_storeStrong((id *)&self->_alarmURL, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getTitle
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_title;
  }
  else
  {
    -[SOAlarm title](self->_base, "title");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (unint64_t)getHour
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_hour;
  else
    return -[SOAlarm hour](self->_base, "hour");
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getMinute
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_minute;
  else
    return -[SOAlarm minute](self->_base, "minute");
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getRepeatSchedule
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_repeatSchedule;
  else
    return -[SOAlarm repeatSchedule](self->_base, "repeatSchedule");
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_isEnabled;
  else
    return -[SOAlarm isEnabled](self->_base, "isEnabled");
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getIsFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_isFiring;
  else
    return -[SOAlarm isFiring](self->_base, "isFiring");
}

- (void)setIsFiring:(BOOL)a3
{
  self->_isFiring = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
