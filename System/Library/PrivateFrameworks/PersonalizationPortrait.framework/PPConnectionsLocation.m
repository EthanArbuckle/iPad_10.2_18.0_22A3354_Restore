@implementation PPConnectionsLocation

- (PPConnectionsLocation)initWithOriginatingBundleID:(id)a3
{
  id v4;
  PPConnectionsLocation *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *originatingBundleID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsLocation;
  v5 = -[PPConnectionsLocation init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "copy");
    originatingBundleID = v5->_originatingBundleID;
    v5->_originatingBundleID = (NSString *)v9;

  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)quickTypeItem
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;

  -[PPConnectionsLocation label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PPConnectionsLocation value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsLocation label](self, "label");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PPConnectionsLocation value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v6) & 1) != 0)
      {
        v7 = 0;
      }
      else
      {
        -[PPConnectionsLocation label](self, "label");
        v7 = objc_claimAutoreleasedReturnValue();
      }

      v5 = (__CFString *)v7;
    }

  }
  else
  {
    -[PPConnectionsLocation label](self, "label");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  -[PPConnectionsLocation value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &stru_1E226D4B0;
    if (v5)
      v9 = v5;
    v21 = v9;
    -[PPConnectionsLocation value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsLocation name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsLocation originatingBundleID](self, "originatingBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsLocation originatingWebsiteURL](self, "originatingWebsiteURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PPConnectionsLocation _roundedPredictionAge](self, "_roundedPredictionAge");
    v15 = -[PPConnectionsLocation shouldAggregate](self, "shouldAggregate");
    v16 = -[PPConnectionsLocation _pexItemSource](self, "_pexItemSource");
    -[PPConnectionsLocation source](self, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v20) = v16;
    LOWORD(v20) = v15;
    +[PPQuickTypeItem quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:](PPQuickTypeItem, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v21, v10, v11, 0, 4, v12, 200.0, v13, v14, v20, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unsigned)_pexItemSource
{
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", CFSTR("calendar")))
    return 3;
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", CFSTR("donation")))
    return 5;
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", CFSTR("schemaorg")))
    return 6;
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", CFSTR("siri")))
    return 8;
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", CFSTR("pasteboard")))
    return 7;
  return 0;
}

- (unint64_t)_roundedPredictionAge
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  unint64_t v10;

  -[PPConnectionsLocation createdAt](self, "createdAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  v6 = (void *)objc_opt_class();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "timeIntervalSinceDate:", v5);
  v9 = (int)v8;
  if ((int)v8 < 0)
    v9 = -v9;
  v10 = objc_msgSend(v6, "round:toNearest:", (double)v9, 30.0);

  return v10;
}

- (id)addressDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (addressDictionary_onceToken != -1)
    dispatch_once(&addressDictionary_onceToken, &__block_literal_global_1985);
  v3 = (void *)objc_opt_new();
  PPCollapseWhitespaceAndStrip(self->_value);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("FormattedAddressLines"));

  }
  PPCollapseWhitespaceAndStrip(self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Name"));
  v8 = (void *)addressDictionary_mapping;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PPConnectionsLocation_addressDictionary__block_invoke_2;
  v13[3] = &unk_1E226A460;
  v13[4] = self;
  v9 = v3;
  v14 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPConnectionsLocation i:%@ n:%@ l:%@ v:%@ b:%@ t:%@ s:%@ loc:%@ a:%@ p:%@ c:%@ ll:(%@,%@) w:%@ lt:%@ pb:%d mu:%@ ah:%@ ch:%@>"), self->_identifier, self->_name, self->_label, self->_value, self->_originatingBundleID, self->_thoroughfare, self->_subThoroughfare, self->_locality, self->_administrativeArea, self->_postalCode, self->_country, self->_latitude, self->_longitude, self->_originatingWebsiteURL, self->_lifetime, self->_copiedToPasteboard,
                                           self->_mapItemURL,
                                           self->_authorHandle,
                                           self->_contactHandles));
}

