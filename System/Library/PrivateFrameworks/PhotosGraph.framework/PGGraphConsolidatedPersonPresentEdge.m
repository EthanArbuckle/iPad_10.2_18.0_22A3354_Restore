@implementation PGGraphConsolidatedPersonPresentEdge

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("CPRESENT"), 300);
}

- (PGGraphConsolidatedPersonPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  PGGraphConsolidatedPersonPresentEdge *v18;

  v10 = a7;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("importance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfAssets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  v18 = -[PGGraphBasePresentEdge initFromPersonNode:toMomentNode:importance:numberOfAssets:](self, "initFromPersonNode:toMomentNode:importance:numberOfAssets:", v12, v11, v17, v15);

  return v18;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("CPRESENT");
  return CFSTR("CPRESENT");
}

@end
