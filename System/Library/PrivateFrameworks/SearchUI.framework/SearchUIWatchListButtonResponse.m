@implementation SearchUIWatchListButtonResponse

- (NSArray)buttonModels
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setButtonModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SearchUIWatchListState)state
{
  return (SearchUIWatchListState *)objc_getProperty(self, a2, 16, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_buttonModels, 0);
}

@end
