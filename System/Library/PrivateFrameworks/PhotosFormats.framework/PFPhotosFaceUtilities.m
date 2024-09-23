@implementation PFPhotosFaceUtilities

+ (id)sortedViableMergeCandidateFacesFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *context;
  id v51;
  id v52;
  id v53;
  CGFloat v54;
  CGFloat point;
  _BOOL4 point_12;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  CGPoint v63;
  CGPoint v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  point_12 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v51 = v8;
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE6614E8))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x1A1B0CDDC]();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v9 = v51;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v58 != v11)
              objc_enumerationMutation(v9);
            v13 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (v13 != v7
              && (objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "conformsToProtocol:", &unk_1EE6614E8, context) & 1) != 0)
            {
              v14 = v7;
              v15 = v13;
              v16 = v15;
              if (!v15)
                goto LABEL_29;
              if (point_12)
              {
                v17 = objc_msgSend(v15, "photosFaceRepresentationSourceWidth");
                v18 = objc_msgSend(v16, "photosFaceRepresentationSourceHeight");
              }
              else
              {
                v17 = objc_msgSend(v14, "photosFaceRepresentationSourceWidth");
                v18 = objc_msgSend(v14, "photosFaceRepresentationSourceHeight");
              }
              v19 = v18;
              v20 = (double)v17;
              if ((double)v17 != (double)objc_msgSend(v16, "photosFaceRepresentationSourceWidth"))
                goto LABEL_29;
              v21 = (double)v19;
              if ((double)v19 != (double)objc_msgSend(v16, "photosFaceRepresentationSourceHeight"))
                goto LABEL_29;
              v22 = v20 >= v21 ? (double)v17 : (double)v19;
              objc_msgSend(v14, "photosFaceRepresentationCenterX");
              v24 = v23;
              objc_msgSend(v14, "photosFaceRepresentationCenterY");
              v26 = v25;
              objc_msgSend(v14, "photosFaceRepresentationSize");
              v28 = v27;
              objc_msgSend(v16, "photosFaceRepresentationCenterX");
              v30 = v29;
              objc_msgSend(v16, "photosFaceRepresentationCenterY");
              v32 = v31;
              objc_msgSend(v16, "photosFaceRepresentationSize");
              v33 = v24 * v20;
              v34 = v26 * v21;
              v35 = v22 * v28;
              v36 = v30 * v20;
              v37 = v32 * v21;
              v39 = v22 * v38;
              v54 = v34;
              point = v33;
              v40 = v33 - v35 * 0.5;
              v41 = v34 - v35 * 0.5;
              v69.origin.x = v36 - v39 * 0.5;
              v65.origin.x = v40;
              v65.origin.y = v41;
              v65.size.width = v35;
              v65.size.height = v35;
              v69.origin.y = v37 - v39 * 0.5;
              v69.size.width = v39;
              v69.size.height = v39;
              v66 = CGRectIntersection(v65, v69);
              v42 = v66.size.height * v66.size.width;
              if (v66.size.height * v66.size.width > 0.0)
              {
                v67.origin.x = v40;
                v67.origin.y = v41;
                v67.size.width = v35;
                v67.size.height = v35;
                v63.x = v36;
                v63.y = v37;
                v43 = v42 / (v35 * v35);
                v44 = v42 / (v39 * v39);
                if (CGRectContainsPoint(v67, v63)
                  && (v68.origin.x = v36 - v39 * 0.5,
                      v64.y = v54,
                      v68.origin.y = v37 - v39 * 0.5,
                      v68.size.width = v39,
                      v68.size.height = v39,
                      v64.x = point,
                      CGRectContainsPoint(v68, v64)))
                {
                  if (v43 < v44)
                    v43 = v42 / (v39 * v39);
                }
                else if (v43 >= v44)
                {
                  v43 = v42 / (v39 * v39);
                }

                if (v43 >= 0.39)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v53, "indexOfObject:inSortedRange:options:usingComparator:", v45, 0, objc_msgSend(v53, "count"), 1024, &__block_literal_global_3723);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "insertObject:atIndex:", v47, v46);

                  objc_msgSend(v52, "insertObject:atIndex:", v16, v46);
                }
              }
              else
              {
LABEL_29:

              }
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v10);
      }

      objc_autoreleasePoolPop(context);
      if (a6)
        *a6 = objc_retainAutorelease(v53);

    }
    else
    {
      v52 = 0;
    }
    v8 = v51;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

