@implementation PGMomentNodeCachedValues

- (PGMomentNodeCachedValues)init
{
  PGMomentNodeCachedValues *v2;
  PGMomentNodeCachedValues *v3;
  uint64_t v4;
  PGGraphMomentNode *previousMomentNode;
  uint64_t v6;
  PGGraphMomentNode *nextMomentNode;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGMomentNodeCachedValues;
  v2 = -[PGMomentNodeCachedValues init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_neighborScore = NAN;
    v2->_bestLocationCoordinate = CLLocationCoordinate2DMake(NAN, NAN);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
    previousMomentNode = v3->_previousMomentNode;
    v3->_previousMomentNode = (PGGraphMomentNode *)v4;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
    nextMomentNode = v3->_nextMomentNode;
    v3->_nextMomentNode = (PGGraphMomentNode *)v6;

  }
  return v3;
}

- (double)neighborScore
{
  return self->_neighborScore;
}

- (void)setNeighborScore:(double)a3
{
  self->_neighborScore = a3;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, a3);
}

- (CLLocationCoordinate2D)bestLocationCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_bestLocationCoordinate.latitude;
  longitude = self->_bestLocationCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setBestLocationCoordinate:(CLLocationCoordinate2D)a3
{
  self->_bestLocationCoordinate = a3;
}

- (PGGraphMomentNode)previousMomentNode
{
  return self->_previousMomentNode;
}

- (void)setPreviousMomentNode:(id)a3
{
  objc_storeStrong((id *)&self->_previousMomentNode, a3);
}

- (PGGraphMomentNode)nextMomentNode
{
  return self->_nextMomentNode;
}

- (void)setNextMomentNode:(id)a3
{
  objc_storeStrong((id *)&self->_nextMomentNode, a3);
}

- (BOOL)hasAddressNodes
{
  return self->_hasAddressNodes;
}

- (void)setHasAddressNodes:(BOOL)a3
{
  self->_hasAddressNodes = a3;
}

- (BOOL)hasAddressNodesIsSet
{
  return self->_hasAddressNodesIsSet;
}

- (void)setHasAddressNodesIsSet:(BOOL)a3
{
  self->_hasAddressNodesIsSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextMomentNode, 0);
  objc_storeStrong((id *)&self->_previousMomentNode, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

@end
