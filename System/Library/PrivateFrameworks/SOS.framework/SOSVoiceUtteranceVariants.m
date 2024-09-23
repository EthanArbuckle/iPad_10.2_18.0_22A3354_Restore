@implementation SOSVoiceUtteranceVariants

- (BOOL)hasUtterances
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[SOSVoiceUtteranceVariants localUtterances](self, "localUtterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SOSVoiceUtteranceVariants remoteUtterances](self, "remoteUtterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 + objc_msgSend(v5, "count") != 0;

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SOSVoiceUtteranceVariants localUtterances](self, "localUtterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSVoiceUtteranceVariants remoteUtterances](self, "remoteUtterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p localUtterances=%@ remoteUtterances=%@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)utteranceVariantsWithLocalUtterances:(id)a3 remoteUtterances:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setLocalUtterances:", v6);

  objc_msgSend(v7, "setRemoteUtterances:", v5);
  return v7;
}

- (NSArray)localUtterances
{
  return self->_localUtterances;
}

- (void)setLocalUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_localUtterances, a3);
}

- (NSArray)remoteUtterances
{
  return self->_remoteUtterances;
}

- (void)setRemoteUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUtterances, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUtterances, 0);
  objc_storeStrong((id *)&self->_localUtterances, 0);
}

@end
