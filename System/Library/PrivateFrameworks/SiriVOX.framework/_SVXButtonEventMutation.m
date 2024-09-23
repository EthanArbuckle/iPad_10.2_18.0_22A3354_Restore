@implementation _SVXButtonEventMutation

- (_SVXButtonEventMutation)init
{
  return -[_SVXButtonEventMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXButtonEventMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXButtonEventMutation *v6;
  _SVXButtonEventMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXButtonEventMutation;
  v6 = -[_SVXButtonEventMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXButtonEvent *baseModel;
  SVXButtonEvent *v4;
  SVXButtonEvent *v5;
  int64_t type;
  unint64_t timestamp;
  int64_t v8;
  unint64_t v9;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXButtonEvent alloc];
    type = self->_type;
    timestamp = self->_timestamp;
LABEL_11:
    v4 = -[SVXButtonEvent initWithType:timestamp:](v5, "initWithType:timestamp:", type, timestamp);
    return v4;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v8 = self->_type;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_7;
    }
    else
    {
      v8 = -[SVXButtonEvent type](baseModel, "type");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        v9 = self->_timestamp;
LABEL_10:
        v5 = [SVXButtonEvent alloc];
        type = v8;
        timestamp = v9;
        goto LABEL_11;
      }
    }
    v9 = -[SVXButtonEvent timestamp](self->_baseModel, "timestamp");
    goto LABEL_10;
  }
  v4 = (SVXButtonEvent *)-[SVXButtonEvent copy](baseModel, "copy");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
