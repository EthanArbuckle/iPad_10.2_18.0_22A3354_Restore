@implementation PGMutableGraph

- (id)addNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  double v5;

  LODWORD(v5) = *MEMORY[0x1E0D42A80];
  return -[MAGraph addNodeWithLabel:domain:weight:properties:](self, "addNodeWithLabel:domain:weight:properties:", a3, a4, a5, v5);
}

- (id)addUniqueNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6
{
  double v6;

  LODWORD(v6) = *MEMORY[0x1E0D42A80];
  return -[MAGraph addUniqueNodeWithLabel:domain:weight:properties:didCreate:](self, "addUniqueNodeWithLabel:domain:weight:properties:didCreate:", a3, a4, a5, a6, v6);
}

- (id)addUniquelyIdentifiedNodeWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5 didCreate:(BOOL *)a6
{
  double v6;

  LODWORD(v6) = *MEMORY[0x1E0D42A80];
  return -[MAGraph addUniquelyIdentifiedNodeWithLabel:domain:weight:properties:didCreate:](self, "addUniquelyIdentifiedNodeWithLabel:domain:weight:properties:didCreate:", a3, a4, a5, a6, v6);
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  double v7;

  LODWORD(v7) = *MEMORY[0x1E0D42A80];
  return -[MAGraph addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", a3, a4, a5, a6, a7, v7);
}

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  double v7;

  LODWORD(v7) = *MEMORY[0x1E0D42A80];
  return -[MAGraph addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:](self, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:weight:properties:", a3, a4, a5, a6, a7, v7);
}

@end
