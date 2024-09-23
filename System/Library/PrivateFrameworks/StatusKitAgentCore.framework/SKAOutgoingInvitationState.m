@implementation SKAOutgoingInvitationState

- (SKAOutgoingInvitationState)initWithToHandle:(id)a3 fromHandle:(id)a4 channelIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SKAOutgoingInvitationState *v12;
  SKAOutgoingInvitationState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKAOutgoingInvitationState;
  v12 = -[SKAOutgoingInvitationState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_toHandle, a3);
    objc_storeStrong((id *)&v13->_fromHandle, a4);
    objc_storeStrong((id *)&v13->_channelIdentifier, a5);
  }

  return v13;
}

- (SKHandle)toHandle
{
  return self->_toHandle;
}

- (void)setToHandle:(id)a3
{
  objc_storeStrong((id *)&self->_toHandle, a3);
}

- (SKHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fromHandle, a3);
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_channelIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_toHandle, 0);
}

@end
