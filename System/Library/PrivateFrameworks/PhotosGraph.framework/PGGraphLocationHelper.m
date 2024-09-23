@implementation PGGraphLocationHelper

- (PGGraphLocationHelper)initWithGraph:(id)a3
{
  id v5;
  PGGraphLocationHelper *v6;
  PGGraphLocationHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphLocationHelper;
  v6 = -[PGGraphLocationHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v7->_locationHelperLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)_fetchLocationNodesByCountryNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByCountryNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationCountryNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationCountryEdge filter](PGGraphLocationCountryEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByCountryNode = self->_locationNodesByCountryNode;
  self->_locationNodesByCountryNode = v6;

}

- (id)locationNodesByCountryNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByCountryNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCountryNode = self->_locationNodesByCountryNode;
  if (!locationNodesByCountryNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByCountryNode](self, "_fetchLocationNodesByCountryNode");
    locationNodesByCountryNode = self->_locationNodesByCountryNode;
  }
  v5 = locationNodesByCountryNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)countryNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *countryNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCountryNode)
    -[PGGraphLocationHelper _fetchLocationNodesByCountryNode](self, "_fetchLocationNodesByCountryNode");
  countryNodesByLocationNode = self->_countryNodesByLocationNode;
  if (!countryNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByCountryNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_countryNodesByLocationNode;
    self->_countryNodesByLocationNode = v5;

    countryNodesByLocationNode = self->_countryNodesByLocationNode;
  }
  v7 = countryNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchLocationNodesByStateNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByStateNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationStateNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationStateEdge filter](PGGraphLocationStateEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByStateNode = self->_locationNodesByStateNode;
  self->_locationNodesByStateNode = v6;

}

- (id)locationNodesByStateNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByStateNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByStateNode = self->_locationNodesByStateNode;
  if (!locationNodesByStateNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByStateNode](self, "_fetchLocationNodesByStateNode");
    locationNodesByStateNode = self->_locationNodesByStateNode;
  }
  v5 = locationNodesByStateNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)stateNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *stateNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByStateNode)
    -[PGGraphLocationHelper _fetchLocationNodesByStateNode](self, "_fetchLocationNodesByStateNode");
  stateNodesByLocationNode = self->_stateNodesByLocationNode;
  if (!stateNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByStateNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_stateNodesByLocationNode;
    self->_stateNodesByLocationNode = v5;

    stateNodesByLocationNode = self->_stateNodesByLocationNode;
  }
  v7 = stateNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (id)stateNodeFromAddressNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 8, a3);
}

- (void)_fetchLocationNodesByCountyNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByCountyNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationCountyNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationCountyEdge filter](PGGraphLocationCountyEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByCountyNode = self->_locationNodesByCountyNode;
  self->_locationNodesByCountyNode = v6;

}

- (id)locationNodesByCountyNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByCountyNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCountyNode = self->_locationNodesByCountyNode;
  if (!locationNodesByCountyNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByCountyNode](self, "_fetchLocationNodesByCountyNode");
    locationNodesByCountyNode = self->_locationNodesByCountyNode;
  }
  v5 = locationNodesByCountyNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)countyNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *countyNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCountyNode)
    -[PGGraphLocationHelper _fetchLocationNodesByCountyNode](self, "_fetchLocationNodesByCountyNode");
  countyNodesByLocationNode = self->_countyNodesByLocationNode;
  if (!countyNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByCountyNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_countyNodesByLocationNode;
    self->_countyNodesByLocationNode = v5;

    countyNodesByLocationNode = self->_countyNodesByLocationNode;
  }
  v7 = countyNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchLocationNodesByCityNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByCityNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationCityNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationCityEdge filter](PGGraphLocationCityEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByCityNode = self->_locationNodesByCityNode;
  self->_locationNodesByCityNode = v6;

}

- (id)locationNodesByCityNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByCityNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByCityNode = self->_locationNodesByCityNode;
  if (!locationNodesByCityNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByCityNode](self, "_fetchLocationNodesByCityNode");
    locationNodesByCityNode = self->_locationNodesByCityNode;
  }
  v5 = locationNodesByCityNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)cityNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *cityNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByCityNode)
    -[PGGraphLocationHelper _fetchLocationNodesByCityNode](self, "_fetchLocationNodesByCityNode");
  cityNodesByLocationNode = self->_cityNodesByLocationNode;
  if (!cityNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByCityNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cityNodesByLocationNode;
    self->_cityNodesByLocationNode = v5;

    cityNodesByLocationNode = self->_cityNodesByLocationNode;
  }
  v7 = cityNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchLocationNodesByDistrictNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByDistrictNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationDistrictNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationDistrictEdge filter](PGGraphLocationDistrictEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  self->_locationNodesByDistrictNode = v6;

}

- (id)locationNodesByDistrictNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByDistrictNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  if (!locationNodesByDistrictNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByDistrictNode](self, "_fetchLocationNodesByDistrictNode");
    locationNodesByDistrictNode = self->_locationNodesByDistrictNode;
  }
  v5 = locationNodesByDistrictNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)districtNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *districtNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByDistrictNode)
    -[PGGraphLocationHelper _fetchLocationNodesByDistrictNode](self, "_fetchLocationNodesByDistrictNode");
  districtNodesByLocationNode = self->_districtNodesByLocationNode;
  if (!districtNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByDistrictNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_districtNodesByLocationNode;
    self->_districtNodesByLocationNode = v5;

    districtNodesByLocationNode = self->_districtNodesByLocationNode;
  }
  v7 = districtNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchLocationNodesByStreetNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByStreetNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationStreetNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationStreetEdge filter](PGGraphLocationStreetEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByStreetNode = self->_locationNodesByStreetNode;
  self->_locationNodesByStreetNode = v6;

}

