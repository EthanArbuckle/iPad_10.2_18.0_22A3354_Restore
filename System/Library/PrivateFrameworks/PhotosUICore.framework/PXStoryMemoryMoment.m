@implementation PXStoryMemoryMoment

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indicesArray:(id)a4 diagnosticDistanceCalculator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PXStoryMemoryMoment *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16++), "unsignedIntegerValue", (_QWORD)v19));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  v17 = -[PXStoryMemoryMoment initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:](self, "initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:", v8, v11, v10);
  return v17;
}

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4
{
  return -[PXStoryMemoryMoment initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:](self, "initWithDisplayAssets:indexSet:diagnosticDistanceCalculator:", a3, a4, 0);
}

- (PXStoryMemoryMoment)initWithDisplayAssets:(id)a3 indexSet:(id)a4 diagnosticDistanceCalculator:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PXStoryMemoryMoment *v17;
  PXStoryMemoryMoment *v18;
  uint64_t v19;
  NSIndexSet *indices;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((unint64_t)objc_msgSend(v10, "rangeCount") >= 2)
  {
    v12 = objc_msgSend(v10, "firstIndex");
    v13 = objc_msgSend(v10, "lastIndex");
    v14 = v13 - objc_msgSend(v10, "firstIndex") + 1;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v12, v14);
    v16 = objc_msgSend(v15, "copy");

    v10 = (id)v16;
  }
  v22.receiver = self;
  v22.super_class = (Class)PXStoryMemoryMoment;
  v17 = -[PXStoryMemoryMoment init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAssets, a3);
    v19 = objc_msgSend(v10, "copy");
    indices = v18->_indices;
    v18->_indices = (NSIndexSet *)v19;

    objc_storeStrong((id *)&v18->_diagnosticDistanceCalculator, a5);
  }

  return v18;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return (PXDisplayAssetFetchResult *)PXDisplayAssetFetchResultSubfetchResultWithIndexSet();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; display asset range = [%ld, %ld]"),
               objc_opt_class(),
               self,
               -[NSIndexSet firstIndex](self->_indices, "firstIndex"),
               -[NSIndexSet lastIndex](self->_indices, "lastIndex"));
}

- (id)assetAtIndex:(unint64_t)a3
{
  void *v7;

  if (-[PXStoryMemoryMoment count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryMoment.m"), 71, CFSTR("Index %ld beyond bounds [0 .. %ld]"), a3, -[PXStoryMemoryMoment count](self, "count") - 1);

  }
  return (id)-[PXDisplayAssetFetchResult objectAtIndex:](self->_displayAssets, "objectAtIndex:", -[NSIndexSet firstIndex](self->_indices, "firstIndex") + a3);
}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  id v4;
  NSIndexSet *indices;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  indices = self->_indices;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PXStoryMemoryMoment_enumerateAssetsUsingBlock___block_invoke;
  v7[3] = &unk_1E5144C48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSIndexSet enumerateIndexesUsingBlock:](indices, "enumerateIndexesUsingBlock:", v7);

}

- (unint64_t)count
{
  return -[NSIndexSet count](self->_indices, "count");
}

- (PXDisplayAsset)firstAsset
{
  return (PXDisplayAsset *)-[PXStoryMemoryMoment assetAtIndex:](self, "assetAtIndex:", 0);
}

- (PXDisplayAsset)lastAsset
{
  return (PXDisplayAsset *)-[PXStoryMemoryMoment assetAtIndex:](self, "assetAtIndex:", -[NSIndexSet count](self->_indices, "count") - 1);
}

- (_NSRange)assetIndexRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[NSIndexSet firstIndex](self->_indices, "firstIndex");
  v4 = -[NSIndexSet count](self->_indices, "count");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)firstGlobalIndex
{
  return -[NSIndexSet firstIndex](self->_indices, "firstIndex");
}

- (unint64_t)lastGlobalIndex
{
  return -[NSIndexSet lastIndex](self->_indices, "lastIndex");
}

- (void)_calculateDiagnostics
{
  PXStoryMemoryMomentClusteringDistanceCalculator *diagnosticDistanceCalculator;
  PXDisplayAssetFetchResult *displayAssets;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[5];

  self->_diagnosticsCalculated = 1;
  diagnosticDistanceCalculator = self->_diagnosticDistanceCalculator;
  displayAssets = self->_displayAssets;
  v5 = -[PXStoryMemoryMoment firstGlobalIndex](self, "firstGlobalIndex");
  v6 = -[PXStoryMemoryMoment lastGlobalIndex](self, "lastGlobalIndex");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PXStoryMemoryMoment__calculateDiagnostics__block_invoke;
  v7[3] = &unk_1E51309A0;
  v7[4] = self;
  -[PXStoryMemoryMomentClusteringDistanceCalculator clusteringDistanceForAssets:fromIndex:toIndex:resultHandler:](diagnosticDistanceCalculator, "clusteringDistanceForAssets:fromIndex:toIndex:resultHandler:", displayAssets, v5, v6, v7);
}

- (double)totalWeightedClusteringDistance
{
  if (!self->_diagnosticsCalculated)
    -[PXStoryMemoryMoment _calculateDiagnostics](self, "_calculateDiagnostics");
  return self->_totalWeightedClusteringDistance;
}

- (double)locationClusteringDistance
{
  if (!self->_diagnosticsCalculated)
    -[PXStoryMemoryMoment _calculateDiagnostics](self, "_calculateDiagnostics");
  return self->_locationClusteringDistance;
}

- (double)timeClusteringDistance
{
  if (!self->_diagnosticsCalculated)
    -[PXStoryMemoryMoment _calculateDiagnostics](self, "_calculateDiagnostics");
  return self->_timeClusteringDistance;
}

- (double)faceClusteringDistance
{
  if (!self->_diagnosticsCalculated)
    -[PXStoryMemoryMoment _calculateDiagnostics](self, "_calculateDiagnostics");
  return self->_faceClusteringDistance;
}

- (PXStoryMemoryMomentClusteringDistanceCalculator)diagnosticDistanceCalculator
{
  return self->_diagnosticDistanceCalculator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticDistanceCalculator, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

uint64_t __44__PXStoryMemoryMoment__calculateDiagnostics__block_invoke(uint64_t result, double a2, double a3, double a4, double a5)
{
  *(double *)(*(_QWORD *)(result + 32) + 32) = a2;
  *(double *)(*(_QWORD *)(result + 32) + 40) = a3;
  *(double *)(*(_QWORD *)(result + 32) + 48) = a4;
  *(double *)(*(_QWORD *)(result + 32) + 56) = a5;
  return result;
}

void __49__PXStoryMemoryMoment_enumerateAssetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstIndex");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
