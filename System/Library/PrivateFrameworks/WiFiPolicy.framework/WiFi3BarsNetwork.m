@implementation WiFi3BarsNetwork

- (WiFi3BarsNetwork)initWithNetwork:(id)a3
{
  id v5;
  WiFi3BarsNetwork *v6;
  id *p_network;
  uint64_t v8;
  NSString *uniqueIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  TBScore *popularityScore;
  uint64_t v21;
  NSSet *attributes;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WiFi3BarsNetwork;
  v6 = -[WiFi3BarsNetwork init](&v28, sel_init);
  p_network = (id *)&v6->_network;
  objc_storeStrong((id *)&v6->_network, a3);
  objc_msgSend(v5, "remoteIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v6->_uniqueIdentifier;
  v6->_uniqueIdentifier = (NSString *)v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TBNetwork isMoving](v6->_network, "isMoving"))
    objc_msgSend(v10, "addObject:", &unk_1E8862430);
  if (objc_msgSend(*p_network, "isCaptive"))
    objc_msgSend(v10, "addObject:", &unk_1E8862448);
  if (objc_msgSend(*p_network, "isSuspicious"))
    objc_msgSend(v10, "addObject:", &unk_1E8862460);
  if (objc_msgSend(*p_network, "isPublic"))
    objc_msgSend(v10, "addObject:", &unk_1E8862478);
  if (objc_msgSend(*p_network, "isLowQuality"))
    objc_msgSend(v10, "addObject:", &unk_1E8862490);
  v6->_type = objc_msgSend(v5, "type");
  v6->_venueGroup = objc_msgSend(v5, "venueGroup");
  v6->_venueType = objc_msgSend(v5, "venueType");
  -[TBNetwork popularityScore](v6->_network, "popularityScore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TBNetwork popularityScore](v6->_network, "popularityScore");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "accessPoints", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "popularityScore");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 += objc_msgSend(v19, "score");

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    +[TBPopularityScore popularityScoreWithValue:](TBPopularityScore, "popularityScoreWithValue:", v16);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  popularityScore = v6->_popularityScore;
  v6->_popularityScore = (TBScore *)v12;

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
    v21 = objc_claimAutoreleasedReturnValue();
    attributes = v6->_attributes;
    v6->_attributes = (NSSet *)v21;

  }
  return v6;
}

- (NSSet)accessPoints
{
  void *v2;
  void *v3;

  -[WiFi3BarsNetwork network](self, "network");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (int64_t)source
{
  return 2;
}

- (BOOL)containsAccessPointMatchingBSSIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  char v21;
  BOOL v22;
  void *v24;
  uint64_t v25;
  WiFi3BarsNetwork *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WiFi3BarsNetwork network](self, "network");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessPointCount");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17AC818]();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      v26 = self;
      v27 = v7;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          -[WiFi3BarsNetwork network](self, "network");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessPoints");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "BSSID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v13, "isEqualToString:", v20);

                if ((v21 & 1) != 0)
                {

                  v22 = 1;
                  v7 = v27;
                  goto LABEL_20;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v17)
                continue;
              break;
            }
          }

          v11 = v25;
          self = v26;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        v22 = 0;
        v7 = v27;
      }
      while (v10);
    }
    else
    {
      v22 = 0;
    }
LABEL_20:

    objc_autoreleasePoolPop(v7);
    v4 = v28;
  }
  else
  {
    -[WiFi3BarsNetwork network](self, "network");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: network (%@) contains 0 access points"), "-[WiFi3BarsNetwork containsAccessPointMatchingBSSIDs:]", v24);

    v22 = 0;
  }

  return v22;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFi3BarsNetwork SSID](self, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("SSID: %@ "), v7);

  -[WiFi3BarsNetwork network](self, "network");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("APS: %lu "), objc_msgSend(v8, "accessPointCount"));

  -[WiFi3BarsNetwork password](self, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("YES");
  if (!v9)
    v10 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("Password: %@ "), v10);

  -[WiFi3BarsNetwork uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Identifier: %@ "), v11);

  -[WiFi3BarsNetwork popularityScore](self, "popularityScore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Score: %lu"), objc_msgSend(v12, "score"));

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *password;
  id v5;

  password = self->password;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", password, CFSTR("password"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("_attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_qualityScore, CFSTR("_qualityScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_popularityScore, CFSTR("_popularityScore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->matched, CFSTR("matched"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_venueGroup, CFSTR("_venueGroup"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_venueType, CFSTR("_venueType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("_uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_SSID, CFSTR("_SSID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_unwantedNetworkName, CFSTR("_unwantedNetworkName"));

}

- (WiFi3BarsNetwork)initWithCoder:(id)a3
{
  id v3;
  WiFi3BarsNetwork *v4;
  uint64_t v5;
  NSString *password;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *attributes;
  uint64_t v12;
  TBScore *qualityScore;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  TBScore *popularityScore;
  uint64_t v19;
  NSString *uniqueIdentifier;
  uint64_t v21;
  NSString *SSID;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WiFi3BarsNetwork;
  v3 = a3;
  v4 = -[WiFi3BarsNetwork init](&v24, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
  v5 = objc_claimAutoreleasedReturnValue();
  password = v4->password;
  v4->password = (NSString *)v5;

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0, v24.receiver, v24.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("_attributes"));
  v10 = objc_claimAutoreleasedReturnValue();
  attributes = v4->_attributes;
  v4->_attributes = (NSSet *)v10;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_qualityScore"));
  v12 = objc_claimAutoreleasedReturnValue();
  qualityScore = v4->_qualityScore;
  v4->_qualityScore = (TBScore *)v12;

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("_popularityScore"));
  v17 = objc_claimAutoreleasedReturnValue();
  popularityScore = v4->_popularityScore;
  v4->_popularityScore = (TBScore *)v17;

  v4->matched = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("matched"));
  v4->_type = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("_type"));
  v4->_venueGroup = (int)objc_msgSend(v3, "decodeIntForKey:", CFSTR("_venueGroup"));
  v4->_venueType = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("_venueType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueIdentifier"));
  v19 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v4->_uniqueIdentifier;
  v4->_uniqueIdentifier = (NSString *)v19;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_SSID"));
  v21 = objc_claimAutoreleasedReturnValue();
  SSID = v4->_SSID;
  v4->_SSID = (NSString *)v21;

  LOBYTE(v16) = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("_unwantedNetworkName"));
  v4->_unwantedNetworkName = (char)v16;
  return v4;
}

- (NSString)password
{
  return self->password;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (TBScore)qualityScore
{
  return self->_qualityScore;
}

- (TBScore)popularityScore
{
  return self->_popularityScore;
}

- (BOOL)matched
{
  return self->matched;
}

- (void)setMatched:(BOOL)a3
{
  self->matched = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TBNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
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
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_popularityScore, 0);
  objc_storeStrong((id *)&self->_qualityScore, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->password, 0);
}

@end
