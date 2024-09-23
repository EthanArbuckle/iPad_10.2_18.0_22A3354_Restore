@implementation NRDLatencyContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
