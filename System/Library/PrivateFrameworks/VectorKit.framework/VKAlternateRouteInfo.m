@implementation VKAlternateRouteInfo

- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6
{
  id v10;
  id v11;
  VKRouteEtaDescription *v12;
  VKAlternateRouteInfo *v13;

  v10 = a3;
  v11 = a4;
  if (v11)
    v12 = -[VKRouteEtaDescription initWithEtaText:]([VKRouteEtaDescription alloc], "initWithEtaText:", v11);
  else
    v12 = 0;
  v13 = -[VKAlternateRouteInfo initWithComposedRoute:etaDescription:divergenceRouteCoordinate:convergenceRouteCoordinate:](self, "initWithComposedRoute:etaDescription:divergenceRouteCoordinate:convergenceRouteCoordinate:", v10, v12, a5, a6);

  return v13;
}

- (VKAlternateRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4 divergenceRouteCoordinate:(PolylineCoordinate)a5 convergenceRouteCoordinate:(PolylineCoordinate)a6
{
  VKAlternateRouteInfo *v8;
  VKAlternateRouteInfo *v9;
  VKAlternateRouteInfo *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKAlternateRouteInfo;
  v8 = -[VKRouteInfo initWithComposedRoute:etaDescription:](&v12, sel_initWithComposedRoute_etaDescription_, a3, a4);
  v9 = v8;
  if (v8)
  {
    v8->_divergenceCoordinate = a5;
    v8->_convergenceCoordinate = a6;
    v10 = v8;
  }

  return v9;
}

- (PolylineCoordinate)divergenceCoordinate
{
  return self->_divergenceCoordinate;
}

- (PolylineCoordinate)convergenceCoordinate
{
  return self->_convergenceCoordinate;
}

- (unsigned)etaComparisionToMain
{
  return self->_etaComparisonToMain;
}

- (void)setEtaComparisionToMain:(unsigned __int8)a3
{
  self->_etaComparisonToMain = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0xBF80000000000000;
  *((_QWORD *)self + 14) = 0xBF80000000000000;
  return self;
}

@end
