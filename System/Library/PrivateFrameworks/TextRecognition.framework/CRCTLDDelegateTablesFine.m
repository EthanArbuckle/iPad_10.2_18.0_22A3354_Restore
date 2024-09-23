@implementation CRCTLDDelegateTablesFine

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v8 = -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", v6, &v16);
  v9 = (unint64_t)v16;
  v15 = 0;
  v10 = -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", v7, &v15);
  v11 = (unint64_t)v15;
  v12 = 1;
  if (v9 == v11)
    v12 = 2;
  if (v9 | v11)
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  CRGroupRegion *v13;
  CRGroupRegion *v14;
  id v16;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", v10, &v16);
    v12 = v16;

    if (v12)
    {
      objc_msgSend(v12, "setSubregions:", v9);
      v13 = (CRGroupRegion *)v12;
    }
    else
    {
      v13 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v8, a4, v9);
    }
    v14 = v13;

  }
  else
  {
    v14 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v8, a4, v9);
  }

  return v14;
}

@end
