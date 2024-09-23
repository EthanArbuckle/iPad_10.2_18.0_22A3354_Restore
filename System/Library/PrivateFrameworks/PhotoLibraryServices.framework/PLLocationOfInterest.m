@implementation PLLocationOfInterest

- (PLLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 typeRadius:(double)a5 routineLocation:(id)a6 mapItemLocation:(id)a7
{
  id v13;
  id v14;
  id v15;
  PLLocationOfInterest *v16;
  PLLocationOfInterest *v17;
  uint64_t v18;
  NSMutableArray *visits;
  objc_super v21;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PLLocationOfInterest;
  v16 = -[PLLocationOfInterest init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_type = a4;
    v17->_typeRadius = a5;
    objc_storeStrong((id *)&v17->_routineLocation, a6);
    objc_storeStrong((id *)&v17->_mapItemLocation, a7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    visits = v17->_visits;
    v17->_visits = (NSMutableArray *)v18;

  }
  return v17;
}

- (void)addVisit:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterest.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visit != nil"));

    v5 = 0;
  }
  if ((-[NSMutableArray containsObject:](self->_visits, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_visits, "addObject:", v7);
    objc_msgSend(v7, "setLocationOfInterest:", self);
  }

}

- (void)removeVisit:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLocationOfInterest.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visit != nil"));

    v5 = 0;
  }
  -[NSMutableArray removeObject:](self->_visits, "removeObject:", v5);
  objc_msgSend(v7, "setLocationOfInterest:", 0);

}

- (double)distanceFromLocation:(id)a3
{
  id v4;
  double typeRadius;
  double v6;
  PLLocationOfInterestLocation *v7;
  PLLocationOfInterestLocation *v8;
  double v9;
  double v10;
  PLLocationOfInterestLocation *mapItemLocation;
  double v12;
  double v13;

  v4 = a3;
  typeRadius = self->_typeRadius;
  v6 = *MEMORY[0x1E0C9E318];
  v7 = self->_routineLocation;
  v8 = v7;
  v9 = v6;
  if (v7)
  {
    -[PLLocationOfInterestLocation distanceFromLocation:withTypeRadius:](v7, "distanceFromLocation:withTypeRadius:", v4, typeRadius);
    v9 = v10;
  }
  mapItemLocation = self->_mapItemLocation;
  if (mapItemLocation)
  {
    -[PLLocationOfInterestLocation distanceFromLocation:withTypeRadius:](mapItemLocation, "distanceFromLocation:withTypeRadius:", v4, typeRadius);
    v6 = v12;
  }
  if (v9 >= v6)
    v13 = v6;
  else
    v13 = v9;

  return v13;
}

- (double)centerDistanceFromLocation:(id)a3
{
  id v4;
  double v5;
  PLLocationOfInterestLocation *v6;
  PLLocationOfInterestLocation *v7;
  double v8;
  void *v9;
  double v10;
  PLLocationOfInterestLocation *mapItemLocation;
  void *v12;
  double v13;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9E318];
  v6 = self->_routineLocation;
  v7 = v6;
  v8 = v5;
  if (v6)
  {
    -[PLLocationOfInterestLocation location](v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "distanceFromLocation:", v4);
    v8 = v10;

  }
  mapItemLocation = self->_mapItemLocation;
  if (mapItemLocation)
  {
    -[PLLocationOfInterestLocation location](mapItemLocation, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "distanceFromLocation:", v4);
    v5 = v13;

  }
  if (v8 < v5)
    v5 = v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLLocationOfInterest;
  -[PLLocationOfInterest description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLocationOfInterest routineLocation](self, "routineLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLocationOfInterest mapItemLocation](self, "mapItemLocation");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = self->_type + 1;
  if (v8 > 2)
    v9 = 0;
  else
    v9 = off_1E3677FF0[v8];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ - %@ - %@"), v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PLLocationOfInterest *v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = (PLLocationOfInterest *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[PLLocationOfInterest identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (double)typeRadius
{
  return self->_typeRadius;
}

- (PLLocationOfInterestLocation)routineLocation
{
  return self->_routineLocation;
}

- (PLLocationOfInterestLocation)mapItemLocation
{
  return self->_mapItemLocation;
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
  objc_storeStrong((id *)&self->_visits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItemLocation, 0);
  objc_storeStrong((id *)&self->_routineLocation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
