@implementation VKRouteRoadInfo

- (VKRouteRoadInfo)initWithName:(id)a3 shieldGroup:(id)a4 offset:(PolylineCoordinate)a5
{
  id v9;
  id v10;
  VKRouteRoadInfo *v11;
  VKRouteRoadInfo *v12;
  VKRouteRoadInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VKRouteRoadInfo;
  v11 = -[VKRouteRoadInfo init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_routeOffset = a5;
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_shieldGroup, a4);
    v13 = v12;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shieldGroup
{
  return self->_shieldGroup;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0xBF80000000000000;
  return self;
}

@end
