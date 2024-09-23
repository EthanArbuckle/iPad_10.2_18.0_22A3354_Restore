@implementation TUMediaTokens

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uST=%ld"), -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" dST=%ld"), -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" cAST=%ld"), -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  -[TUMediaTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sTPID=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUplinkStreamToken:", -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v4, "setDownlinkStreamToken:", -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v4, "setCombinedAudioStreamToken:", -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  -[TUMediaTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStreamTokensByParticipantID:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUMediaTokens)initWithCoder:(id)a3
{
  id v4;
  TUMediaTokens *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *streamTokensByParticipantID;

  v4 = a3;
  v5 = -[TUMediaTokens init](self, "init");
  if (v5)
  {
    v5->_uplinkStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uplinkStreamToken"));
    v5->_downlinkStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downlinkStreamToken"));
    v5->_combinedAudioStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("combinedAudioStreamToken"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("streamTokensByParticipantID"));
    v10 = objc_claimAutoreleasedReturnValue();
    streamTokensByParticipantID = v5->_streamTokensByParticipantID;
    v5->_streamTokensByParticipantID = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"), CFSTR("uplinkStreamToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"), CFSTR("downlinkStreamToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"), CFSTR("combinedAudioStreamToken"));
  -[TUMediaTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("streamTokensByParticipantID"));

}

- (BOOL)isEqual:(id)a3
{
  TUMediaTokens *v4;
  BOOL v5;

  v4 = (TUMediaTokens *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUMediaTokens isEqualToMediaTokens:](self, "isEqualToMediaTokens:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMediaTokens:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken");
  if (v5 == objc_msgSend(v4, "uplinkStreamToken")
    && (v6 = -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"),
        v6 == objc_msgSend(v4, "downlinkStreamToken"))
    && (v7 = -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"),
        v7 == objc_msgSend(v4, "combinedAudioStreamToken")))
  {
    -[TUMediaTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streamTokensByParticipantID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)uplinkStreamToken
{
  return self->_uplinkStreamToken;
}

- (void)setUplinkStreamToken:(int64_t)a3
{
  self->_uplinkStreamToken = a3;
}

- (int64_t)downlinkStreamToken
{
  return self->_downlinkStreamToken;
}

- (void)setDownlinkStreamToken:(int64_t)a3
{
  self->_downlinkStreamToken = a3;
}

- (NSDictionary)streamTokensByParticipantID
{
  return self->_streamTokensByParticipantID;
}

- (void)setStreamTokensByParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_streamTokensByParticipantID, a3);
}

- (int64_t)combinedAudioStreamToken
{
  return self->_combinedAudioStreamToken;
}

- (void)setCombinedAudioStreamToken:(int64_t)a3
{
  self->_combinedAudioStreamToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamTokensByParticipantID, 0);
}

@end