- (id)locationNodesByStreetNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByStreetNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByStreetNode = self->_locationNodesByStreetNode;
  if (!locationNodesByStreetNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByStreetNode](self, "_fetchLocationNodesByStreetNode");
    locationNodesByStreetNode = self->_locationNodesByStreetNode;
  }
  v5 = locationNodesByStreetNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)streetNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *streetNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByStreetNode)
    -[PGGraphLocationHelper _fetchLocationNodesByStreetNode](self, "_fetchLocationNodesByStreetNode");
  streetNodesByLocationNode = self->_streetNodesByLocationNode;
  if (!streetNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByStreetNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_streetNodesByLocationNode;
    self->_streetNodesByLocationNode = v5;

    streetNodesByLocationNode = self->_streetNodesByLocationNode;
  }
  v7 = streetNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchLocationNodesByNumberNode
{
  void *v3;
  void *v4;
  void *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *locationNodesByNumberNode;
  id v8;

  v3 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationNumberNodeCollection, "nodesInGraph:", self->_graph);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationNumberEdge filter](PGGraphLocationNumberEdge, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v8, v5, objc_opt_class());
  v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
  locationNodesByNumberNode = self->_locationNodesByNumberNode;
  self->_locationNodesByNumberNode = v6;

}

- (id)locationNodesByNumberNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *locationNodesByNumberNode;
  MABinaryAdjacency *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  locationNodesByNumberNode = self->_locationNodesByNumberNode;
  if (!locationNodesByNumberNode)
  {
    -[PGGraphLocationHelper _fetchLocationNodesByNumberNode](self, "_fetchLocationNodesByNumberNode");
    locationNodesByNumberNode = self->_locationNodesByNumberNode;
  }
  v5 = locationNodesByNumberNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)numberNodesByLocationNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *numberNodesByLocationNode;
  MABinaryAdjacency *v5;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_locationNodesByNumberNode)
    -[PGGraphLocationHelper _fetchLocationNodesByNumberNode](self, "_fetchLocationNodesByNumberNode");
  numberNodesByLocationNode = self->_numberNodesByLocationNode;
  if (!numberNodesByLocationNode)
  {
    -[MABinaryAdjacency transposed](self->_locationNodesByNumberNode, "transposed");
    v5 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v6 = self->_numberNodesByLocationNode;
    self->_numberNodesByLocationNode = v5;

    numberNodesByLocationNode = self->_numberNodesByLocationNode;
  }
  v7 = numberNodesByLocationNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v7;
}

- (void)_fetchAddressNodes
{
  PGGraphAddressNodeCollection *v3;
  PGGraphAddressNodeCollection *addressNodes;

  +[PGGraphNodeCollection nodesInGraph:](PGGraphAddressNodeCollection, "nodesInGraph:", self->_graph);
  v3 = (PGGraphAddressNodeCollection *)objc_claimAutoreleasedReturnValue();
  addressNodes = self->_addressNodes;
  self->_addressNodes = v3;

}

- (id)addressNodes
{
  os_unfair_lock_s *p_locationHelperLock;
  PGGraphAddressNodeCollection *addressNodes;
  PGGraphAddressNodeCollection *v5;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  addressNodes = self->_addressNodes;
  if (!addressNodes)
  {
    -[PGGraphLocationHelper _fetchAddressNodes](self, "_fetchAddressNodes");
    addressNodes = self->_addressNodes;
  }
  v5 = addressNodes;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v5;
}

- (id)addressNodesByAreaNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *addressNodesByAreaNode;
  void *v5;
  PGGraphAddressNodeCollection *addressNodes;
  void *v7;
  void *v8;
  MABinaryAdjacency *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes)
    -[PGGraphLocationHelper _fetchAddressNodes](self, "_fetchAddressNodes");
  addressNodesByAreaNode = self->_addressNodesByAreaNode;
  if (!addressNodesByAreaNode)
  {
    v5 = (void *)MEMORY[0x1E0D429D8];
    addressNodes = self->_addressNodes;
    +[PGGraphAddressNode areaOfAddress](PGGraphAddressNode, "areaOfAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adjacencyWithSources:relation:targetsClass:", addressNodes, v7, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transposed");
    v9 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v10 = self->_addressNodesByAreaNode;
    self->_addressNodesByAreaNode = v9;

    addressNodesByAreaNode = self->_addressNodesByAreaNode;
  }
  v11 = addressNodesByAreaNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v11;
}

- (id)areaNodesByAddressNode
{
  void *v3;
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *areaNodesByAddressNode;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;
  MABinaryAdjacency *v8;

  -[PGGraphLocationHelper addressNodesByAreaNode](self, "addressNodesByAreaNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes)
    -[PGGraphLocationHelper _fetchAddressNodes](self, "_fetchAddressNodes");
  areaNodesByAddressNode = self->_areaNodesByAddressNode;
  if (!areaNodesByAddressNode)
  {
    objc_msgSend(v3, "transposed");
    v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v7 = self->_areaNodesByAddressNode;
    self->_areaNodesByAddressNode = v6;

    areaNodesByAddressNode = self->_areaNodesByAddressNode;
  }
  v8 = areaNodesByAddressNode;
  os_unfair_lock_unlock(p_locationHelperLock);

  return v8;
}

- (id)momentNodesByAddressNode
{
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *momentNodesByAddressNode;
  void *v5;
  PGGraphAddressNodeCollection *addressNodes;
  void *v7;
  MABinaryAdjacency *v8;
  MABinaryAdjacency *v9;
  MABinaryAdjacency *v10;

  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes)
    -[PGGraphLocationHelper _fetchAddressNodes](self, "_fetchAddressNodes");
  momentNodesByAddressNode = self->_momentNodesByAddressNode;
  if (!momentNodesByAddressNode)
  {
    v5 = (void *)MEMORY[0x1E0D429D8];
    addressNodes = self->_addressNodes;
    +[PGGraphAddressNode momentOfAddress](PGGraphAddressNode, "momentOfAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adjacencyWithSources:relation:targetsClass:", addressNodes, v7, objc_opt_class());
    v8 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v9 = self->_momentNodesByAddressNode;
    self->_momentNodesByAddressNode = v8;

    momentNodesByAddressNode = self->_momentNodesByAddressNode;
  }
  v10 = momentNodesByAddressNode;
  os_unfair_lock_unlock(p_locationHelperLock);
  return v10;
}