- (PPConnectionsLocation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  PPConnectionsLocation *v15;
  PPConnectionsLocation *v16;
  PPConnectionsLocation *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *fullFormattedAddress;
  uint64_t v22;
  NSString *thoroughfare;
  uint64_t v24;
  NSString *subThoroughfare;
  uint64_t v26;
  NSString *locality;
  uint64_t v28;
  NSString *administrativeArea;
  uint64_t v30;
  NSString *postalCode;
  uint64_t v32;
  NSString *country;
  uint64_t v34;
  NSNumber *latitude;
  uint64_t v36;
  NSNumber *longitude;
  uint64_t v38;
  NSURL *originatingWebsiteURL;
  uint64_t v40;
  NSURL *mapItemURL;
  uint64_t v42;
  NSString *label;
  uint64_t v44;
  NSString *value;
  uint64_t v46;
  NSString *shortValue;
  void *v48;
  void *v49;
  uint64_t v50;
  NSDictionary *addressComponents;
  uint64_t v52;
  NSString *source;
  uint64_t v54;
  NSString *trigger;
  uint64_t v56;
  NSDate *createdAt;
  uint64_t v58;
  NSNumber *lifetime;
  uint64_t v60;
  NSString *authorHandle;
  void *v62;
  void *v63;
  uint64_t v64;
  NSArray *contactHandles;
  objc_super v67;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("bid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ide"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)PPConnectionsLocation;
    v16 = -[PPConnectionsLocation init](&v67, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_identifier, v13);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nam"));
      v18 = objc_claimAutoreleasedReturnValue();
      name = v17->_name;
      v17->_name = (NSString *)v18;

      objc_storeStrong((id *)&v17->_originatingBundleID, v11);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ffa"));
      v20 = objc_claimAutoreleasedReturnValue();
      fullFormattedAddress = v17->_fullFormattedAddress;
      v17->_fullFormattedAddress = (NSString *)v20;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("thr"));
      v22 = objc_claimAutoreleasedReturnValue();
      thoroughfare = v17->_thoroughfare;
      v17->_thoroughfare = (NSString *)v22;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("sth"));
      v24 = objc_claimAutoreleasedReturnValue();
      subThoroughfare = v17->_subThoroughfare;
      v17->_subThoroughfare = (NSString *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("loc"));
      v26 = objc_claimAutoreleasedReturnValue();
      locality = v17->_locality;
      v17->_locality = (NSString *)v26;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("aar"));
      v28 = objc_claimAutoreleasedReturnValue();
      administrativeArea = v17->_administrativeArea;
      v17->_administrativeArea = (NSString *)v28;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("poc"));
      v30 = objc_claimAutoreleasedReturnValue();
      postalCode = v17->_postalCode;
      v17->_postalCode = (NSString *)v30;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("cnt"));
      v32 = objc_claimAutoreleasedReturnValue();
      country = v17->_country;
      v17->_country = (NSString *)v32;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("lat"));
      v34 = objc_claimAutoreleasedReturnValue();
      latitude = v17->_latitude;
      v17->_latitude = (NSNumber *)v34;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("lon"));
      v36 = objc_claimAutoreleasedReturnValue();
      longitude = v17->_longitude;
      v17->_longitude = (NSNumber *)v36;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("owu"));
      v38 = objc_claimAutoreleasedReturnValue();
      originatingWebsiteURL = v17->_originatingWebsiteURL;
      v17->_originatingWebsiteURL = (NSURL *)v38;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("miu"));
      v40 = objc_claimAutoreleasedReturnValue();
      mapItemURL = v17->_mapItemURL;
      v17->_mapItemURL = (NSURL *)v40;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("lab"));
      v42 = objc_claimAutoreleasedReturnValue();
      label = v17->_label;
      v17->_label = (NSString *)v42;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("val"));
      v44 = objc_claimAutoreleasedReturnValue();
      value = v17->_value;
      v17->_value = (NSString *)v44;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("shv"));
      v46 = objc_claimAutoreleasedReturnValue();
      shortValue = v17->_shortValue;
      v17->_shortValue = (NSString *)v46;

      v17->_shouldAggregate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sha"));
      v48 = (void *)MEMORY[0x18D7805AC]();
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v8, v5, 0);
      objc_autoreleasePoolPop(v48);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("add"));
      v50 = objc_claimAutoreleasedReturnValue();
      addressComponents = v17->_addressComponents;
      v17->_addressComponents = (NSDictionary *)v50;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("src"));
      v52 = objc_claimAutoreleasedReturnValue();
      source = v17->_source;
      v17->_source = (NSString *)v52;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("trg"));
      v54 = objc_claimAutoreleasedReturnValue();
      trigger = v17->_trigger;
      v17->_trigger = (NSString *)v54;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("cra"));
      v56 = objc_claimAutoreleasedReturnValue();
      createdAt = v17->_createdAt;
      v17->_createdAt = (NSDate *)v56;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("lft"));
      v58 = objc_claimAutoreleasedReturnValue();
      lifetime = v17->_lifetime;
      v17->_lifetime = (NSNumber *)v58;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("auh"));
      v60 = objc_claimAutoreleasedReturnValue();
      authorHandle = v17->_authorHandle;
      v17->_authorHandle = (NSString *)v60;

      v62 = (void *)MEMORY[0x18D7805AC]();
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, v5, 0);
      objc_autoreleasePoolPop(v62);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, CFSTR("cnh"));
      v64 = objc_claimAutoreleasedReturnValue();
      contactHandles = v17->_contactHandles;
      v17->_contactHandles = (NSArray *)v64;

      v17->_copiedToPasteboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cpb"));
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("ide"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("nam"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingBundleID, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullFormattedAddress, CFSTR("ffa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thoroughfare, CFSTR("thr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subThoroughfare, CFSTR("sth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locality, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_administrativeArea, CFSTR("aar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("poc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("cnt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latitude, CFSTR("lat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longitude, CFSTR("lon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingWebsiteURL, CFSTR("owu"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItemURL, CFSTR("miu"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("lab"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("val"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortValue, CFSTR("shv"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAggregate, CFSTR("sha"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressComponents, CFSTR("add"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trigger, CFSTR("trg"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdAt, CFSTR("cra"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lifetime, CFSTR("lft"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorHandle, CFSTR("auh"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactHandles, CFSTR("cnh"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_copiedToPasteboard, CFSTR("cpb"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSString copyWithZone:](self->_originatingBundleID, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[NSString copyWithZone:](self->_fullFormattedAddress, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[NSString copyWithZone:](self->_thoroughfare, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[NSString copyWithZone:](self->_subThoroughfare, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[NSString copyWithZone:](self->_locality, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v18;

    v20 = -[NSString copyWithZone:](self->_administrativeArea, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v20;

    v22 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v22;

    v24 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v24;

    v26 = -[NSNumber copyWithZone:](self->_latitude, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v26;

    v28 = -[NSNumber copyWithZone:](self->_longitude, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v28;

    v30 = -[NSURL copyWithZone:](self->_originatingWebsiteURL, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v30;

    v32 = -[NSURL copyWithZone:](self->_mapItemURL, "copyWithZone:", a3);
    v33 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v32;

    v34 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
    v35 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v34;

    v36 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
    v37 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v36;

    v38 = -[NSString copyWithZone:](self->_shortValue, "copyWithZone:", a3);
    v39 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v38;

    *(_BYTE *)(v5 + 9) = self->_shouldAggregate;
    v40 = -[NSDictionary copyWithZone:](self->_addressComponents, "copyWithZone:", a3);
    v41 = *(void **)(v5 + 176);
    *(_QWORD *)(v5 + 176) = v40;

    v42 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
    v43 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = v42;

    v44 = -[NSString copyWithZone:](self->_trigger, "copyWithZone:", a3);
    v45 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = v44;

    v46 = -[NSDate copyWithZone:](self->_createdAt, "copyWithZone:", a3);
    v47 = *(void **)(v5 + 200);
    *(_QWORD *)(v5 + 200) = v46;

    v48 = -[NSNumber copyWithZone:](self->_lifetime, "copyWithZone:", a3);
    v49 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v48;

    v50 = -[NSString copyWithZone:](self->_authorHandle, "copyWithZone:", a3);
    v51 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v50;

    v52 = -[NSArray copyWithZone:](self->_contactHandles, "copyWithZone:", a3);
    v53 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v52;

    *(_BYTE *)(v5 + 8) = self->_copiedToPasteboard;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PPConnectionsLocation *v4;
  PPConnectionsLocation *v5;
  BOOL v6;

  v4 = (PPConnectionsLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPConnectionsLocation isEqualToConnectionsLocation:](self, "isEqualToConnectionsLocation:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqualToConnectionsLocation:(id)a3
{
  id *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *name;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *originatingBundleID;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *fullFormattedAddress;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *thoroughfare;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  NSString *subThoroughfare;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  NSString *locality;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  NSString *administrativeArea;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  char v44;
  NSString *postalCode;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  char v49;
  NSString *country;
  NSString *v51;
  NSString *v52;
  NSString *v53;
  char v54;
  NSNumber *latitude;
  NSNumber *v56;
  NSNumber *v57;
  NSNumber *v58;
  char v59;
  NSNumber *longitude;
  NSNumber *v61;
  NSNumber *v62;
  NSNumber *v63;
  char v64;
  NSURL *originatingWebsiteURL;
  NSURL *v66;
  NSURL *v67;
  NSURL *v68;
  char v69;
  NSURL *mapItemURL;
  NSURL *v71;
  NSURL *v72;
  NSURL *v73;
  char v74;
  NSString *label;
  NSString *v76;
  NSString *v77;
  NSString *v78;
  char v79;
  NSString *value;
  NSString *v81;
  NSString *v82;
  NSString *v83;
  char v84;
  NSString *shortValue;
  NSString *v86;
  NSString *v87;
  NSString *v88;
  char v89;
  NSDictionary *addressComponents;
  NSDictionary *v91;
  NSDictionary *v92;
  NSDictionary *v93;
  char v94;
  NSString *source;
  NSString *v96;
  NSString *v97;
  NSString *v98;
  char v99;
  NSString *trigger;
  NSString *v101;
  NSString *v102;
  NSString *v103;
  char v104;
  NSDate *createdAt;
  NSDate *v106;
  NSDate *v107;
  NSDate *v108;
  char v109;
  NSNumber *lifetime;
  NSNumber *v111;
  NSNumber *v112;
  NSNumber *v113;
  char v114;
  NSString *authorHandle;
  NSString *v116;
  NSString *v117;
  NSString *v118;
  char v119;
  NSArray *contactHandles;
  NSArray *v121;
  NSArray *v122;
  NSArray *v123;
  char v124;
  BOOL v125;

  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = identifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_96;
  }
  name = self->_name;
  v11 = (NSString *)v4[3];
  if (name == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = name;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_96;
  }
  originatingBundleID = self->_originatingBundleID;
  v16 = (NSString *)v4[4];
  if (originatingBundleID == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = originatingBundleID;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_96;
  }
  fullFormattedAddress = self->_fullFormattedAddress;
  v21 = (NSString *)v4[5];
  if (fullFormattedAddress == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = fullFormattedAddress;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_96;
  }
  thoroughfare = self->_thoroughfare;
  v26 = (NSString *)v4[6];
  if (thoroughfare == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = thoroughfare;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_96;
  }
  subThoroughfare = self->_subThoroughfare;
  v31 = (NSString *)v4[7];
  if (subThoroughfare == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = subThoroughfare;
    v34 = -[NSString isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_96;
  }
  locality = self->_locality;
  v36 = (NSString *)v4[8];
  if (locality == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = locality;
    v39 = -[NSString isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
      goto LABEL_96;
  }
  administrativeArea = self->_administrativeArea;
  v41 = (NSString *)v4[9];
  if (administrativeArea == v41)
  {

  }
  else
  {
    v42 = v41;
    v43 = administrativeArea;
    v44 = -[NSString isEqual:](v43, "isEqual:", v42);

    if ((v44 & 1) == 0)
      goto LABEL_96;
  }
  postalCode = self->_postalCode;
  v46 = (NSString *)v4[10];
  if (postalCode == v46)
  {

  }
  else
  {
    v47 = v46;
    v48 = postalCode;
    v49 = -[NSString isEqual:](v48, "isEqual:", v47);

    if ((v49 & 1) == 0)
      goto LABEL_96;
  }
  country = self->_country;
  v51 = (NSString *)v4[11];
  if (country == v51)
  {

  }
  else
  {
    v52 = v51;
    v53 = country;
    v54 = -[NSString isEqual:](v53, "isEqual:", v52);

    if ((v54 & 1) == 0)
      goto LABEL_96;
  }
  latitude = self->_latitude;
  v56 = (NSNumber *)v4[12];
  if (latitude == v56)
  {

  }
  else
  {
    v57 = v56;
    v58 = latitude;
    v59 = -[NSNumber isEqual:](v58, "isEqual:", v57);

    if ((v59 & 1) == 0)
      goto LABEL_96;
  }
  longitude = self->_longitude;
  v61 = (NSNumber *)v4[13];
  if (longitude == v61)
  {

  }
  else
  {
    v62 = v61;
    v63 = longitude;
    v64 = -[NSNumber isEqual:](v63, "isEqual:", v62);

    if ((v64 & 1) == 0)
      goto LABEL_96;
  }
  originatingWebsiteURL = self->_originatingWebsiteURL;
  v66 = (NSURL *)v4[14];
  if (originatingWebsiteURL == v66)
  {

  }
  else
  {
    v67 = v66;
    v68 = originatingWebsiteURL;
    v69 = -[NSURL isEqual:](v68, "isEqual:", v67);

    if ((v69 & 1) == 0)
      goto LABEL_96;
  }
  mapItemURL = self->_mapItemURL;
  v71 = (NSURL *)v4[15];
  if (mapItemURL == v71)
  {

  }
  else
  {
    v72 = v71;
    v73 = mapItemURL;
    v74 = -[NSURL isEqual:](v73, "isEqual:", v72);

    if ((v74 & 1) == 0)
      goto LABEL_96;
  }
  label = self->_label;
  v76 = (NSString *)v4[18];
  if (label == v76)
  {

  }
  else
  {
    v77 = v76;
    v78 = label;
    v79 = -[NSString isEqual:](v78, "isEqual:", v77);

    if ((v79 & 1) == 0)
      goto LABEL_96;
  }
  value = self->_value;
  v81 = (NSString *)v4[19];
  if (value == v81)
  {

  }
  else
  {
    v82 = v81;
    v83 = value;
    v84 = -[NSString isEqual:](v83, "isEqual:", v82);

    if ((v84 & 1) == 0)
      goto LABEL_96;
  }
  shortValue = self->_shortValue;
  v86 = (NSString *)v4[20];
  if (shortValue == v86)
  {

  }
  else
  {
    v87 = v86;
    v88 = shortValue;
    v89 = -[NSString isEqual:](v88, "isEqual:", v87);

    if ((v89 & 1) == 0)
      goto LABEL_96;
  }
  if (self->_shouldAggregate == *((unsigned __int8 *)v4 + 9))
  {
    addressComponents = self->_addressComponents;
    v91 = (NSDictionary *)v4[22];
    if (addressComponents == v91)
    {

    }
    else
    {
      v92 = v91;
      v93 = addressComponents;
      v94 = -[NSDictionary isEqual:](v93, "isEqual:", v92);

      if ((v94 & 1) == 0)
        goto LABEL_96;
    }
    source = self->_source;
    v96 = (NSString *)v4[23];
    if (source == v96)
    {

    }
    else
    {
      v97 = v96;
      v98 = source;
      v99 = -[NSString isEqual:](v98, "isEqual:", v97);

      if ((v99 & 1) == 0)
        goto LABEL_96;
    }
    trigger = self->_trigger;
    v101 = (NSString *)v4[24];
    if (trigger == v101)
    {

    }
    else
    {
      v102 = v101;
      v103 = trigger;
      v104 = -[NSString isEqual:](v103, "isEqual:", v102);

      if ((v104 & 1) == 0)
        goto LABEL_96;
    }
    createdAt = self->_createdAt;
    v106 = (NSDate *)v4[25];
    if (createdAt == v106)
    {

    }
    else
    {
      v107 = v106;
      v108 = createdAt;
      v109 = -[NSDate isEqual:](v108, "isEqual:", v107);

      if ((v109 & 1) == 0)
        goto LABEL_96;
    }
    lifetime = self->_lifetime;
    v111 = (NSNumber *)v4[26];
    if (lifetime == v111)
    {

    }
    else
    {
      v112 = v111;
      v113 = lifetime;
      v114 = -[NSNumber isEqual:](v113, "isEqual:", v112);

      if ((v114 & 1) == 0)
        goto LABEL_96;
    }
    authorHandle = self->_authorHandle;
    v116 = (NSString *)v4[17];
    if (authorHandle == v116)
    {

    }
    else
    {
      v117 = v116;
      v118 = authorHandle;
      v119 = -[NSString isEqual:](v118, "isEqual:", v117);

      if ((v119 & 1) == 0)
        goto LABEL_96;
    }
    contactHandles = self->_contactHandles;
    v121 = (NSArray *)v4[16];
    if (contactHandles == v121)
    {

    }
    else
    {
      v122 = v121;
      v123 = contactHandles;
      v124 = -[NSArray isEqual:](v123, "isEqual:", v122);

      if ((v124 & 1) == 0)
        goto LABEL_96;
    }
    v125 = *((unsigned __int8 *)v4 + 8) == self->_copiedToPasteboard;
    goto LABEL_97;
  }
LABEL_96:
  v125 = 0;
LABEL_97:

  return v125;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (NSString)fullFormattedAddress
{
  return self->_fullFormattedAddress;
}

- (void)setFullFormattedAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (void)setThoroughfare:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (void)setSubThoroughfare:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (void)setOriginatingWebsiteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
}

- (void)setMapItemURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)authorHandle
{
  return self->_authorHandle;
}

- (void)setAuthorHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)copiedToPasteboard
{
  return self->_copiedToPasteboard;
}

- (void)setCopiedToPasteboard:(BOOL)a3
{
  self->_copiedToPasteboard = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)shortValue
{
  return self->_shortValue;
}

- (void)setShortValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (void)setShouldAggregate:(BOOL)a3
{
  self->_shouldAggregate = a3;
}

- (NSString)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)addressComponents
{
  return self->_addressComponents;
}

- (void)setAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)lifetime
{
  return self->_lifetime;
}

- (void)setLifetime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_shortValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_authorHandle, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_fullFormattedAddress, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __42__PPConnectionsLocation_addressDictionary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void __42__PPConnectionsLocation_addressDictionary__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB3260];
  v4[0] = *MEMORY[0x1E0CB3298];
  v4[1] = v0;
  v5[0] = CFSTR("Street");
  v5[1] = CFSTR("City");
  v1 = *MEMORY[0x1E0CB32A0];
  v4[2] = *MEMORY[0x1E0CB3290];
  v4[3] = v1;
  v5[2] = CFSTR("State");
  v5[3] = CFSTR("ZIP");
  v4[4] = *MEMORY[0x1E0CB3268];
  v5[4] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)addressDictionary_mapping;
  addressDictionary_mapping = v2;

}

+ (unint64_t)round:(double)a3 toNearest:(double)a4
{
  float v4;
  float v5;

  v4 = a3 / a4 + 0.5;
  v5 = floorf(v4) * a4;
  return vcvtas_u32_f32(v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
