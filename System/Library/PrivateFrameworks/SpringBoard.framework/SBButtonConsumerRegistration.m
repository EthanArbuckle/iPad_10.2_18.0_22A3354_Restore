@implementation SBButtonConsumerRegistration

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventMask);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)buttonKind
{
  return self->_buttonKind;
}

- (SBButtonConsumerClient)client
{
  return (SBButtonConsumerClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void)setEventPriority:(int64_t)a3
{
  self->_eventPriority = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (void)setButtonKind:(int64_t)a3
{
  self->_buttonKind = a3;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (id)description
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("client"));

  NSStringFromSBSHardwareButtonKind();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("buttonKind"));

  v8 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_eventMask, CFSTR("eventMask"));
  v9 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_eventPriority, CFSTR("eventPriority"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SBButtonConsumerRegistration *v4;
  SBButtonConsumerRegistration *v5;
  id WeakRetained;
  id v7;
  int64_t buttonKind;
  unint64_t eventMask;
  int64_t eventPriority;
  BOOL v11;

  v4 = (SBButtonConsumerRegistration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_client);
      -[SBButtonConsumerRegistration client](v5, "client");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (WeakRetained == v7
        && (buttonKind = self->_buttonKind, buttonKind == -[SBButtonConsumerRegistration buttonKind](v5, "buttonKind"))
        && (eventMask = self->_eventMask, eventMask == -[SBButtonConsumerRegistration eventMask](v5, "eventMask")))
      {
        eventPriority = self->_eventPriority;
        v11 = eventPriority == -[SBButtonConsumerRegistration eventPriority](v5, "eventPriority");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (int64_t)eventPriority
{
  return self->_eventPriority;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

@end
