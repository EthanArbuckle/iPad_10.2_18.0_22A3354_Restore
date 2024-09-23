@implementation MapHead

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A660;
  if (!qword_10012A660)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", MapHead, CFSTR("MapHead"), &unk_1001259B0, &off_100125C68, 9, 64, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB37E);
    qword_10012A660 = (uint64_t)v2;
  }
  return v2;
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[MapHead logBeginningMs](self, "logBeginningMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("logBeginningMs"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)-[MapHead logBeginningMs](self, "logBeginningMs") / 0x3E8)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("logBeginningDateReadable"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapHead mapHeadHash](self, "mapHeadHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mapHeadHash"));

  v9 = Application_EnumDescriptor();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textFormatNameForValue:", -[MapHead application](self, "application")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("application"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[MapHead revision](self, "revision")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("revision"));

  v13 = MapType_EnumDescriptor();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textFormatNameForValue:", -[MapHead mapType](self, "mapType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("mapType"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[MapHead treeId](self, "treeId")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("treeId"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[MapHead timestampMs](self, "timestampMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("timestampMs"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)-[MapHead timestampMs](self, "timestampMs") / 0x3E8)));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("timestampReadable"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MapHead populating](self, "populating")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("populating"));

  return v3;
}

@end
