@implementation WiFiAvailabilityMatch

+ (id)matchWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v5;
  id v6;
  WiFiAvailabilityMatch *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setMatched:", 1);
  v7 = -[WiFiAvailabilityMatch initWithNetwork:scannedNetwork:]([WiFiAvailabilityMatch alloc], "initWithNetwork:scannedNetwork:", v6, v5);

  return v7;
}

- (WiFiAvailabilityMatch)initWithNetwork:(id)a3 scannedNetwork:(id)a4
{
  id v7;
  id v8;
  WiFiAvailabilityMatch *v9;
  WiFiAvailabilityMatch *v10;
  id *p_scannedNetwork;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WiFiCandidateNetwork *network;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *SSID;
  uint64_t v24;
  uint64_t v25;
  void *matchedAt;
  uint64_t v28;
  NSString *v29;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WiFiAvailabilityMatch;
  v9 = -[WiFiAvailabilityMatch init](&v30, sel_init);
  v10 = v9;
  if (!v9)
  {
    matchedAt = 0;
    goto LABEL_19;
  }
  if (!v7)
  {
    NSLog(CFSTR("%s: missing candidate network"), "-[WiFiAvailabilityMatch initWithNetwork:scannedNetwork:]");
    matchedAt = v10;
    v10 = 0;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v9->_network, a3);
  p_scannedNetwork = (id *)&v10->_scannedNetwork;
  objc_storeStrong((id *)&v10->_scannedNetwork, a4);
  -[WiFiCandidateNetwork SSID](v10->_network, "SSID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[WiFiCandidateNetwork SSID](v10->_network, "SSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      network = v10->_network;
LABEL_9:
      -[WiFiCandidateNetwork SSID](network, "SSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      SSID = v10->_SSID;
      v10->_SSID = (NSString *)v22;
LABEL_10:

      goto LABEL_12;
    }
  }
  objc_msgSend(*p_scannedNetwork, "SSID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(*p_scannedNetwork, "SSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      network = v10->_scannedNetwork;
      goto LABEL_9;
    }
  }
  if (!v10->_SSID)
  {
    -[WiFiScannedNetwork scanProperties](v10->_scannedNetwork, "scanProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("SSID_STR"));
    SSID = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(SSID, "copy");
    v29 = v10->_SSID;
    v10->_SSID = (NSString *)v28;

    goto LABEL_10;
  }
LABEL_12:
  if (objc_msgSend(v7, "source") == 1)
  {
    v24 = 2;
LABEL_17:
    v10->_priority = v24;
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "source") != 2)
  {
    v24 = 1;
    goto LABEL_17;
  }
  v10->_priority = 0;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = objc_claimAutoreleasedReturnValue();
  matchedAt = v10->_matchedAt;
  v10->_matchedAt = (NSDate *)v25;
LABEL_19:

  return v10;
}

- (BOOL)isEqualToScannedNetwork:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "SSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAvailabilityMatch network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WiFiAvailabilityMatch isEqualToAvailabilityMatch:](self, "isEqualToAvailabilityMatch:", v4);

  return v5;
}

- (BOOL)isEqualToAvailabilityMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[WiFiAvailabilityMatch SSID](self, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[WiFiAvailabilityMatch network](self, "network");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "source");
    objc_msgSend(v4, "network");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == objc_msgSend(v9, "source");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WiFiAvailabilityMatch SSID](self, "SSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiAvailabilityMatch network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Source: %ld "), objc_msgSend(v7, "source"));

  -[WiFiAvailabilityMatch SSID](self, "SSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("SSID: %@ "), v8);

  -[WiFiAvailabilityMatch scannedNetwork](self, "scannedNetwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WiFiAvailabilityMatch scannedNetwork](self, "scannedNetwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("RSSI: %ld "), objc_msgSend(v10, "RSSI"));

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("RSSI: %ld "), 0);
  }

  -[WiFiAvailabilityMatch matchedAt](self, "matchedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("MatchedAt: %@ "), v11);

  if (-[WiFiAvailabilityMatch unwantedNetworkName](self, "unwantedNetworkName"))
    objc_msgSend(v6, "appendString:", CFSTR("unwantedNetworkName: 1"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (int64_t)priority
{
  return self->_priority;
}

- (WiFiCandidateNetwork)network
{
  return self->_network;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (WiFiScannedNetwork)scannedNetwork
{
  return self->_scannedNetwork;
}

- (void)setScannedNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_scannedNetwork, a3);
}

- (NSDate)matchedAt
{
  return self->_matchedAt;
}

- (void)setMatchedAt:(id)a3
{
  objc_storeStrong((id *)&self->_matchedAt, a3);
}

- (BOOL)unwantedNetworkName
{
  return self->_unwantedNetworkName;
}

- (void)setUnwantedNetworkName:(BOOL)a3
{
  self->_unwantedNetworkName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedAt, 0);
  objc_storeStrong((id *)&self->_scannedNetwork, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end
