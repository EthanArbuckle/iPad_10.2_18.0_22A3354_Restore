@implementation PGGraphAddressEdge

- (id)initFromMomentNode:(id)a3 toAddressNode:(id)a4 relevance:(double)a5 universalStartDate:(id)a6 universalEndDate:(id)a7 photoCoordinate:(CLLocationCoordinate2D)a8 numberOfAssets:(unint64_t)a9
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v18;
  id v19;
  PGGraphAddressEdge *v20;
  PGGraphAddressEdge *v21;
  objc_super v23;

  longitude = a8.longitude;
  latitude = a8.latitude;
  v18 = a6;
  v19 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PGGraphAddressEdge;
  v20 = -[PGGraphEdge initWithSourceNode:targetNode:](&v23, sel_initWithSourceNode_targetNode_, a3, a4);
  v21 = v20;
  if (v20)
  {
    v20->_relevance = a5;
    objc_storeStrong((id *)&v20->_universalStartDate, a6);
    objc_storeStrong((id *)&v21->_universalEndDate, a7);
    v21->_photoCoordinate.latitude = latitude;
    v21->_photoCoordinate.longitude = longitude;
    v21->_numberOfAssets = a9;
  }

  return v21;
}

- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  CLLocationDegrees v28;
  CLLocationDegrees v29;
  CLLocationCoordinate2D v30;
  double latitude;
  double longitude;
  void *v33;
  void *v34;
  PGGraphAddressEdge *v35;

  v10 = a4;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relevance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = 1.0;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("utcs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("utce"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lat"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lng"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("noa"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "unsignedIntegerValue");
  if (v23 && v24)
  {
    objc_msgSend(v23, "doubleValue");
    v28 = v27;
    objc_msgSend(v24, "doubleValue");
    v30 = CLLocationCoordinate2DMake(v28, v29);
    latitude = v30.latitude;
    longitude = v30.longitude;
  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  if (v19 == 0.0)
  {
    v33 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v22 == 0.0)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = -[PGGraphAddressEdge initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:](self, "initFromMomentNode:toAddressNode:relevance:universalStartDate:universalEndDate:photoCoordinate:numberOfAssets:", v10, v11, v33, v34, v26, v16, latitude, longitude);

  return v35;
}

- (PGGraphAddressEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  PGGraphAddressEdge *v22;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("relevance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("relevance"));

    v17 = v19;
  }
  v22 = -[PGGraphAddressEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v17);

  return v22;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  BOOL v22;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relevance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_relevance)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("utcs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      -[PGGraphAddressEdge timestampUTCStart](self, "timestampUTCStart");
      if (v11 != v12)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("utce"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v15 = v14;
      -[PGGraphAddressEdge timestampUTCEnd](self, "timestampUTCEnd");
      if (v15 != v16)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lat"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      if (v18 != self->_photoCoordinate.latitude)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lng"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      if (v20 != self->_photoCoordinate.longitude)
        goto LABEL_17;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("noa"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v21 && objc_msgSend(v21, "unsignedIntegerValue") != self->_numberOfAssets)
LABEL_17:
      v22 = 0;
    else
      v22 = 1;

  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("relevance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relevance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("utcs");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphAddressEdge timestampUTCStart](self, "timestampUTCStart");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("utce");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphAddressEdge timestampUTCEnd](self, "timestampUTCEnd");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("lat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_photoCoordinate.latitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("lng");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_photoCoordinate.longitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("noa");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAssets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphAddressEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v7, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%.2f, (%.3f, %.3f))"), v4, *(_QWORD *)&self->_relevance, *(_QWORD *)&self->_photoCoordinate.latitude, *(_QWORD *)&self->_photoCoordinate.longitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MAEdgeFilter)uniquelyIdentifyingFilter
{
  return (MAEdgeFilter *)objc_msgSend((id)objc_opt_class(), "filter");
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("ADDRESS");
  return CFSTR("ADDRESS");
}

- (unsigned)domain
{
  return 200;
}

- (double)timestampUTCStart
{
  NSDate *universalStartDate;
  double result;

  universalStartDate = self->_universalStartDate;
  if (!universalStartDate)
    return 0.0;
  -[NSDate timeIntervalSince1970](universalStartDate, "timeIntervalSince1970");
  return result;
}

- (double)timestampUTCEnd
{
  NSDate *universalEndDate;
  double result;

  universalEndDate = self->_universalEndDate;
  if (!universalEndDate)
    return 0.0;
  -[NSDate timeIntervalSince1970](universalEndDate, "timeIntervalSince1970");
  return result;
}

- (CLLocation)photoLocation
{
  double latitude;
  double longitude;
  void *v4;
  CLLocationCoordinate2D v6;

  latitude = self->_photoCoordinate.latitude;
  longitude = self->_photoCoordinate.longitude;
  v6.latitude = latitude;
  v6.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v6))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
  else
    v4 = 0;
  return (CLLocation *)v4;
}

- (double)relevance
{
  return self->_relevance;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (CLLocationCoordinate2D)photoCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_photoCoordinate.latitude;
  longitude = self->_photoCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("ADDRESS"), 200);
}

+ (void)setRelevance:(double)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithDouble:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forEdgeWithIdentifier:", v9, CFSTR("relevance"), a4);

}

+ (void)setUniversalStartDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forEdgeWithIdentifier:", v8, CFSTR("utcs"), a4);

}

+ (void)setUniversalEndDate:(id)a3 onAddressEdgeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forEdgeWithIdentifier:", v8, CFSTR("utce"), a4);

}

@end
