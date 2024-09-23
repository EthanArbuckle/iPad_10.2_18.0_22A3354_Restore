@implementation PreviousRoam

+ (void)initialize
{
  qword_10026D568 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend((id)qword_10026D568, "setDateFormat:", CFSTR("HH:mm:ss"));
}

+ (id)roamWithBssid:(id)a3 andReason:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithBssid:andReason:", a3, a4);
}

- (PreviousRoam)initWithBssid:(id)a3 andReason:(unint64_t)a4
{
  PreviousRoam *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PreviousRoam;
  v6 = -[PreviousRoam init](&v8, "init");
  -[PreviousRoam setBssid:](v6, "setBssid:", a3);
  -[PreviousRoam setReason:](v6, "setReason:", +[WiFiRoamManager stringRepresentationWithReason:](WiFiRoamManager, "stringRepresentationWithReason:", a4));
  -[PreviousRoam setTimestamp:](v6, "setTimestamp:", +[NSDate date](NSDate, "date"));
  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@):%@"), self->_bssid, self->_reason, objc_msgSend((id)qword_10026D568, "stringFromDate:", self->_timestamp));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PreviousRoam;
  -[PreviousRoam dealloc](&v3, "dealloc");
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
