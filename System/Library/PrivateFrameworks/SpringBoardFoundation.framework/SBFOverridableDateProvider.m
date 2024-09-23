@implementation SBFOverridableDateProvider

- (id)date
{
  NSDate *v3;
  uint64_t v4;

  v3 = self->_overrideDate;
  if (!v3)
  {
    -[SBFDateProviding date](self->_underlyingProvider, "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_overrideDateOffset != 0.0)
  {
    -[NSDate dateByAddingTimeInterval:](v3, "dateByAddingTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSDate *)v4;
  }
  return v3;
}

uint64_t __51__SBFOverridableDateProvider__fireHandlersForDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
}

void __55__SBFOverridableDateProvider__updateUnderlyingProvider__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(double *)(a1 + 40) == 0.0)
  {
    v5 = v6;
  }
  else
  {
    objc_msgSend(v6, "dateByAddingTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  v7 = v5;
  objc_msgSend(WeakRetained, "_fireHandlersForDate:", v5);

}

- (void)_fireHandlersForDate:(id)a3
{
  id v4;
  NSMutableDictionary *minuteHandlers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  minuteHandlers = self->_minuteHandlers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SBFOverridableDateProvider__fireHandlersForDate___block_invoke;
  v7[3] = &unk_1E200E6A0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](minuteHandlers, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (SBFOverridableDateProvider)init
{
  SBFDefaultDateProvider *v3;
  SBFOverridableDateProvider *v4;

  v3 = objc_alloc_init(SBFDefaultDateProvider);
  v4 = -[SBFOverridableDateProvider initWithDateProvider:](self, "initWithDateProvider:", v3);

  return v4;
}

- (SBFOverridableDateProvider)initWithDateProvider:(id)a3
{
  id v5;
  SBFOverridableDateProvider *v6;
  SBFOverridableDateProvider *v7;
  uint64_t v8;
  SBFDateTimeController *dateTimeController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFOverridableDateProvider;
  v6 = -[SBFOverridableDateProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingProvider, a3);
    +[SBFDateTimeController sharedInstance](SBFDateTimeController, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    dateTimeController = v7->_dateTimeController;
    v7->_dateTimeController = (SBFDateTimeController *)v8;

    -[SBFDateTimeController addObserver:](v7->_dateTimeController, "addObserver:", v7);
    -[SBFOverridableDateProvider _updateForOverrides](v7, "_updateForOverrides");
  }

  return v7;
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *minuteHandlers;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  ++self->_nextToken;
  objc_msgSend(v5, "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_minuteHandlers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    minuteHandlers = self->_minuteHandlers;
    self->_minuteHandlers = v7;

  }
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = (void *)MEMORY[0x18D774178]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_minuteHandlers, "setObject:forKeyedSubscript:", v10, v6);

  -[SBFOverridableDateProvider _updateUnderlyingProvider](self, "_updateUnderlyingProvider");
  return v6;
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_minuteHandlers, "removeObjectForKey:", a3);
  -[SBFOverridableDateProvider _updateUnderlyingProvider](self, "_updateUnderlyingProvider");
}

- (void)_updateForOverrides
{
  void *v3;
  NSDate *v4;
  NSDate *overrideDate;
  double v6;
  id v7;

  -[SBFDateTimeController overrideDate](self->_dateTimeController, "overrideDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSDate *)objc_msgSend(v3, "copy");
  overrideDate = self->_overrideDate;
  self->_overrideDate = v4;

  -[SBFDateTimeController overrideDateOffset](self->_dateTimeController, "overrideDateOffset");
  self->_overrideDateOffset = v6;
  -[SBFOverridableDateProvider _updateUnderlyingProvider](self, "_updateUnderlyingProvider");
  -[SBFOverridableDateProvider date](self, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFOverridableDateProvider _fireHandlersForDate:](self, "_fireHandlersForDate:", v7);

}

- (void)_updateUnderlyingProvider
{
  uint64_t v3;
  id underlyingToken;
  NSDate *overrideDate;
  BOOL v6;
  BOOL v7;
  void *v8;
  id v9;
  double overrideDateOffset;
  SBFDateProviding *underlyingProvider;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15[2];
  id location;

  v3 = -[NSMutableDictionary count](self->_minuteHandlers, "count");
  underlyingToken = self->_underlyingToken;
  overrideDate = self->_overrideDate;
  if (v3)
    v6 = overrideDate == 0;
  else
    v6 = 0;
  if (v6)
  {
    if (!underlyingToken)
    {
      overrideDateOffset = self->_overrideDateOffset;
      objc_initWeak(&location, self);
      underlyingProvider = self->_underlyingProvider;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__SBFOverridableDateProvider__updateUnderlyingProvider__block_invoke;
      v14[3] = &unk_1E200E910;
      objc_copyWeak(v15, &location);
      v15[1] = *(id *)&overrideDateOffset;
      -[SBFDateProviding observeMinuteUpdatesWithHandler:](underlyingProvider, "observeMinuteUpdatesWithHandler:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_underlyingToken;
      self->_underlyingToken = v12;

      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
    }
  }
  else if (underlyingToken)
  {
    if (v3)
      v7 = overrideDate == 0;
    else
      v7 = 1;
    if (!v7)
    {
      -[SBFOverridableDateProvider date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFOverridableDateProvider _fireHandlersForDate:](self, "_fireHandlersForDate:", v8);

      underlyingToken = self->_underlyingToken;
    }
    -[SBFDateProviding removeMinuteUpdateHandler:](self->_underlyingProvider, "removeMinuteUpdateHandler:", underlyingToken);
    v9 = self->_underlyingToken;
    self->_underlyingToken = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong(&self->_underlyingToken, 0);
  objc_storeStrong((id *)&self->_minuteHandlers, 0);
  objc_storeStrong((id *)&self->_underlyingProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeController, 0);
}

@end
