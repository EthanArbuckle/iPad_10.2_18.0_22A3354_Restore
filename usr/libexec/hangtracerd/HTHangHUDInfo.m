@implementation HTHangHUDInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTHangHUDInfo)initWithHangStartTime:(unint64_t)a3 hangEndTime:(unint64_t)a4 receivedTimestamp:(unint64_t)a5 hangDurationMS:(double)a6 hudString:(id)a7 shortenedBundle:(id)a8 bundleId:(id)a9 timedOut:(BOOL)a10
{
  id v18;
  id v19;
  id v20;
  HTHangHUDInfo *v21;
  HTHangHUDInfo *v22;
  objc_super v24;

  v18 = a7;
  v19 = a8;
  v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HTHangHUDInfo;
  v21 = -[HTHangHUDInfo init](&v24, "init");
  v22 = v21;
  if (v21)
  {
    v21->_hangStartTime = a3;
    v21->_hangEndTime = a4;
    v21->_receivedTimestamp = a5;
    v21->_hangDurationMS = a6;
    objc_storeStrong((id *)&v21->_hudString, a7);
    objc_storeStrong((id *)&v22->_shortenedBundle, a8);
    objc_storeStrong((id *)&v22->_bundleId, a9);
    v22->_timedOut = a10;
  }

  return v22;
}

- (HTHangHUDInfo)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  HTHangHUDInfo *v17;
  uint64_t v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hangStartTime"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hangEndTime"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("receivedTimestamp"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hangDurationMS"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("hudString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("shortenedBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("timedOut"));

  LOBYTE(v19) = v16;
  v17 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:](self, "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:", v5, v6, v7, v11, v13, v15, v9, v19);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t hangStartTime;
  id v5;

  hangStartTime = self->_hangStartTime;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", hangStartTime, CFSTR("hangStartTime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_hangEndTime, CFSTR("hangEndTime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_receivedTimestamp, CFSTR("receivedTimestamp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("hangDurationMS"), self->_hangDurationMS);
  objc_msgSend(v5, "encodeObject:forKey:", self->_hudString, CFSTR("hudString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortenedBundle, CFSTR("shortenedBundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_timedOut, CFSTR("timedOut"));

}

- (id)getHangHUDInfoKey
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), -[HTHangHUDInfo hangStartTime](self, "hangStartTime"));
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  double v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  void *v12;
  unsigned __int8 v13;

  v7 = sub_1000273EC(a3 - -[HTHangHUDInfo receivedTimestamp](self, "receivedTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTHangHUDInfo getHangHUDInfoKey](self, "getHangHUDInfoKey"));
  v9 = sub_100024FF4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10002E640((uint64_t)v8, v10, v7);

  if (-[HTHangHUDInfo hangEndTime](self, "hangEndTime") == 0x7FFFFFFFFFFFFFFFLL
    || sub_1000273EC(a3 - -[HTHangHUDInfo hangEndTime](self, "hangEndTime")) >= 200.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HangDataStreamStatusTracker sharedInstance](HangDataStreamStatusTracker, "sharedInstance"));
    v13 = objc_msgSend(v12, "isHangEndedWithDuration:updateInterval:hangID:", v8, v7, a4);

    v11 = v13 ^ 1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (unint64_t)compareValue
{
  return self->_hangStartTime;
}

- (BOOL)isTimedOut
{
  return self->_timedOut;
}

- (unint64_t)hangStartTime
{
  return self->_hangStartTime;
}

- (unint64_t)hangEndTime
{
  return self->_hangEndTime;
}

- (unint64_t)receivedTimestamp
{
  return self->_receivedTimestamp;
}

- (double)hangDurationMS
{
  return self->_hangDurationMS;
}

- (NSString)hudString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)shortenedBundle
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_shortenedBundle, 0);
  objc_storeStrong((id *)&self->_hudString, 0);
}

@end