+ (id)sortedViableMergeCandidateTorsosFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5 matchScores:(id *)a6
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *context;
  id v55;
  id v56;
  id v57;
  double y;
  CGFloat x;
  CGFloat v60;
  double v61;
  double v62;
  double pointa;
  CGFloat point;
  _BOOL4 point_12;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  CGPoint v72;
  CGPoint v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  point_12 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v55 = v8;
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE6614E8))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v56 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v57 = (id)objc_claimAutoreleasedReturnValue();
      context = (void *)MEMORY[0x1A1B0CDDC]();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v9 = v55;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v67 != v11)
              objc_enumerationMutation(v9);
            v13 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * i);
            if (v13 != v7
              && (objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "conformsToProtocol:", &unk_1EE6614E8, context) & 1) != 0)
            {
              v14 = v7;
              v15 = v13;
              v16 = v15;
              if (!v15)
                goto LABEL_30;
              if (point_12)
              {
                v17 = objc_msgSend(v15, "photosFaceRepresentationSourceWidth");
                v18 = objc_msgSend(v16, "photosFaceRepresentationSourceHeight");
              }
              else
              {
                v17 = objc_msgSend(v14, "photosFaceRepresentationSourceWidth");
                v18 = objc_msgSend(v14, "photosFaceRepresentationSourceHeight");
              }
              v19 = v18;
              v20 = (double)v17;
              if ((double)v17 != (double)objc_msgSend(v16, "photosFaceRepresentationSourceWidth"))
                goto LABEL_30;
              v21 = (double)v19;
              if ((double)v19 != (double)objc_msgSend(v16, "photosFaceRepresentationSourceHeight"))
                goto LABEL_30;
              v22 = v20 >= v21 ? (double)v17 : (double)v19;
              objc_msgSend(v14, "photosFaceRepresentationBodyCenterX");
              pointa = v23;
              objc_msgSend(v14, "photosFaceRepresentationBodyCenterY");
              v61 = v24;
              objc_msgSend(v14, "photosFaceRepresentationBodyWidth");
              v26 = v25;
              objc_msgSend(v14, "photosFaceRepresentationBodyHeight");
              v28 = v27;
              objc_msgSend(v16, "photosFaceRepresentationBodyCenterX");
              v30 = v29;
              objc_msgSend(v16, "photosFaceRepresentationBodyCenterY");
              v32 = v31;
              objc_msgSend(v16, "photosFaceRepresentationBodyWidth");
              v34 = v33;
              objc_msgSend(v16, "photosFaceRepresentationBodyHeight");
              v35 = v61 * v21;
              v36 = v22 * v26;
              v37 = v22 * v28;
              v38 = v30 * v20;
              v39 = v32 * v21;
              v40 = v22 * v34;
              v42 = v22 * v41;
              v60 = v35;
              v62 = pointa * v20;
              v43 = pointa * v20 - v36 * 0.5;
              v44 = v35 - v37 * 0.5;
              point = v38;
              v78.origin.x = v38 - v40 * 0.5;
              v78.origin.y = v39 - v42 * 0.5;
              v74.origin.x = v43;
              v74.origin.y = v44;
              v74.size.width = v36;
              v74.size.height = v37;
              y = v78.origin.y;
              x = v78.origin.x;
              v78.size.width = v40;
              v78.size.height = v42;
              v75 = CGRectIntersection(v74, v78);
              v45 = v75.size.height * v75.size.width;
              if (v75.size.height * v75.size.width > 0.0)
              {
                v76.origin.x = v43;
                v76.origin.y = v44;
                v76.size.width = v36;
                v76.size.height = v37;
                v72.x = point;
                v72.y = v39;
                v46 = v45 / (v36 * v37);
                v47 = v45 / (v40 * v42);
                if (CGRectContainsPoint(v76, v72)
                  && (v77.origin.y = y,
                      v77.origin.x = x,
                      v77.size.width = v40,
                      v77.size.height = v42,
                      v73.y = v60,
                      v73.x = v62,
                      CGRectContainsPoint(v77, v73)))
                {
                  if (v46 >= v47)
                    v48 = v45 / (v36 * v37);
                  else
                    v48 = v45 / (v40 * v42);
                }
                else if (v46 >= v47)
                {
                  v48 = v45 / (v40 * v42);
                }
                else
                {
                  v48 = v45 / (v36 * v37);
                }

                if (v48 >= 0.39)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v57, "indexOfObject:inSortedRange:options:usingComparator:", v49, 0, objc_msgSend(v57, "count"), 1024, &__block_literal_global_45);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "insertObject:atIndex:", v51, v50);

                  objc_msgSend(v56, "insertObject:atIndex:", v16, v50);
                }
              }
              else
              {
LABEL_30:

              }
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
        }
        while (v10);
      }

      objc_autoreleasePoolPop(context);
      if (a6)
        *a6 = objc_retainAutorelease(v57);

    }
    else
    {
      v56 = 0;
    }
    v8 = v55;
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

