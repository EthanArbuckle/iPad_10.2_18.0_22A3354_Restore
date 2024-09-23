@implementation ALActivityOverrideMsg

- (void)dealloc
{
  objc_super v3;

  -[ALActivityOverrideMsg setActivity:](self, "setActivity:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALActivityOverrideMsg;
  -[ALActivityOverrideMsg dealloc](&v3, "dealloc");
}

- (id)overrideActionAsString:(int)a3
{
  if ((a3 + 1) >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10213ED28 + a3 + 1);
}

- (int)StringAsOverrideAction:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOverrideActionNone")) & 1) != 0)
    return -1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kOverrideActionClear")) & 1) != 0)
    return 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kOverrideActionSet")))
    return 1;
  return -1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALActivityOverrideMsg;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALActivityOverrideMsg description](&v3, "description"), -[ALActivityOverrideMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  int v4;
  NSString *v5;
  ALCLMotionActivity *activity;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = self->_overrideAction + 1;
  if (v4 >= 3)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_overrideAction);
  else
    v5 = (NSString *)*(&off_10213ED28 + v4);
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("overrideAction"));
  activity = self->_activity;
  if (activity)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLMotionActivity dictionaryRepresentation](activity, "dictionaryRepresentation"), CFSTR("activity"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004D3F58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ALCLMotionActivity *activity;

  PBDataWriterWriteInt32Field(a3, self->_overrideAction, 1);
  activity = self->_activity;
  if (!activity)
    sub_1018FCC5C();
  PBDataWriterWriteSubmessage(a3, activity, 2);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_overrideAction;
  objc_msgSend(a3, "setActivity:", self->_activity);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)v5 + 4) = self->_overrideAction;

  *((_QWORD *)v5 + 1) = -[ALCLMotionActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  ALCLMotionActivity *activity;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if (self->_overrideAction == *((_DWORD *)a3 + 4))
    {
      activity = self->_activity;
      if ((unint64_t)activity | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[ALCLMotionActivity isEqual:](activity, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_overrideAction;
  return -[ALCLMotionActivity hash](self->_activity, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;

  self->_overrideAction = *((_DWORD *)a3 + 4);
  v3 = *((_QWORD *)a3 + 1);
  if (self->_activity)
  {
    if (v3)
      -[ALCLMotionActivity mergeFrom:](self->_activity, "mergeFrom:");
  }
  else if (v3)
  {
    -[ALActivityOverrideMsg setActivity:](self, "setActivity:");
  }
}

- (int)overrideAction
{
  return self->_overrideAction;
}

- (void)setOverrideAction:(int)a3
{
  self->_overrideAction = a3;
}

- (ALCLMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