- (id)addressNodesByMomentNode
{
  void *v3;
  os_unfair_lock_s *p_locationHelperLock;
  MABinaryAdjacency *addressNodesByMomentNode;
  MABinaryAdjacency *v6;
  MABinaryAdjacency *v7;
  MABinaryAdjacency *v8;

  -[PGGraphLocationHelper momentNodesByAddressNode](self, "momentNodesByAddressNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_locationHelperLock = &self->_locationHelperLock;
  os_unfair_lock_lock(&self->_locationHelperLock);
  if (!self->_addressNodes)
    -[PGGraphLocationHelper _fetchAddressNodes](self, "_fetchAddressNodes");
  addressNodesByMomentNode = self->_addressNodesByMomentNode;
  if (!addressNodesByMomentNode)
  {
    objc_msgSend(v3, "transposed");
    v6 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v7 = self->_addressNodesByMomentNode;
    self->_addressNodesByMomentNode = v6;

    addressNodesByMomentNode = self->_addressNodesByMomentNode;
  }
  v8 = addressNodesByMomentNode;
  os_unfair_lock_unlock(p_locationHelperLock);

  return v8;
}

- (id)addressNodesByMomentNodeAdjacency
{
  void *v2;
  void *v3;

  -[PGGraphLocationHelper addressNodesByMomentNode](self, "addressNodesByMomentNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjacency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5
{
  return -[PGGraphLocationHelper _closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:](self, "_closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:", a3, a4, a5, 0);
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5
{
  return -[PGGraphLocationHelper _closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:](self, "_closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:", a3, a4, 0, a5);
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(v6, "locationNodeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper _parentLocationNodeWithDimension:sourceLocationNodeAsCollection:sourceLabel:](self, "_parentLocationNodeWithDimension:sourceLocationNodeAsCollection:sourceLabel:", a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 ofLocationNodeAsCollection:(id)a4
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:sourceLocationNodeAsCollection:sourceLabel:](self, "_parentLocationNodeWithDimension:sourceLocationNodeAsCollection:sourceLabel:", a3, a4, 0);
}

- (id)_parentLocationNodeWithDimension:(unint64_t)a3 sourceLocationNodeAsCollection:(id)a4 sourceLabel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void (**v15)(void *, uint64_t, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "labels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v34 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v11);
  v13 = v32[3];
  if (v13 == a3)
  {
    v14 = v8;
  }
  else if (v13 >= a3)
  {
    v14 = 0;
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__29291;
    v29 = __Block_byref_object_dispose__29292;
    v30 = v8;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__PGGraphLocationHelper__parentLocationNodeWithDimension_sourceLocationNodeAsCollection_sourceLabel___block_invoke;
    aBlock[3] = &unk_1E842C5E0;
    aBlock[5] = &v25;
    aBlock[6] = a3;
    aBlock[4] = &v31;
    v15 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    -[PGGraphLocationHelper numberNodesByLocationNode](self, "numberNodesByLocationNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 3, v16);

    -[PGGraphLocationHelper streetNodesByLocationNode](self, "streetNodesByLocationNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 4, v17);

    -[PGGraphLocationHelper districtNodesByLocationNode](self, "districtNodesByLocationNode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 5, v18);

    -[PGGraphLocationHelper cityNodesByLocationNode](self, "cityNodesByLocationNode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 6, v19);

    -[PGGraphLocationHelper countyNodesByLocationNode](self, "countyNodesByLocationNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 7, v20);

    -[PGGraphLocationHelper stateNodesByLocationNode](self, "stateNodesByLocationNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 8, v21);

    -[PGGraphLocationHelper countryNodesByLocationNode](self, "countryNodesByLocationNode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 9, v22);

    if (v32[3] == a3)
      v14 = (id)v26[5];
    else
      v14 = 0;

    _Block_object_dispose(&v25, 8);
  }
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (id)_parentLocationNodeForLocationNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[8];

  v27[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraphLocationHelper numberNodesByLocationNode](self, "numberNodesByLocationNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  -[PGGraphLocationHelper streetNodesByLocationNode](self, "streetNodesByLocationNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  -[PGGraphLocationHelper districtNodesByLocationNode](self, "districtNodesByLocationNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  -[PGGraphLocationHelper cityNodesByLocationNode](self, "cityNodesByLocationNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v8;
  -[PGGraphLocationHelper countyNodesByLocationNode](self, "countyNodesByLocationNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v9;
  -[PGGraphLocationHelper stateNodesByLocationNode](self, "stateNodesByLocationNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v10;
  -[PGGraphLocationHelper countryNodesByLocationNode](self, "countryNodesByLocationNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationNodeCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v17)
        objc_enumerationMutation(v14);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "targetsForSources:", v13, (_QWORD)v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
        break;

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v16)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v19 = 0;
  }

  objc_msgSend(v19, "anyNode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5 reverse:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  id v16;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  char v23;
  _BOOL4 v24;
  void *v25;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = (uint64_t (**)(_QWORD, _QWORD))v11;
  if (v11)
    a4 = (*((uint64_t (**)(id, unint64_t))v11 + 2))(v11, a4);
  +[PGCommonTitleUtility locationLabelForDimension:](PGCommonTitleUtility, "locationLabelForDimension:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  v25 = v13;
  if (v15)
  {
    v16 = v10;
  }
  else
  {
    v16 = 0;
    if (v6)
      v18 = 4;
    else
      v18 = 9;
    v19 = a4 < v18 && v6;
    if (a4 && !v19)
    {
      if (v6)
        v20 = -1;
      else
        v20 = 1;
      while (a4 <= v18 || v6)
      {
        -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", a4, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "anyNode");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          a4 += v20;
          if (v12)
          {
            v22 = !v6;
            v23 = a4 < v18 || !v6;
            if (a4 > v18)
              v22 = 0;
            if (v22 || (v23 & 1) == 0)
              a4 = v12[2](v12, a4);
          }
          v16 = 0;
          v24 = a4 < v18 && v6;
          if (a4 && !v24)
            continue;
        }
        goto LABEL_5;
      }
      v16 = 0;
    }
  }
LABEL_5:

  return v16;
}

- (id)addressNodesFromAreaNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraphLocationHelper addressNodesByAreaNode](self, "addressNodesByAreaNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetsForSources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)areaNodesFromAddressNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraphLocationHelper areaNodesByAddressNode](self, "areaNodesByAddressNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetsForSources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addressNodesFromLocationNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;

  v4 = a3;
  -[PGGraphLocationHelper locationNodesByCountryNode](self, "locationNodesByCountryNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionByIntersecting:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByCountryNode](self, "locationNodesByCountryNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetsForSources:", v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionByFormingUnionWith:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByStateNode](self, "locationNodesByStateNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sources");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionByIntersecting:", v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByStateNode](self, "locationNodesByStateNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "targetsForSources:", v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionByFormingUnionWith:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByCountyNode](self, "locationNodesByCountyNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "collectionByIntersecting:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByCountyNode](self, "locationNodesByCountyNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "targetsForSources:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionByFormingUnionWith:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByCityNode](self, "locationNodesByCityNode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionByIntersecting:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByCityNode](self, "locationNodesByCityNode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "targetsForSources:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "collectionByFormingUnionWith:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByDistrictNode](self, "locationNodesByDistrictNode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sources");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "collectionByIntersecting:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByDistrictNode](self, "locationNodesByDistrictNode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "targetsForSources:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "collectionByFormingUnionWith:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByStreetNode](self, "locationNodesByStreetNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sources");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "collectionByIntersecting:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByStreetNode](self, "locationNodesByStreetNode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "targetsForSources:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "collectionByFormingUnionWith:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByNumberNode](self, "locationNodesByNumberNode");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sources");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "collectionByIntersecting:", v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper locationNodesByNumberNode](self, "locationNodesByNumberNode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "targetsForSources:", v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "collectionByFormingUnionWith:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphLocationHelper addressNodes](self, "addressNodes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "collectionByIntersecting:", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (id)momentNodesByAddressNodeIntersectingAddressNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraphLocationHelper momentNodesByAddressNode](self, "momentNodesByAddressNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectingSourcesWith:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)districtNodeFromAddressNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 5, a3);
}

- (id)cityNodesFromAddressNodes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  PGGraphLocationCityNodeCollection *v8;
  PGGraphLocationCityNodeCollection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  PGGraphLocationHelper *v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0D429B0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__PGGraphLocationHelper_cityNodesFromAddressNodes___block_invoke;
  v14 = &unk_1E842FF10;
  v15 = self;
  v16 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", &v11);

  v8 = [PGGraphLocationCityNodeCollection alloc];
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v8, "initWithGraph:elementIdentifiers:", self->_graph, v7, v11, v12, v13, v14, v15);

  return v9;
}

- (id)cityNodeFromAddressNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 6, a3);
}

- (id)countryNodeFromAddressNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 9, a3);
}

- (id)countryNodeFromAddressNodeAsCollection:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNodeAsCollection:](self, "_parentLocationNodeWithDimension:ofLocationNodeAsCollection:", 9, a3);
}

- (id)countyNodeFromCityNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 7, a3);
}

- (id)stateNodeFromCityNodeAsCollection:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNodeAsCollection:](self, "_parentLocationNodeWithDimension:ofLocationNodeAsCollection:", 8, a3);
}

