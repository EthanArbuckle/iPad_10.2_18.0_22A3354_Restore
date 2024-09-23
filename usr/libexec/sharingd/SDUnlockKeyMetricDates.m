@implementation SDUnlockKeyMetricDates

- (NSDate)started
{
  return self->_started;
}

- (void)setStarted:(id)a3
{
  objc_storeStrong((id *)&self->_started, a3);
}

- (NSDate)keyExchangeResponseReceived
{
  return self->_keyExchangeResponseReceived;
}

- (void)setKeyExchangeResponseReceived:(id)a3
{
  objc_storeStrong((id *)&self->_keyExchangeResponseReceived, a3);
}

- (NSDate)pillUpdated
{
  return self->_pillUpdated;
}

- (void)setPillUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_pillUpdated, a3);
}

- (NSDate)confirmationReceived
{
  return self->_confirmationReceived;
}

- (void)setConfirmationReceived:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationReceived, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationReceived, 0);
  objc_storeStrong((id *)&self->_pillUpdated, 0);
  objc_storeStrong((id *)&self->_keyExchangeResponseReceived, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

@end
