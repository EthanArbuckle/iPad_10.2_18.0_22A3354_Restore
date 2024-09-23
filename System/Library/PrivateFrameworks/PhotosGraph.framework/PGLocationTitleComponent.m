@implementation PGLocationTitleComponent

- (PGLocationTitleComponent)init
{
  PGLocationTitleComponent *v2;
  uint64_t v3;
  NSMutableSet *addressNodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGLocationTitleComponent;
  v2 = -[PGLocationTitleComponent init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    addressNodes = v2->_addressNodes;
    v2->_addressNodes = (NSMutableSet *)v3;

    v2->_type = 0;
  }
  return v2;
}

- (void)addAddressNode:(id)a3
{
  -[NSMutableSet addObject:](self->_addressNodes, "addObject:", a3);
}

- (BOOL)canMergeWithTitleComponent:(id)a3
{
  _QWORD *v4;
  PGGraphNode *node;
  PGGraphEdge *edge;
  char v7;

  v4 = a3;
  node = self->_node;
  if ((node == (PGGraphNode *)v4[2] || -[MANode isSameNodeAsNode:](node, "isSameNodeAsNode:"))
    && ((edge = self->_edge, edge == (PGGraphEdge *)v4[3]) || -[MAEdge isSameEdgeAsEdge:](edge, "isSameEdgeAsEdge:")))
  {
    v7 = -[NSMutableSet isEqual:](self->_addressNodes, "isEqual:", v4[1]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateWithMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PGGraphAddressNodeCollection *v7;
  void *v8;
  PGGraphAddressNodeCollection *v9;
  PGGraphMomentNodeCollection *v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FEFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [PGGraphAddressNodeCollection alloc];
    -[PGLocationTitleComponent addressNodes](self, "addressNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAElementCollection initWithSet:graph:](v7, "initWithSet:graph:", v8, v6);

    v10 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v4, v6);
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PGLocationTitleComponent_updateWithMomentNodes___block_invoke;
    v12[3] = &unk_1E84279C8;
    v12[4] = &v13;
    v12[5] = &v17;
    objc_msgSend(v11, "enumerateEdgesUsingBlock:", v12);

  }
  *(_QWORD *)&self->_timestampStart = v18[3];
  *(_QWORD *)&self->_weight = v14[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[MANode hash](self->_node, "hash");
  v4 = -[MAEdge hash](self->_edge, "hash") ^ v3;
  return v4 ^ -[NSMutableSet hash](self->_addressNodes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  PGGraphNode *node;
  PGGraphEdge *edge;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGLocationTitleComponent;
  if (-[PGLocationTitleComponent isEqual:](&v10, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    node = self->_node;
    if ((node == (PGGraphNode *)v5[2] || -[MANode isSameNodeAsNode:](node, "isSameNodeAsNode:"))
      && ((edge = self->_edge, edge == (PGGraphEdge *)v5[3]) || -[MAEdge isSameEdgeAsEdge:](edge, "isSameEdgeAsEdge:")))
    {
      v8 = -[NSMutableSet isEqual:](self->_addressNodes, "isEqual:", v5[1]);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PGGraphNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (PGGraphEdge)edge
{
  return self->_edge;
}

- (void)setEdge:(id)a3
{
  objc_storeStrong((id *)&self->_edge, a3);
}

- (NSSet)addressNodes
{
  return &self->_addressNodes->super;
}

- (void)setAddressNodes:(id)a3
{
  objc_storeStrong((id *)&self->_addressNodes, a3);
}

- (double)timestampStart
{
  return self->_timestampStart;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)personName
{
  return self->_personName;
}

- (void)setPersonName:(id)a3
{
  self->_personName = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edge, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_addressNodes, 0);
}

void __50__PGLocationTitleComponent_updateWithMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "timestampUTCStart");
  v5 = v4;
  objc_msgSend(v3, "relevance");
  v7 = v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v8 + 24) > v5)
    *(double *)(v8 + 24) = v5;
}

@end