- (id)stateNodesFromAddressNodes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  PGGraphLocationStateNodeCollection *v8;
  PGGraphLocationStateNodeCollection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  PGGraphLocationHelper *v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0D429B0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__PGGraphLocationHelper_stateNodesFromAddressNodes___block_invoke;
  v14 = &unk_1E842FF10;
  v15 = self;
  v16 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", &v11);

  v8 = [PGGraphLocationStateNodeCollection alloc];
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v8, "initWithGraph:elementIdentifiers:", self->_graph, v7, v11, v12, v13, v14, v15);

  return v9;
}

- (id)cityNodeFromDistrictNode:(id)a3
{
  return -[PGGraphLocationHelper _parentLocationNodeWithDimension:ofLocationNode:](self, "_parentLocationNodeWithDimension:ofLocationNode:", 6, a3);
}

- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  PGIncompleteLocationResolver *v13;
  PGLocationsResolver *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  void *v31;
  PGLocationsResolver *v32;
  PGIncompleteLocationResolver *v33;
  void *v34;
  PGGraphMomentNodeCollection *v35;
  void *v36;
  id v37;
  PGLocationsFilterer *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v6, v8);
    -[PGGraphLocationHelper addressNodesByMomentNode](self, "addressNodesByMomentNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetsForSources:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "temporarySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", v12, self);
      v14 = -[PGLocationsResolver initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:]([PGLocationsResolver alloc], "initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:", v6, v13, self);
      -[PGLocationsResolver resolvedMomentNodes](v14, "resolvedMomentNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLocationsResolver resolvedLocationNodes](v14, "resolvedLocationNodes");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PGLocationsFilterer initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:]([PGLocationsFilterer alloc], "initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:", v15, v39, v13);
      -[PGLocationsFilterer filteredLocationNodes](v38, "filteredLocationNodes");
      v16 = objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v31 = v15;
        v32 = v14;
        v33 = v13;
        v34 = v12;
        v35 = v9;
        v36 = v8;
        v37 = v6;
        v17 = (void *)v16;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v30 = v17;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              -[PGGraphLocationHelper densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:](self, "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", v24, 0, -1, v30);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                objc_msgSend(v18, "addObject:", v25);
              }
              else
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "loggingConnection");
                v27 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v24;
                  _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "No densestLocationNode for locationNode %@", buf, 0xCu);
                }

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          }
          while (v21);
        }

        v8 = v36;
        v6 = v37;
        v12 = v34;
        v9 = v35;
        v14 = v32;
        v13 = v33;
        v28 = v30;
        v15 = v31;
      }
      else
      {
        v28 = (void *)v16;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  PGGraphMomentNodeCollection *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  __int128 v33;
  PGGraphMomentNodeCollection *v34;
  id v35;
  void *v37;
  id obj;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t j;
  _QWORD v45[4];
  id v46;
  void *v47;
  id v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v4 = a4;
  v71 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v5 = v35;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v63 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "bestAddressNode");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v42, "addIdentifier:", objc_msgSend(v9, "identifier"));
            objc_msgSend(v43, "addObject:", v10);
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v6);
    }

    v11 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "graph");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MAElementCollection initWithArray:graph:](v11, "initWithArray:graph:", v5, v13);

    -[PGGraphLocationHelper addressNodesByMomentNode](self, "addressNodesByMomentNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetsForSources:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphLocationHelper relevantLocationNodesForMomentNodes:applyDensestCloseLocationNode:](self, "relevantLocationNodesForMomentNodes:applyDensestCloseLocationNode:", v5, v4);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v59;
      *(_QWORD *)&v15 = 138412290;
      v33 = v15;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v59 != v40)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          v54 = 0;
          v55 = &v54;
          v56 = 0x2020000000;
          v57 = 0;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v17 = v43;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v51;
            while (2)
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v51 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
                objc_msgSend(v21, "collection", v33);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "label");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "nearestDeepParentLocationNodesWithLabel:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "anyNode");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25 == v16)
                {
                  objc_msgSend(v39, "addObject:", v21);
                  *((_BYTE *)v55 + 24) = 1;

                  goto LABEL_26;
                }

              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
              if (v18)
                continue;
              break;
            }
          }
