@implementation PGGraphHighlightTypeNode

- (PGGraphHighlightTypeNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphHighlightTypeNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightTypeNode;
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
  return 103;
}

- (unint64_t)featureType
{
  return 32;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightTypeNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 103);
}

+ (id)typeNodeFilterForLabel:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 103);

  return v5;
}

+ (MANodeFilter)tripTypeNodeFilter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("LongTrip"), CFSTR("ShortTrip"), CFSTR("OngoingTrip"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 103, MEMORY[0x1E0C9AA70]);

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)concludedTripTypeNodeFilter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("LongTrip"), CFSTR("ShortTrip"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 103, MEMORY[0x1E0C9AA70]);

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)longTripTypeNodeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("LongTrip"), 103);
}

+ (MANodeFilter)shortTripTypeNodeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("ShortTrip"), 103);
}

+ (MANodeFilter)aggregationTypeNodeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Aggregation"), 103);
}

+ (MANodeFilter)onGoingTripTypeNodeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("OngoingTrip"), 103);
}

+ (MANodeFilter)defaultTypeNodeFilter
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Default"), 103);
}

+ (MARelation)highlightGroupOfType
{
  void *v2;
  void *v3;

  +[PGGraphHasTypeEdge filter](PGGraphHasTypeEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
