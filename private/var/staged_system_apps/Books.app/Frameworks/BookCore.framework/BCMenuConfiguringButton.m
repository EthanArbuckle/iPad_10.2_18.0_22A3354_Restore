@implementation BCMenuConfiguringButton

- (void)setMenu:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCMenuConfiguringButton;
  -[BCMenuConfiguringButton setMenu:](&v4, "setMenu:", a3);
  -[BCMenuConfiguringButton setPreferredMenuElementOrder:](self, "setPreferredMenuElementOrder:", 2);
}

- (void)setupAppAnalyticsReportingUsingTracker:(id)a3 withPropertyProvider:(id)a4
{
  _TtC13BookAnalytics9BATracker *v6;
  BAAssetPropertyProvider *v7;
  _TtC13BookAnalytics9BATracker *tracker;
  BAAssetPropertyProvider *propertyProvider;
  _TtC13BookAnalytics9BATracker *v10;

  v6 = (_TtC13BookAnalytics9BATracker *)a3;
  v7 = (BAAssetPropertyProvider *)a4;
  tracker = self->_tracker;
  self->_tracker = v6;
  v10 = v6;

  propertyProvider = self->_propertyProvider;
  self->_propertyProvider = v7;

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  NSDate *v6;
  NSDate *appearDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCMenuConfiguringButton;
  -[BCMenuConfiguringButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v8, "contextMenuInteraction:willDisplayMenuForConfiguration:animator:", a3, a4, a5);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  appearDate = self->_appearDate;
  self->_appearDate = v6;

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  NSDate *appearDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCMenuConfiguringButton;
  -[BCMenuConfiguringButton contextMenuInteraction:willEndForConfiguration:animator:](&v8, "contextMenuInteraction:willEndForConfiguration:animator:", a3, a4, a5);
  if (self->_tracker && self->_propertyProvider && self->_appearDate)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v6, "emitContextualActionSheetExposureEventWithTracker:startDate:propertyProvider:", self->_tracker, self->_appearDate, self->_propertyProvider);

  }
  appearDate = self->_appearDate;
  self->_appearDate = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearDate, 0);
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
