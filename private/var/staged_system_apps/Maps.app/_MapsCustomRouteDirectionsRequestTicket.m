@implementation _MapsCustomRouteDirectionsRequestTicket

- (_MapsCustomRouteDirectionsRequestTicket)initWithRequestDetails:(id)a3
{
  id v5;
  _MapsCustomRouteDirectionsRequestTicket *v6;
  _MapsCustomRouteDirectionsRequestTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MapsCustomRouteDirectionsRequestTicket;
  v6 = -[_MapsCustomRouteDirectionsRequestTicket init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_directionsRequestDetails, a3);

  return v7;
}

- (void)submitWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  MNRouteEditorRequestTicket *v9;
  MNRouteEditorRequestTicket *ticket;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNDirectionsRequestDetails persistentData](self->_directionsRequestDetails, "persistentData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedRoute _maps_composedRouteWithPersistentData:](GEOComposedRoute, "_maps_composedRouteWithPersistentData:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MNDirectionsRequestDetails traits](self->_directionsRequestDetails, "traits"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100845408;
  v13[3] = &unk_1011BD390;
  v14 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100845420;
  v11[3] = &unk_1011D8F28;
  v12 = v14;
  v8 = v14;
  v9 = (MNRouteEditorRequestTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", v7, v13, v11));
  ticket = self->_ticket;
  self->_ticket = v9;

}

- (void)cancel
{
  -[MNRouteEditorRequestTicket cancel](self->_ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_directionsRequestDetails, 0);
}

@end
