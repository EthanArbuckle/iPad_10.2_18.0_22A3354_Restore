@implementation PGGraphEnabler

- (PGGraphEnabler)initWithGraph:(id)a3
{
  id v5;
  PGGraphEnabler *v6;
  PGGraphEnabler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphEnabler;
  v6 = -[PGGraphEnabler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (BOOL)locationIsFrequent:(id)a3
{
  id v4;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v7;
  char v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  CLLocationCoordinate2D v15;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v4, "coordinate");
  latitude = v15.latitude;
  longitude = v15.longitude;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self->_graph);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__PGGraphEnabler_locationIsFrequent___block_invoke;
    v10[3] = &unk_1E842C770;
    *(CLLocationDegrees *)&v10[5] = latitude;
    *(CLLocationDegrees *)&v10[6] = longitude;
    v10[4] = &v11;
    objc_msgSend(v7, "enumerateNodesUsingBlock:", v10);

  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (BOOL)locationIsNearMyHomeOrWork:(id)a3
{
  id v4;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  CLLocationCoordinate2D v17;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v4, "coordinate");
  latitude = v17.latitude;
  longitude = v17.longitude;
  if (CLLocationCoordinate2DIsValid(v17))
  {
    -[PGGraph meNodeCollection](self->_graph, "meNodeCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeOrWorkNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PGGraphEnabler_locationIsNearMyHomeOrWork___block_invoke;
    v12[3] = &unk_1E8435528;
    *(CLLocationDegrees *)&v12[5] = latitude;
    *(CLLocationDegrees *)&v12[6] = longitude;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v12);

  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (PGGraph)graph
{
  return (PGGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

uint64_t __45__PGGraphEnabler_locationIsNearMyHomeOrWork___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  double v6;

  objc_msgSend(a2, "coordinate");
  result = CLLocationCoordinate2DGetDistanceFrom();
  if (v6 < 100.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __37__PGGraphEnabler_locationIsFrequent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t result;
  double v7;

  objc_msgSend(a2, "addressNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");

  result = CLLocationCoordinate2DGetDistanceFrom();
  if (v7 <= 10000.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
