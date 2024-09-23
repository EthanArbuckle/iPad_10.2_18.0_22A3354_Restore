@implementation _SOTimersSnapshotMutation

- (_SOTimersSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _SOTimersSnapshotMutation *v6;
  _SOTimersSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SOTimersSnapshotMutation;
  v6 = -[_SOTimersSnapshotMutation init](&v9, sel_init);
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
    -[SOTimersSnapshot date](self->_base, "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getTimersByID
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_timersByID;
  }
  else
  {
    -[SOTimersSnapshot timersByID](self->_base, "timersByID");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTimersByID:(id)a3
{
  objc_storeStrong((id *)&self->_timersByID, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
