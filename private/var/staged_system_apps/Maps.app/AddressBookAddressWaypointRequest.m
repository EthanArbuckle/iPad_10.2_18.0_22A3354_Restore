@implementation AddressBookAddressWaypointRequest

- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3
{
  return -[AddressBookAddressWaypointRequest initWithAddress:mapItem:](self, "initWithAddress:mapItem:", a3, 0);
}

- (AddressBookAddressWaypointRequest)initWithAddress:(id)a3 mapItem:(id)a4
{
  id v7;
  id v8;
  AddressBookAddressWaypointRequest *v9;
  void *v10;
  id v11;
  void *v12;
  CNContact *v13;
  id v14;
  void *v15;
  NSString *v16;
  NSString *addressString;
  GEOMapItemClientAttributes *v18;
  GEOMapItemClientAttributes *clientAttributes;
  CNContact *contact;
  CNContact *v21;
  AddressBookAddressWaypointRequest *v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isValid") & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)AddressBookAddressWaypointRequest;
    v9 = -[AddressBookAddressWaypointRequest init](&v29, "init");
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleLineAddress"));
      v11 = objc_msgSend((id)objc_opt_class(v9), "_clientAttributesForAddress:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (CNContact *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contact"));
      if (!v8)
      {
        v14 = objc_alloc((Class)MKMapItem);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressDictionary"));
        v8 = objc_msgSend(v14, "initWithAddressDictionary:", v15);

      }
      objc_storeStrong((id *)&v9->_address, a3);
      v16 = (NSString *)objc_msgSend(v10, "copy");
      addressString = v9->_addressString;
      v9->_addressString = v16;

      v18 = (GEOMapItemClientAttributes *)objc_msgSend(v12, "copy");
      clientAttributes = v9->_clientAttributes;
      v9->_clientAttributes = v18;

      contact = v9->_contact;
      v9->_contact = v13;
      v21 = v13;

      objc_storeStrong((id *)&v9->_mapItem, v8);
    }
    self = v9;
    v22 = self;
  }
  else
  {
    v23 = sub_1004328BC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (objc_class *)objc_opt_class(v7);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412546;
      v31 = v27;
      v32 = 2112;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Invalid %@ was passed in: %@", buf, 0x16u);

    }
    v22 = 0;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithAddress:mapItem:", self->_address, self->_mapItem);
  objc_storeStrong(v4 + 6, self->_cachedLoadResult);
  return v4;
}

- (NSString)description
{
  AddressBookAddressWaypointRequest *v2;
  id v3;
  void ***v4;
  AddressBookAddressWaypointRequest *v5;
  AddressBookAddressWaypointRequest *v6;
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
  v18 = sub_1008EB7E4;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[AddressBookAddressWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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
  AddressBookAddressWaypointRequest *v2;
  id v3;
  void ***v4;
  AddressBookAddressWaypointRequest *v5;
  AddressBookAddressWaypointRequest *v6;
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
  v18 = sub_1008EB964;
  v19 = &unk_1011B0158;
  v3 = objc_alloc_init((Class)NSMutableArray);
  v20 = v3;
  v4 = objc_retainBlock(&v16);
  -[AddressBookAddressWaypointRequest _maps_buildDescriptionWithBlock:](v2, "_maps_buildDescriptionWithBlock:", v4);
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
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

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, const __CFString *, NSString *))a3 + 2))(v6, CFSTR("addressString"), self->_addressString);
  (*((void (**)(id, const __CFString *, GEOMapItemClientAttributes *))a3 + 2))(v6, CFSTR("clientAttributes"), self->_clientAttributes);
  (*((void (**)(id, const __CFString *, CNContact *))a3 + 2))(v6, CFSTR("contact"), self->_contact);
  (*((void (**)(id, const __CFString *, MKMapItem *))a3 + 2))(v6, CFSTR("mapItem"), self->_mapItem);

}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = kCLLocationCoordinate2DInvalid.latitude;
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (BOOL)hasCachedResult
{
  return self->_cachedLoadResult != 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  return self->_mapItem;
}

- (id)waypointIconWithScale:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest address](self, "address"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thumbnailIconWithScale:size:", 2, a3));

  return v5;
}

- (NSString)waypointName
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest contact](self, "contact"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest address](self, "address")),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest address](self, "address"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypointCompositeName"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem name](self->_mapItem, "name"));
    if (!v8)
    {
      v10 = MKLocalizedStringForUnknownLocation();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v6 = 0;
      goto LABEL_8;
    }
    v7 = v8;
    v6 = v7;
  }
  v9 = v7;
LABEL_8:

  return (NSString *)v9;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest addressString](self, "addressString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressString"));

    v9 = objc_msgSend(v7, "isEqualToString:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  void (**v26)(id, void *);
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest cachedLoadResult](self, "cachedLoadResult"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest cachedLoadResult](self, "cachedLoadResult"));
    v12[2](v12, v15);

    v16 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1008EB454;
    v25[3] = &unk_1011DB600;
    objc_copyWeak(&v27, &location);
    v26 = v12;
    v17 = objc_retainBlock(v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest addressString](self, "addressString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookAddressWaypointRequest clientAttributes](self, "clientAttributes"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1008EB4B0;
    v22[3] = &unk_1011DB628;
    objc_copyWeak(&v24, &location);
    v20 = v17;
    v23 = v20;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOComposedWaypoint composedWaypointForAddressString:traits:clientAttributes:completionHandler:networkActivityHandler:](GEOComposedWaypoint, "composedWaypointForAddressString:traits:clientAttributes:completionHandler:networkActivityHandler:", v18, v10, v19, v22, v13));

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)recordRAPInformation:(id)a3
{
  NSString *addressString;
  id v4;

  addressString = self->_addressString;
  v4 = a3;
  objc_msgSend(v4, "setSingleLineAddressString:", addressString);
  objc_msgSend(v4, "setOrigin:", 1);

}

+ (id)_clientAttributesForAddress:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = objc_alloc_init((Class)GEOMapItemAddressBookAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "compositeName"));
  objc_msgSend(v4, "setName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "spokenNameForNavigation"));
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "setSpokenName:", v6);
  objc_msgSend(v4, "setAddressType:", objc_msgSend(v3, "addressType"));
  objc_msgSend(v4, "setIsMe:", objc_msgSend(v3, "isMeCard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addressValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v4, "setAddressIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  objc_msgSend(v4, "setContactIdentifier:", v10);

  v11 = objc_alloc_init((Class)GEOMapItemClientAttributes);
  objc_msgSend(v11, "setAddressBookAttributes:", v4);

  return v11;
}

- (AddressBookAddress)address
{
  return self->_address;
}

- (CNContact)contact
{
  return self->_contact;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  return self->_clientAttributes;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (Result)cachedLoadResult
{
  return self->_cachedLoadResult;
}

- (void)setCachedLoadResult:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLoadResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLoadResult, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
