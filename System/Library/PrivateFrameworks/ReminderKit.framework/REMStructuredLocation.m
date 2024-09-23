@implementation REMStructuredLocation

+ (double)minimumRegionMonitoringDistance
{
  return 100.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMStructuredLocation *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REMStructuredLocation *v18;

  v4 = [REMStructuredLocation alloc];
  -[REMStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation locationUID](self, "locationUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation latitude](self, "latitude");
  v8 = v7;
  -[REMStructuredLocation longitude](self, "longitude");
  v10 = v9;
  -[REMStructuredLocation radius](self, "radius");
  v12 = v11;
  -[REMStructuredLocation address](self, "address");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation routing](self, "routing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation referenceFrameString](self, "referenceFrameString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation contactLabel](self, "contactLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation mapKitHandle](self, "mapKitHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[REMStructuredLocation initWithTitle:locationUID:latitude:longitude:radius:address:routing:referenceFrameString:contactLabel:mapKitHandle:](v4, "initWithTitle:locationUID:latitude:longitude:radius:address:routing:referenceFrameString:contactLabel:mapKitHandle:", v5, v6, v13, v14, v15, v16, v8, v10, v12, v17);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  REMStructuredLocation *v4;
  REMStructuredLocation *v5;
  REMStructuredLocation *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  v4 = (REMStructuredLocation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMStructuredLocation locationUID](self, "locationUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation locationUID](v6, "locationUID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMStructuredLocation locationUID](self, "locationUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation locationUID](v6, "locationUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      v13 = -[REMStructuredLocation isContentEqual:](self, "isContentEqual:", v6);
      goto LABEL_9;
    }
LABEL_5:
    v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)isContentEqual:(id)a3
{
  REMStructuredLocation *v4;
  REMStructuredLocation *v5;
  REMStructuredLocation *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = (REMStructuredLocation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMStructuredLocation title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation title](v6, "title");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMStructuredLocation title](self, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation title](v6, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_25;
      }
      -[REMStructuredLocation latitude](self, "latitude");
      v15 = v14;
      -[REMStructuredLocation latitude](v6, "latitude");
      if (vabdd_f64(v15, v16) >= 2.22044605e-16)
        goto LABEL_25;
      -[REMStructuredLocation longitude](self, "longitude");
      v18 = v17;
      -[REMStructuredLocation longitude](v6, "longitude");
      if (vabdd_f64(v18, v19) >= 2.22044605e-16)
        goto LABEL_25;
      -[REMStructuredLocation radius](self, "radius");
      v21 = v20;
      -[REMStructuredLocation radius](v6, "radius");
      if (vabdd_f64(v21, v22) >= 2.22044605e-16)
        goto LABEL_25;
      -[REMStructuredLocation address](self, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation address](v6, "address");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v23 == (void *)v24)
      {

      }
      else
      {
        v25 = (void *)v24;
        -[REMStructuredLocation address](self, "address");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation address](v6, "address");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqual:", v27);

        if (!v28)
          goto LABEL_25;
      }
      -[REMStructuredLocation routing](self, "routing");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation routing](v6, "routing");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v29 == (void *)v30)
      {

      }
      else
      {
        v31 = (void *)v30;
        -[REMStructuredLocation routing](self, "routing");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation routing](v6, "routing");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if (!v34)
          goto LABEL_25;
      }
      -[REMStructuredLocation referenceFrameString](self, "referenceFrameString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation referenceFrameString](v6, "referenceFrameString");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v35 == (void *)v36)
      {

      }
      else
      {
        v37 = (void *)v36;
        -[REMStructuredLocation referenceFrameString](self, "referenceFrameString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation referenceFrameString](v6, "referenceFrameString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqual:", v39);

        if (!v40)
          goto LABEL_25;
      }
      -[REMStructuredLocation contactLabel](self, "contactLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation contactLabel](v6, "contactLabel");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v41 == (void *)v42)
      {

      }
      else
      {
        v43 = (void *)v42;
        -[REMStructuredLocation contactLabel](self, "contactLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation contactLabel](v6, "contactLabel");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "isEqual:", v45);

        if (!v46)
          goto LABEL_25;
      }
      -[REMStructuredLocation mapKitHandle](self, "mapKitHandle");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStructuredLocation mapKitHandle](v6, "mapKitHandle");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v48 == (void *)v49)
      {
        v13 = 1;
        v50 = v48;
      }
      else
      {
        v50 = (void *)v49;
        -[REMStructuredLocation mapKitHandle](self, "mapKitHandle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStructuredLocation mapKitHandle](v6, "mapKitHandle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v51, "isEqual:", v52);

      }
      goto LABEL_26;
    }
LABEL_25:
    v13 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v13 = 1;
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[REMStructuredLocation title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[REMStructuredLocation locationUID](self, "locationUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[REMStructuredLocation address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[REMStructuredLocation routing](self, "routing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[REMStructuredLocation referenceFrameString](self, "referenceFrameString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[REMStructuredLocation contactLabel](self, "contactLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") - v12 + 32 * v12;

  -[REMStructuredLocation mapKitHandle](self, "mapKitHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash") - v14 + 32 * v14;

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMStructuredLocation locationUID](self, "locationUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {locationUID = %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStructuredLocation latitude](self, "latitude");
  v7 = v6;
  -[REMStructuredLocation longitude](self, "longitude");
  v9 = v8;
  -[REMStructuredLocation radius](self, "radius");
  v11 = v10;
  -[REMStructuredLocation locationUID](self, "locationUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {title: %@; latlong: (%f, %f); radius: %f; locationUID = %@}"),
    v4,
    v5,
    v7,
    v9,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (REMStructuredLocation)initWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  REMStructuredLocation *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMStructuredLocation initWithTitle:locationUID:](self, "initWithTitle:locationUID:", v5, v7);

  return v8;
}

- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4
{
  id v7;
  id v8;
  REMStructuredLocation *v9;
  REMStructuredLocation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMStructuredLocation;
  v9 = -[REMStructuredLocation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_locationUID, a4);
  }

  return v10;
}

- (REMStructuredLocation)initWithTitle:(id)a3 locationUID:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7 address:(id)a8 routing:(id)a9 referenceFrameString:(id)a10 contactLabel:(id)a11 mapKitHandle:(id)a12
{
  id v22;
  id v23;
  REMStructuredLocation *v24;
  REMStructuredLocation *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v22 = a11;
  v23 = a12;
  v32.receiver = self;
  v32.super_class = (Class)REMStructuredLocation;
  v24 = -[REMStructuredLocation init](&v32, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_title, a3);
    objc_storeStrong((id *)&v25->_locationUID, a4);
    v25->_latitude = a5;
    v25->_longitude = a6;
    v25->_radius = a7;
    objc_storeStrong((id *)&v25->_address, a8);
    objc_storeStrong((id *)&v25->_routing, a9);
    objc_storeStrong((id *)&v25->_referenceFrameString, a10);
    objc_storeStrong((id *)&v25->_contactLabel, a11);
    objc_storeStrong((id *)&v25->_mapKitHandle, a12);
  }

  return v25;
}

