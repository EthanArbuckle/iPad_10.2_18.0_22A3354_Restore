@implementation CRGreedyTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  _BOOL4 v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v9 = a4;
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    do
    {
      if (!objc_msgSend(v11, "count"))
        goto LABEL_14;
      v13 = 0;
      v14 = 0;
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v9)
          objc_msgSend(v15, "boundingQuadAtOCRDispatch");
        else
          objc_msgSend(v15, "boundingQuad");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "boundingQuad");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "overlapsNormalizedQuad:", v19);

        if (v20)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "trackingID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v41, "containsObject:", v22);

          if ((v23 & 1) == 0)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "trackingID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v25);

            objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v26);

          }
          v14 = 1;
        }

        ++v13;
      }
      while (objc_msgSend(v11, "count") > v13);
      if ((v14 & 1) == 0)
      {
LABEL_14:
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v27);

        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "trackingID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v29);

      }
      ++v12;
    }
    while (objc_msgSend(v10, "count") > v12);
  }
  if (objc_msgSend(v11, "count"))
  {
    v30 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trackingID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v41, "containsObject:", v32);

      if ((v33 & 1) == 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "trackingID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v35);

      }
      ++v30;
    }
    while (objc_msgSend(v11, "count") > v30);
  }
  v36 = -[CRTrackingAssociatorResults initWithTotalError:tracked:updatedRegionIDs:removedRegionIDs:addedRegionIDs:]([CRTrackingAssociatorResults alloc], v40, v41, v38, v39, 0.0);

  return v36;
}

@end
