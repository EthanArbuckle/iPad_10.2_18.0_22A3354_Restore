@implementation VenueAreaIdentifier

- (VenueAreaIdentifier)initWithVenueID:(unint64_t)a3 buildingID:(id)a4 levelID:(id)a5 floorOrdinal:(id)a6
{
  id v10;
  id v11;
  id v12;
  VenueAreaIdentifier *v13;
  VenueAreaIdentifier *v14;
  NSNumber *v15;
  NSNumber *buildingID;
  NSNumber *v17;
  NSNumber *levelID;
  NSNumber *v19;
  NSNumber *floorOrdinal;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VenueAreaIdentifier;
  v13 = -[VenueAreaIdentifier init](&v22, "init");
  v14 = v13;
  if (v13)
  {
    v13->_venueID = a3;
    v15 = (NSNumber *)objc_msgSend(v10, "copy");
    buildingID = v14->_buildingID;
    v14->_buildingID = v15;

    v17 = (NSNumber *)objc_msgSend(v11, "copy");
    levelID = v14->_levelID;
    v14->_levelID = v17;

    v19 = (NSNumber *)objc_msgSend(v12, "copy");
    floorOrdinal = v14->_floorOrdinal;
    v14->_floorOrdinal = v19;

  }
  return v14;
}

+ (id)keyForVenue:(id)a3 building:(id)a4 floorOrdinal:(id)a5
{
  id v7;
  id v8;
  id v9;
  VenueAreaIdentifier *v10;
  id v11;
  void *v12;
  VenueAreaIdentifier *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = [VenueAreaIdentifier alloc];
    v11 = objc_msgSend(v7, "venueID");
    if (v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "buildingId")));
      v13 = -[VenueAreaIdentifier initWithVenueID:buildingID:levelID:floorOrdinal:](v10, "initWithVenueID:buildingID:levelID:floorOrdinal:", v11, v12, 0, v9);

    }
    else
    {
      v13 = -[VenueAreaIdentifier initWithVenueID:buildingID:levelID:floorOrdinal:](v10, "initWithVenueID:buildingID:levelID:floorOrdinal:", v11, 0, 0, v9);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[VenueAreaIdentifier venueID](self, "venueID")));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier buildingID](self, "buildingID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier levelID](self, "levelID"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier floorOrdinal](self, "floorOrdinal"));
  v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash") ^ v4;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  v5 = objc_opt_class(VenueAreaIdentifier);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "venueID");
    if (v7 == (id)-[VenueAreaIdentifier venueID](self, "venueID"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buildingID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier buildingID](self, "buildingID"));
      if (+[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", v8, v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "levelID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier levelID](self, "levelID"));
        if (+[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", v10, v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floorOrdinal"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueAreaIdentifier floorOrdinal](self, "floorOrdinal"));
          v14 = +[NSNumber number:isEqualToNumber:](NSNumber, "number:isEqualToNumber:", v12, v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)venueID
{
  return self->_venueID;
}

- (NSNumber)buildingID
{
  return self->_buildingID;
}

- (NSNumber)levelID
{
  return self->_levelID;
}

- (NSNumber)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorOrdinal, 0);
  objc_storeStrong((id *)&self->_levelID, 0);
  objc_storeStrong((id *)&self->_buildingID, 0);
}

@end
