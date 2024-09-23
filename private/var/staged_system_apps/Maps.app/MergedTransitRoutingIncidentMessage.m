@implementation MergedTransitRoutingIncidentMessage

- (MergedTransitRoutingIncidentMessage)initWithTransitIncidents:(id)a3
{
  return -[MergedTransitRoutingIncidentMessage initWithGEOComposedRouteAdvisory:transitIncidents:](self, "initWithGEOComposedRouteAdvisory:transitIncidents:", 0, a3);
}

- (MergedTransitRoutingIncidentMessage)initWithGEOComposedRouteAdvisory:(id)a3 transitIncidents:(id)a4
{
  id v7;
  id v8;
  MergedTransitRoutingIncidentMessage *v9;
  MergedTransitRoutingIncidentMessage *v10;
  NSArray *v11;
  NSArray *transitIncidents;
  void *v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  NSString *routingMessage;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MergedTransitRoutingIncidentMessage;
  v9 = -[MergedTransitRoutingIncidentMessage init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_advisory, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    transitIncidents = v10->_transitIncidents;
    v10->_transitIncidents = v11;

    if (v10->_advisory)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleString"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringWithDefaultOptions"));
    }
    else
    {
      if ((id)-[NSArray count](v10->_transitIncidents, "count") == (id)1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v10->_transitIncidents, "objectAtIndexedSubscript:", 0));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
        v16 = (NSString *)-[NSString copy](v15, "copy");
        routingMessage = v10->_routingMessage;
        v10->_routingMessage = v16;

LABEL_8:
        goto LABEL_9;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Transit_Routing_Incident_Message_Multiple_Incidents_Synthesized_Title"), CFSTR("localized string not found"), 0));

      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, -[NSArray count](v10->_transitIncidents, "count")));
    }
    v15 = v10->_routingMessage;
    v10->_routingMessage = (NSString *)v14;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (NSString)routingMessage
{
  return self->_routingMessage;
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_routingMessage, 0);
}

@end
