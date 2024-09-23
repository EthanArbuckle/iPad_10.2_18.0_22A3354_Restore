@implementation PGGraphMobilityNode

- (PGGraphMobilityNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphMobilityNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMobilityNode;
  v5 = -[PGGraphNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (unsigned)domain
{
  return 203;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", self->_label, 203);
}

- (unint64_t)mobilityType
{
  void *v2;
  unint64_t v3;

  -[PGGraphMobilityNode label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "mobilityTypeForMobilityLabel:", v2);

  return v3;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 203);
}

+ (unint64_t)mobilityTypeForMobilityLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4AF70]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4AF60]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4AF68]) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4AF78]))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
