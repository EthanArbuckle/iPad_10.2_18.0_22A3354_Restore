@implementation MapsSuggestionsEntry

- (MKMapItem)MKMapItem
{
  void *v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem"));

  if (v3)
  {
    AssociatedObject = objc_getAssociatedObject(self, &algn_10006C1CF);
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    v6 = objc_getAssociatedObject(self, &unk_10006C1D0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v5
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem")),
          v9 = objc_msgSend(v8, "isEqual:", v7),
          v8,
          v9))
    {
      v10 = v5;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem"));
      if (-[MapsSuggestionsEntry isShortcut](self, "isShortcut"))
      {
        v12 = objc_msgSend(v11, "copy");

        v13 = objc_alloc_init((Class)GEOMapItemStorageUserValues);
        objc_msgSend(v12, "setUserValues:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userValues"));
        objc_msgSend(v15, "setName:", v14);

        v11 = v12;
      }
      v16 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v11, 0);

      objc_setAssociatedObject(self, &algn_10006C1CF, v16, (void *)0x301);
      objc_setAssociatedObject(self, &unk_10006C1D0, v11, (void *)0x301);
      v10 = v16;

    }
  }
  else
  {
    v10 = 0;
  }
  return (MKMapItem *)v10;
}

- (UIImage)icon
{
  void *v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));

  if (v3)
  {
    AssociatedObject = objc_getAssociatedObject(self, &unk_10006C1D1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    v6 = objc_getAssociatedObject(self, &unk_10006C1D2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (!v5
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData")),
          v9 = objc_msgSend(v8, "isEqual:", v7),
          v8,
          (v9 & 1) == 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v10));

      objc_setAssociatedObject(self, &unk_10006C1D1, v11, (void *)0x301);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      objc_setAssociatedObject(self, &unk_10006C1D2, v12, (void *)0x301);

      v5 = v11;
    }
    v13 = v5;

  }
  else
  {
    v13 = 0;
  }
  return (UIImage *)v13;
}

- (void)setIcon:(id)a3
{
  id AssociatedObject;
  void *v5;
  NSData *v6;
  void *v7;
  void *v8;
  UIImage *image;

  image = (UIImage *)a3;
  AssociatedObject = objc_getAssociatedObject(self, &unk_10006C1D1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (image)
  {
    if ((-[UIImage isEqual:](image, "isEqual:", v5) & 1) == 0)
    {
      v6 = UIImagePNGRepresentation(image);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[MapsSuggestionsEntry setIconData:](self, "setIconData:", v7);

      objc_setAssociatedObject(self, &unk_10006C1D1, image, (void *)0x301);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      objc_setAssociatedObject(self, &unk_10006C1D2, v8, (void *)0x301);

    }
  }
  else if (v5)
  {
    objc_setAssociatedObject(self, &unk_10006C1D1, 0, (void *)0x301);
    objc_setAssociatedObject(self, &unk_10006C1D2, 0, (void *)0x301);
    -[MapsSuggestionsEntry setIconData:](self, "setIconData:", 0);
  }

}

- (GEOFeatureStyleAttributes)styleAttributes
{
  unint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (unint64_t)-[MapsSuggestionsEntry type](self, "type");
  if (v3 > 0x18)
  {
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry MKMapItem](self, "MKMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_styleAttributes"));

    if (v7)
      return (GEOFeatureStyleAttributes *)v7;
    goto LABEL_3;
  }
  if (((1 << v3) & 0x8018E) == 0)
  {
    if (v3 == 24)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes sharedLocationStyleAttributes](GEOFeatureStyleAttributes, "sharedLocationStyleAttributes"));
      if (v7)
        return (GEOFeatureStyleAttributes *)v7;
      goto LABEL_3;
    }
    goto LABEL_8;
  }
LABEL_3:
  v4 = -[MapsSuggestionsEntry type](self, "type");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));
  v6 = v5;
  v7 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
      goto LABEL_22;
    case 1uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
      goto LABEL_22;
    case 2uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      goto LABEL_22;
    case 3uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes calendarEventStyleAttributes](GEOFeatureStyleAttributes, "calendarEventStyleAttributes"));
      goto LABEL_22;
    case 7uLL:
    case 0xAuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
      goto LABEL_22;
    case 8uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes restaurantStyleAttributes](GEOFeatureStyleAttributes, "restaurantStyleAttributes"));
      goto LABEL_22;
    case 0xDuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes hotelStyleAttributes](GEOFeatureStyleAttributes, "hotelStyleAttributes"));
      goto LABEL_22;
    case 0xEuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes carRentalStyleAttributes](GEOFeatureStyleAttributes, "carRentalStyleAttributes"));
      goto LABEL_22;
    case 0xFuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes airportStyleAttributes](GEOFeatureStyleAttributes, "airportStyleAttributes"));
      goto LABEL_22;
    case 0x10uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes ticketedEventStyleAttributes](GEOFeatureStyleAttributes, "ticketedEventStyleAttributes"));
      goto LABEL_22;
    case 0x13uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      goto LABEL_22;
    case 0x16uLL:
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("NearbyTransit")))
      {
        v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes nearbyTransitStyleAttributes](GEOFeatureStyleAttributes, "nearbyTransitStyleAttributes"));
LABEL_22:
        v7 = (void *)v8;
      }
      else
      {
        v7 = 0;
      }
LABEL_23:

      break;
    default:
      goto LABEL_23;
  }
  return (GEOFeatureStyleAttributes *)v7;
}

- (NSString)poiTitle
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;

  v3 = (unint64_t)-[MapsSuggestionsEntry type](self, "type");
  if (v3 > 0x18)
  {
    v5 = 0;
    return (NSString *)v5;
  }
  if (((1 << v3) & 0x7E96F7) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle"));
  }
  else
  {
    if (((1 << v3) & 0x1816108) == 0
      || (-[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry MKMapItem](self, "MKMapItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

      return (NSString *)v5;
    }
    v4 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")));
  }
  v5 = (void *)v4;
  return (NSString *)v5;
}

- (NSArray)waypoints
{
  MapsSuggestionsEntry *v2;
  void *v3;

  v2 = self;
  if (self)
  {
    if (-[MapsSuggestionsEntry type](self, "type") == (id)11)
      v2 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry routeRequestStorageForKey:](v2, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
    else
      v2 = 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry waypoints](v2, "waypoints"));

  return (NSArray *)v3;
}

@end
