@implementation SearchUIAlarmBiomeEvent

+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SearchUIAlarmBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4
{
  id v6;
  id v7;
  SearchUIAlarmBiomeEvent *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SearchUIAlarmBiomeEvent;
  v8 = -[BMEventBase init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "alarmIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAlarmBiomeEvent setObservedAlarmIdentifier:](v8, "setObservedAlarmIdentifier:", v9);

    -[SearchUIBiomeEvent setBiomeEvent:](v8, "setBiomeEvent:", v6);
  }

  return v8;
}

- (void)getEnabledStatusWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUIAlarmBiomeEvent observedAlarmIdentifier](self, "observedAlarmIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUIMobileTimerUtilities getEnablementStatusForAlarmWithIdentifier:completion:](SearchUIMobileTimerUtilities, "getEnablementStatusForAlarmWithIdentifier:completion:", v5, v4);

}

- (NSString)observedAlarmIdentifier
{
  return self->_observedAlarmIdentifier;
}

- (void)setObservedAlarmIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_observedAlarmIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAlarmIdentifier, 0);
}

@end
