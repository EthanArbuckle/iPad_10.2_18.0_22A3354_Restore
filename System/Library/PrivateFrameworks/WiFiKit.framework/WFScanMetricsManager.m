@implementation WFScanMetricsManager

- (WFScanMetricsManager)init
{
  WFScanMetricsManager *v2;
  uint64_t v3;
  NSMutableDictionary *sectionCounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFScanMetricsManager;
  v2 = -[WFScanMetricsManager init](&v6, sel_init);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  sectionCounts = v2->_sectionCounts;
  v2->_sectionCounts = (NSMutableDictionary *)v3;

  -[WFScanMetricsManager reset](v2, "reset");
  return v2;
}

- (void)reset
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *timestamp;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v3 && os_log_type_enabled(v3, v4))
  {
    v14 = 136315138;
    v15 = "-[WFScanMetricsManager reset]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s", (uint8_t *)&v14, 0xCu);
  }

  -[WFScanMetricsManager setSubmited:](self, "setSubmited:", 0);
  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", &unk_24DC5D810, CFSTR("known"));

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", &unk_24DC5D810, CFSTR("hotspot"));

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", &unk_24DC5D810, CFSTR("public"));

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", &unk_24DC5D810, CFSTR("infra"));

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", &unk_24DC5D810, CFSTR("adhoc"));

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", &unk_24DC5D810, CFSTR("accessory"));

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v12;

}

- (void)submit
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  os_log_type_t v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!-[WFScanMetricsManager submited](self, "submited"))
  {
    -[WFScanMetricsManager timestamp](self, "timestamp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;

    WFLogForCategory(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6)
    {
      v8 = v6;
      if (os_log_type_enabled(v8, v7))
      {
        -[WFScanMetricsManager timestamp](self, "timestamp");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v19 = 134217984;
        v20 = -v10;
        _os_log_impl(&dword_219FC8000, v8, v7, "scan metrics session duration %f", (uint8_t *)&v19, 0xCu);

      }
    }
    v11 = -v5;

    WFLogForCategory(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v12)
    {
      v14 = v12;
      if (os_log_type_enabled(v14, v13))
      {
        -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
        v15 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v19 = 138412290;
        v20 = v15;
        _os_log_impl(&dword_219FC8000, v14, v13, "scan metrics section counts %@", (uint8_t *)&v19, 0xCu);

      }
    }

    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFScanSessionEvent scanSessionEventWithSectionCounts:duration:](WFScanSessionEvent, "scanSessionEventWithSectionCounts:duration:", v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processEvent:", v18);

    -[WFScanMetricsManager setSubmited:](self, "setSubmited:", 1);
  }
}

- (void)ingestScanResults:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a3;
  objc_msgSend(v46, "knownNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("known"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v5 > v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("known"));

  }
  objc_msgSend(v46, "infrastructureNetworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("infra"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  if (v12 > v15)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("infra"));

  }
  objc_msgSend(v46, "instantHotspotNetworks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("hotspot"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  if (v19 > v22)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("hotspot"));

  }
  objc_msgSend(v46, "popularNetworks");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("public"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedIntegerValue");

  if (v26 > v29)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("public"));

  }
  objc_msgSend(v46, "adhocNetworks");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("adhoc"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedIntegerValue");

  if (v33 > v36)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("adhoc"));

  }
  objc_msgSend(v46, "unconfiguredNetworks");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("accessory"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "unsignedIntegerValue");

  if (v40 > v43)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScanMetricsManager sectionCounts](self, "sectionCounts");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("accessory"));

  }
}

- (id)sectionNameForRecord:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isKnown") & 1) != 0)
  {
    v4 = CFSTR("known");
  }
  else if ((objc_msgSend(v3, "isInstantHotspot") & 1) != 0)
  {
    v4 = CFSTR("hotspot");
  }
  else if ((objc_msgSend(v3, "isPopular") & 1) != 0)
  {
    v4 = CFSTR("public");
  }
  else if ((objc_msgSend(v3, "isAdhoc") & 1) != 0)
  {
    v4 = CFSTR("adhoc");
  }
  else if (objc_msgSend(v3, "isUnconfiguredAccessory"))
  {
    v4 = CFSTR("accessory");
  }
  else
  {
    v4 = CFSTR("infra");
  }

  return (id)v4;
}

- (NSMutableDictionary)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
  objc_storeStrong((id *)&self->_sectionCounts, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)submited
{
  return self->_submited;
}

- (void)setSubmited:(BOOL)a3
{
  self->_submited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sectionCounts, 0);
}

@end
