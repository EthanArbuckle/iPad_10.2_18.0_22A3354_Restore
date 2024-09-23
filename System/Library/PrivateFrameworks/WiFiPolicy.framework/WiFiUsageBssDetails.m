@implementation WiFiUsageBssDetails

+ (id)bssWithIdentifier:(id)a3 channel:(int64_t)a4 channelFlags:(unint64_t)a5 rssi:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v9 = a3;
  v10 = (void *)objc_opt_class();
  +[WiFiUsageAccessPointProfile profileForBSSID:](WiFiUsageAccessPointProfile, "profileForBSSID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 0;
  objc_msgSend(v10, "bssWithIdentifier:apProfile:apMode:phyMode:channel:channelFlags:channelWidth:rssi:latitude:longitude:isEdgeBss:", v9, v11, 0, 0, a4, a5, 0.0, 0.0, 0, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bssWithIdentifier:(id)a3 apProfile:(id)a4 apMode:(int64_t)a5 phyMode:(int)a6 channel:(int64_t)a7 channelFlags:(unint64_t)a8 channelWidth:(int64_t)a9 rssi:(int64_t)a10 latitude:(double)a11 longitude:(double)a12 isEdgeBss:(BOOL)a13
{
  uint64_t v17;
  id v21;
  id v22;
  id v23;
  void *v24;

  v17 = *(_QWORD *)&a6;
  v21 = a3;
  v22 = a4;
  v23 = objc_alloc_init((Class)a1);
  objc_msgSend(v23, "setBssid:", v21);
  objc_msgSend(v23, "setApMode:", a5);
  objc_msgSend(v23, "setPhyMode:", v17);
  objc_msgSend(v23, "setChannelFlags:", a8);
  objc_msgSend(v23, "setBand:", +[WiFiUsagePrivacyFilter bandFromFlags:](WiFiUsagePrivacyFilter, "bandFromFlags:", a8));
  objc_msgSend(v23, "setChannel:", a7);
  objc_msgSend(v23, "setChannelWidth:", +[WiFiUsagePrivacyFilter channelWidthFromFlags:](WiFiUsagePrivacyFilter, "channelWidthFromFlags:", a8));
  objc_msgSend(v23, "setLocationLatitude:", a11);
  objc_msgSend(v23, "setLocationLongitude:", a12);
  objc_msgSend(v23, "setIsEdgeBss:", a13);
  objc_msgSend(v23, "setRssi:", a10);
  objc_msgSend(v23, "setNSS:", 0x7FFFFFFFFFFFFFFFLL);
  if (v22)
  {
    objc_msgSend(v23, "setApProfile:", v22);
  }
  else
  {
    +[WiFiUsageAccessPointProfile profileForBSSID:](WiFiUsageAccessPointProfile, "profileForBSSID:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setApProfile:", v24);

  }
  objc_msgSend(v23, "setCurrentMloPreferredBand:", 3);

  return v23;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setPhyMode:(int)a3
{
  self->_phyMode = a3;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (void)setIsEdgeBss:(BOOL)a3
{
  self->_isEdgeBss = a3;
}

- (void)setChannelWidth:(int64_t)a3
{
  self->_channelWidth = a3;
}

- (void)setChannelFlags:(unint64_t)a3
{
  self->_channelFlags = a3;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBand:(int)a3
{
  self->_band = a3;
}

- (void)setApProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setApMode:(int64_t)a3
{
  self->_apMode = a3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WiFiUsageBssDetails bssid](self, "bssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WiFiUsageBssDetails bssid](self, "bssid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (int)phyMode
{
  return self->_phyMode;
}

- (int64_t)channel
{
  return self->_channel;
}

- (int64_t)channelWidth
{
  return self->_channelWidth;
}

- (int)band
{
  return self->_band;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mloTrafficSwitchEnabled, 0);
  objc_storeStrong((id *)&self->_currentMloLinks, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t channel;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", self->_bssid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  channel = self->_channel;
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_band);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{BSSID:%@,Channel:%d(%@ Ghz),RSSI:%d}"), v4, channel, v6, self->_rssi);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)redactedDescription
{
  void *v3;
  int64_t channel;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  channel = self->_channel;
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_band);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{BSSID:<redacted>,Channel:%d(%@ Ghz),RSSI:%d}"), channel, v5, self->_rssi);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)apProfile
{
  NSString *apProfile;
  NSString *v4;
  NSString *v5;

  apProfile = self->_apProfile;
  if (!apProfile)
  {
    +[WiFiUsageAccessPointProfile profileForBSSID:](WiFiUsageAccessPointProfile, "profileForBSSID:", self->_bssid);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_apProfile;
    self->_apProfile = v4;

    apProfile = self->_apProfile;
  }
  return apProfile;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  uint64_t v7;

  v4 = (void *)objc_opt_class();
  LOBYTE(v7) = self->_isEdgeBss;
  objc_msgSend(v4, "bssWithIdentifier:apProfile:apMode:phyMode:channel:channelFlags:channelWidth:rssi:latitude:longitude:isEdgeBss:", self->_bssid, self->_apProfile, self->_apMode, self->_phyMode, self->_channel, self->_channelFlags, self->_locationLatitude, self->_locationLongitude, self->_channelWidth, self->_rssi, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasAppleIE:", self->_hasAppleIE);
  objc_msgSend(v5, "setHasInterworkingIE:", self->_hasInterworkingIE);
  objc_msgSend(v5, "setHasWpsIE:", self->_hasWpsIE);
  objc_msgSend(v5, "setHasDomainName:", self->_hasDomainName);
  objc_msgSend(v5, "setHasNaiRealms:", self->_hasNaiRealms);
  objc_msgSend(v5, "setHasRoamingOis:", self->_hasRoamingOis);
  objc_msgSend(v5, "setNetworkAccessCode:", self->_networkAccessCode);
  objc_msgSend(v5, "setVenueGroup:", self->_venueGroup);
  objc_msgSend(v5, "setVenueCode:", self->_venueCode);
  objc_msgSend(v5, "setModelName:", self->_modelName);
  objc_msgSend(v5, "setModelNumber:", self->_modelNumber);
  objc_msgSend(v5, "setManufacturerName:", self->_manufacturerName);
  objc_msgSend(v5, "setDeviceVersion:", self->_deviceVersion);
  objc_msgSend(v5, "setRssi:", self->_rssi);
  return v5;
}

- (id)eventDictionary:(BOOL)a3
{
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_bssid, CFSTR("NetworkBssIdentifier"));
  if (self->_bssid)
  {
    +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("NetworkBssOui"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_apProfile, CFSTR("NetworkBssApProfile"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_phyMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("NetworkBssPhyMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_apMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("NetworkBssApMode"));

  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_band);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("NetworkBssBand"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_channel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("NetworkBssChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_channelWidth);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("NetworkBssChannelWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEdgeBss);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("NetworkBssIsEdge"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAppleIE);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("NetworkBssHasAppleIE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasInterworkingIE);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("NetworkBssHasInterworkingIE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWpsIE);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("NetworkBssHasWpsIE"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasDomainName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("NetworkBssHasDomainName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasNaiRealms);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("NetworkBssHasNaiRealms"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRoamingOis);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("NetworkBssHasRoamingOis"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_networkAccessCode);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("NetworkBssNetworkAccessCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_venueGroup);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("NetworkBssVenueGroup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_venueCode);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("NetworkBssVenueCode"));

  return v6;
}

- (BOOL)isOnChannel:(id)a3
{
  id v4;
  void *v5;
  int band;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  band = self->_band;
  if (band)
  {
    if (band != 2)
    {
      if (band != 1 || (objc_msgSend(v4, "is5GHz") & 1) == 0)
        goto LABEL_5;
LABEL_9:
      v7 = self->_channel == objc_msgSend(v5, "channelNumber");
      goto LABEL_10;
    }
    if ((objc_msgSend(v4, "is6GHz") & 1) != 0)
      goto LABEL_9;
  }
  else if (objc_msgSend(v4, "is2_4GHz"))
  {
    goto LABEL_9;
  }
LABEL_5:
  v7 = 0;
LABEL_10:

  return v7;
}

- (void)updateMLORuntimeConfig:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int *var1;
  void *v10;
  NSArray *v11;
  NSArray *currentMloLinks;

  -[WiFiUsageBssDetails setCurrentMloLinksCount:](self, "setCurrentMloLinksCount:", a3->var0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssDetails setMloTrafficSwitchEnabled:](self, "setMloTrafficSwitchEnabled:", v5);

  v6 = (void *)MEMORY[0x1D17AC818](-[WiFiUsageBssDetails setCurrentMloPreferredBand:](self, "setCurrentMloPreferredBand:", a3->var2));
  v7 = (void *)objc_opt_new();
  v8 = 0;
  var1 = a3->var1;
  do
  {
    if (var1[v8] != 3)
    {
      +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

    }
    ++v8;
  }
  while (v8 != 3);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  currentMloLinks = self->_currentMloLinks;
  self->_currentMloLinks = v11;

  objc_autoreleasePoolPop(v6);
}

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (int64_t)nSS
{
  return self->_nSS;
}

- (void)setNSS:(int64_t)a3
{
  self->_nSS = a3;
}

- (int64_t)apMode
{
  return self->_apMode;
}

- (unint64_t)channelFlags
{
  return self->_channelFlags;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (BOOL)isEdgeBss
{
  return self->_isEdgeBss;
}

- (BOOL)hasAppleIE
{
  return self->_hasAppleIE;
}

- (void)setHasAppleIE:(BOOL)a3
{
  self->_hasAppleIE = a3;
}

- (BOOL)hasInterworkingIE
{
  return self->_hasInterworkingIE;
}

- (void)setHasInterworkingIE:(BOOL)a3
{
  self->_hasInterworkingIE = a3;
}

- (BOOL)hasWpsIE
{
  return self->_hasWpsIE;
}

- (void)setHasWpsIE:(BOOL)a3
{
  self->_hasWpsIE = a3;
}

- (BOOL)hasDomainName
{
  return self->_hasDomainName;
}

- (void)setHasDomainName:(BOOL)a3
{
  self->_hasDomainName = a3;
}

- (BOOL)hasNaiRealms
{
  return self->_hasNaiRealms;
}

- (void)setHasNaiRealms:(BOOL)a3
{
  self->_hasNaiRealms = a3;
}

- (BOOL)hasRoamingOis
{
  return self->_hasRoamingOis;
}

- (void)setHasRoamingOis:(BOOL)a3
{
  self->_hasRoamingOis = a3;
}

- (unint64_t)networkAccessCode
{
  return self->_networkAccessCode;
}

- (void)setNetworkAccessCode:(unint64_t)a3
{
  self->_networkAccessCode = a3;
}

- (unint64_t)venueGroup
{
  return self->_venueGroup;
}

- (void)setVenueGroup:(unint64_t)a3
{
  self->_venueGroup = a3;
}

- (unint64_t)venueCode
{
  return self->_venueCode;
}

- (void)setVenueCode:(unint64_t)a3
{
  self->_venueCode = a3;
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)currentMloLinksCount
{
  return self->_currentMloLinksCount;
}

- (void)setCurrentMloLinksCount:(unint64_t)a3
{
  self->_currentMloLinksCount = a3;
}

- (int)currentMloPreferredBand
{
  return self->_currentMloPreferredBand;
}

- (void)setCurrentMloPreferredBand:(int)a3
{
  self->_currentMloPreferredBand = a3;
}

- (NSArray)currentMloLinks
{
  return self->_currentMloLinks;
}

- (void)setCurrentMloLinks:(id)a3
{
  objc_storeStrong((id *)&self->_currentMloLinks, a3);
}

- (NSNumber)mloTrafficSwitchEnabled
{
  return self->_mloTrafficSwitchEnabled;
}

- (void)setMloTrafficSwitchEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_mloTrafficSwitchEnabled, a3);
}

@end
