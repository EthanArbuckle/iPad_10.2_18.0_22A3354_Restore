@implementation LogHead

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A650;
  if (!qword_10012A650)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", LogHead, CFSTR("LogHead"), &unk_1001259B0, &off_100125AA8, 8, 64, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB340);
    qword_10012A650 = (uint64_t)v2;
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
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogHead logBeginningMs](self, "logBeginningMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("logBeginningMs"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)-[LogHead logBeginningMs](self, "logBeginningMs") / 0x3E8)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("logBeginningDateReadable"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogHead logSize](self, "logSize")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("logSize"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LogHead logHeadHash](self, "logHeadHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("logHeadHash"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogHead revision](self, "revision")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("revision"));

  v11 = LogType_EnumDescriptor();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textFormatNameForValue:", -[LogHead logType](self, "logType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("logType"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogHead treeId](self, "treeId")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("treeId"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[LogHead timestampMs](self, "timestampMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("timestampMs"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)-[LogHead timestampMs](self, "timestampMs") / 0x3E8)));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("timestampReadable"));

  if (Application_IsValidValue(-[LogHead application](self, "application")))
  {
    v18 = Application_EnumDescriptor();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textFormatNameForValue:", -[LogHead application](self, "application")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("application"));

  }
  return v3;
}

@end
