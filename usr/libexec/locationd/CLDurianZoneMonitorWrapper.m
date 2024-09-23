@implementation CLDurianZoneMonitorWrapper

- (CLDurianZoneMonitorWrapper)init
{
  -[CLDurianZoneMonitorWrapper doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianZoneMonitorWrapper)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4
{
  void *__p;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLDurianZoneMonitorWrapper;
  if (-[CLDurianZoneMonitorWrapper init](&v7, "init"))
  {
    sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
    operator new();
  }
  return 0;
}

- (BOOL)isInZone:(id)a3
{
  void *wrappedAvengerZoneMonitor;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  char v11;
  double v12[2];
  uint64_t v13;
  double v14[2];

  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  objc_msgSend(a3, "coordinate");
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(a3, "coordinate");
  v12[1] = v7;
  v13 = v8;
  objc_msgSend(a3, "horizontalAccuracy");
  v12[0] = v9;
  v11 = 0;
  return sub_100179958((uint64_t)wrappedAvengerZoneMonitor, v14, (double *)&v13, v12, &v11);
}

- (void)dealloc
{
  void *wrappedAvengerZoneMonitor;
  objc_super v4;

  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  if (wrappedAvengerZoneMonitor)
    (*(void (**)(void *, SEL))(*(_QWORD *)wrappedAvengerZoneMonitor + 8))(wrappedAvengerZoneMonitor, a2);
  v4.receiver = self;
  v4.super_class = (Class)CLDurianZoneMonitorWrapper;
  -[CLDurianZoneMonitorWrapper dealloc](&v4, "dealloc");
}

@end
