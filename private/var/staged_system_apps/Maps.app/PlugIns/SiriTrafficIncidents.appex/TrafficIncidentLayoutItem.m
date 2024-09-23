@implementation TrafficIncidentLayoutItem

- (TrafficIncidentLayoutItem)initWithTrafficIncidentType:(int)a3 displayOnMap:(BOOL)a4
{
  TrafficIncidentLayoutItem *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  result = -[TrafficIncidentLayoutItem init](&v7, "init");
  if (result)
  {
    result->_incidentType = a3;
    result->_displayIncidentOnMap = a4;
  }
  return result;
}

- (TrafficIncidentLayoutItem)initWithCoder:(id)a3
{
  id v4;
  TrafficIncidentLayoutItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentLayoutItem;
  v5 = -[TrafficIncidentLayoutItem init](&v7, "init");
  if (v5)
  {
    -[TrafficIncidentLayoutItem setIncidentType:](v5, "setIncidentType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("incidentType")));
    -[TrafficIncidentLayoutItem setDisplayIncidentOnMap:](v5, "setDisplayIncidentOnMap:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayIncidentOnMap")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[TrafficIncidentLayoutItem incidentType](self, "incidentType"), CFSTR("incidentType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TrafficIncidentLayoutItem displayIncidentOnMap](self, "displayIncidentOnMap"), CFSTR("displayIncidentOnMap"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("incidentType:%d displayIncidentOnMap: %d"), -[TrafficIncidentLayoutItem incidentType](self, "incidentType"), -[TrafficIncidentLayoutItem displayIncidentOnMap](self, "displayIncidentOnMap"));
}

- (id)incidentTypeAsString
{
  uint64_t v2;

  v2 = -[TrafficIncidentLayoutItem incidentType](self, "incidentType");
  if (v2 >= 0x12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v2));
  else
    return *(&off_1000082F0 + (int)v2);
}

- (int)incidentType
{
  return self->_incidentType;
}

- (void)setIncidentType:(int)a3
{
  self->_incidentType = a3;
}

- (BOOL)displayIncidentOnMap
{
  return self->_displayIncidentOnMap;
}

- (void)setDisplayIncidentOnMap:(BOOL)a3
{
  self->_displayIncidentOnMap = a3;
}

@end
