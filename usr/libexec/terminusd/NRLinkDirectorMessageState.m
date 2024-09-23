@implementation NRLinkDirectorMessageState

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("[%@, %@]"), self->_sequenceNum, self->_localReceiveID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localReceiveID, 0);
  objc_storeStrong((id *)&self->_sequenceNum, 0);
}

@end
