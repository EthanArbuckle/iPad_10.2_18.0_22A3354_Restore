@implementation PNPersonCluster

- (PNPersonCluster)initWithPerson:(id)a3 inPhotoLibrary:(id)a4
{
  id v7;
  id v8;
  PNPersonCluster *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PNPersonCluster;
  v9 = -[PNPersonCluster init](&v16, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    if (objc_msgSend(v10, "isEqual:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PNPersonCluster.m"), 64, CFSTR("Cannot create a person cluster with another person cluster"));

    }
    -[PNPersonCluster setSourcePerson:](v9, "setSourcePerson:", v7);
    -[PNPersonCluster setPhotoLibrary:](v9, "setPhotoLibrary:", v8);
    objc_msgSend(v7, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hash = objc_msgSend(v11, "hash");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonCluster setBackingFaceIdentifiersByMomentIdentifiers:](v9, "setBackingFaceIdentifiersByMomentIdentifiers:", v12);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonCluster setRepresentativeFaceByFaceIdentifiers:](v9, "setRepresentativeFaceByFaceIdentifiers:", v13);

    v9->_detectionType = objc_msgSend(v7, "detectionType");
    -[PNPersonCluster invalidateCaches](v9, "invalidateCaches");
  }

  return v9;
}

- (PNPersonCluster)initWithFaceGroup:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  PNPersonCluster *v8;
  PNPersonCluster *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PNPersonCluster;
  v8 = -[PNPersonCluster init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PNPersonCluster setSourceFaceGroup:](v8, "setSourceFaceGroup:", v6);
    -[PNPersonCluster setPhotoLibrary:](v9, "setPhotoLibrary:", v7);
    objc_msgSend(v6, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hash = objc_msgSend(v10, "hash");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPersonCluster setBackingFaceIdentifiersByMomentIdentifiers:](v9, "setBackingFaceIdentifiersByMomentIdentifiers:", v11);

    v9->_detectionType = 1;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  PNPersonCluster *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (PNPersonCluster *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PNPersonCluster sourcePerson](self, "sourcePerson");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PNPersonCluster sourcePerson](v6, "sourcePerson");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          -[PNPersonCluster sourcePerson](self, "sourcePerson");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PNPersonCluster sourcePerson](v6, "sourcePerson");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", v4))
          {

            v9 = 1;
            goto LABEL_17;
          }
          v18 = v8;
          v10 = 1;
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      -[PNPersonCluster sourceFaceGroup](self, "sourceFaceGroup");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[PNPersonCluster sourceFaceGroup](v6, "sourceFaceGroup");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[PNPersonCluster sourceFaceGroup](self, "sourceFaceGroup");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PNPersonCluster sourceFaceGroup](v6, "sourceFaceGroup");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v15, "isEqual:", v16);

          if ((v10 & 1) == 0)
            goto LABEL_16;
          goto LABEL_15;
        }

        v9 = 0;
        if ((v10 & 1) == 0)
        {
LABEL_16:
          if (!v7)
          {
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        v9 = 0;
        if (!v10)
          goto LABEL_16;
      }
LABEL_15:

      goto LABEL_16;
    }
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  _BOOL4 v24;
  const __CFString *v25;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[PNPersonCluster localIdentifier](self, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anonymizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[PNPersonCluster sourcePerson](self, "sourcePerson");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anonymizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" Name: %@,"), v10);

  }
  v11 = -[PNPersonCluster faceCount](self, "faceCount");
  -[PNPersonCluster backingMomentIdentifiers](self, "backingMomentIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PNPersonCluster backingAssetIdentifiers](self, "backingAssetIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  -[PNPersonCluster mergedPersonIdentifiers](self, "mergedPersonIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" Faces: %lu, Moments: %lu, Assets: %lu, Merges: %lu, VerifiedType: %d"), v11, v13, v15, objc_msgSend(v16, "count"), -[PNPersonCluster verifiedType](self, "verifiedType"));

  -[PNPersonCluster mergedPersonIdentifiers](self, "mergedPersonIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[PNPersonCluster mergedPersonIdentifiers](self, "mergedPersonIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(", Merged Persons: [%@]"), v21);

  }
  -[PNPersonCluster interestingScore](self, "interestingScore");
  if (v22 >= 0.0)
  {
    v23 = v22;
    v24 = -[PNPersonCluster highlyInteresting](self, "highlyInteresting");
    v25 = CFSTR("Interesting");
    if (v24)
      v25 = CFSTR("Highly Interesting");
    objc_msgSend(v5, "appendFormat:", CFSTR(", %@: %.5f"), v25, *(_QWORD *)&v23);
  }
  return (NSString *)v5;
}

