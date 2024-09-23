@implementation DirectionsPlanWaypoint

- (BOOL)hasWaypoint
{
  return self->_waypoint != 0;
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DirectionsPlanWaypoint;
  v3 = -[DirectionsPlanWaypoint description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlanWaypoint dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOComposedWaypoint *waypoint;
  void *v5;
  NSString *searchString;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  waypoint = self->_waypoint;
  if (waypoint)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint dictionaryRepresentation](waypoint, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("waypoint"));

  }
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("searchString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004872F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  GEOComposedWaypoint *waypoint;
  NSString *searchString;
  id v7;

  v4 = a3;
  waypoint = self->_waypoint;
  v7 = v4;
  if (waypoint)
  {
    PBDataWriterWriteSubmessage(v4, waypoint, 1);
    v4 = v7;
  }
  searchString = self->_searchString;
  if (searchString)
  {
    PBDataWriterWriteStringField(v7, searchString, 2);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_waypoint)
  {
    objc_msgSend(v4, "setWaypoint:");
    v4 = v5;
  }
  if (self->_searchString)
  {
    objc_msgSend(v5, "setSearchString:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOComposedWaypoint copyWithZone:](self->_waypoint, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOComposedWaypoint *waypoint;
  NSString *searchString;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((waypoint = self->_waypoint, !((unint64_t)waypoint | v4[2]))
     || -[GEOComposedWaypoint isEqual:](waypoint, "isEqual:")))
  {
    searchString = self->_searchString;
    if ((unint64_t)searchString | v4[1])
      v7 = -[NSString isEqual:](searchString, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[GEOComposedWaypoint hash](self->_waypoint, "hash");
  return -[NSString hash](self->_searchString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOComposedWaypoint *waypoint;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  waypoint = self->_waypoint;
  v6 = v4[2];
  v7 = v4;
  if (waypoint)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOComposedWaypoint mergeFrom:](waypoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DirectionsPlanWaypoint setWaypoint:](self, "setWaypoint:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DirectionsPlanWaypoint setSearchString:](self, "setSearchString:");
    v4 = v7;
  }

}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (void)setWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_waypoint, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
