@implementation ATXNamedLOI

- (ATXNamedLOI)initWithName:(id)a3 type:(int64_t)a4
{
  id v7;
  void *v8;
  CLLocationCoordinate2D v9;
  ATXNamedLOI *v10;
  objc_super v12;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = CLLocationCoordinate2DMake(0.0, 0.0);
  v12.receiver = self;
  v12.super_class = (Class)ATXNamedLOI;
  v10 = -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:](&v12, sel_initWithUUID_visits_coordinate_type_, v8, 0, a4, v9.latitude, v9.longitude);

  if (v10)
    objc_storeStrong((id *)&v10->_name, a3);

  return v10;
}

- (id)description
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
