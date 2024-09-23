@implementation GEOURLRouteHandle

- (id)initWithRoute:(id)a3
{
  return -[GEOURLRouteHandle initWithRoute:fidelity:](self, "initWithRoute:fidelity:", a3, 0xFFFFFFFLL);
}

- (GEOURLRouteHandle)initWithRoute:(id)a3 fidelity:(unint64_t)a4
{
  char v4;
  id v6;
  GEOURLRouteHandle *v7;
  GEOURLRouteHandle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v7 = 0;
  if (v6 && (v4 & 8) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOURLRouteHandle;
    v8 = -[GEOURLRouteHandle init](&v16, "init");
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsResponseID"));
      -[GEOURLRouteHandle setDirectionsResponseID:](v8, "setDirectionsResponseID:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serverRouteID"));
      -[GEOURLRouteHandle setRouteID:](v8, "setRouteID:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "suggestedRoute"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeHandle"));
      -[GEOURLRouteHandle setTransitData:](v8, "setTransitData:", v12);

      if ((v4 & 0x20) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zilchDataArrayToEndOfRouteFromStepIndex:", 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
        -[GEOURLRouteHandle setZilchPoints:](v8, "setZilchPoints:", v14);

      }
    }
    self = v8;
    v7 = self;
  }

  return v7;
}

@end
