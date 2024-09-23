@implementation CLWifiAssociatedApCentroidMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("CLWifiAssociatedApCentroidMO"));
}

- (id)convert
{
  CLWifiAssociatedApCentroidDO *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  id v18;
  double v19;

  v3 = [CLWifiAssociatedApCentroidDO alloc];
  v4 = -[CLWifiAssociatedApCentroidMO mac](self, "mac");
  -[CLWifiAssociatedApCentroidMO latitude](self, "latitude");
  v6 = v5;
  -[CLWifiAssociatedApCentroidMO longitude](self, "longitude");
  v8 = v7;
  -[CLWifiAssociatedApCentroidMO altitude](self, "altitude");
  v10 = v9;
  -[CLWifiAssociatedApCentroidMO horizontalAccuracy](self, "horizontalAccuracy");
  v12 = v11;
  -[CLWifiAssociatedApCentroidMO verticalAccuracy](self, "verticalAccuracy");
  v14 = v13;
  v15 = -[CLWifiAssociatedApCentroidMO reach](self, "reach");
  -[CLWifiAssociatedApCentroidMO stationaryTimeInSeconds](self, "stationaryTimeInSeconds");
  v17 = v16;
  v18 = -[CLWifiAssociatedApCentroidMO loiType](self, "loiType");
  -[CLWifiAssociatedApCentroidMO lastUpdated](self, "lastUpdated");
  return -[CLWifiAssociatedApCentroidDO initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:](v3, "initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:", v4, v15, v18, v6, v8, v10, v12, v14, v17, v19);
}

@end
