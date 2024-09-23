@implementation TIGeocodeCompletionHandlerHolder

- (id)geocodeCompletionHandler
{
  return self->_geocodeCompletionHandler;
}

- (void)setGeocodeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_geocodeCompletionHandler, 0);
}

@end
