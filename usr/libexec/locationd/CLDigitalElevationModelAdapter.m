@implementation CLDigitalElevationModelAdapter

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (void)updateMotion:(int)a3 conf:(int)a4
{
  sub_100057284((uint64_t)self->_cldem, a3, a4);
}

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5 feedToAltFilter:(BOOL)a6
{
  return sub_10007D5A4((uint64_t)self->_cldem, (uint64_t)a3, a4, a5, a6);
}

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5
{
  return -[CLDigitalElevationModelAdapter syncgetAltitude:rel:undulation:feedToAltFilter:](self, "syncgetAltitude:rel:undulation:feedToAltFilter:", a3, a4, a5, 0);
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_10230C3E0 != -1)
    dispatch_once(&qword_10230C3E0, &stru_10219EC58);
  return (id)qword_10230C3D8;
}

- (CLDigitalElevationModelAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDigitalElevationModelAdapter;
  return -[CLDigitalElevationModelAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLDigitalElevationModelPublicProtocol, &OBJC_PROTOCOL___CLDigitalElevationModelClientProtocol);
}

- (void)beginService
{
  self->_cldem = (void *)sub_10109F04C((uint64_t)-[CLDigitalElevationModelAdapter universe](self, "universe"));
}

- (void)endService
{
  void *cldem;

  sub_10109F104((uint64_t)self->_cldem);
  cldem = self->_cldem;
  if (cldem)
    (*(void (**)(void *))(*(_QWORD *)cldem + 8))(cldem);
  self->_cldem = 0;
}

- (void)clear
{
  sub_10109F104((uint64_t)self->_cldem);
}

- (void)updateAirborneActivity:(BOOL)a3
{
  sub_10109F21C((uint64_t)self->_cldem, a3);
}

- (void)updateTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
  _OWORD *cldem;
  __int128 v4;
  __int128 v5;

  cldem = self->_cldem;
  v5 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var4;
  cldem[31] = *(_OWORD *)&a3->var0;
  cldem[32] = v5;
  cldem[33] = v4;
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5
{
  _BOOL4 v5;
  void *cldem;
  _QWORD v8[19];

  v5 = a5;
  cldem = self->_cldem;
  (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  sub_10109F2E8((uint64_t)cldem, (uint64_t)v8, a4, v5, 0);
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5 ringsToDownloadOverCellular:(int)a6
{
  _BOOL4 v7;
  void *cldem;
  _QWORD v10[19];

  v7 = a5;
  cldem = self->_cldem;
  (*((void (**)(_QWORD *__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  sub_10109F2E8((uint64_t)cldem, (uint64_t)v10, a4, v7, a6);
}

- (void)downloadAvailabilityFile:(double)a3
{
  double v3;

  v3 = a3;
  sub_10109FB2C((uint64_t)self->_cldem, &v3);
}

- (void)updateComputeDemFlatnessMetric:(BOOL)a3
{
  sub_1010A04E4((uint64_t)self->_cldem, a3);
}

- (void)cldem
{
  return self->_cldem;
}

- (void)setCldem:(void *)a3
{
  self->_cldem = a3;
}

@end
