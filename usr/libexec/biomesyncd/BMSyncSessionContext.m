@implementation BMSyncSessionContext

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (unint64_t)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unint64_t)a3
{
  self->_messageID = a3;
}

- (NSString)originatingSiteIdentifier
{
  return self->_originatingSiteIdentifier;
}

- (void)setOriginatingSiteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatingSiteIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingSiteIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
