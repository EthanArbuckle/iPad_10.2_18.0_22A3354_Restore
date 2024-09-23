@implementation RTNavigationManagerRouteSummaryNotification

- (RTNavigationManagerRouteSummaryNotification)initWithRouteSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  RTNavigationManagerRouteSummaryNotification *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSString *destinationName;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  RTNavigationManagerRouteSummaryNotification *v26;
  objc_super v28;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v4, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latLng");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_8;
  }
  v8 = (void *)v7;
  objc_msgSend(v5, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latLng");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    v26 = 0;
    goto LABEL_9;
  }
  v28.receiver = self;
  v28.super_class = (Class)RTNavigationManagerRouteSummaryNotification;
  v11 = -[RTNotification init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(v5, "origin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "latLng");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lat");
    v11->_originLatitude = v14;

    objc_msgSend(v5, "origin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latLng");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lng");
    v11->_originLongitude = v17;

    objc_msgSend(v5, "destinationName");
    v18 = objc_claimAutoreleasedReturnValue();
    destinationName = v11->_destinationName;
    v11->_destinationName = (NSString *)v18;

    objc_msgSend(v5, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "latLng");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lat");
    v11->_destinationLatitude = v22;

    objc_msgSend(v5, "destination");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "latLng");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lng");
    v11->_destinationLongitude = v25;

    v11->_transportType = (int)objc_msgSend(v5, "transportType");
  }
  self = v11;
  v26 = self;
LABEL_9:

  return v26;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTNavigationManagerRouteSummaryNotification originLatitude](self, "originLatitude");
  v5 = v4;
  -[RTNavigationManagerRouteSummaryNotification originLongitude](self, "originLongitude");
  v7 = v6;
  -[RTNavigationManagerRouteSummaryNotification destinationName](self, "destinationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNavigationManagerRouteSummaryNotification destinationLatitude](self, "destinationLatitude");
  v10 = v9;
  -[RTNavigationManagerRouteSummaryNotification destinationLongitude](self, "destinationLongitude");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("origin location, <%f, %f>, destination name, %@, destination location, <%f, %f>"), v5, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)originLatitude
{
  return self->_originLatitude;
}

- (void)setOriginLatitude:(double)a3
{
  self->_originLatitude = a3;
}

- (double)originLongitude
{
  return self->_originLongitude;
}

- (void)setOriginLongitude:(double)a3
{
  self->_originLongitude = a3;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (double)destinationLatitude
{
  return self->_destinationLatitude;
}

- (void)setDestinationLatitude:(double)a3
{
  self->_destinationLatitude = a3;
}

- (double)destinationLongitude
{
  return self->_destinationLongitude;
}

- (void)setDestinationLongitude:(double)a3
{
  self->_destinationLongitude = a3;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
}

@end
