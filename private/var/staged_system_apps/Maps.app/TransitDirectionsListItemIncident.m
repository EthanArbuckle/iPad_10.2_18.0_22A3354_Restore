@implementation TransitDirectionsListItemIncident

- (TransitDirectionsListItemIncident)initWithIncidentMessage:(id)a3
{
  id v5;
  TransitDirectionsListItemIncident *v6;
  TransitDirectionsListItemIncident *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsListItemIncident;
  v6 = -[TransitDirectionsListItem initWithInstructions:](&v9, "initWithInstructions:", 0);
  v7 = v6;
  if (v6)
  {
    -[TransitDirectionsListItem setType:](v6, "setType:", 13);
    objc_storeStrong((id *)&v7->_incidentMessage, a3);
  }

  return v7;
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_incidentMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentMessage, 0);
}

@end