LABEL_26:

          if (!*((_BYTE *)v55 + 24))
          {
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __90__PGGraphLocationHelper_relevantAddressNodesForMomentNodes_applyDensestCloseLocationNode___block_invoke;
            v45[3] = &unk_1E842C608;
            v46 = v42;
            v47 = v16;
            v26 = v39;
            v48 = v26;
            v49 = &v54;
            objc_msgSend(v37, "enumerateIdentifiersAsCollectionsWithBlock:", v45);

            if (!*((_BYTE *)v55 + 24))
            {
              objc_msgSend(v16, "locationNodeCollection");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGGraphLocationHelper addressNodesFromLocationNodes:](self, "addressNodesFromLocationNodes:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "anyNode");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                objc_msgSend(v26, "addObject:", v29);
              }
              else
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "loggingConnection");
                v31 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v33;
                  v67 = v16;
                  _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "No address node from location node: %@", buf, 0xCu);
                }

              }
            }
          }
          _Block_object_dispose(&v54, 8);
        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v41);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  _BYTE *v18;
  unint64_t v19;
  _BYTE buf[24];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v5);

  objc_msgSend(v4, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PGGraphLocationHelper locationIsInSupersetCategoryForLocationNode:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "%s called with unsupported dimension %lu", buf, 0x16u);
      }

      goto LABEL_5;
    case 6uLL:
      objc_msgSend(v7, "supersetCityNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7uLL:
      objc_msgSend(v7, "supersetCountyNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8uLL:
      objc_msgSend(v7, "supersetStateNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9uLL:
      objc_msgSend(v7, "supersetCountryNodes");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v12;
      break;
    default:
LABEL_5:
      v11 = 0;
      break;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PGGraphLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke;
  v16[3] = &unk_1E842C630;
  v18 = buf;
  v19 = v6;
  v16[4] = self;
  v13 = v4;
  v17 = v13;
  objc_msgSend(v11, "enumerateNodesUsingBlock:", v16);
  v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)densestCloseLocationNodeFromLocationNode:(id)a3 withDateInterval:(id)a4 locationMask:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  double v35;
  double v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;
  void *v46;
  id v47;
  unint64_t v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  double v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  double *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[5];
  id v96;
  id v97;
  id v98;
  id v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  CLLocationDegrees v105;
  CLLocationDegrees v106;
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[5];
  CLLocationCoordinate2D v112;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Address"));

  if (v11)
  {
    -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v8, a5);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v13 = (void *)v12;

    v8 = v13;
  }
  -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PGGraphLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", v8);
      latitude = v112.latitude;
      longitude = v112.longitude;
      v18 = CLLocationCoordinate2DIsValid(v112);
      v19 = v8;
      if (v18)
      {
        v48 = a5;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x2020000000;
        v111[3] = 0;
        v110[0] = 0;
        v110[1] = v110;
        v110[2] = 0x2020000000;
        v110[3] = 0;
        v49 = v15;
        v109[0] = 0;
        v109[1] = v109;
        v109[2] = 0x2020000000;
        v109[3] = 0;
        v108[0] = 0;
        v108[1] = v108;
        v108[2] = 0x2020000000;
        v108[3] = 0;
        v107[0] = 0;
        v107[1] = v107;
        v107[2] = 0x2020000000;
        v107[3] = 0;
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke;
        v95[3] = &unk_1E842C680;
        v95[4] = self;
        v105 = latitude;
        v106 = longitude;
        v47 = v9;
        v96 = v9;
        v50 = v20;
        v97 = v50;
        v22 = v21;
        v98 = v22;
        v100 = v110;
        v101 = v109;
        v99 = v14;
        v102 = v111;
        v103 = v108;
        v104 = v107;
        objc_msgSend(v15, "enumerateNeighborNodesThroughInEdgesUsingBlock:", v95);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;
        v45 = v23;

        v91 = 0;
        v92 = &v91;
        v93 = 0x2020000000;
        v94 = 0;
        v87 = 0;
        v88 = (double *)&v87;
        v89 = 0x2020000000;
        v90 = 0;
        v83 = 0;
        v84 = (double *)&v83;
        v85 = 0x2020000000;
        v86 = 0;
        objc_msgSend(v19, "graph");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0;
        v78 = &v77;
        v79 = 0x3032000000;
        v80 = __Block_byref_object_copy__29291;
        v81 = __Block_byref_object_dispose__29292;
        v31 = v19;
        v82 = v31;
        v73 = 0;
        v74 = (double *)&v73;
        v75 = 0x2020000000;
        v76 = v29 * 0.4 + v26 * 0.6;
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_3;
        v65[3] = &unk_1E842C6A8;
        v32 = v22;
        v66 = v32;
        v68 = &v91;
        v69 = &v87;
        v70 = &v83;
        v71 = &v73;
        v33 = v30;
        v67 = v33;
        v72 = &v77;
        objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v65);
        v34 = v92[3];
        v35 = 0.0;
        if (v34 >= 2)
          v35 = v84[3] / (double)(v34 - 1);
        v84[3] = v35;
        v61 = 0;
        v62 = &v61;
        v51[0] = MEMORY[0x1E0C809B0];
        v63 = 0x2020000000;
        v64 = 0;
        v57 = 0;
        v58 = &v57;
        v59 = 0x2020000000;
        v60 = 0;
        v51[1] = 3221225472;
        v51[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_4;
        v51[3] = &unk_1E842C6D0;
        v36 = sqrt(v35);
        v37 = v32;
        v52 = v37;
        v53 = &v87;
        v56 = v36;
        v54 = &v57;
        v55 = &v61;
        objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v51);
        if ((unint64_t)v62[3] <= 1 && (unint64_t)v58[3] < 3)
        {
          if (v74[3] - v88[3] < v36 + v36)
          {
            v40 = v31;
            goto LABEL_13;
          }
          v38 = v37;
          v40 = (id)v78[5];
          v39 = v31;
        }
        else
        {
          v38 = v37;
          -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v78[5], v45);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v31, v39);
          v40 = (id)objc_claimAutoreleasedReturnValue();

        }
        v37 = v38;
