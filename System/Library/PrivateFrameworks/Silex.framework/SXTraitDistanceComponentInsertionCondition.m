@implementation SXTraitDistanceComponentInsertionCondition

- (SXTraitDistanceComponentInsertionCondition)initWithTrait:(unint64_t)a3 otherTrait:(unint64_t)a4 distance:(_SXConvertibleValue)a5
{
  unint64_t unit;
  double value;
  SXTraitDistanceComponentInsertionCondition *result;
  objc_super v10;

  unit = a5.unit;
  value = a5.value;
  v10.receiver = self;
  v10.super_class = (Class)SXTraitDistanceComponentInsertionCondition;
  result = -[SXTraitDistanceComponentInsertionCondition init](&v10, sel_init);
  if (result)
  {
    result->_componentTrait = a3;
    result->_otherComponentTrait = a4;
    result->_distance.value = value;
    result->_distance.unit = unit;
  }
  return result;
}

- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  void *v8;
  id v9;
  id v10;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *traitAreas;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *otherTraitAreas;
  id v15;

  v8 = (void *)MEMORY[0x24BDD1698];
  v9 = a5;
  v10 = a4;
  v15 = a3;
  objc_msgSend(v8, "indexSet");
  v11 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
  traitAreas = self->_traitAreas;
  self->_traitAreas = v11;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v13 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
  otherTraitAreas = self->_otherTraitAreas;
  self->_otherTraitAreas = v13;

  -[SXTraitDistanceComponentInsertionCondition inspectTraitAreasForComponents:layoutProvider:DOMObjectProvider:](self, "inspectTraitAreasForComponents:layoutProvider:DOMObjectProvider:", v15, v10, v9);
}

- (void)insertedComponent:(id)a3 approximateLocation:(CGPoint)a4
{
  double y;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  y = a4.y;
  v10 = a3;
  v6 = objc_msgSend(v10, "traits");
  if ((-[SXTraitDistanceComponentInsertionCondition componentTrait](self, "componentTrait") & v6) != 0)
  {
    -[SXTraitDistanceComponentInsertionCondition traitAreas](self, "traitAreas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIndex:", (unint64_t)y);

  }
  v8 = objc_msgSend(v10, "traits");
  if ((-[SXTraitDistanceComponentInsertionCondition otherComponentTrait](self, "otherComponentTrait") & v8) != 0)
  {
    -[SXTraitDistanceComponentInsertionCondition otherTraitAreas](self, "otherTraitAreas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIndex:", (unint64_t)y);

  }
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  BOOL v20;

  v8 = a3;
  objc_msgSend(a5, "unitConverterForMarker:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SXTraitDistanceComponentInsertionCondition distance](self, "distance");
  objc_msgSend(v9, "convertValueToPoints:", v10, v11);
  v13 = v12;
  objc_msgSend(v8, "approximateLocation");
  v15 = v14;

  if ((-[SXTraitDistanceComponentInsertionCondition otherComponentTrait](self, "otherComponentTrait") & a4) != 0)
  {
    -[SXTraitDistanceComponentInsertionCondition traitAreas](self, "traitAreas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intersectsIndexesInRange:", (unint64_t)(v15 - v13), (unint64_t)(v13 + v13));

    if ((v17 & 1) != 0)
      goto LABEL_5;
  }
  if ((-[SXTraitDistanceComponentInsertionCondition componentTrait](self, "componentTrait") & a4) != 0
    && (-[SXTraitDistanceComponentInsertionCondition otherTraitAreas](self, "otherTraitAreas"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "intersectsIndexesInRange:", (unint64_t)(v15 - v13), (unint64_t)(v13 + v13)), v18, (v19 & 1) != 0))
  {
LABEL_5:
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (void)inspectTraitAreasForComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SXComponentTraitsProvider *v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  unint64_t MinY;
  double Height;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  unint64_t v37;
  double v38;
  void *v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v11)
  {
    v12 = v11;
    v41 = *(_QWORD *)v43;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
        v15 = -[SXComponentTraitsProvider initWithDOMObjectProvider:]([SXComponentTraitsProvider alloc], "initWithDOMObjectProvider:", v10);
        v16 = -[SXComponentTraitsProvider traitsForComponent:](v15, "traitsForComponent:", v14);
        if ((-[SXTraitDistanceComponentInsertionCondition componentTrait](self, "componentTrait") & v16) != 0)
        {
          objc_msgSend(v9, "frameForComponent:", v14);
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          -[SXTraitDistanceComponentInsertionCondition traitAreas](self, "traitAreas");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48.origin.x = v18;
          v48.origin.y = v20;
          v48.size.width = v22;
          v48.size.height = v24;
          MinY = (unint64_t)CGRectGetMinY(v48);
          v49.origin.x = v18;
          v49.origin.y = v20;
          v49.size.width = v22;
          v49.size.height = v24;
          Height = CGRectGetHeight(v49);
          if (Height < 1.0)
            Height = 1.0;
          objc_msgSend(v25, "addIndexesInRange:", MinY, (unint64_t)Height);

        }
        if ((-[SXTraitDistanceComponentInsertionCondition otherComponentTrait](self, "otherComponentTrait") & v16) != 0)
        {
          objc_msgSend(v9, "frameForComponent:", v14);
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;
          -[SXTraitDistanceComponentInsertionCondition otherTraitAreas](self, "otherTraitAreas");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v50.origin.x = v29;
          v50.origin.y = v31;
          v50.size.width = v33;
          v50.size.height = v35;
          v37 = (unint64_t)CGRectGetMinY(v50);
          v51.origin.x = v29;
          v51.origin.y = v31;
          v51.size.width = v33;
          v51.size.height = v35;
          v38 = CGRectGetHeight(v51);
          if (v38 < 1.0)
            v38 = 1.0;
          objc_msgSend(v36, "addIndexesInRange:", v37, (unint64_t)v38);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "components");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTraitDistanceComponentInsertionCondition inspectTraitAreasForComponents:layoutProvider:DOMObjectProvider:](self, "inspectTraitAreasForComponents:layoutProvider:DOMObjectProvider:", v39, v9, v10);

        }
        ++v13;
      }
      while (v12 != v13);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v12);
  }

}

- (unint64_t)componentTrait
{
  return self->_componentTrait;
}

- (unint64_t)otherComponentTrait
{
  return self->_otherComponentTrait;
}

- (_SXConvertibleValue)distance
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_distance.unit;
  value = self->_distance.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (NSMutableIndexSet)traitAreas
{
  return self->_traitAreas;
}

- (void)setTraitAreas:(id)a3
{
  objc_storeStrong((id *)&self->_traitAreas, a3);
}

- (NSMutableIndexSet)otherTraitAreas
{
  return self->_otherTraitAreas;
}

- (void)setOtherTraitAreas:(id)a3
{
  objc_storeStrong((id *)&self->_otherTraitAreas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherTraitAreas, 0);
  objc_storeStrong((id *)&self->_traitAreas, 0);
}

@end