+ (id)bestMergeCandidateFaceFor:(id)a3 from:(id)a4 ignoreSourceAssetDimensions:(BOOL)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "sortedViableMergeCandidateFacesFor:from:ignoreSourceAssetDimensions:matchScores:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)qualityMeasureForFace:(id)a3 countOfFacesOnAsset:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  char v13;
  double v14;
  int v15;
  unint64_t v16;
  float v17;
  float v18;
  BOOL v19;
  float v20;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float v25;
  int64_t v26;

  v5 = a3;
  v6 = objc_msgSend(v5, "photosFaceRepresentationSourceWidth");
  v7 = objc_msgSend(v5, "photosFaceRepresentationSourceHeight");
  objc_msgSend(v5, "photosFaceRepresentationSize");
  v9 = v8;
  objc_msgSend(v5, "photosFaceRepresentationBlurScore");
  v11 = v10;
  v12 = objc_msgSend(v5, "photosFaceRepresentationHasSmile");
  v13 = objc_msgSend(v5, "photosFaceRepresentationIsLeftEyeClosed");
  LODWORD(v14) = 0.5;
  if ((v13 & 1) == 0)
  {
    v15 = objc_msgSend(v5, "photosFaceRepresentationIsRightEyeClosed", v14);
    LODWORD(v14) = 2.0;
    if (v15)
      *(float *)&v14 = 0.5;
  }
  if (v6 <= v7)
    v16 = v7;
  else
    v16 = v6;
  v17 = 0.25;
  if (v16 >= 0x400)
  {
    v17 = 1.0;
    if (v16 <= 0xC00)
      v17 = (float)((float)v16 * 0.00036621) + -0.125;
  }
  if (a4)
  {
    v18 = v9;
    v19 = v18 > 0.5 || v18 < 0.1;
    v20 = (float)(v18 * 0.5) + 0.75;
    v21 = 0.8;
    if (v19)
      v20 = 0.8;
    if (v12)
      v21 = 1.0;
    v22 = (1.0 - v11) * 5.0;
    v23 = *(float *)&v14 * (float)(v21 * (float)((float)(v20 * v22) * v17));
    v24 = 3;
    if (a4 < 3)
      v24 = a4;
    v25 = (float)(v23 * PFFaceCountPenalties[v24 - 1]) * 100.0;
  }
  else
  {
    v25 = 0.0;
  }
  if (v25 < 1.0)
    v25 = 1.0;
  v26 = (uint64_t)v25;

  return v26;
}

+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5
{
  return (id)objc_msgSend(a1, "selectRepresentativeFromFaces:qualityMeasureByLocalIdentifier:representativenessByCSN:candidateFaces:", a3, a4, a5, 0);
}