- (id)displayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  -[REMStructuredLocation contactLabel](self, "contactLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[REMStructuredLocation contactLabel](self, "contactLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "host");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v5;
    }
    v10 = v9;

  }
  else
  {
    -[REMStructuredLocation title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (REMStructuredLocation)initWithCoder:(id)a3
{
  id v4;
  REMStructuredLocation *v5;
  uint64_t v6;
  NSString *title;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  NSString *locationUID;
  uint64_t v13;
  NSString *address;
  uint64_t v15;
  NSString *routing;
  uint64_t v17;
  NSString *referenceFrameString;
  uint64_t v19;
  NSString *contactLabel;
  uint64_t v21;
  NSData *mapKitHandle;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMStructuredLocation;
  v5 = -[REMStructuredLocation init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v5->_latitude = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v5->_longitude = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    v5->_radius = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    locationUID = v5->_locationUID;
    v5->_locationUID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v13 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routing"));
    v15 = objc_claimAutoreleasedReturnValue();
    routing = v5->_routing;
    v5->_routing = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceFrameString"));
    v17 = objc_claimAutoreleasedReturnValue();
    referenceFrameString = v5->_referenceFrameString;
    v5->_referenceFrameString = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactLabel"));
    v19 = objc_claimAutoreleasedReturnValue();
    contactLabel = v5->_contactLabel;
    v5->_contactLabel = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapKitHandle"));
    v21 = objc_claimAutoreleasedReturnValue();
    mapKitHandle = v5->_mapKitHandle;
    v5->_mapKitHandle = (NSData *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[REMStructuredLocation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[REMStructuredLocation latitude](self, "latitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"));
  -[REMStructuredLocation longitude](self, "longitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"));
  -[REMStructuredLocation radius](self, "radius");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("radius"));
  -[REMStructuredLocation locationUID](self, "locationUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("locationUID"));

  -[REMStructuredLocation address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("address"));

  -[REMStructuredLocation routing](self, "routing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("routing"));

  -[REMStructuredLocation referenceFrameString](self, "referenceFrameString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("referenceFrameString"));

  -[REMStructuredLocation contactLabel](self, "contactLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("contactLabel"));

  -[REMStructuredLocation mapKitHandle](self, "mapKitHandle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("mapKitHandle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)routing
{
  return self->_routing;
}

- (void)setRouting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)referenceFrameString
{
  return self->_referenceFrameString;
}

- (void)setReferenceFrameString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)locationUID
{
  return self->_locationUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationUID, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_referenceFrameString, 0);
  objc_storeStrong((id *)&self->_routing, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
