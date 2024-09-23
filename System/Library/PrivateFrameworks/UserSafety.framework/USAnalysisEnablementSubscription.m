@implementation USAnalysisEnablementSubscription

- (USAnalysisEnablementSubscription)initWithObserver:(id)a3
{
  id v5;
  USAnalysisEnablementSubscription *v6;
  USAnalysisEnablementSubscription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USAnalysisEnablementSubscription;
  v6 = -[USAnalysisEnablementSubscription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_analysisAvailabilityObserver, a3);

  return v7;
}

- (void)cancel
{
  -[SCSensitivityAnalysisAvailabilityObserver cancel](self->_analysisAvailabilityObserver, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisAvailabilityObserver, 0);
}

@end
