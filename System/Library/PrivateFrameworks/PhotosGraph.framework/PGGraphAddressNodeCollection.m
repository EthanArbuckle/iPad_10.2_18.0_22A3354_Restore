@implementation PGGraphAddressNodeCollection

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PGGraphAddressNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("utce"), v6);

}

- (NSSet)uuids
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphAddressNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("uuid"), v6);

  return (NSSet *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode momentOfAddress](PGGraphAddressNode, "momentOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode homeOfAddress](PGGraphAddressNode, "homeOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)workNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode workOfAddress](PGGraphAddressNode, "workOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeWorkNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode homeWorkOfAddress](PGGraphAddressNode, "homeWorkOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphLocationNumberNodeCollection)numberNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode numberOfAddress](PGGraphAddressNode, "numberOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNumberNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationNumberNodeCollection *)v4;
}

- (PGGraphLocationStreetNodeCollection)streetNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode streetOfAddress](PGGraphAddressNode, "streetOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationStreetNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationStreetNodeCollection *)v4;
}

- (PGGraphLocationDistrictNodeCollection)districtNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode districtOfAddress](PGGraphAddressNode, "districtOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationDistrictNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationDistrictNodeCollection *)v4;
}

- (PGGraphLocationCityNodeCollection)cityNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode cityOfAddress](PGGraphAddressNode, "cityOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCityNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCityNodeCollection *)v4;
}

- (PGGraphLocationCountyNodeCollection)countyNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode countyOfAddress](PGGraphAddressNode, "countyOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCountyNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCountyNodeCollection *)v4;
}

- (PGGraphLocationStateNodeCollection)stateNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode stateOfAddress](PGGraphAddressNode, "stateOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationStateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationStateNodeCollection *)v4;
}

- (PGGraphLocationCountryNodeCollection)countryNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode countryOfAddress](PGGraphAddressNode, "countryOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCountryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCountryNodeCollection *)v4;
}

- (PGGraphLanguageNodeCollection)languageNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode languageOfAddress](PGGraphAddressNode, "languageOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLanguageNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLanguageNodeCollection *)v4;
}

- (PGGraphAreaNodeCollection)areaNodes
{
  void *v3;
  void *v4;

  +[PGGraphAddressNode areaOfAddress](PGGraphAddressNode, "areaOfAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAreaNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAreaNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseSubset
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphAddressNode preciseFilter](PGGraphAddressNode, "preciseFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v5;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (void)enumerateLatitudesUsingBlock:(id)a3
{
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("lat"), a3);
}

- (void)enumerateLongitudesUsingBlock:(id)a3
{
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("lng"), a3);
}

- (CLLocation)centroidLocation
{
  double latitude;
  double longitude;
  void *v4;
  CLLocationCoordinate2D v6;

  -[PGGraphAddressNodeCollection centroidCoordinate](self, "centroidCoordinate");
  latitude = v6.latitude;
  longitude = v6.longitude;
  if (CLLocationCoordinate2DIsValid(v6))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
  else
    v4 = 0;
  return (CLLocation *)v4;
}

- (CLLocationCoordinate2D)centroidCoordinate
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  CLLocationCoordinate2D v6;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  double v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  CLLocationCoordinate2D result;

  v3 = -[MAElementCollection count](self, "count");
  if (v3)
  {
    v4 = v3;
    v17 = 0;
    v18 = (double *)&v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v5 = MEMORY[0x1E0C809B0];
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke;
    v12[3] = &unk_1E84345A0;
    v12[4] = &v17;
    -[PGGraphAddressNodeCollection enumerateLatitudesUsingBlock:](self, "enumerateLatitudesUsingBlock:", v12);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke_2;
    v11[3] = &unk_1E84345A0;
    v11[4] = &v13;
    -[PGGraphAddressNodeCollection enumerateLongitudesUsingBlock:](self, "enumerateLongitudesUsingBlock:", v11);
    v6 = CLLocationCoordinate2DMake(v18[3] / (double)v4, v14[3] / (double)v4);
    latitude = v6.latitude;
    longitude = v6.longitude;
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v9 = latitude;
  v10 = longitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (NSArray)locations
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PGGraphAddressNodeCollection_locations__block_invoke;
  v6[3] = &unk_1E8434620;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return (NSArray *)v4;
}

void __41__PGGraphAddressNodeCollection_locations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "location");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

double __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

double __50__PGGraphAddressNodeCollection_centroidCoordinate__block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

void __37__PGGraphAddressNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __69__PGGraphAddressNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)addressNodeAsCollectionForUUID:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[PGGraphAddressNode filter](PGGraphAddressNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("uuid");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphAddressNodeCollection, "nodesMatchingFilter:inGraph:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)addressNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  +[PGGraphAddressNode filter](PGGraphAddressNode, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("uuid");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphAddressNodeCollection, "nodesMatchingFilter:inGraph:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)addressNodesWithinDistance:(double)a3 ofLocations:(id)a4 inGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    objc_msgSend(a1, "nodesInGraph:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__PGGraphAddressNodeCollection_addressNodesWithinDistance_ofLocations_inGraph___block_invoke;
    v15[3] = &unk_1E8430238;
    v18 = a3;
    v16 = v8;
    v17 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateNodesUsingBlock:", v15);

    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraph:elementIdentifiers:", v9, v12);
    v9 = v12;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraph:", v9);
  }

  return v13;
}

void __79__PGGraphAddressNodeCollection_addressNodesWithinDistance_ofLocations_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "coordinate", v14, v15, 0, 0, (_QWORD)v16);
        objc_msgSend(v3, "coordinate", 0, 0, v9, v10);
        v14 = v11;
        v15 = v12;
        CLLocationCoordinate2DGetDistanceFrom();
        if (v13 <= *(double *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", objc_msgSend(v3, "identifier", v14, v15));
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, v15);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

@end
