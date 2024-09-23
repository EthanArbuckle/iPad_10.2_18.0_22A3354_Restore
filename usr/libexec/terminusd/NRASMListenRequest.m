@implementation NRASMListenRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
}

@end
