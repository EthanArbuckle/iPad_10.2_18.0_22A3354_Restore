@implementation UMQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
