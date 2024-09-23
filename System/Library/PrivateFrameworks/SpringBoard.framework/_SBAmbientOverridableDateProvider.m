@implementation _SBAmbientOverridableDateProvider

- (_SBAmbientOverridableDateProvider)init
{
  _SBAmbientOverridableDateProvider *v2;
  id v3;
  id v4;
  uint64_t v5;
  SBFOverridableDateProvider *dateProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBAmbientOverridableDateProvider;
  v2 = -[_SBAmbientOverridableDateProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DA9EB0]);
    v4 = objc_alloc_init(MEMORY[0x1E0D1BC18]);
    v5 = objc_msgSend(v3, "initWithDateProvider:", v4);
    dateProvider = v2->_dateProvider;
    v2->_dateProvider = (SBFOverridableDateProvider *)v5;

  }
  return v2;
}

- (id)date
{
  return (id)-[SBFOverridableDateProvider date](self->_dateProvider, "date");
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  return (id)-[SBFOverridableDateProvider observeMinuteUpdatesWithHandler:](self->_dateProvider, "observeMinuteUpdatesWithHandler:", a3);
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  -[SBFOverridableDateProvider removeMinuteUpdateHandler:](self->_dateProvider, "removeMinuteUpdateHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
