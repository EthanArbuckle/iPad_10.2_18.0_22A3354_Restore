@implementation VIOntologyGraph

- (VIOntologyGraph)initWithOntologyGraph:(id)a3
{
  id v5;
  VIOntologyGraph *v6;
  VIOntologyGraph *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIOntologyGraph;
  v6 = -[VIOntologyGraph init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_compatGraph, a3);

  return v7;
}

- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4
{
  return -[OntologyGraphCompatible isDescendentWithDescendent:ancestor:](self->_compatGraph, "isDescendentWithDescendent:ancestor:", a3, a4);
}

- (id)ontologyNodeWithKnowledgeGraphID:(id)a3
{
  return -[OntologyGraphCompatible ontologyNodeWithKnowledgeGraphID:](self->_compatGraph, "ontologyNodeWithKnowledgeGraphID:", a3);
}

- (unint64_t)count
{
  return -[OntologyGraphCompatible count](self->_compatGraph, "count");
}

- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4
{
  return -[OntologyGraphCompatible findLeastCommonAncestorWithNode1:node2:](self->_compatGraph, "findLeastCommonAncestorWithNode1:node2:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatGraph, 0);
}

@end
