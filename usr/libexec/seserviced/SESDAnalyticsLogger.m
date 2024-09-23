@implementation SESDAnalyticsLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedPeers, 0);
}

@end
