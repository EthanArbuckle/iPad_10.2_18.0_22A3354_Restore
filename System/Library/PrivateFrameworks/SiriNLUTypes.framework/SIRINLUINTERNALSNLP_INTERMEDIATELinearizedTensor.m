@implementation SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor;
  -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor dealloc](&v3, sel_dealloc);
}

- (unint64_t)shapesCount
{
  return self->_shapes.count;
}

- (unsigned)shapes
{
  return self->_shapes.list;
}

- (void)clearShapes
{
  PBRepeatedUInt32Clear();
}

- (void)addShape:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)shapeAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_shapes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_shapes = &self->_shapes;
  count = self->_shapes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_shapes->list[a3];
}

- (void)setShapes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)numericalizedFeaturesCount
{
  return self->_numericalizedFeatures.count;
}

- (unsigned)numericalizedFeatures
{
  return self->_numericalizedFeatures.list;
}

- (void)clearNumericalizedFeatures
{
  PBRepeatedUInt32Clear();
}

- (void)addNumericalizedFeature:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)numericalizedFeatureAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_numericalizedFeatures;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_numericalizedFeatures = &self->_numericalizedFeatures;
  count = self->_numericalizedFeatures.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_numericalizedFeatures->list[a3];
}

- (void)setNumericalizedFeatures:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearFeatures
{
  -[NSMutableArray removeAllObjects](self->_features, "removeAllObjects");
}

- (void)addFeature:(id)a3
{
  id v4;
  NSMutableArray *features;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  features = self->_features;
  v8 = v4;
  if (!features)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_features;
    self->_features = v6;

    v4 = v8;
    features = self->_features;
  }
  -[NSMutableArray addObject:](features, "addObject:", v4);

}

- (unint64_t)featuresCount
{
  return -[NSMutableArray count](self->_features, "count");
}

- (id)featureAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_features, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor;
  -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *features;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("shape"));

  PBRepeatedUInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("numericalized_feature"));

  features = self->_features;
  if (features)
    objc_msgSend(v3, "setObject:forKey:", features, CFSTR("feature"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_shapes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_shapes.count);
  }
  if (self->_numericalizedFeatures.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_numericalizedFeatures.count);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_features;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  void *v13;
  id v14;

  v14 = a3;
  if (-[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor shapesCount](self, "shapesCount"))
  {
    objc_msgSend(v14, "clearShapes");
    v4 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor shapesCount](self, "shapesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v14, "addShape:", -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor shapeAtIndex:](self, "shapeAtIndex:", i));
    }
  }
  if (-[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor numericalizedFeaturesCount](self, "numericalizedFeaturesCount"))
  {
    objc_msgSend(v14, "clearNumericalizedFeatures");
    v7 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor numericalizedFeaturesCount](self, "numericalizedFeaturesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v14, "addNumericalizedFeature:", -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor numericalizedFeatureAtIndex:](self, "numericalizedFeatureAtIndex:", j));
    }
  }
  if (-[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor featuresCount](self, "featuresCount"))
  {
    objc_msgSend(v14, "clearFeatures");
    v10 = -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor featuresCount](self, "featuresCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
      {
        -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor featureAtIndex:](self, "featureAtIndex:", k);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addFeature:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_features;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addFeature:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *features;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    features = self->_features;
    if ((unint64_t)features | v4[7])
      v6 = -[NSMutableArray isEqual:](features, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = PBRepeatedUInt32Hash();
  v4 = PBRepeatedUInt32Hash() ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_features, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = objc_msgSend(v4, "shapesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addShape:](self, "addShape:", objc_msgSend(v4, "shapeAtIndex:", i));
  }
  v8 = objc_msgSend(v4, "numericalizedFeaturesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addNumericalizedFeature:](self, "addNumericalizedFeature:", objc_msgSend(v4, "numericalizedFeatureAtIndex:", j));
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v4[7];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[SIRINLUINTERNALSNLP_INTERMEDIATELinearizedTensor addFeature:](self, "addFeature:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

+ (Class)featureType
{
  return (Class)objc_opt_class();
}

@end