- (id)fetchFaces
{
  void *v3;
  NSMutableSet *backingFaceIdentifiers;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableSet *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backingFaceIdentifiers = self->_backingFaceIdentifiers;
  if (backingFaceIdentifiers)
  {
    -[NSMutableSet allObjects](backingFaceIdentifiers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pn_fetchFacesWithLocalIdentifiers:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PNPersonCluster sourcePerson](self, "sourcePerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "pn_fetchFacesForPerson:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PNPersonCluster sourceFaceGroup](self, "sourceFaceGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pn_fetchFacesForFaceGroup:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = (NSMutableSet *)objc_opt_new();
    v11 = self->_backingFaceIdentifiers;
    self->_backingFaceIdentifiers = v10;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v8;
    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v6);
          v16 = self->_backingFaceIdentifiers;
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "localIdentifier", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v16, "addObject:", v17);

        }
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  return v6;
}

- (NSMutableSet)backingFaceIdentifiers
{
  NSMutableSet *backingFaceIdentifiers;
  void *v4;
  id v5;

  backingFaceIdentifiers = self->_backingFaceIdentifiers;
  if (!backingFaceIdentifiers)
  {
    v4 = (void *)MEMORY[0x249506444](0, a2);
    v5 = -[PNPersonCluster fetchFaces](self, "fetchFaces");
    objc_autoreleasePoolPop(v4);
    backingFaceIdentifiers = self->_backingFaceIdentifiers;
  }
  return backingFaceIdentifiers;
}

- (id)fetchAssets
{
  void *v3;
  NSMutableSet *backingAssetIdentifiers;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *v15;
  void *v16;
  NSSet *v17;
  NSSet *sourcePersonBackingAssetIdentifiers;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backingAssetIdentifiers = self->_backingAssetIdentifiers;
  if (backingAssetIdentifiers)
  {
    -[NSMutableSet allObjects](backingAssetIdentifiers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pn_fetchAssetsWithLocalIdentifiers:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PNPersonCluster backingFaceIdentifiers](self, "backingFaceIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pn_fetchAssetsForFaceLocalIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (NSMutableSet *)objc_opt_new();
    v10 = self->_backingAssetIdentifiers;
    self->_backingAssetIdentifiers = v9;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v8;
    v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v6);
          v15 = self->_backingAssetIdentifiers;
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "localIdentifier", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v15, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    v17 = (NSSet *)-[NSMutableSet copy](self->_backingAssetIdentifiers, "copy");
    sourcePersonBackingAssetIdentifiers = self->_sourcePersonBackingAssetIdentifiers;
    self->_sourcePersonBackingAssetIdentifiers = v17;

  }
  return v6;
}

- (NSMutableSet)backingAssetIdentifiers
{
  NSMutableSet *backingAssetIdentifiers;
  void *v4;
  id v5;

  backingAssetIdentifiers = self->_backingAssetIdentifiers;
  if (!backingAssetIdentifiers)
  {
    v4 = (void *)MEMORY[0x249506444](0, a2);
    v5 = -[PNPersonCluster fetchAssets](self, "fetchAssets");
    objc_autoreleasePoolPop(v4);
    backingAssetIdentifiers = self->_backingAssetIdentifiers;
  }
  return backingAssetIdentifiers;
}

- (id)fetchMoments
{
  void *v3;
  NSMutableSet *backingMomentIdentifiers;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableSet *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  backingMomentIdentifiers = self->_backingMomentIdentifiers;
  if (backingMomentIdentifiers)
  {
    -[NSMutableSet allObjects](backingMomentIdentifiers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pn_fetchMomentsWithLocalIdentifiers:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PNPersonCluster backingAssetIdentifiers](self, "backingAssetIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "pn_fetchMomentsForAssetsWithLocalIdentifiers:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableSet *)objc_opt_new();
    v11 = self->_backingMomentIdentifiers;
    self->_backingMomentIdentifiers = v10;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v9;
    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v6);
          v16 = self->_backingMomentIdentifiers;
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "localIdentifier", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v16, "addObject:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  return v6;
}

- (NSMutableSet)backingMomentIdentifiers
{
  NSMutableSet *backingMomentIdentifiers;
  void *v4;
  id v5;

  backingMomentIdentifiers = self->_backingMomentIdentifiers;
  if (!backingMomentIdentifiers)
  {
    v4 = (void *)MEMORY[0x249506444](0, a2);
    v5 = -[PNPersonCluster fetchMoments](self, "fetchMoments");
    objc_autoreleasePoolPop(v4);
    backingMomentIdentifiers = self->_backingMomentIdentifiers;
  }
  return backingMomentIdentifiers;
}

