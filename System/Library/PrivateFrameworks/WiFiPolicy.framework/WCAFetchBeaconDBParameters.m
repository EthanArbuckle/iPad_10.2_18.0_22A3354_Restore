@implementation WCAFetchBeaconDBParameters

- (void)fetchWithCompletion:(id)a3
{
  id v4;
  WCAFetchSQLiteRequest *v5;
  void *v6;
  float v7;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;

  v4 = a3;
  v5 = objc_alloc_init(WCAFetchSQLiteRequest);
  -[WCAFetchSQLiteRequest setTableName:](v5, "setTableName:", CFSTR("prof_clean"));
  -[WCAFetchSQLiteRequest setColumnNames:](v5, "setColumnNames:", &unk_1E88641C0);
  -[WCAFetchSQLiteRequest setLimit:](v5, "setLimit:", 1);
  v6 = (void *)objc_opt_new();
  -[WCAFetchBeaconDBParameters wlanTimDtimPeriod](self, "wlanTimDtimPeriod");
  if (v7 != 0.0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[WCAFetchBeaconDBParameters wlanTimDtimPeriod](self, "wlanTimDtimPeriod");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("wlan-tim-dtim_period"));

  }
  -[WCAFetchBeaconDBParameters wlanHTCapabilities](self, "wlanHTCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WCAFetchBeaconDBParameters wlanHTCapabilities](self, "wlanHTCapabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("wlan-ht-capabilities"));

  }
  -[WCAFetchBeaconDBParameters wlanWfaIeWmeQosInfo](self, "wlanWfaIeWmeQosInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WCAFetchBeaconDBParameters wlanWfaIeWmeQosInfo](self, "wlanWfaIeWmeQosInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v13, CFSTR("wlan-wfa-ie-wme-qos_info"));

  }
  -[WCAFetchBeaconDBParameters wlanHtexCapabilities](self, "wlanHtexCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WCAFetchBeaconDBParameters wlanHtexCapabilities](self, "wlanHtexCapabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("wlan-htex-capabilities"));

  }
  -[WCAFetchBeaconDBParameters wlanHTAmpduparam](self, "wlanHTAmpduparam");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WCAFetchBeaconDBParameters wlanHTAmpduparam](self, "wlanHTAmpduparam");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("wlan-ht-ampduparam"));

  }
  -[WCAFetchBeaconDBParameters wlanVhtCapabilities](self, "wlanVhtCapabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WCAFetchBeaconDBParameters wlanVhtCapabilities](self, "wlanVhtCapabilities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("wlan-vht-capabilities"));

  }
  -[WCAFetchBeaconDBParameters wlanTxbf](self, "wlanTxbf");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[WCAFetchBeaconDBParameters wlanTxbf](self, "wlanTxbf");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v21, CFSTR("wlan-txbf"));

  }
  -[WCAFetchBeaconDBParameters wlanAsel](self, "wlanAsel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[WCAFetchBeaconDBParameters wlanAsel](self, "wlanAsel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v23, CFSTR("wlan-asel"));

  }
  -[WCAFetchBeaconDBParameters wlanFixedCapabilities](self, "wlanFixedCapabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[WCAFetchBeaconDBParameters wlanFixedCapabilities](self, "wlanFixedCapabilities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v25, CFSTR("wlan-fixed-capabilities"));

  }
  if (-[WCAFetchBeaconDBParameters beaconInterval](self, "beaconInterval"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[WCAFetchBeaconDBParameters beaconInterval](self, "beaconInterval"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v26, CFSTR("beacon_interval"));

  }
  if (-[WCAFetchBeaconDBParameters QBSS_Load](self, "QBSS_Load"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WCAFetchBeaconDBParameters QBSS_Load](self, "QBSS_Load"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v27, CFSTR("QBSS_Load"));

  }
  if (-[WCAFetchBeaconDBParameters has_11krm](self, "has_11krm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WCAFetchBeaconDBParameters has_11krm](self, "has_11krm"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v28, CFSTR("has_11krm"));

  }
  if (-[WCAFetchBeaconDBParameters UAPSD](self, "UAPSD"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WCAFetchBeaconDBParameters UAPSD](self, "UAPSD"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v29, CFSTR("U-APSD"));

  }
  -[WCAFetchBeaconDBParameters antennas11c](self, "antennas11c");
  if (v30 != 0.0)
  {
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[WCAFetchBeaconDBParameters antennas11c](self, "antennas11c");
    objc_msgSend(v31, "numberWithFloat:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v32, CFSTR("11c_antennas"));

  }
  -[WCAFetchBeaconDBParameters antennas11n](self, "antennas11n");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[WCAFetchBeaconDBParameters antennas11n](self, "antennas11n");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v34, CFSTR("11n_antennas"));

  }
  -[WCAFetchBeaconDBParameters max_rates](self, "max_rates");
  if (v35 != 0.0)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    -[WCAFetchBeaconDBParameters max_rates](self, "max_rates");
    objc_msgSend(v36, "numberWithFloat:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v37, CFSTR("max_rates"));

  }
  -[WCAFetchSQLiteRequest setParameters:](v5, "setParameters:", v6);
  +[WCAAsset beaconsDataAsset](WCAAsset, "beaconsDataAsset");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCAFetchRequest setAsset:](v5, "setAsset:", v38);

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke;
  v41[3] = &unk_1E881E6A8;
  v42 = v4;
  v39 = v4;
  -[WCAFetchRequest setCompletionHandler:](v5, "setCompletionHandler:", v41);
  +[WCAClient sharedClient](WCAClient, "sharedClient");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "executeFetchRequest:", v5);

}

