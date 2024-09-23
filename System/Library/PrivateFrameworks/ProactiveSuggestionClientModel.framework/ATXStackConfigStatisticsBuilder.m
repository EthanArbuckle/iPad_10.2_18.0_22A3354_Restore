@implementation ATXStackConfigStatisticsBuilder

- (ATXStackConfigStatisticsBuilder)initWithWidgetBundleId:(id)a3 widgetKind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  NSDate *v14;
  NSDate *timestamp;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_widgetBundleId, a3);
    objc_storeStrong((id *)&self->_widgetKind, a4);
    objc_storeStrong((id *)&self->_containerBundleIdentifier, a5);
    self->_widgetFamily = a6;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timestamp = self->_timestamp;
    self->_timestamp = v14;

    *(_OWORD *)&self->_countOfSmartStacksWithWidget = 0u;
    *(_OWORD *)&self->_countOfStandaloneWidgets = 0u;
  }

  return self;
}

- (id)build
{
  return -[ATXStackConfigStatistics initWithBuilder:]([ATXStackConfigStatistics alloc], "initWithBuilder:", self);
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)countOfSmartStacksWithWidget
{
  return self->_countOfSmartStacksWithWidget;
}

- (void)setCountOfSmartStacksWithWidget:(int64_t)a3
{
  self->_countOfSmartStacksWithWidget = a3;
}

- (int64_t)countOfNonSmartStacksWithWidget
{
  return self->_countOfNonSmartStacksWithWidget;
}

- (void)setCountOfNonSmartStacksWithWidget:(int64_t)a3
{
  self->_countOfNonSmartStacksWithWidget = a3;
}

- (int64_t)countOfStandaloneWidgets
{
  return self->_countOfStandaloneWidgets;
}

- (void)setCountOfStandaloneWidgets:(int64_t)a3
{
  self->_countOfStandaloneWidgets = a3;
}

- (int64_t)countOfWidgetsWithUnknownStackKind
{
  return self->_countOfWidgetsWithUnknownStackKind;
}

- (void)setCountOfWidgetsWithUnknownStackKind:(int64_t)a3
{
  self->_countOfWidgetsWithUnknownStackKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
}

@end
