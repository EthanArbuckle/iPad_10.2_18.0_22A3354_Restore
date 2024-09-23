@implementation CLIndoorPrefetchRegion

- (id)initFromLOI:(const void *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLIndoorPrefetchRegion;
  if (-[CLIndoorPrefetchRegion init](&v4, "init"))
    operator new();
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLIndoorPrefetchRegion;
  -[CLIndoorPrefetchRegion dealloc](&v3, "dealloc");
}

- (BOOL)mergeLocationOfInterest:(const void *)a3 clusterRadius:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;

  -[GeographicCoordinate latitude](self->_latlon, "latitude");
  v8 = v7;
  -[GeographicCoordinate longitude](self->_latlon, "longitude");
  v10 = sub_100124100(v8, v9, *(double *)a3, *((double *)a3 + 1));
  if (v10 <= a4)
    sub_10024F2DC((uint64_t)self->_baseOfOperations.__ptr_.__value_, (uint64_t)a3);
  return v10 <= a4;
}

- (time_point<std::chrono::system_clock,)relevancy:()time_point<std:(std:()std:(1000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::system_clock
{
  CLIndoorPrefetchLocationOfInterest *value;

  value = self->_baseOfOperations.__ptr_.__value_;
  if (*((_BYTE *)value + 32))
    return *(time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000>>> *)((char *)value + 40);
  return a3;
}

- (GeographicCoordinate)latlon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 16, 1);
}

- (ECEFCoordinate)ecef
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  sub_10025DBF4((uint64_t *)&self->_baseOfOperations, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
