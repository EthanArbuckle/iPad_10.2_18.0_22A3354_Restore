@implementation VKARWalkingArrivalFeature

- (VKARWalkingArrivalFeature)initWithARInfo:(id)a3 undulationProvider:(id)a4 iconStyleAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VKARWalkingArrivalStoreFront *v17;
  VKARWalkingArrivalFeature *v18;
  VKARWalkingArrivalFeature *v19;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = a5;
  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "storefrontFaceGeometrys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v8, "storefrontFaceGeometrys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        v17 = -[VKARWalkingArrivalStoreFront initWithGEOOrientedBox:undulationProvider:]([VKARWalkingArrivalStoreFront alloc], "initWithGEOOrientedBox:undulationProvider:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), v9);
        if (v17)
          objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = -[VKARWalkingArrivalFeature initWithStoreFronts:iconStyleAttributes:](self, "initWithStoreFronts:iconStyleAttributes:", v12, v22);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_arInfo, a3);

  return v19;
}

- (VKARWalkingArrivalFeature)initWithPosition:(id)a3 iconStyleAttributes:(id)a4
{
  double var2;
  double v7;
  __double2 v8;
  double v9;
  __double2 v10;

  var2 = a3.var2;
  v7 = a3.var1 * 0.0174532925;
  v8 = __sincos_stret(a3.var0 * 0.0174532925);
  v9 = 6378137.0 / sqrt(v8.__sinval * v8.__sinval * -0.00669437999 + 1.0);
  v10 = __sincos_stret(v7);
  return -[VKARWalkingArrivalFeature initWithGeocentricPosition:iconStyleAttributes:](self, "initWithGeocentricPosition:iconStyleAttributes:", a4, (v9 + var2) * v8.__cosval * v10.__cosval, (v9 + var2) * v8.__cosval * v10.__sinval, (var2 + v9 * 0.99330562) * v8.__sinval);
}

- (VKARWalkingArrivalFeature)initWithGeocentricPosition:(Geocentric<double>)a3 iconStyleAttributes:(id)a4
{
  double v4;
  double v5;
  double v6;
  id v8;
  void *v9;
  VKARWalkingArrivalStoreFront *v10;
  void *v11;
  VKARWalkingArrivalFeature *v12;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v4 = a3._e[2];
  v5 = a3._e[1];
  v6 = a3._e[0];
  v8 = a4;
  v14 = v6;
  v15 = v5;
  v16 = v4;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0x3FF0000000000000;
  v21 = 0u;
  v22 = 0u;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = -[VKARWalkingArrivalStoreFront initWithOrientedRect:]([VKARWalkingArrivalStoreFront alloc], "initWithOrientedRect:", &v14);
  objc_msgSend(v9, "arrayWithObjects:", v10, 0, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16, v17, v18, v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VKARWalkingArrivalFeature initWithStoreFronts:iconStyleAttributes:](self, "initWithStoreFronts:iconStyleAttributes:", v11, v8);
  return v12;
}

- (VKARWalkingArrivalFeature)initWithStoreFront:(id)a3 iconStyleAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VKARWalkingArrivalFeature *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKARWalkingArrivalFeature initWithStoreFronts:iconStyleAttributes:](self, "initWithStoreFronts:iconStyleAttributes:", v8, v7);

  return v9;
}

- (VKARWalkingArrivalFeature)initWithStoreFronts:(id)a3 iconStyleAttributes:(id)a4
{
  id v7;
  id v8;
  VKARWalkingArrivalFeature *v9;
  VKARWalkingArrivalFeature *v10;
  VKARWalkingArrivalFeature *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKARWalkingArrivalFeature;
  v9 = -[VKARWalkingFeature initWithType:](&v13, sel_initWithType_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeFronts, a3);
    objc_storeStrong((id *)&v10->_styleAttributes, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  GEOARInfo **v8;
  GEOARInfo **v9;
  NSArray *storeFronts;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKARWalkingArrivalFeature;
  if (-[VKARWalkingFeature isEqual:](&v17, sel_isEqual_, v4) && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v8 = (GEOARInfo **)v4;
    v9 = v8;
    if (self->_arInfo != v8[4])
      goto LABEL_6;
    storeFronts = self->_storeFronts;
    objc_msgSend(v8, "storeFronts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = storeFronts;
    v13 = v11;
    if (!((unint64_t)v12 | v13)
      || (v14 = (void *)v13,
          v15 = objc_msgSend(v12, "isEqual:", v13),
          v14,
          v12,
          v14,
          (v15 & 1) != 0))
    {
      objc_msgSend(v9, "styleAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = GeoCodecsFeatureStyleAttributesCompare() == 0;

    }
    else
    {
LABEL_6:
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_stringForAttributes
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  unint64_t i;
  uint64_t v8;
  __CFString *v9;

  if (self->_styleAttributes)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 3 * -[GEOFeatureStyleAttributes countAttrs](self->_styleAttributes, "countAttrs"));
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p"), v5, self);

    objc_msgSend(v3, "appendString:", CFSTR(" attrs:["));
    v6 = 0;
    for (i = 1; i - 1 < -[GEOFeatureStyleAttributes countAttrs](self->_styleAttributes, "countAttrs"); ++i)
    {
      v8 = -[GEOFeatureStyleAttributes v](self->_styleAttributes, "v");
      objc_msgSend(v3, "appendFormat:", CFSTR("(%d,%d)"), *(unsigned int *)(v8 + v6), *(unsigned int *)(v8 + v6 + 4));
      if (i < -[GEOFeatureStyleAttributes countAttrs](self->_styleAttributes, "countAttrs"))
        objc_msgSend(v3, "appendString:", CFSTR(","));
      v6 += 8;
    }
    objc_msgSend(v3, "appendString:", CFSTR("]>"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E4315B30;
  }
  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  GEOARInfo *arInfo;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  arInfo = self->_arInfo;
  -[VKARWalkingArrivalFeature _stringForAttributes](self, "_stringForAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p arInfo:%@ styleAttributes:%@ storeFronts:%@>"), v5, self, arInfo, v7, self->_storeFronts);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)storeFronts
{
  return self->_storeFronts;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFronts, 0);
  objc_storeStrong((id *)&self->_arInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end
