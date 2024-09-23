@implementation WaypointSet

- (WaypointSet)initWithWaypoints:(id)a3
{
  id v4;
  WaypointSet *v5;
  NSArray *v6;
  NSArray *waypointsOrNull;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WaypointSet;
  v5 = -[WaypointSet init](&v21, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    waypointsOrNull = v5->_waypointsOrNull;
    v5->_waypointsOrNull = v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5->_waypointsOrNull;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(NSNull);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            v15 = 0;
            goto LABEL_12;
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_12:

    v5->_areAllValidWaypoints = v15;
  }

  return v5;
}

- (id)waypointAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](self, "waypointsOrNull"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v11 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](self, "waypointsOrNull"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

    v9 = objc_opt_class(NSNull);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = 0;
    else
      v10 = v8;
    v11 = v10;

  }
  return v11;
}

- (GEOComposedWaypoint)origin
{
  return (GEOComposedWaypoint *)-[WaypointSet waypointAtIndex:](self, "waypointAtIndex:", 0);
}

- (GEOComposedWaypoint)destination
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](self, "waypointsOrNull"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointAtIndex:](self, "waypointAtIndex:", (char *)objc_msgSend(v3, "count") - 1));

  return (GEOComposedWaypoint *)v4;
}

- (id)description
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = sub_1006289DC(self->_waypointsOrNull);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, waypoints: %@>"), v3, self, v5));

  return v6;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](self, "waypointsOrNull"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  WaypointSet *v5;
  WaypointSet *v6;
  WaypointSet *v7;
  NSArray *waypointsOrNull;
  NSArray *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = (WaypointSet *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    if (-[WaypointSet isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class(self)))
    {
      v6 = v5;
      v7 = v6;
      waypointsOrNull = self->_waypointsOrNull;
      v9 = waypointsOrNull;
      if (!waypointsOrNull)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](v6, "waypointsOrNull"));
        if (!v3)
        {
          v11 = 1;
          goto LABEL_11;
        }
        v9 = self->_waypointsOrNull;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointSet waypointsOrNull](v7, "waypointsOrNull"));
      v11 = -[NSArray isEqual:](v9, "isEqual:", v10);

      if (waypointsOrNull)
      {
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:

      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSArray hash](self->_waypointsOrNull, "hash");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSArray countByEnumeratingWithState:objects:count:](self->_waypointsOrNull, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)areAllValidWaypoints
{
  return self->_areAllValidWaypoints;
}

- (NSArray)waypointsOrNull
{
  return self->_waypointsOrNull;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointsOrNull, 0);
}

@end
