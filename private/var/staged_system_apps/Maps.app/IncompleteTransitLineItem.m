@implementation IncompleteTransitLineItem

- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3
{
  return -[IncompleteTransitLineItem initWithLabelMarker:system:](self, "initWithLabelMarker:system:", a3, 0);
}

- (IncompleteTransitLineItem)initWithLabelMarker:(id)a3 system:(id)a4
{
  id v7;
  id v8;
  IncompleteTransitLineItem *v9;
  IncompleteTransitLineItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IncompleteTransitLineItem;
  v9 = -[IncompleteTransitLineItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_labelMarker, a3);
    objc_storeStrong((id *)&v10->_system, a4);
  }

  return v10;
}

- (IncompleteTransitLineItem)initWithIdentifier:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  IncompleteTransitLineItem *v9;
  IncompleteTransitLineItem *v10;
  NSString *v11;
  NSString *name;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IncompleteTransitLineItem;
  v9 = -[IncompleteTransitLineItem init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = v11;

  }
  return v10;
}

- (IncompleteTransitLineItem)initWithTransitLine:(id)a3
{
  id v5;
  IncompleteTransitLineItem *v6;
  IncompleteTransitLineItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IncompleteTransitLineItem;
  v6 = -[IncompleteTransitLineItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_line, a3);

  return v7;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (unint64_t)muid
{
  GEOTransitLine *line;
  void *v4;
  void *v5;
  id v6;

  if (self->_line)
  {
    line = self->_line;
    return (unint64_t)-[GEOTransitLine muid](line, "muid");
  }
  if (!self->_labelMarker)
  {
    line = self->_identifier;
    return (unint64_t)-[GEOTransitLine muid](line, "muid");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_lineIdentifiers](self->_labelMarker, "_maps_lineIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = objc_msgSend(v5, "muid");

  return (unint64_t)v6;
}

- (GEOMapItemIdentifier)identifier
{
  GEOTransitLine *line;
  uint64_t v4;
  VKLabelMarker *labelMarker;
  void *v6;
  void *v7;
  void *v8;

  line = self->_line;
  if (line)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[GEOTransitLine identifier](line, "identifier"));
LABEL_7:
    v8 = (void *)v4;
    return (GEOMapItemIdentifier *)v8;
  }
  labelMarker = self->_labelMarker;
  if (!labelMarker
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _maps_lineIdentifiers](labelMarker, "_maps_lineIdentifiers")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject")),
        v6,
        !v7))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MKMapItemIdentifier geoMapItemIdentifier](self->_identifier, "geoMapItemIdentifier"));
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItemIdentifier"));

  return (GEOMapItemIdentifier *)v8;
}

- (NSString)name
{
  NSString *v2;

  if (self->_line)
  {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[GEOTransitLine name](self->_line, "name"));
  }
  else if (self->_labelMarker)
  {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker _annotationTitle](self->_labelMarker, "_annotationTitle"));
  }
  else
  {
    v2 = self->_name;
  }
  return v2;
}

- (GEOTransitSystem)system
{
  GEOTransitSystem *system;

  system = self->_system;
  if (system)
    return system;
  else
    return (GEOTransitSystem *)(id)objc_claimAutoreleasedReturnValue(-[GEOTransitLine system](self->_line, "system"));
}

- (unint64_t)departureTimeDisplayStyle
{
  unint64_t result;

  result = (unint64_t)self->_line;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "departureTimeDisplayStyle");
  return result;
}

- (BOOL)departuresAreVehicleSpecific
{
  GEOTransitLine *line;

  line = self->_line;
  if (line)
    LOBYTE(line) = -[GEOTransitLine departuresAreVehicleSpecific](line, "departuresAreVehicleSpecific");
  return (char)line;
}

- (GEOTransitArtworkDataSource)artwork
{
  GEOTransitLine *line;
  VKLabelMarker *v4;

  line = self->_line;
  if (line)
    v4 = (VKLabelMarker *)objc_claimAutoreleasedReturnValue(-[GEOTransitLine artwork](line, "artwork"));
  else
    v4 = self->_labelMarker;
  return v4;
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine modeArtwork](self->_line, "modeArtwork");
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine headerArtwork](self->_line, "headerArtwork");
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOTransitLine alternateArtwork](self->_line, "alternateArtwork");
}

- (BOOL)hasLineColorString
{
  GEOTransitLine *line;

  line = self->_line;
  if (line)
    LOBYTE(line) = -[GEOTransitLine hasLineColorString](line, "hasLineColorString");
  return (char)line;
}

- (NSString)lineColorString
{
  return (NSString *)-[GEOTransitLine lineColorString](self->_line, "lineColorString");
}

- (BOOL)showVehicleNumber
{
  GEOTransitLine *line;

  line = self->_line;
  if (line)
    LOBYTE(line) = -[GEOTransitLine showVehicleNumber](line, "showVehicleNumber");
  return (char)line;
}

- (NSArray)operatingHours
{
  return (NSArray *)-[GEOTransitLine operatingHours](self->_line, "operatingHours");
}

- (NSArray)labelItems
{
  return 0;
}

- (GEOTransitAttribution)attribution
{
  return 0;
}

- (GEOMapRegion)mapRegion
{
  return 0;
}

- (NSArray)incidents
{
  return 0;
}

- (BOOL)isIncidentsTTLExpired
{
  return 0;
}

- (BOOL)hasIncidentComponent
{
  return 0;
}

- (BOOL)hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  return 0;
}

- (BOOL)isBus
{
  return -[GEOTransitLine isBus](self->_line, "isBus");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
