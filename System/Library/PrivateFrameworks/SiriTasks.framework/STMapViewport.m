@implementation STMapViewport

- (id)_aceContextObjectValue
{
  id v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE81420]);
  objc_msgSend(v3, "setNorthLatitude:", self->_northLatitude);
  objc_msgSend(v3, "setSouthLatitude:", self->_southLatitude);
  objc_msgSend(v3, "setEastLongitude:", self->_eastLongitude);
  objc_msgSend(v3, "setWestLongitude:", self->_westLongitude);
  objc_msgSend(v3, "setTimeInSecondsSinceViewportChanged:", self->_timeSinceViewportChanged);
  objc_msgSend(v3, "setTimeInSecondsSinceViewportEnteredForeground:", self->_timeSinceViewportEnteredForeground);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_viewportVertices, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_viewportVertices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x24BE81428]);
        objc_msgSend(v10, "latitude", (_QWORD)v13);
        objc_msgSend(v11, "setLatitude:");
        objc_msgSend(v10, "longitude");
        objc_msgSend(v11, "setLongitude:");

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setVertices:", v4);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STMapViewport;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_eastLongitude"), self->_eastLongitude, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_westLongitude"), self->_westLongitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_northLatitude"), self->_northLatitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_southLatitude"), self->_southLatitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_timeSinceViewportChanged"), self->_timeSinceViewportChanged);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_timeSinceViewportEnteredForeground"), self->_timeSinceViewportEnteredForeground);
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewportVertices, CFSTR("_viewportVertices"));

}

- (STMapViewport)initWithCoder:(id)a3
{
  id v4;
  STMapViewport *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *viewportVertices;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STMapViewport;
  v5 = -[STSiriModelObject initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_eastLongitude"));
    v5->_eastLongitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_westLongitude"));
    v5->_westLongitude = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_northLatitude"));
    v5->_northLatitude = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_southLatitude"));
    v5->_southLatitude = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timeSinceViewportChanged"));
    v5->_timeSinceViewportChanged = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timeSinceViewportEnteredForeground"));
    v5->_timeSinceViewportEnteredForeground = v11;
    v12 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_viewportVertices"));
    v15 = objc_claimAutoreleasedReturnValue();
    viewportVertices = v5->_viewportVertices;
    v5->_viewportVertices = (NSArray *)v15;

  }
  return v5;
}

- (double)northLatitude
{
  return self->_northLatitude;
}

- (void)setNorthLatitude:(double)a3
{
  self->_northLatitude = a3;
}

- (double)southLatitude
{
  return self->_southLatitude;
}

- (void)setSouthLatitude:(double)a3
{
  self->_southLatitude = a3;
}

- (double)eastLongitude
{
  return self->_eastLongitude;
}

- (void)setEastLongitude:(double)a3
{
  self->_eastLongitude = a3;
}

- (double)westLongitude
{
  return self->_westLongitude;
}

- (void)setWestLongitude:(double)a3
{
  self->_westLongitude = a3;
}

- (double)timeSinceViewportChanged
{
  return self->_timeSinceViewportChanged;
}

- (void)setTimeSinceViewportChanged:(double)a3
{
  self->_timeSinceViewportChanged = a3;
}

- (double)timeSinceViewportEnteredForeground
{
  return self->_timeSinceViewportEnteredForeground;
}

- (void)setTimeSinceViewportEnteredForeground:(double)a3
{
  self->_timeSinceViewportEnteredForeground = a3;
}

- (NSArray)viewportVertices
{
  return self->_viewportVertices;
}

- (void)setViewportVertices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportVertices, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
