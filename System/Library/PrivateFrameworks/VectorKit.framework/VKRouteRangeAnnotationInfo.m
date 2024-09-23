@implementation VKRouteRangeAnnotationInfo

- (VKRouteRangeAnnotationInfo)initWithEtaDescription:(id)a3 start:(PolylineCoordinate)a4 end:(PolylineCoordinate)a5
{
  id v9;
  VKRouteRangeAnnotationInfo *v10;
  VKRouteRangeAnnotationInfo *v11;
  VKRouteRangeAnnotationInfo *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRouteRangeAnnotationInfo;
  v10 = -[VKRouteRangeAnnotationInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_etaDescription, a3);
    v11->_start = a4;
    v11->_end = a5;
    v12 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  VKRouteRangeAnnotationInfo *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (VKRouteRangeAnnotationInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && -[VKRouteRangeAnnotationInfo compare:](self, "compare:", v4) == 0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  VKRouteEtaDescription *etaDescription;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "start");
  v5 = GEOPolylineCoordinateCompare();
  if (v5 || (objc_msgSend(v4, "end"), (v5 = GEOPolylineCoordinateCompare()) != 0))
  {
    if (v5 == -1)
      v6 = -1;
    else
      v6 = 1;
  }
  else
  {
    etaDescription = self->_etaDescription;
    objc_msgSend(v4, "etaDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VKRouteEtaDescription compare:](etaDescription, "compare:", v9);

  }
  return v6;
}

- (VKRouteEtaDescription)etaDescription
{
  return self->_etaDescription;
}

- (PolylineCoordinate)start
{
  return self->_start;
}

- (PolylineCoordinate)end
{
  return self->_end;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaDescription, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0xBF80000000000000;
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  return self;
}

@end
