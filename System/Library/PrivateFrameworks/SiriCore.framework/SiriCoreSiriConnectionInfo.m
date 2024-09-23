@implementation SiriCoreSiriConnectionInfo

- (void)_appendPotentiallyNilString:(id)a3 toMutableString:(id)a4
{
  if (!a3)
    a3 = CFSTR("(nil)");
  objc_msgSend(a4, "appendString:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p"), self);
  objc_msgSend(v3, "appendString:", CFSTR("\n\tURL: "));
  -[NSURL description](self->_url, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo _appendPotentiallyNilString:toMutableString:](self, "_appendPotentiallyNilString:toMutableString:", v5, v3);

  objc_msgSend(v3, "appendString:", CFSTR("\n\tACE Host: "));
  -[SiriCoreSiriConnectionInfo _appendPotentiallyNilString:toMutableString:](self, "_appendPotentiallyNilString:toMutableString:", self->_aceHost, v3);
  objc_msgSend(v3, "appendString:", CFSTR("\n\tLanguage Code: "));
  -[SiriCoreSiriConnectionInfo _appendPotentiallyNilString:toMutableString:](self, "_appendPotentiallyNilString:toMutableString:", self->_languageCode, v3);
  objc_msgSend(v3, "appendString:", CFSTR("\n\tPrefers WWAN: "));
  if (self->_prefersWWAN)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(v3, "appendString:", CFSTR("\n\tTimeout: "));
  objc_msgSend(v3, "appendFormat:", CFSTR("%.2f"), *(_QWORD *)&self->_timeout);
  objc_msgSend(v3, "appendString:", CFSTR("\n\tConnection Policy: "));
  -[SAConnectionPolicy description](self->_connectionPolicy, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo _appendPotentiallyNilString:toMutableString:](self, "_appendPotentiallyNilString:toMutableString:", v7, v3);

  objc_msgSend(v3, "appendString:", CFSTR("\n\tConnection Policy Route: "));
  -[SAConnectionPolicyRoute description](self->_connectionPolicyRoute, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo _appendPotentiallyNilString:toMutableString:](self, "_appendPotentiallyNilString:toMutableString:", v8, v3);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SAConnectionPolicyRoute)connectionPolicyRoute
{
  return self->_connectionPolicyRoute;
}

- (void)setConnectionPolicyRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setAceHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)prefersWWAN
{
  return self->_prefersWWAN;
}

- (void)setPrefersWWAN:(BOOL)a3
{
  self->_prefersWWAN = a3;
}

- (BOOL)skipPeer
{
  return self->_skipPeer;
}

- (void)setSkipPeer:(BOOL)a3
{
  self->_skipPeer = a3;
}

- (BOOL)useWiFiHint
{
  return self->_useWiFiHint;
}

- (void)setUseWiFiHint:(BOOL)a3
{
  self->_useWiFiHint = a3;
}

- (NSError)skipPeerErrorReason
{
  return self->_skipPeerErrorReason;
}

- (void)setSkipPeerErrorReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)forceReconnect
{
  return self->_forceReconnect;
}

- (void)setForceReconnect:(BOOL)a3
{
  self->_forceReconnect = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (void)setConnectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)imposePolicyBan
{
  return self->_imposePolicyBan;
}

- (void)setImposePolicyBan:(BOOL)a3
{
  self->_imposePolicyBan = a3;
}

- (BOOL)requiresURLSession
{
  return self->_requiresURLSession;
}

- (void)setRequiresURLSession:(BOOL)a3
{
  self->_requiresURLSession = a3;
}

- (SAConnectionPolicy)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setConnectionPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isForceOnDeviceOnlyDictationEnabled
{
  return self->_forceOnDeviceOnlyDictation;
}

- (void)setForceOnDeviceOnlyDictation:(BOOL)a3
{
  self->_forceOnDeviceOnlyDictation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_skipPeerErrorReason, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_connectionPolicyRoute, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
