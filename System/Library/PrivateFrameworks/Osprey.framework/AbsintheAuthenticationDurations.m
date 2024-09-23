@implementation AbsintheAuthenticationDurations

- (AbsintheAuthenticationDurations)init
{
  AbsintheAuthenticationDurations *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *absintheTimestamps;
  NSMutableString *v5;
  NSMutableString *connectionMethod;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AbsintheAuthenticationDurations;
  v2 = -[AbsintheAuthenticationDurations init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    absintheTimestamps = v2->_absintheTimestamps;
    v2->_absintheTimestamps = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    connectionMethod = v2->_connectionMethod;
    v2->_connectionMethod = v5;

  }
  return v2;
}

- (void)reportAbsintheAuthenticationDurations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("GetCertificateStart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("GetCertificateEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations calculateDuration:and:](self, "calculateDuration:and:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations setGetCertificateElapsed:](self, "setGetCertificateElapsed:", v7);

  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("CreateSessionStart"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CreateSessionEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations calculateDuration:and:](self, "calculateDuration:and:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations setCreateSessionElapsed:](self, "setCreateSessionElapsed:", v12);

  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("SessionEstablishedStart"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("SessionEstablishedEnd"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations calculateDuration:and:](self, "calculateDuration:and:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations setSessionEstablishedElapsed:](self, "setSessionEstablishedElapsed:", v17);

  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("GetCertificateStart"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("FinalSignedData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations calculateDuration:and:](self, "calculateDuration:and:", v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AbsintheAuthenticationDurations setAbsintheElapsed:](self, "setAbsintheElapsed:", v22);

  +[OspreyAnalytics reporter](OspreyAnalytics, "reporter");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reportAbsintheMetrics:", self);

}

- (void)setAbsintheAuthenticationTimestampForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AbsintheAuthenticationDurations absintheTimestamps](self, "absintheTimestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = mach_absolute_time();
  objc_msgSend(v6, "numberWithUnsignedLongLong:", OspreyMachAbsoluteTimeGetNanoseconds(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v4);

  LODWORD(v5) = objc_msgSend(v4, "isEqualToString:", CFSTR("FinalSignedData"));
  if ((_DWORD)v5)
  {
    -[AbsintheAuthenticationDurations connectionMethod](self, "connectionMethod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[AbsintheAuthenticationDurations reportAbsintheAuthenticationDurations](self, "reportAbsintheAuthenticationDurations");
  }
}

- (void)setAbsintheConnectionMethodWith:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[AbsintheAuthenticationDurations setConnectionMethod:](self, "setConnectionMethod:", v4);

}

- (id)calculateDuration:(id)a3 and:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "longLongValue");
  v7 = objc_msgSend(v5, "longLongValue");

  if ((unint64_t)(v6 - v7) > 0xE8D4A50FFFLL)
  {
    v8 = &unk_1E70A36F0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (NSMutableDictionary)absintheTimestamps
{
  return self->_absintheTimestamps;
}

- (void)setAbsintheTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_absintheTimestamps, a3);
}

- (NSMutableString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setConnectionMethod:(id)a3
{
  objc_storeStrong((id *)&self->_connectionMethod, a3);
}

- (NSNumber)getCertificateElapsed
{
  return self->_getCertificateElapsed;
}

- (void)setGetCertificateElapsed:(id)a3
{
  objc_storeStrong((id *)&self->_getCertificateElapsed, a3);
}

- (NSNumber)createSessionElapsed
{
  return self->_createSessionElapsed;
}

- (void)setCreateSessionElapsed:(id)a3
{
  objc_storeStrong((id *)&self->_createSessionElapsed, a3);
}

- (NSNumber)sessionEstablishedElapsed
{
  return self->_sessionEstablishedElapsed;
}

- (void)setSessionEstablishedElapsed:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEstablishedElapsed, a3);
}

- (NSNumber)absintheElapsed
{
  return self->_absintheElapsed;
}

- (void)setAbsintheElapsed:(id)a3
{
  objc_storeStrong((id *)&self->_absintheElapsed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absintheElapsed, 0);
  objc_storeStrong((id *)&self->_sessionEstablishedElapsed, 0);
  objc_storeStrong((id *)&self->_createSessionElapsed, 0);
  objc_storeStrong((id *)&self->_getCertificateElapsed, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);
  objc_storeStrong((id *)&self->_absintheTimestamps, 0);
}

@end