+ (id)selectRepresentativeFromFaces:(id)a3 qualityMeasureByLocalIdentifier:(id)a4 representativenessByCSN:(id)a5 candidateFaces:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  id v43;
  id v44;
  _OWORD v46[2];
  _QWORD v47[4];
  id v48;
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (uint64_t)(float)((float)(unint64_t)objc_msgSend(v9, "count") * 0.7);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __126__PFPhotosFaceUtilities_selectRepresentativeFromFaces_qualityMeasureByLocalIdentifier_representativenessByCSN_candidateFaces___block_invoke;
  v47[3] = &unk_1E45A29E8;
  v14 = v11;
  v48 = v14;
  objc_msgSend(v9, "sortedArrayUsingComparator:", v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subarrayWithRange:", v13, objc_msgSend(v9, "count") - v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (!v17)
    goto LABEL_16;
  v18 = v17;
  v42 = v15;
  v43 = v14;
  v44 = v9;
  v19 = 0;
  v20 = 0;
  v21 = -1.79769313e308;
  do
  {
    objc_msgSend(v16, "objectAtIndex:", v20, v42, v43, v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photosFaceRepresentationRoll");
    if (fabs(v23) <= 0.785398163)
    {
      if (v10)
      {
        objc_msgSend(v22, "photosFaceRepresentationLocalIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "integerValue");

      }
      else
      {
        v26 = objc_msgSend(v22, "photosFaceRepresentationClusterSequenceNumber");
      }
      memset(v46, 0, sizeof(v46));
      objc_msgSend(v22, "photosFaceRepresentationSize");
      v28 = v27;
      v29 = (double)objc_msgSend(v22, "photosFaceRepresentationSourceWidth");
      v30 = (double)objc_msgSend(v22, "photosFaceRepresentationSourceHeight");
      objc_msgSend(v22, "photosFaceRepresentationCenterX");
      v32 = v31;
      objc_msgSend(v22, "photosFaceRepresentationCenterY");
      if (objc_msgSend(a1, "getCropRectForPortraitImage:size:imgWidth:imgHeight:centerX:centerY:", v46, v28, v29, v30, v32, v33))v34 = 1.0;
      else
        v34 = 0.8;
      v35 = v34 * (double)v26;
      if (v35 >= v21)
      {
        v36 = v22;

        v19 = v36;
        v21 = v35;
      }
      if (v12)
      {
        v49[0] = CFSTR("localIdentifier");
        objc_msgSend(v22, "photosFaceRepresentationLocalIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = CFSTR("qualityMeasure");
        v50[0] = v37;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v39);
      }
    }

    ++v20;
  }
  while (v18 != v20);
  v14 = v43;
  v9 = v44;
  v15 = v42;
  if (!v19)
  {
LABEL_16:
    objc_msgSend(v16, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = v19;

  return v40;
}

+ (BOOL)getCropRectForPortraitImage:(CGRect *)a3 size:(double)a4 imgWidth:(double)a5 imgHeight:(double)a6 centerX:(double)a7 centerY:(double)a8
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MaxY;
  double v19;
  BOOL v20;
  double v21;
  BOOL v22;
  double v23;
  CGRect v25;
  CGRect v26;

  objc_msgSend(a1, "faceTileSizeAdjustingForImageAspectRatio:imgWidth:imgHeight:", a4 * 0.5, a4 * 0.5, a5, a6);
  v13 = v12 * -1.63999999 + a7 - v12 * 0.5;
  v14 = 1.0 - a8 - v11 * 0.5 - v11 * 1.91999996;
  v15 = v12 - (v12 * -1.63999999 + v12 * -1.63999999);
  v16 = v11 - (v11 * 1.91999996 * -1.10000002 - v11 * 1.91999996);
  if (v14 >= 0.0)
    v17 = v14;
  else
    v17 = 0.0;
  v25.origin.x = v13;
  v25.origin.y = v17;
  v25.size.width = v15;
  v25.size.height = v16;
  MaxY = CGRectGetMaxY(v25);
  if (MaxY <= 1.0)
    goto LABEL_7;
  v19 = MaxY + -1.0;
  if (v19 < v16 * 0.200000003 / 3.0 + v16 * 0.200000003 / 3.0)
  {
    v17 = v19 * 0.5 + v17;
    v16 = v16 + v19 * -1.5;
LABEL_7:
    v20 = 1;
    goto LABEL_9;
  }
  v20 = 0;
  v16 = v16 - v19;
LABEL_9:
  if (v17 < 0.0)
  {
    v16 = 1.0;
    v17 = 0.0;
  }
  if (v13 < 0.0)
    v13 = 0.0;
  v26.origin.x = v13;
  v26.origin.y = v17;
  v26.size.width = v15;
  v26.size.height = v16;
  v21 = v13 - fmax(CGRectGetMaxX(v26) + -1.0, 0.0);
  v22 = v21 < 0.0;
  if (v21 < 0.0)
    v21 = 0.0;
  a3->origin.x = v21;
  a3->origin.y = v17;
  if (v22)
    v23 = 1.0;
  else
    v23 = v15;
  a3->size.width = v23;
  a3->size.height = v16;
  return v20;
}

+ (CGSize)faceTileSizeAdjustingForImageAspectRatio:(CGSize)result imgWidth:(double)a4 imgHeight:(double)a5
{
  if (a4 <= a5)
    result.width = result.height * (a5 / a4);
  else
    result.height = result.width * (a4 / a5);
  if (result.width > 1.0)
  {
    result.height = result.height * (1.0 / result.width);
    result.width = 1.0;
  }
  if (result.height > 1.0)
  {
    result.width = result.width * (1.0 / result.height);
    result.height = 1.0;
  }
  return result;
}

uint64_t __126__PFPhotosFaceUtilities_selectRepresentativeFromFaces_qualityMeasureByLocalIdentifier_representativenessByCSN_candidateFaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "photosFaceRepresentationClusterSequenceNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &unk_1E45CA628;
  v12 = v11;

  v13 = *(void **)(a1 + 32);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v7, "photosFaceRepresentationClusterSequenceNumber");

  objc_msgSend(v14, "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = &unk_1E45CA628;
  v20 = v19;

  v21 = objc_msgSend(v12, "compare:", v20);
  return v21;
}

uint64_t __106__PFPhotosFaceUtilities_sortedViableMergeCandidateTorsosFor_from_ignoreSourceAssetDimensions_matchScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __105__PFPhotosFaceUtilities_sortedViableMergeCandidateFacesFor_from_ignoreSourceAssetDimensions_matchScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

@end
