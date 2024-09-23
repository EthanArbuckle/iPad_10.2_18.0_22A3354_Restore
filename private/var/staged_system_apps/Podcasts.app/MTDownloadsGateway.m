@implementation MTDownloadsGateway

+ (MTDownloadsGatewayProtocol)shared
{
  if (qword_100567598 != -1)
    dispatch_once(&qword_100567598, &stru_1004ABC40);
  return (MTDownloadsGatewayProtocol *)(id)qword_100567590;
}

@end
