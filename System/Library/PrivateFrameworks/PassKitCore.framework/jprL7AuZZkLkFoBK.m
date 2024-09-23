@implementation jprL7AuZZkLkFoBK

- (jprL7AuZZkLkFoBK)initWithServerEndpointIdentifier:(id)a3
{
  id v5;
  jprL7AuZZkLkFoBK *v6;
  jprL7AuZZkLkFoBK *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)jprL7AuZZkLkFoBK;
  v6 = -[jprL7AuZZkLkFoBK init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serverEndpointIdentifier, a3);

  return v7;
}

- (NSString)serverEndpointIdentifier
{
  return self->_serverEndpointIdentifier;
}

- (void)setServerEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serverEndpointIdentifier, a3);
}

- (NSData)hostChallenge
{
  return self->_hostChallenge;
}

- (void)setHostChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_hostChallenge, a3);
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
  objc_storeStrong((id *)&self->_challengeResponse, a3);
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
  objc_storeStrong((id *)&self->_seid, a3);
}

- (NSSet)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_identities, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (NSString)FPANSuffix
{
  return self->_FPANSuffix;
}

- (void)setFPANSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_FPANSuffix, a3);
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)passwordSetting
{
  return self->_passwordSetting;
}

- (void)setPasswordSetting:(unint64_t)a3
{
  self->_passwordSetting = a3;
}

- (unint64_t)eventFrequency
{
  return self->_eventFrequency;
}

- (void)setEventFrequency:(unint64_t)a3
{
  self->_eventFrequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_FPANSuffix, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_hostChallenge, 0);
  objc_storeStrong((id *)&self->_serverEndpointIdentifier, 0);
}

@end