LABEL_13:
        -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v40, v48, v45);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v41;
        if (v41)
          v43 = (void *)v41;
        else
          v43 = v31;
        v19 = v43;

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v61, 8);

        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);

        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);

        _Block_object_dispose(v107, 8);
        _Block_object_dispose(v108, 8);
        _Block_object_dispose(v109, 8);
        _Block_object_dispose(v110, 8);
        _Block_object_dispose(v111, 8);

        v9 = v47;
        v15 = v49;
      }
    }
    else
    {
      v19 = v8;
    }

    goto LABEL_20;
  }
  v19 = v8;
LABEL_20:

LABEL_21:
  return v19;
}

- (id)commonLocationNodeForRelevantLocationNodes:(id)a3 locationMask:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    if (-[PGGraphLocationHelper _locationNodesRepresentSameCity:](self, "_locationNodesRepresentSameCity:", v6))
    {
      -[PGGraphLocationHelper _mostVisitedLocationNodeForLocationNodes:](self, "_mostVisitedLocationNodeForLocationNodes:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v8, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v6, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (v13)
            {
              -[PGGraphLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v13, v16, (_QWORD)v31);
              v17 = objc_claimAutoreleasedReturnValue();

              v13 = (id)v17;
              if (!v17)
                goto LABEL_25;
            }
            else
            {
              v13 = v16;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v12);

        if (v13)
        {
          objc_msgSend(v13, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("Country")) & 1) == 0)
          {

LABEL_36:
            -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v13, a4, (_QWORD)v31);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          objc_msgSend(v8, "supersetCountryNodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsNode:", v13);

          if (!v20)
            goto LABEL_36;
        }
      }
      else
      {
LABEL_25:

        v13 = 0;
      }
      goto LABEL_29;
    }
    if (objc_msgSend(v6, "count") != 2)
    {
LABEL_30:
      v7 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v6, "allObjects");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v24, "isEqualToString:", CFSTR("State"));

    if ((_DWORD)v22)
    {
      v25 = v23;
      if (!v25)
        goto LABEL_28;
    }
    else
    {
      objc_msgSend(v23, "locationNodeCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nearestDeepParentLocationNodesWithLabel:", CFSTR("State"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "anyNode");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
    }
    objc_msgSend(v8, "supersetStateNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "containsNode:", v25);

    if (!v29)
    {
      -[PGGraphLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v23, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v7;
}

- (BOOL)_locationNodesRepresentSameCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  double v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CLLocationCoordinate2D v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CLLocationCoordinate2D v48;
  CLLocationCoordinate2D v49;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", v6))
        {
          LOBYTE(v15) = 0;
          v22 = v7;
          goto LABEL_33;
        }
        objc_msgSend(v12, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("City"));

        if (!v15)
        {
          v22 = v7;
          goto LABEL_34;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)objc_msgSend(v7, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v7;
  v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    while (2)
    {
      v20 = 0;
      v30 = v18;
      do
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v20);
        v35.latitude = 0.0;
        v35.longitude = 0.0;
        -[PGGraphLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", v21);
        v35 = v48;
        if (!CLLocationCoordinate2DIsValid(v48))
        {
          LOBYTE(v15) = 0;
          goto LABEL_32;
        }
        objc_msgSend(v16, "removeObject:", v21);
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v32;
          v29 = v19;
          while (2)
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v32 != v25)
                objc_enumerationMutation(v22);
              -[PGGraphLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), v29);
              if (CLLocationCoordinate2DIsValid(v49))
              {
                CLLocationCoordinate2DGetDistanceFrom();
                if (v27 <= 50000.0)
                  continue;
              }

              LOBYTE(v15) = 0;
              goto LABEL_33;
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            v19 = v29;
            if (v24)
              continue;
            break;
          }
        }

        ++v20;
      }
      while (v20 != v30);
      v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      LOBYTE(v15) = 1;
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
LABEL_32:
    v22 = v16;
  }
