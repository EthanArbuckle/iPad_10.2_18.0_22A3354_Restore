@implementation BRCTransferFailureReport

- (BRCTransferFailureReport)initWithError:(id)a3
{
  id v5;
  BRCTransferFailureReport *v6;
  BRCTransferFailureReport *v7;
  uint64_t v8;
  NSMutableDictionary *privateDBErrorCountByPCSAndEDPState;
  uint64_t v10;
  NSMutableDictionary *shareDBErrorCountByPCSAndEDPState;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCTransferFailureReport;
  v6 = -[BRCTransferFailureReport init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = objc_opt_new();
    privateDBErrorCountByPCSAndEDPState = v7->_privateDBErrorCountByPCSAndEDPState;
    v7->_privateDBErrorCountByPCSAndEDPState = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    shareDBErrorCountByPCSAndEDPState = v7->_shareDBErrorCountByPCSAndEDPState;
    v7->_shareDBErrorCountByPCSAndEDPState = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (void)setLastFailureDate:(id)a3
{
  id v5;
  NSDate **p_lastFailureDate;
  NSDate *lastFailureDate;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v5 = a3;
  lastFailureDate = self->_lastFailureDate;
  p_lastFailureDate = &self->_lastFailureDate;
  v12 = v5;
  if (!lastFailureDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v9);
    v11 = v10;

    if (v11 <= 0.0)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:");
  if (v8 > 0.0)
LABEL_3:
    objc_storeStrong((id *)p_lastFailureDate, a3);
LABEL_4:

}

- (void)encounteredErrorWithPCSState:(unsigned int)a3 enhancedDrivePrivacyEnabled:(BOOL)a4 privateDB:(BOOL)a5 atDate:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v10 = 16;
  if (a5)
    v10 = 8;
  v20 = *(id *)((char *)&self->super.isa + v10);
  v11 = (void *)MEMORY[0x24BE17650];
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a6;
  objc_msgSend(v12, "numberWithUnsignedInt:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairWithLeft:andRight:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v17, "longLongValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = &unk_24FEB3248;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v16);
  -[BRCTransferFailureReport setLastFailureDate:](self, "setLastFailureDate:", v13);

}

- (void)encounteredErrors:(unint64_t)a3 atDate:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x24BE17650];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v9, "supportsEnhancedDrivePrivacy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairWithLeft:andRight:", &unk_24FEB3260, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_privateDBErrorCountByPCSAndEDPState, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue") + a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_privateDBErrorCountByPCSAndEDPState, "setObject:forKeyedSubscript:", v13, v14);
  -[BRCTransferFailureReport setLastFailureDate:](self, "setLastFailureDate:", v8);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p e:%@ ppcs:%@ spcs:%@>"), objc_opt_class(), self, self->_error, self->_privateDBErrorCountByPCSAndEDPState, self->_shareDBErrorCountByPCSAndEDPState);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSInteger v5;
  void *v6;
  unint64_t v7;

  -[NSError domain](self->_error, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSError code](self->_error, "code") ^ v4;
  -[NSError brc_cloudKitErrorMessage](self->_error, "brc_cloudKitErrorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BRCTransferFailureReport *v4;
  BOOL v5;

  v4 = (BRCTransferFailureReport *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRCTransferFailureReport isEqualToTransferFailureReport:](self, "isEqualToTransferFailureReport:", v4);
  }

  return v5;
}

- (BOOL)isEqualToTransferFailureReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSInteger v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;

  v4 = a3;
  -[NSError domain](self->_error, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    v8 = -[NSError code](self->_error, "code");
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "code"))
    {
      -[NSError brc_cloudKitErrorMessage](self->_error, "brc_cloudKitErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "brc_cloudKitErrorMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v12)
      {
        v15 = 1;
      }
      else
      {
        -[NSError brc_cloudKitErrorMessage](self->_error, "brc_cloudKitErrorMessage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "error");
        v18 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "brc_cloudKitErrorMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v17, "isEqualToString:", v14);

        v10 = v18;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)lastFailureDate
{
  return self->_lastFailureDate;
}

- (NSDictionary)privateDBErrorCountByPCSAndEDPState
{
  return &self->_privateDBErrorCountByPCSAndEDPState->super;
}

- (NSDictionary)shareDBErrorCountByPCSAndEDPState
{
  return &self->_shareDBErrorCountByPCSAndEDPState->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFailureDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_shareDBErrorCountByPCSAndEDPState, 0);
  objc_storeStrong((id *)&self->_privateDBErrorCountByPCSAndEDPState, 0);
}

@end