- (id)personLocalIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster sourceFaceGroup](self, "sourceFaceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    context = (void *)MEMORY[0x249506444]();
    -[PNPersonCluster fetchFaces](self, "fetchFaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchedObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("ANY detectedFaces in %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v8);

    objc_msgSend(MEMORY[0x24BDE35E0], "fetchPersonsWithOptions:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    -[PNPersonCluster mergedPersonIdentifiers](self, "mergedPersonIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPersonCluster localIdentifier](self, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObject:", v19);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PNPersonCluster localIdentifier](self, "localIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v10;
}

- (NSString)localIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PNPersonCluster sourceFaceGroup](self, "sourceFaceGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (BOOL)isVerified
{
  void *v2;
  char v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVerified");

  return v3;
}

- (void)setIsVerified:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsVerified:", v3);

}

- (int64_t)verifiedType
{
  void *v2;
  int64_t v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verifiedType");

  return v3;
}

- (int64_t)manualOrder
{
  void *v2;
  int64_t v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "manualOrder");

  return v3;
}

- (void)setManualOrder:(int64_t)a3
{
  id v4;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManualOrder:", a3);

}

- (PNFaceProtocol)keyFace
{
  void *v2;
  void *v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PNFaceProtocol *)v3;
}

- (void)setKeyFace:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyFace:", v4);

}

- (unint64_t)faceCount
{
  void *v2;
  unint64_t v3;

  -[PNPersonCluster backingFaceIdentifiers](self, "backingFaceIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)favorite
{
  void *v2;
  char v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "favorite");

  return v3;
}

- (BOOL)hidden
{
  void *v2;
  char v3;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidden");

  return v3;
}

- (NSString)anonymizedName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anonymizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PNPersonCluster localIdentifier](self, "localIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)pn_addMergeCandidatePersons:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PNPersonCluster sourcePerson](self, "sourcePerson");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_addMergeCandidatePersons:", v4);

}

- (double)libraryTimespan
{
  NSDate *firstSeenDate;
  NSDate *lastSeenDate;
  double result;

  firstSeenDate = self->_firstSeenDate;
  if (!firstSeenDate || (lastSeenDate = self->_lastSeenDate) == 0)
  {
    -[PNPersonCluster _cacheDates](self, "_cacheDates");
    firstSeenDate = self->_firstSeenDate;
    lastSeenDate = self->_lastSeenDate;
  }
  -[NSDate timeIntervalSinceDate:](lastSeenDate, "timeIntervalSinceDate:", firstSeenDate);
  return result;
}

- (NSDate)firstSeenDate
{
  NSDate *firstSeenDate;

  firstSeenDate = self->_firstSeenDate;
  if (!firstSeenDate)
  {
    -[PNPersonCluster _cacheDates](self, "_cacheDates");
    firstSeenDate = self->_firstSeenDate;
  }
  return firstSeenDate;
}

- (NSDate)lastSeenDate
{
  NSDate *lastSeenDate;

  lastSeenDate = self->_lastSeenDate;
  if (!lastSeenDate)
  {
    -[PNPersonCluster _cacheDates](self, "_cacheDates");
    lastSeenDate = self->_lastSeenDate;
  }
  return lastSeenDate;
}

- (id)firstSeenDateWithoutOutliersForAgeType:(unsigned __int16)a3
{
  NSDate *firstSeenDateWithoutOutliers;
  NSDate *v5;

  firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
  if (!firstSeenDateWithoutOutliers)
  {
    if (a3 != 1)
    {
      -[PNPersonCluster firstSeenDate](self, "firstSeenDate");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    -[PNPersonCluster _cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:](self, "_cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:", 15778800.0);
    firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
  }
  v5 = firstSeenDateWithoutOutliers;
  return v5;
}

- (void)_cacheDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *v10;
  NSDate *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSDate *v16;
  void *v17;
  NSDate *v18;
  NSDate *firstSeenDate;
  NSDate *v20;
  NSDate *lastSeenDate;
  NSDate *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonCluster backingMomentIdentifiers](self, "backingMomentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pn_fetchMomentsWithLocalIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "startDate", (_QWORD)v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11 || -[NSDate compare:](v11, "compare:", v15) == NSOrderedDescending)
        {
          v16 = v15;

          v11 = v16;
        }
        objc_msgSend(v14, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10 || -[NSDate compare:](v10, "compare:", v17) == NSOrderedAscending)
        {
          v18 = v17;

          v10 = v18;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  firstSeenDate = self->_firstSeenDate;
  self->_firstSeenDate = v11;
  v20 = v11;

  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = v10;
  v22 = v10;

}

- (void)_cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSDate *v28;
  void *v29;
  double v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  NSDate *firstSeenDate;
  NSDate *v37;
  NSDate *lastSeenDate;
  NSDate *v39;
  uint64_t v40;
  NSDate *firstSeenDateWithoutOutliers;
  NSDate *v42;
  void *v43;
  PNPersonCluster *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  -[PNPersonCluster backingMomentIdentifiers](self, "backingMomentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v16, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

        objc_msgSend(v16, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13 || -[NSDate compare:](v13, "compare:", v18) == NSOrderedAscending)
        {
          v19 = v18;

          v13 = v19;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  v43 = v10;

  objc_msgSend(v9, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v9, "firstObject");
  v20 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  v42 = v20;
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v46;
    do
    {
      v27 = 0;
      v28 = v20;
      do
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v27);
        objc_msgSend(v29, "timeIntervalSinceDate:", v28);
        if (v30 <= a3)
        {
          objc_msgSend(v22, "addObject:", v29);
        }
        else
        {
          v31 = objc_msgSend(v22, "count");
          if (v31 > objc_msgSend(v21, "count"))
          {
            v32 = v22;

            v21 = v32;
          }
          v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v29, 0);

          v22 = (id)v33;
        }
        v20 = v29;

        ++v27;
        v28 = v20;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v25);
  }

  v34 = objc_msgSend(v22, "count");
  if (v34 > objc_msgSend(v21, "count"))
  {
    v35 = v22;

    v21 = v35;
  }
  firstSeenDate = v44->_firstSeenDate;
  v44->_firstSeenDate = v42;
  v37 = v42;

  lastSeenDate = v44->_lastSeenDate;
  v44->_lastSeenDate = v13;
  v39 = v13;

  objc_msgSend(v21, "firstObject");
  v40 = objc_claimAutoreleasedReturnValue();
  firstSeenDateWithoutOutliers = v44->_firstSeenDateWithoutOutliers;
  v44->_firstSeenDateWithoutOutliers = (NSDate *)v40;

}

