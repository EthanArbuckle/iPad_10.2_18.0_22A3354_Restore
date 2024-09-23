@implementation _SOAlarmsSnapshotMutation

- (_SOAlarmsSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _SOAlarmsSnapshotMutation *v6;
  _SOAlarmsSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOAlarmsSnapshotMutation;
  v6 = -[_SOAlarmsSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    -[SOAlarmsSnapshot date](self->_base, "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getAlarmsByID
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmsByID;
  }
  else
  {
    -[SOAlarmsSnapshot alarmsByID](self->_base, "alarmsByID");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmsByID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmsByID, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getFiringAlarmIDs
{
  NSOrderedSet *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_firingAlarmIDs;
  }
  else
  {
    -[SOAlarmsSnapshot firingAlarmIDs](self->_base, "firingAlarmIDs");
    v2 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setFiringAlarmIDs:(id)a3
{
  objc_storeStrong((id *)&self->_firingAlarmIDs, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getDismissedAlarmIDs
{
  NSOrderedSet *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_dismissedAlarmIDs;
  }
  else
  {
    -[SOAlarmsSnapshot dismissedAlarmIDs](self->_base, "dismissedAlarmIDs");
    v2 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDismissedAlarmIDs:(id)a3
{
  objc_storeStrong((id *)&self->_dismissedAlarmIDs, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_firingAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
