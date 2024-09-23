@implementation GuidanceManeuverArtwork

- (BOOL)isValue:(id)a3 equalTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v10;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
    goto LABEL_2;
  v8 = 0;
  if (v5 && v6)
  {
    if (v5 == v6)
    {
LABEL_2:
      v8 = 1;
      goto LABEL_3;
    }
    v10 = objc_opt_class(v6);
    if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
      v8 = objc_msgSend((id)v5, "isEqual:", v7);
    else
      v8 = 0;
  }
LABEL_3:

  return v8;
}

+ (GuidanceManeuverArtwork)artworkWithManeuver:(int)a3
{
  return (GuidanceManeuverArtwork *)objc_msgSend(objc_alloc((Class)a1), "initWithManeuver:junction:drivingSide:artworkDataSource:", *(_QWORD *)&a3, 0, 0, 0);
}

- (GuidanceManeuverArtwork)initWithManeuver:(int)a3 junction:(id)a4 drivingSide:(int)a5 artworkDataSource:(id)a6
{
  id v11;
  id v12;
  GuidanceManeuverArtwork *v13;
  GuidanceManeuverArtwork *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)GuidanceManeuverArtwork;
  v13 = -[GuidanceManeuverArtwork init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_maneuver = a3;
    objc_storeStrong((id *)&v13->_junction, a4);
    v14->_drivingSide = a5;
    objc_storeStrong((id *)&v14->_artworkDataSource, a6);
  }

  return v14;
}

- (BOOL)isStartRouteManeuver
{
  unsigned int v2;
  BOOL result;

  v2 = -[GuidanceManeuverArtwork maneuver](self, "maneuver");
  result = 1;
  if (v2 - 25 > 0x3D || ((1 << (v2 - 25)) & 0x3000000000000001) == 0)
    return v2 == 17;
  return result;
}

- (BOOL)isArriveManeuver
{
  unsigned int v2;

  v2 = -[GuidanceManeuverArtwork maneuver](self, "maneuver");
  return (v2 < 0x28) & (0x8600050000uLL >> v2);
}

- (BOOL)isRoundaboutManeuver
{
  unsigned int v2;

  v2 = -[GuidanceManeuverArtwork maneuver](self, "maneuver");
  return (v2 < 0x3C) & (0xFFFFE00000000C0uLL >> v2);
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = 2654435761 * self->_maneuver;
  v4 = v3 ^ (unint64_t)-[MKJunction hash](self->_junction, "hash");
  v5 = 2654435761 * self->_drivingSide;
  return v4 ^ v5 ^ (unint64_t)-[GEOTransitArtworkDataSource hash](self->_artworkDataSource, "hash");
}

- (BOOL)isEqual:(id)a3
{
  GuidanceManeuverArtwork *v4;
  int maneuver;
  int drivingSide;
  MKJunction *junction;
  void *v8;
  GEOTransitArtworkDataSource *artworkDataSource;
  void *v10;
  BOOL v11;

  v4 = (GuidanceManeuverArtwork *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[GuidanceManeuverArtwork isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self))
         && (maneuver = self->_maneuver, maneuver == -[GuidanceManeuverArtwork maneuver](v4, "maneuver"))
         && (drivingSide = self->_drivingSide, drivingSide == -[GuidanceManeuverArtwork drivingSide](v4, "drivingSide"))
         && (junction = self->_junction,
             v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork junction](v4, "junction")),
             LODWORD(junction) = -[GuidanceManeuverArtwork isValue:equalTo:](self, "isValue:equalTo:", junction, v8),
             v8,
             (_DWORD)junction))
  {
    artworkDataSource = self->_artworkDataSource;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverArtwork artworkDataSource](v4, "artworkDataSource"));
    v11 = -[GuidanceManeuverArtwork isValue:equalTo:](self, "isValue:equalTo:", artworkDataSource, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GEOTransitArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setArtworkDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_artworkDataSource, a3);
}

- (int)maneuver
{
  return self->_maneuver;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junction, 0);
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
}

@end
