@implementation BMStreamCRDTLocation

- (id)initFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BMStreamCRDTLocation *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stream")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("site")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("day")));

  v8 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:](self, "initWithStreamName:siteIdentifier:day:", v5, v6, v7);
  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v8[0] = CFSTR("stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](self, "streamName"));
  v9[0] = v3;
  v8[1] = CFSTR("site");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](self, "siteIdentifier"));
  v9[1] = v4;
  v8[2] = CFSTR("day");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](self, "day"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  return v6;
}

- (BMStreamCRDTLocation)initWithStreamName:(id)a3 siteIdentifier:(id)a4 day:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BMStreamCRDTLocation *v13;
  id *p_isa;
  BMStreamCRDTLocation *v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)BMStreamCRDTLocation;
    v13 = -[BMStreamCRDTLocation init](&v19, "init");
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_streamName, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = __biome_log_for_category(11);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v12;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "nil value encountered in [BMStreamCRDTLocation initWithStreamName:%@ siteIdentifier:%@ day:%@]", buf, 0x20u);
    }

    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  BMStreamCRDTLocation *v4;
  BMStreamCRDTLocation *v5;
  NSString *streamName;
  void *v7;
  NSString *siteIdentifier;
  void *v9;
  NSDate *day;
  void *v11;
  unsigned __int8 v12;

  v4 = (BMStreamCRDTLocation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    streamName = self->_streamName;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v4, "streamName"));
    if (-[NSString isEqualToString:](streamName, "isEqualToString:", v7))
    {
      siteIdentifier = self->_siteIdentifier;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v5, "siteIdentifier"));
      if (-[NSString isEqualToString:](siteIdentifier, "isEqualToString:", v9))
      {
        day = self->_day;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](v5, "day"));
        v12 = -[NSDate isEqualToDate:](day, "isEqualToDate:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_streamName, "hash");
  v4 = -[NSString hash](self->_siteIdentifier, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSDate hash](self->_day, "hash");
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("BMStreamCRDTLocation(stream: %@, site: %@, day: %@)"), self->_streamName, self->_siteIdentifier, self->_day);
}

- (id)triple
{
  void *v3;
  void *v4;
  id v5;
  NSString *streamName;
  NSString *siteIdentifier;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateFormatter"));

  v5 = objc_alloc((Class)NSString);
  streamName = self->_streamName;
  siteIdentifier = self->_siteIdentifier;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", self->_day));
  v9 = objc_msgSend(v5, "initWithFormat:", CFSTR("(%@,%@,%@)"), streamName, siteIdentifier, v8);

  return v9;
}

+ (id)recordNameFromSite:(id)a3 day:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFormatter"));

  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v5));

  v11 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@,%@"), v6, v10);
  return v11;
}

- (id)recordName
{
  return +[BMStreamCRDTLocation recordNameFromSite:day:](BMStreamCRDTLocation, "recordNameFromSite:day:", self->_siteIdentifier, self->_day);
}

- (BMStreamCRDTLocation)initWithTriple:(id)a3
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
  BMStreamCRDTLocation *v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 1, (char *)objc_msgSend(v4, "length") - 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(",")));

    if (objc_msgSend(v6, "count") == (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFormatter"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 2));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateFromString:", v11));

      v13 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]([BMStreamCRDTLocation alloc], "initWithStreamName:siteIdentifier:day:", v7, v8, v12);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)dayFromRecordName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(",")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFormatter"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromString:", v6));

  return v7;
}

- (BMStreamCRDTLocation)initWithZoneName:(id)a3 recordName:(id)a4
{
  id v6;
  id v7;
  id v8;
  BMStreamCRDTLocation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("(%@,%@)"), v7, v6);

  v9 = -[BMStreamCRDTLocation initWithTriple:](self, "initWithTriple:", v8);
  return v9;
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3
{
  return -[BMStreamCRDTLocation initWithCKMergeableValueID:streamName:](self, "initWithCKMergeableValueID:streamName:", a3, 0);
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3 streamName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  BMStreamCRDTLocation *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = objc_msgSend(v8, "initWithData:encoding:", v9, 4);

  if (objc_msgSend(v10, "characterAtIndex:", 0) == 40)
  {
    if (v10 && objc_msgSend(v10, "length"))
    {
      self = -[BMStreamCRDTLocation initWithTriple:](self, "initWithTriple:", v10);
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (v7)
    {
      v12 = v7;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));

      if (!v12)
      {
        v14 = __biome_log_for_category(11);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          sub_100044D44(v15);

        v12 = 0;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));

    v26 = v7;
    if (v17)
      v18 = v17;
    else
      v18 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(",")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateFormatter"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateFromString:", v23));

    self = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:](self, "initWithStreamName:siteIdentifier:day:", v12, v20, v24);
    v11 = self;
    v7 = v26;
  }

  return v11;
}

- (id)ckMergeableValueID
{
  return -[BMStreamCRDTLocation ckMergeableValueIDWithFormatVersion:](self, "ckMergeableValueIDWithFormatVersion:", 0);
}

- (id)ckMergeableValueIDWithFormatVersion:(unint64_t)a3
{
  NSString **p_streamName;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSString *streamName;
  NSString *siteIdentifier;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;

  p_streamName = &self->_streamName;
  if (!-[NSString length](self->_streamName, "length"))
  {
    v15 = __biome_log_for_category(11);
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_100044D84(p_streamName, (uint64_t)self, v6);
    goto LABEL_11;
  }
  v6 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", *p_streamName, CKCurrentUserDefaultName);
  if (a3 == 1)
  {
    v16 = objc_alloc((Class)CKMergeableValueID);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation recordName](self, "recordName"));
    v14 = objc_msgSend(v16, "initWithName:zoneID:", v17, v6);

    goto LABEL_12;
  }
  if (a3)
  {
    v18 = __biome_log_for_category(11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_100044E28(a3, v19);

LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMDateFormatterVendor sharedInstance](BMDateFormatterVendor, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFormatter"));

  v9 = objc_alloc((Class)NSString);
  streamName = self->_streamName;
  siteIdentifier = self->_siteIdentifier;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", self->_day));
  v13 = objc_msgSend(v9, "initWithFormat:", CFSTR("(%@,%@,%@)"), streamName, siteIdentifier, v12);

  v14 = objc_msgSend(objc_alloc((Class)CKMergeableValueID), "initWithName:zoneID:", v13, v6);
LABEL_12:

  return v14;
}

- (double)secondsUntilExpirationWithStreamConfiguration:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "storeConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pruningPolicy"));
  objc_msgSend(v5, "maxAge");
  v7 = v6;

  v8 = 2419200.0;
  if (v7 != 0.0)
    v8 = v7;
  if (v7 == BMPruningPolicyMaxAgeNoLimit)
    v9 = 157680000.0;
  else
    v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](self, "day"));
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;

  return v9 + v12;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)siteIdentifier
{
  return self->_siteIdentifier;
}

- (NSDate)day
{
  return self->_day;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_siteIdentifier, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
