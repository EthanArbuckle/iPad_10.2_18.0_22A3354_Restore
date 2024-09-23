@implementation RBEventQueueEvent

- (int64_t)compare:(id)a3
{
  double eventTime;
  double v4;

  eventTime = self->_eventTime;
  v4 = *((double *)a3 + 2);
  if (eventTime < v4)
    return -1;
  else
    return eventTime > v4;
}

- (id)context
{
  return self->_context;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(double)a3
{
  self->_eventTime = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_context, 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| context:%@ eventTime:%.2f>"), v4, self->_context, *(_QWORD *)&self->_eventTime);

  return v5;
}

- (id)action
{
  return self->_action;
}

@end
