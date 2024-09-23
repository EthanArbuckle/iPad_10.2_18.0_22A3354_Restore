@implementation RAPDU

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullRapdu, 0);
}

@end
