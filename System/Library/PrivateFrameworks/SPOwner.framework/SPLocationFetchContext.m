@implementation SPLocationFetchContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastOnlineLocationInfo, 0);
  objc_storeStrong((id *)&self->_searchLocationSources, 0);
  objc_storeStrong((id *)&self->_searchTypes, 0);
  objc_storeStrong((id *)&self->_searchPriority, 0);
  objc_storeStrong((id *)&self->_searchIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationFetchContext)initWithCoder:(id)a3
{
  id v4;
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
  float v23;
  unint64_t v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cachePolicy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setCachePolicy:](self, "setCachePolicy:", v5);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("searchIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setSearchIdentifiers:](self, "setSearchIdentifiers:", v9);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("searchPriority"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setSearchPriority:](self, "setSearchPriority:", v13);

  v14 = (void *)MEMORY[0x1E0C99E60];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("searchTypes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setSearchTypes:](self, "setSearchTypes:", v17);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("searchLocationSources"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setSearchLocationSources:](self, "setSearchLocationSources:", v21);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationFetchContext setBundleIdentifier:](self, "setBundleIdentifier:", v22);

  -[SPLocationFetchContext setSubscribe:](self, "setSubscribe:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("subscribe")));
  -[SPLocationFetchContext setReportDeviceEvents:](self, "setReportDeviceEvents:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reportDeviceEvents")));
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("primaryIndexRangeStart"));
  v24 = (unint64_t)v23;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("primaryIndexRangeLength"));
  -[SPLocationFetchContext setPrimaryIndexRange:](self, "setPrimaryIndexRange:", v24, (unint64_t)v25);
  v26 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27, v31, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("lastOnlineLocationInfo"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPLocationFetchContext setLastOnlineLocationInfo:](self, "setLastOnlineLocationInfo:", v29);
  return self;
}

- (void)setSearchLocationSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSearchTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSearchIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLastOnlineLocationInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCachePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSubscribe:(BOOL)a3
{
  self->_subscribe = a3;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSearchPriority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPrimaryIndexRange:(_NSRange)a3
{
  self->_primaryIndexRange = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  double v13;
  id v14;

  v14 = a3;
  -[SPLocationFetchContext cachePolicy](self, "cachePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("cachePolicy"));

  -[SPLocationFetchContext searchIdentifiers](self, "searchIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("searchIdentifiers"));

  -[SPLocationFetchContext searchPriority](self, "searchPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("searchPriority"));

  -[SPLocationFetchContext searchTypes](self, "searchTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("searchTypes"));

  -[SPLocationFetchContext searchLocationSources](self, "searchLocationSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("searchLocationSources"));

  -[SPLocationFetchContext bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("bundleIdentifier"));

  objc_msgSend(v14, "encodeBool:forKey:", -[SPLocationFetchContext subscribe](self, "subscribe"), CFSTR("subscribe"));
  objc_msgSend(v14, "encodeBool:forKey:", -[SPLocationFetchContext reportDeviceEvents](self, "reportDeviceEvents"), CFSTR("reportDeviceEvents"));
  -[SPLocationFetchContext lastOnlineLocationInfo](self, "lastOnlineLocationInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("lastOnlineLocationInfo"));

  *(float *)&v11 = (float)(unint64_t)-[SPLocationFetchContext primaryIndexRange](self, "primaryIndexRange");
  objc_msgSend(v14, "encodeFloat:forKey:", CFSTR("primaryIndexRangeStart"), v11);
  -[SPLocationFetchContext primaryIndexRange](self, "primaryIndexRange");
  *(float *)&v13 = (float)v12;
  objc_msgSend(v14, "encodeFloat:forKey:", CFSTR("primaryIndexRangeLength"), v13);

}

- (_NSRange)primaryIndexRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_primaryIndexRange.length;
  location = self->_primaryIndexRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)searchLocationSources
{
  return self->_searchLocationSources;
}

- (NSArray)searchIdentifiers
{
  return self->_searchIdentifiers;
}

- (BOOL)subscribe
{
  return self->_subscribe;
}

- (NSArray)searchTypes
{
  return self->_searchTypes;
}

- (NSArray)searchPriority
{
  return self->_searchPriority;
}

- (NSDictionary)lastOnlineLocationInfo
{
  return self->_lastOnlineLocationInfo;
}

- (NSString)cachePolicy
{
  return self->_cachePolicy;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void *)objc_opt_new();
  -[SPLocationFetchContext cachePolicy](self, "cachePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachePolicy:", v5);

  -[SPLocationFetchContext searchIdentifiers](self, "searchIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchIdentifiers:", v6);

  -[SPLocationFetchContext searchPriority](self, "searchPriority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchPriority:", v7);

  -[SPLocationFetchContext searchTypes](self, "searchTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchTypes:", v8);

  -[SPLocationFetchContext searchLocationSources](self, "searchLocationSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchLocationSources:", v9);

  -[SPLocationFetchContext bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v10);

  objc_msgSend(v4, "setSubscribe:", -[SPLocationFetchContext subscribe](self, "subscribe"));
  objc_msgSend(v4, "setReportDeviceEvents:", -[SPLocationFetchContext reportDeviceEvents](self, "reportDeviceEvents"));
  -[SPLocationFetchContext lastOnlineLocationInfo](self, "lastOnlineLocationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastOnlineLocationInfo:", v11);

  v12 = -[SPLocationFetchContext primaryIndexRange](self, "primaryIndexRange");
  objc_msgSend(v4, "setPrimaryIndexRange:", v12, v13);
  return v4;
}

- (BOOL)reportDeviceEvents
{
  return self->_reportDeviceEvents;
}

- (void)setReportDeviceEvents:(BOOL)a3
{
  self->_reportDeviceEvents = a3;
}

@end