LABEL_33:

LABEL_34:
  return v15;
}

- (id)_mostVisitedLocationNodeForLocationNodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v21;
  id obj;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anyObject");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v23 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "locationNodeCollection", v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphLocationHelper addressNodesFromLocationNodes:](self, "addressNodesFromLocationNodes:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[PGGraphLocationHelper momentNodesByAddressNode](self, "momentNodesByAddressNode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "targetsForSources:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 > v7
            || v14 == v7
            && (objc_msgSend(v9, "UUID"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v24, "UUID"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v16, "compare:", v17),
                v17,
                v16,
                v18 == -1))
          {
            v15 = v9;

            v7 = v14;
            v24 = v15;
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }

    v4 = v21;
  }
  v19 = v24;

  return v19;
}

- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  id v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v7 = a4;
  if (v6 == v7)
  {
    v24 = v6;
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__29291;
    v38 = __Block_byref_object_dispose__29292;
    v8 = v6;
    v39 = v8;
    objc_msgSend(v8, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Address"));

    if (v10)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke;
      v33[3] = &unk_1E842FAB8;
      v33[4] = &v34;
      objc_msgSend(v8, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v33);
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__29291;
    v31 = __Block_byref_object_dispose__29292;
    v11 = v7;
    v32 = v11;
    objc_msgSend(v11, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Address"));

    if (v13)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2;
      v26[3] = &unk_1E842FAB8;
      v26[4] = &v27;
      objc_msgSend(v11, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v26);
    }
    v14 = (void *)v35[5];
    v15 = (void *)v28[5];
    v16 = v14 == v15;
    if (v14 != v15 && v14 && v15)
    {
      do
      {
        v17 = objc_msgSend(v14, "locationMask");
        if (v17 <= objc_msgSend((id)v28[5], "locationMask"))
        {
          -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v35[5]);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v35;
        }
        else
        {
          -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v28[5]);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v28;
        }
        v20 = (void *)v19[5];
        v19[5] = v18;

        v14 = (void *)v35[5];
        v21 = (void *)v28[5];
        v16 = v14 == v21;
      }
      while (v14 != v21 && v14 != 0 && v21 != 0);
    }
    if (v16)
      v24 = v14;
    else
      v24 = 0;
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v34, 8);
  }

  return v24;
}

- (CLLocationCoordinate2D)_approximateCoordinateForLocationNode:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[5];
  CLLocationCoordinate2D result;

  v4 = a3;
  if (objc_msgSend(v4, "domain") != 200)
  {
    v12 = *MEMORY[0x1E0C9E500];
    v13 = *(double *)(MEMORY[0x1E0C9E500] + 8);
LABEL_12:

    goto LABEL_13;
  }
  v5 = objc_msgSend(v4, "locationMask");
  if (v4)
  {
    v6 = v5;
    while (1)
    {
      objc_msgSend(v4, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Address"));

      if ((v8 & 1) != 0)
        break;
      if (v6 < 0x10)
      {
        -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v4);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x2020000000;
        v25[3] = 0;
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__29291;
        v23 = __Block_byref_object_dispose__29292;
        v24 = 0;
        objc_msgSend(v4, "locationNodeCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "childLocationNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __63__PGGraphLocationHelper__approximateCoordinateForLocationNode___block_invoke;
        v18[3] = &unk_1E842C6F8;
        v18[4] = self;
        v18[5] = v25;
        v18[6] = &v19;
        objc_msgSend(v10, "enumerateIdentifiersAsCollectionsWithBlock:", v18);

        v11 = (id)v20[5];
        v6 >>= 1;
        _Block_object_dispose(&v19, 8);

        _Block_object_dispose(v25, 8);
      }
      v4 = v11;
      if (!v11)
        goto LABEL_9;
    }
    objc_msgSend(v4, "coordinate");
    v12 = v14;
    v13 = v15;
    goto LABEL_12;
  }
LABEL_9:
  v12 = *MEMORY[0x1E0C9E500];
  v13 = *(double *)(MEMORY[0x1E0C9E500] + 8);
LABEL_13:
  v16 = v12;
  v17 = v13;
  result.longitude = v17;
  result.latitude = v16;
  return result;
}

- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  if ((objc_msgSend(v6, "locationMask") & a4) == 0)
  {
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = objc_msgSend(v6, "outEdgesCount");
      if (v8 == 1)
      {
        -[PGGraphLocationHelper _parentLocationNodeForLocationNode:](self, "_parentLocationNodeForLocationNode:", v6);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (!v8)
        {
          v10 = 0;
          goto LABEL_9;
        }
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__29291;
        v17 = __Block_byref_object_dispose__29292;
        v18 = 0;
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __76__PGGraphLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke;
        v12[3] = &unk_1E842C720;
        v12[4] = &v13;
        objc_msgSend(v6, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v12);
        v9 = (id)v14[5];

        _Block_object_dispose(&v13, 8);
      }
      v6 = v9;
    }
    while ((objc_msgSend(v9, "locationMask") & a4) == 0);
  }
  v6 = v6;
  v10 = v6;
LABEL_9:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_addressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_momentNodesByAddressNode, 0);
  objc_storeStrong((id *)&self->_areaNodesByAddressNode, 0);
  objc_storeStrong((id *)&self->_addressNodesByAreaNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByNumberNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByStreetNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByDistrictNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCityNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCountyNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByStateNode, 0);
  objc_storeStrong((id *)&self->_locationNodesByCountryNode, 0);
  objc_storeStrong((id *)&self->_numberNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_streetNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_districtNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_cityNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_countyNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_stateNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_countryNodesByLocationNode, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __76__PGGraphLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __63__PGGraphLocationHelper__approximateCoordinateForLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addressNodesFromLocationNodes:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "momentNodesByAddressNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetsForSources:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v7 > *(_QWORD *)(v8 + 24))
  {
    *(_QWORD *)(v8 + 24) = v7;
    objc_msgSend(v12, "anyNode");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __68__PGGraphLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v14 = 0x2020000000;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2;
  v5[3] = &unk_1E842C658;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v13 = &v12;
  v15 = 0;
  v5[1] = 3221225472;
  v11 = *(_OWORD *)(a1 + 112);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = &v12;
  v10 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "enumerateNeighborNodesThroughInEdgesUsingBlock:", v5);
  if (*(id *)(a1 + 64) == v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += v13[3];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                             + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                              + 24);
  }

  _Block_object_dispose(&v12, 8);
}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(a3, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = v19;
  v11 = v9 * 0.4 + v6 * 0.6;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(double *)(v12 + 24);
  *(double *)(v12 + 24) = v13
                        + (v11 - v13) / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24)
                                                              + (v11 - v13)
                                                              * (v11
                                                               - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 24));
  if (v11 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "nodeForIdentifier:", objc_msgSend(v19, "unsignedIntValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v11 == *(double *)(v15 + 24))
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "locationMask");
      if (objc_msgSend(v14, "locationMask") >= v16)
      {
LABEL_6:

        v10 = v19;
        goto LABEL_7;
      }
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(double *)(v15 + 24) = v11;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v14;
    v14 = v18;
    goto LABEL_6;
  }
LABEL_7:

}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = v12 * 0.4 + v9 * 0.6;
  v14 = *(double *)(a1 + 64);
  if (v13 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + v14)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v13 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + v14 * 2.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 1uLL
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 3uLL)
    {
      *a4 = 1;
    }
  }
}

void __96__PGGraphLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CLLocationCoordinate2D v25;
  _BYTE v26[128];
  uint64_t v27;
  CLLocationCoordinate2D v28;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_approximateCoordinateForLocationNode:", v3);
  v25 = v28;
  if (CLLocationCoordinate2DIsValid(v28))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    if (v4 <= 20000.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "inEdgesCount");
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "locationNodeCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addressNodesFromLocationNodes:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "momentNodesByAddressNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetsForSources:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(a1 + 40))
      {
        v20 = v6;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v11, "universalDateIntervals");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v12);
              v15 += objc_msgSend(*(id *)(a1 + 40), "intersectsDateInterval:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v14);
        }
        else
        {
          v15 = 0;
        }

        v6 = v20;
      }
      else
      {
        v15 = objc_msgSend(v11, "count");
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, v5);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v19, v5);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v15;

    }
  }

}

void __69__PGGraphLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "closestLocationNodeFromLocationNode:withDimension:reverse:", a2, *(_QWORD *)(a1 + 56), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40));
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __90__PGGraphLocationHelper_relevantAddressNodesForMomentNodes_applyDensestCloseLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIdentifier:", a2) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nearestDeepParentLocationNodesWithLabel:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == *(void **)(a1 + 40))
    {
      v10 = *(void **)(a1 + 48);
      objc_msgSend(v12, "anyNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
}

void __52__PGGraphLocationHelper_stateNodesFromAddressNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stateNodeFromAddressNode:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v5, "elementIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionWithIdentifierSet:", v4);

}

void __51__PGGraphLocationHelper_cityNodesFromAddressNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cityNodeFromAddressNode:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v5, "elementIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionWithIdentifierSet:", v4);

}

void __101__PGGraphLocationHelper__parentLocationNodeWithDimension_sourceLocationNodeAsCollection_sourceLabel___block_invoke(_QWORD *a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) < a2 && a1[6] >= a2)
  {
    v7 = v5;
    objc_msgSend(v5, "targetsForSources:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") || a1[6] == a2)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v6);
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
    }

    v5 = v7;
  }

}

+ (id)inefficientLocationHelper
{
  return objc_alloc_init(PGGraphLegacyLocationHelper);
}

@end
