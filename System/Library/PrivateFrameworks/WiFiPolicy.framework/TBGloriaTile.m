@implementation TBGloriaTile

+ (unsigned)defaultZoomLevel
{
  return +[TBDefaults zoomLevel](TBDefaults, "zoomLevel");
}

- (unint64_t)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_WKTString, 0);
}

- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5
{
  TBGloriaTile *v8;
  double v9;
  double v10;
  double v11;
  _BYTE v13[16];
  objc_super v14;
  char v15;
  double v16;
  double v17;

  v17 = a3;
  v16 = a4;
  v15 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TBGloriaTile;
  v8 = -[TBGloriaTile init](&v14, sel_init);
  v8->_lat = a3;
  v8->_lng = a4;
  v8->_zoom = a5;
  gloria::TileId::FromLatLng((gloria::TileId *)&v17, &v16, (const double *)&v15, (uint64_t)v13);
  v8->_key = gloria::TileId::GetEncodedTileId((gloria::TileId *)v13);
  v8->_tileSize = gloria::TileId::TileSize((gloria::TileId *)v13);
  v8->_north = _TBGloriaBoundingBoxFromLocation(v17, v16, v15);
  v8->_south = v9;
  v8->_east = v10;
  v8->_west = v11;
  return v8;
}

- (id)neighborTileKeysWithRadius:(double)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD **v9;
  BOOL v10;
  _QWORD **v12;
  _QWORD *v13[2];
  _BYTE v14[16];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  gloria::TileId::TileId((uint64_t)v14, -[TBGloriaTile key](self, "key"));
  gloria::TileId::NeighborsWithinRadius((gloria::TileId *)v14, a3, (uint64_t)&v12);
  v6 = v12;
  if (v12 != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", gloria::TileId::GetEncodedTileId((gloria::TileId *)(v6 + 4)));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      v8 = (_QWORD *)v6[1];
      if (v8)
      {
        do
        {
          v9 = (_QWORD **)v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD **)v6[2];
          v10 = *v9 == v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
    }
    while (v9 != v13);
  }
  std::__tree<gloria::TileId>::destroy((uint64_t)&v12, v13[0]);
  return v5;
}

- (TBGloriaTile)initWithEncodedKey:(unint64_t)a3 zoom:(unsigned __int8)a4
{
  TBGloriaTile *v6;
  double v7;
  double v8;
  double v9;
  void **v10;
  uint64_t v11;
  NSString *WKTString;
  void *__p[2];
  char v15;
  _QWORD v16[4];
  _BYTE v17[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TBGloriaTile;
  v6 = -[TBGloriaTile init](&v18, sel_init);
  v6->_key = a3;
  v6->_zoom = a4;
  gloria::TileId::TileId((uint64_t)v17, a3);
  v16[0] = gloria::TileId::ToBBOX((gloria::TileId *)v17);
  *(double *)&v16[1] = v7;
  *(double *)&v16[2] = v8;
  *(double *)&v16[3] = v9;
  *(_QWORD *)&v6->_north = v16[0];
  v6->_south = v7;
  v6->_east = v8;
  v6->_west = v9;
  v6->_tileSize = gloria::TileId::TileSize((gloria::TileId *)v17);
  gloria::TileBoundingBox::ToWKT((uint64_t *)__p, (gloria::TileBoundingBox *)v16);
  if (v15 < 0)
  {
    if (!__p[1])
      goto LABEL_7;
    v10 = (void **)__p[0];
  }
  else
  {
    if (!v15)
      goto LABEL_7;
    v10 = __p;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  WKTString = v6->_WKTString;
  v6->_WKTString = (NSString *)v11;

LABEL_7:
  if (v15 < 0)
    operator delete(__p[0]);
  return v6;
}

+ (id)gloriaTileWithLat:(double)a3 lng:(double)a4 zoom:(unsigned __int8)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLat:lng:zoom:", a5, a3, a4);
}

- (TBGloriaTile)initWithLat:(double)a3 lng:(double)a4
{
  return -[TBGloriaTile initWithLat:lng:zoom:](self, "initWithLat:lng:zoom:", +[TBGloriaTile defaultZoomLevel](TBGloriaTile, "defaultZoomLevel"), a3, a4);
}

- (id)adjacentTileKeysWithLevel:(unsigned int)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD **v9;
  BOOL v10;
  _QWORD **v12;
  _QWORD *v13[2];
  _BYTE v14[16];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  gloria::TileId::TileId((uint64_t)v14, -[TBGloriaTile key](self, "key"));
  gloria::TileId::Neighbors((gloria::TileId *)v14, a3, (uint64_t)&v12);
  v6 = v12;
  if (v12 != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", gloria::TileId::GetEncodedTileId((gloria::TileId *)(v6 + 4)));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      v8 = (_QWORD *)v6[1];
      if (v8)
      {
        do
        {
          v9 = (_QWORD **)v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD **)v6[2];
          v10 = *v9 == v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
    }
    while (v9 != v13);
  }
  std::__tree<gloria::TileId>::destroy((uint64_t)&v12, v13[0]);
  return v5;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (double)lat
{
  return self->_lat;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (double)lng
{
  return self->_lng;
}

- (void)setLng:(double)a3
{
  self->_lng = a3;
}

- (unsigned)zoom
{
  return self->_zoom;
}

- (void)setZoom:(unsigned __int8)a3
{
  self->_zoom = a3;
}

- (NSString)WKTString
{
  return self->_WKTString;
}

- (void)setWKTString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)tileSize
{
  return self->_tileSize;
}

- (void)setTileSize:(double)a3
{
  self->_tileSize = a3;
}

- (double)north
{
  return self->_north;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)south
{
  return self->_south;
}

- (void)setSouth:(double)a3
{
  self->_south = a3;
}

- (double)east
{
  return self->_east;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (double)west
{
  return self->_west;
}

- (void)setWest:(double)a3
{
  self->_west = a3;
}

@end