void __50__WCAFetchBeaconDBParameters_fetchWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v12, "records");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForKey:", CFSTR("index"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)objc_msgSend(v7, "intValue");

  }
  else
  {
    v8 = -1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@"), v10);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v8);

}

- (float)wlanTimDtimPeriod
{
  return self->_wlanTimDtimPeriod;
}

- (void)setWlanTimDtimPeriod:(float)a3
{
  self->_wlanTimDtimPeriod = a3;
}

- (NSString)wlanHTCapabilities
{
  return self->_wlanHTCapabilities;
}

- (void)setWlanHTCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_wlanHTCapabilities, a3);
}

- (NSString)wlanWfaIeWmeQosInfo
{
  return self->_wlanWfaIeWmeQosInfo;
}

- (void)setWlanWfaIeWmeQosInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wlanWfaIeWmeQosInfo, a3);
}

- (NSString)wlanHtexCapabilities
{
  return self->_wlanHtexCapabilities;
}

- (void)setWlanHtexCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_wlanHtexCapabilities, a3);
}

- (NSString)wlanHTAmpduparam
{
  return self->_wlanHTAmpduparam;
}

- (void)setWlanHTAmpduparam:(id)a3
{
  objc_storeStrong((id *)&self->_wlanHTAmpduparam, a3);
}

- (NSString)wlanVhtCapabilities
{
  return self->_wlanVhtCapabilities;
}

- (void)setWlanVhtCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_wlanVhtCapabilities, a3);
}

- (NSString)wlanTxbf
{
  return self->_wlanTxbf;
}

- (void)setWlanTxbf:(id)a3
{
  objc_storeStrong((id *)&self->_wlanTxbf, a3);
}

- (NSString)wlanAsel
{
  return self->_wlanAsel;
}

- (void)setWlanAsel:(id)a3
{
  objc_storeStrong((id *)&self->_wlanAsel, a3);
}

- (NSString)wlanFixedCapabilities
{
  return self->_wlanFixedCapabilities;
}

- (void)setWlanFixedCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_wlanFixedCapabilities, a3);
}

- (int64_t)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(int64_t)a3
{
  self->_beaconInterval = a3;
}

- (BOOL)QBSS_Load
{
  return self->_QBSS_Load;
}

- (void)setQBSS_Load:(BOOL)a3
{
  self->_QBSS_Load = a3;
}

- (BOOL)has_11krm
{
  return self->_has_11krm;
}

- (void)setHas_11krm:(BOOL)a3
{
  self->_has_11krm = a3;
}

- (BOOL)UAPSD
{
  return self->_UAPSD;
}

- (void)setUAPSD:(BOOL)a3
{
  self->_UAPSD = a3;
}

- (float)antennas11c
{
  return self->_antennas11c;
}

- (void)setAntennas11c:(float)a3
{
  self->_antennas11c = a3;
}

- (NSString)antennas11n
{
  return self->_antennas11n;
}

- (void)setAntennas11n:(id)a3
{
  objc_storeStrong((id *)&self->_antennas11n, a3);
}

- (float)max_rates
{
  return self->_max_rates;
}

- (void)setMax_rates:(float)a3
{
  self->_max_rates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_antennas11n, 0);
  objc_storeStrong((id *)&self->_wlanFixedCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanAsel, 0);
  objc_storeStrong((id *)&self->_wlanTxbf, 0);
  objc_storeStrong((id *)&self->_wlanVhtCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanHTAmpduparam, 0);
  objc_storeStrong((id *)&self->_wlanHtexCapabilities, 0);
  objc_storeStrong((id *)&self->_wlanWfaIeWmeQosInfo, 0);
  objc_storeStrong((id *)&self->_wlanHTCapabilities, 0);
}

@end