- (void)invalidateCaches
{
  NSDate *firstSeenDate;
  NSDate *lastSeenDate;
  NSDate *firstSeenDateWithoutOutliers;

  firstSeenDate = self->_firstSeenDate;
  self->_firstSeenDate = 0;

  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = 0;

  self->_interestingScore = -1.79769313e308;
  firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
  self->_firstSeenDateWithoutOutliers = 0;

}

- (double)sideFaceRatio
{
  void *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PNPersonCluster fetchFaces](self, "fetchFaces");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v2);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "poseType");
        if (v10 == 4 || v10 == 2)
          ++v7;
      }
      v6 += v5;
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
    if (v7 && v6)
      v4 = (double)v7 / (double)v6;
  }

  return v4;
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  return (PNPhotoLibraryProtocol *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (PNPersonProtocol)sourcePerson
{
  return self->_sourcePerson;
}

- (void)setSourcePerson:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePerson, a3);
}

- (PNFaceGroupProtocol)sourceFaceGroup
{
  return self->_sourceFaceGroup;
}

- (void)setSourceFaceGroup:(id)a3
{
  objc_storeStrong((id *)&self->_sourceFaceGroup, a3);
}

- (NSMutableSet)mergedPersonIdentifiers
{
  return self->_mergedPersonIdentifiers;
}

- (void)setMergedPersonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mergedPersonIdentifiers, a3);
}

- (void)setBackingFaceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_backingFaceIdentifiers, a3);
}

- (void)setBackingAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_backingAssetIdentifiers, a3);
}

- (NSSet)sourcePersonBackingAssetIdentifiers
{
  return self->_sourcePersonBackingAssetIdentifiers;
}

- (void)setSourcePersonBackingAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePersonBackingAssetIdentifiers, a3);
}

- (void)setBackingMomentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_backingMomentIdentifiers, a3);
}

- (double)interestingScore
{
  return self->_interestingScore;
}

- (void)setInterestingScore:(double)a3
{
  self->_interestingScore = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (NSMutableDictionary)backingFaceIdentifiersByMomentIdentifiers
{
  return self->_backingFaceIdentifiersByMomentIdentifiers;
}

- (void)setBackingFaceIdentifiersByMomentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_backingFaceIdentifiersByMomentIdentifiers, a3);
}

- (NSMutableDictionary)representativeFaceByFaceIdentifiers
{
  return self->_representativeFaceByFaceIdentifiers;
}

- (void)setRepresentativeFaceByFaceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_representativeFaceByFaceIdentifiers, a3);
}

- (BOOL)highlyInteresting
{
  return self->_highlyInteresting;
}

- (void)setHighlyInteresting:(BOOL)a3
{
  self->_highlyInteresting = a3;
}

- (BOOL)quarantined
{
  return self->_quarantined;
}

- (void)setQuarantined:(BOOL)a3
{
  self->_quarantined = a3;
}

- (void)setFirstSeenDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstSeenDate, a3);
}

- (void)setLastSeenDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_representativeFaceByFaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingFaceIdentifiersByMomentIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingMomentIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourcePersonBackingAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingFaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_mergedPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceFaceGroup, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_firstSeenDateWithoutOutliers, 0);
}

@end
