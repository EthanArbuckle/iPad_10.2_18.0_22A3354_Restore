@implementation SASActivationCondition

- (SASActivationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)buttonTriggerStateActive
{
  return self->_buttonTriggerStateActive;
}

- (void)setButtonTriggerStateActive:(BOOL)a3
{
  self->_buttonTriggerStateActive = a3;
}

- (SASSystemState)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (SASSiriPocketStateManager)pocketStateManager
{
  return self->_pocketStateManager;
}

- (void)setPocketStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateManager, a3);
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (void)setAnalyticsContext:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsContext, a3);
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
}

- (UAFAssetUtilities)assetUtilities
{
  return self->_assetUtilities;
}

- (void)setAssetUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_assetUtilities, a3);
}

- (int64_t)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(int64_t)a3
{
  self->_presentationIdentifier = a3;
}

- (NSString)uiPresentationIdentifier
{
  return self->_uiPresentationIdentifier;
}

- (void)setUiPresentationIdentifier:(id)a3
{
  self->_uiPresentationIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
