@implementation NESetConfigurationCompletionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
