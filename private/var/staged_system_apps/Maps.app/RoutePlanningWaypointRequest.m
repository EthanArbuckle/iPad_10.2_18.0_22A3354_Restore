@implementation RoutePlanningWaypointRequest

- (RoutePlanningWaypointRequest)initWithWaypointPlaceholder:(id)a3 request:(id)a4 preferredNameSource:(unint64_t)a5
{
  id v9;
  id v10;
  RoutePlanningWaypointRequest *v11;
  RoutePlanningWaypointRequest *v12;
  WaypointRequest *v13;
  WaypointRequest *waypointRequest;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RoutePlanningWaypointRequest;
  v11 = -[RoutePlanningWaypointRequest init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_waypointPlaceholder, a3);
    v13 = (WaypointRequest *)objc_msgSend(v10, "copyWithZone:", 0);
    waypointRequest = v12->_waypointRequest;
    v12->_waypointRequest = v13;

    v12->_preferredNameSource = a5;
  }

  return v12;
}

- (id)nameWithResolvedWaypoint:(id)a3 allowCurrentLocation:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  SearchResult *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = v6;
  if (!a4 && objc_msgSend(v6, "isCurrentLocation"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mkMapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_addressFormattedAsShortenedAddress"));
    if (!v9)
    {
      v16 = MKLocalizedStringForUnknownLocation();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v11 = 0;
LABEL_22:

      v11 = (id)v17;
      goto LABEL_23;
    }
    v10 = v9;
    v11 = v10;
LABEL_21:
    v17 = (uint64_t)v10;
    goto LABEL_22;
  }
  if (-[RoutePlanningWaypointRequest preferredNameSource](self, "preferredNameSource"))
  {
    if (!v7 || (objc_msgSend(v7, "isCurrentLocation") & 1) != 0)
    {
      v11 = 0;
      goto LABEL_19;
    }
    v13 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult name](v13, "name"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressBookAddress"));
    if (v12)
    {

    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyHandle"));

      if (!v11)
        goto LABEL_19;
    }
    v13 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](self, "waypointRequest"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult waypointName](v13, "waypointName"));
    v15 = v14;
    if (v14)
    {
      v11 = v14;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointPlaceholder](self, "waypointPlaceholder"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));

    }
  }

LABEL_19:
  if (!objc_msgSend(v11, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointPlaceholder](self, "waypointPlaceholder"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    goto LABEL_21;
  }
LABEL_23:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithWaypointPlaceholder:request:preferredNameSource:", self->_waypointPlaceholder, self->_waypointRequest, self->_preferredNameSource);
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[WaypointPlaceholder hash](self->_waypointPlaceholder, "hash");
  return (unint64_t)-[WaypointRequest hash](self->_waypointRequest, "hash") ^ v3 ^ (2654435761u
                                                                                         * self->_preferredNameSource);
}

- (BOOL)isEqual:(id)a3
{
  RoutePlanningWaypointRequest *v4;
  RoutePlanningWaypointRequest *v5;
  WaypointPlaceholder *waypointPlaceholder;
  void *v7;
  WaypointRequest *waypointRequest;
  void *v9;
  id preferredNameSource;
  BOOL v11;

  v4 = (RoutePlanningWaypointRequest *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (-[RoutePlanningWaypointRequest isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    waypointPlaceholder = self->_waypointPlaceholder;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointPlaceholder](v5, "waypointPlaceholder"));
    if (-[WaypointPlaceholder isEqual:](waypointPlaceholder, "isEqual:", v7))
    {
      waypointRequest = self->_waypointRequest;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](v5, "waypointRequest"));
      if (-[WaypointRequest isEqual:](waypointRequest, "isEqual:", v9))
      {
        preferredNameSource = (id)self->_preferredNameSource;
        v11 = preferredNameSource == (id)-[RoutePlanningWaypointRequest preferredNameSource](v5, "preferredNameSource");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  RoutePlanningWaypointRequest *v2;
  id v3;
  void ***v4;
  RoutePlanningWaypointRequest *v5;
  RoutePlanningWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10095E0C8;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[RoutePlanningWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v12, v13));

  return (NSString *)v14;
}

- (NSString)debugDescription
{
  RoutePlanningWaypointRequest *v2;
  id v3;
  void ***v4;
  RoutePlanningWaypointRequest *v5;
  RoutePlanningWaypointRequest *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;

  v2 = self;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10095E248;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[RoutePlanningWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
  v5 = v2;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_9;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11, v16, v17, v18, v19));

      goto LABEL_7;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_7:

LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {\n%@\n}"), v12, v13));

  return (NSString *)v14;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;
  id v7;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, WaypointRequest *))a3 + 2))(v6, CFSTR("waypointRequest"), self->_waypointRequest);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_preferredNameSource));
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v6, CFSTR("preferredNameSource"), v7);

}

- (WaypointPlaceholder)waypointPlaceholder
{
  return self->_waypointPlaceholder;
}

- (WaypointRequest)waypointRequest
{
  return self->_waypointRequest;
}

- (unint64_t)preferredNameSource
{
  return self->_preferredNameSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointRequest, 0);
  objc_storeStrong((id *)&self->_waypointPlaceholder, 0);
}

@end
