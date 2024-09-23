@implementation GEORPFeedbackSubmissionParameters

- (void)addDirectionsContextWithReport:(id)a3 recording:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  RAPPhoto *v27;
  void *v28;
  void *v29;
  void *v30;
  RAPPhoto *v31;
  void *v32;
  RAPPhotoWithMetadata *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  RAPPhoto *v58;
  void *v59;
  _QWORD v60[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionsFeedback"));

  if (!v11)
  {
    v12 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    objc_msgSend(v13, "setDirectionsFeedback:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsFeedback"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "directionsContext"));

  if (!v16)
  {
    v16 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "directionsFeedback"));
    objc_msgSend(v18, "setDirectionsContext:", v16);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsRequests"));
  objc_msgSend(v16, "setDirectionsRequests:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsResponses"));
  objc_msgSend(v16, "setDirectionsResponses:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "directionsFeedback"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "directionsCorrections"));

  if (!v23)
  {
    v23 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "directionsFeedback"));
    objc_msgSend(v25, "setDirectionsCorrections:", v23);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsResponseID"));
  objc_msgSend(v23, "setDirectionsResponseId:", v26);

  v27 = [RAPPhoto alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overviewScreenshotImageData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v31 = -[RAPPhoto initWithPhoto:date:location:](v27, "initWithPhoto:date:location:", v29, v30, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhoto photo](v31, "photo"));
  if (v32)
  {
    v33 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v31, 2);
    objc_msgSend(v6, "addPhotoWithMetadata:", v33);

  }
  v58 = v31;
  v59 = v6;
  v34 = objc_alloc((Class)GEORPPlaceInfo);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startWaypointCorrectedSearchTemplate"));
  v36 = objc_msgSend(v34, "initWithCorrectedSearch:", v35);

  objc_msgSend(v36, "clearSessionId");
  v37 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeRequest"));
  objc_msgSend(v37, "setPlaceRequest:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeResponse"));
  objc_msgSend(v37, "setPlaceResponse:", v39);

  v40 = objc_alloc((Class)GEORPPlaceInfo);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endWaypointCorrectedSearchTemplate"));
  v42 = objc_msgSend(v40, "initWithCorrectedSearch:", v41);

  objc_msgSend(v42, "clearSessionId");
  v43 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "placeRequest"));
  objc_msgSend(v43, "setPlaceRequest:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "placeResponse"));
  objc_msgSend(v43, "setPlaceResponse:", v45);

  v60[0] = v37;
  v60[1] = v43;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 2));
  v47 = objc_msgSend(v46, "mutableCopy");
  objc_msgSend(v16, "setDirectionsWaypointPlaceInfos:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startWaypoint"));
  if (v48)
  {
    v49 = objc_msgSend(objc_alloc((Class)GEORPUserSearchInput), "initWithRAPUserSearchInput:", v48);
    objc_msgSend(v16, "setStartWaypoint:", v49);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endWaypoint"));
  if (v50)
  {
    v51 = objc_msgSend(objc_alloc((Class)GEORPUserSearchInput), "initWithRAPUserSearchInput:", v50);
    objc_msgSend(v16, "setEndWaypoint:", v51);

  }
  if (v7
    && objc_msgSend(v7, "hasSelectedDirectionsResponseIndex")
    && objc_msgSend(v7, "hasSelectedSuggestedRouteIndexInDirectionsResponse")
    && !objc_msgSend(v23, "problematicRouteIndexsCount"))
  {
    v52 = objc_alloc_init((Class)GEORPSuggestedRouteIndex);
    objc_msgSend(v52, "setDirectionsResponseIndex:", objc_msgSend(v7, "selectedDirectionsResponseIndex"));
    v57 = v52;
    objc_msgSend(v52, "setDirectionsResponseSuggestedRoutesIndex:", objc_msgSend(v7, "selectedSuggestedRouteIndexInDirectionsResponse"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsResponses"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v7, "selectedDirectionsResponseIndex")));

    v56 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "suggestedRoutes"));

    if (v54)
      objc_msgSend(v57, "setClusteredRouteRideSelections:count:", objc_msgSend(v7, "clusteredRouteRideSelections"), objc_msgSend(v7, "clusteredRouteRideSelectionsCount"));
    objc_msgSend(v23, "addProblematicRouteIndex:", v57);

  }
}

- (void)setFeedbackType
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  unsigned int v35;

  if (-[GEORPFeedbackSubmissionParameters hasDetails](self, "hasDetails"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    v4 = objc_msgSend(v3, "hasPoiFeedback");

    if ((v4 & 1) != 0)
    {
      v5 = 2;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
      v7 = objc_msgSend(v6, "hasTransitPoiFeedback");

      if ((v7 & 1) != 0)
      {
        v5 = 3;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
        v9 = objc_msgSend(v8, "hasTileFeedback");

        if ((v9 & 1) != 0)
        {
          v5 = 5;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
          v11 = objc_msgSend(v10, "hasSearchFeedback");

          if ((v11 & 1) != 0)
          {
            v5 = 6;
          }
          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
            v13 = objc_msgSend(v12, "hasDirectionsFeedback");

            if ((v13 & 1) != 0)
            {
              v5 = 8;
            }
            else
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
              v15 = objc_msgSend(v14, "hasAddressPointFeedback");

              if ((v15 & 1) != 0)
              {
                v5 = 4;
              }
              else
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                v17 = objc_msgSend(v16, "hasGroundViewFeedback");

                if ((v17 & 1) != 0)
                {
                  v5 = 9;
                }
                else
                {
                  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                  v19 = objc_msgSend(v18, "hasMerchantLookupFeedback");

                  if ((v19 & 1) != 0)
                  {
                    v5 = 7;
                  }
                  else
                  {
                    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                    v21 = objc_msgSend(v20, "hasPoiEnrichmentUpdate");

                    if ((v21 & 1) != 0)
                    {
                      v5 = 10;
                    }
                    else
                    {
                      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                      v23 = objc_msgSend(v22, "hasIncidentFeedback");

                      if ((v23 & 1) != 0)
                      {
                        v5 = 11;
                      }
                      else
                      {
                        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                        v25 = objc_msgSend(v24, "hasPoiImageFeedback");

                        if ((v25 & 1) != 0)
                        {
                          v5 = 13;
                        }
                        else
                        {
                          v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                          v27 = objc_msgSend(v26, "hasCuratedCollectionFeedback");

                          if ((v27 & 1) != 0)
                          {
                            v5 = 12;
                          }
                          else
                          {
                            v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                            v29 = objc_msgSend(v28, "hasAddMapFeedback");

                            if ((v29 & 1) != 0)
                            {
                              v5 = 15;
                            }
                            else
                            {
                              v30 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                              v31 = objc_msgSend(v30, "hasStreetFeedback");

                              if ((v31 & 1) != 0)
                              {
                                v5 = 17;
                              }
                              else
                              {
                                v32 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                                v33 = objc_msgSend(v32, "hasLocalityFeedback");

                                if ((v33 & 1) != 0)
                                {
                                  v5 = 16;
                                }
                                else
                                {
                                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
                                  v35 = objc_msgSend(v34, "hasRapUserResponseFeedback");

                                  if (v35)
                                    v5 = 21;
                                  else
                                    v5 = 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v5 = 1;
  }
  -[GEORPFeedbackSubmissionParameters setType:](self, "setType:", v5);
}

- (id)stringForFeedbackType:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0:
    case 5:
    case 6:
    case 7:
    case 10:
    case 11:
    case 14:
    case 18:
    case 19:
    case 20:
    case 21:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Other Issue");
      goto LABEL_3;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Map Issue");
      goto LABEL_3;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Place Issue");
      goto LABEL_3;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Transit Issue");
      goto LABEL_3;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Address Issue");
      goto LABEL_3;
    case 8:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Directions Issue");
      goto LABEL_3;
    case 9:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Look Around Issue");
      goto LABEL_3;
    case 12:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Guide Issue");
      goto LABEL_3;
    case 13:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Photo Issue");
      goto LABEL_3;
    case 15:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Missing Feature");
      goto LABEL_3;
    case 16:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Locality Issue");
      goto LABEL_3;
    case 17:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Street Issue");
LABEL_3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      break;
    default:
      return v3;
  }
  return v3;
}

- (unint64_t)logDiscardTriggerType
{
  unsigned int v2;

  v2 = -[GEORPFeedbackSubmissionParameters type](self, "type") - 2;
  if (v2 > 0x13)
    return 0;
  else
    return qword_100E37238[v2];
}

- (void)insertDirectionStepImageId:(id)a3 withMatchingPhoto:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionsFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsCorrections"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instructionCorrections"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v22 = v6;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeStepScreenshotImageId", v22));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoMetadata"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "clientImageUuid"));
        v20 = objc_msgSend(v17, "isEqualToString:", v19);

        if (v20)
        {
          v21 = v16;
          v6 = v22;
          objc_msgSend(v21, "setRouteStepScreenshotImageId:", v22);
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v6 = v22;
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)insertDirectionStepCommentId:(id)a3 withMatchingPhoto:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionsFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsCorrections"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instructionCorrections"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v22 = v6;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "photoId", v22));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoMetadata"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "clientImageUuid"));
        v20 = objc_msgSend(v17, "isEqualToString:", v19);

        if (v20)
        {
          v21 = v16;
          v6 = v22;
          objc_msgSend(v21, "setPhotoId:", v22);
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v6 = v22;
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)insertOverviewDirectionsImageId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackDetails);
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsFeedback"));

  if (!v7)
  {
    v7 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    objc_msgSend(v8, "setDirectionsFeedback:", v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsFeedback"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionsCorrections"));

  if (!v11)
  {
    v11 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "directionsFeedback"));
    objc_msgSend(v13, "setDirectionsCorrections:", v11);

  }
  objc_msgSend(v11, "setOverviewScreenshotImageId:", v14);

}

- (void)insertImageIdIntoMapViewContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonContext](self, "commonContext"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    -[GEORPFeedbackSubmissionParameters setCommonContext:](self, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonContext](self, "commonContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapLocation"));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)GEORPMapLocation);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonContext](self, "commonContext"));
    objc_msgSend(v10, "setMapLocation:", v9);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonContext](self, "commonContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapLocation"));
  objc_msgSend(v11, "setMapScreenshotId:", v4);

}

- (void)insertImageIdIntoCommonCorrections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonCorrections](self, "commonCorrections"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
    -[GEORPFeedbackSubmissionParameters setCommonCorrections:](self, "setCommonCorrections:", v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters commonCorrections](self, "commonCorrections"));
  objc_msgSend(v7, "addImageId:", v4);

}

- (void)insertImageIdIntoLookAroundContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackDetails);
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groundViewFeedback"));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)GEORPGroundViewFeedback);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    objc_msgSend(v10, "setGroundViewFeedback:", v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groundViewFeedback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groundViewContext"));

  if (!v13)
  {
    v14 = objc_alloc_init((Class)GEORPGroundViewFeedbackContext);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "groundViewFeedback"));
    objc_msgSend(v16, "setGroundViewContext:", v14);

  }
  v19 = (id)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "groundViewFeedback"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "groundViewContext"));
  objc_msgSend(v18, "setImageId:", v4);

}

- (BOOL)isDirectionsFeedback
{
  return -[GEORPFeedbackSubmissionParameters type](self, "type") == 8;
}

- (BOOL)isTransitFeedback
{
  return -[GEORPFeedbackSubmissionParameters type](self, "type") == 3;
}

- (BOOL)isPersonalizedMapsFeedback
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (-[GEORPFeedbackSubmissionParameters type](self, "type") != 4)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addressPointFeedback"));
  v5 = objc_msgSend(v4, "hasPersonalizedMaps");

  return v5;
}

- (void)appendServerImageId:(id)a3 withMatchingPhoto:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  switch((unint64_t)objc_msgSend(v6, "photoType"))
  {
    case 0uLL:
      -[GEORPFeedbackSubmissionParameters insertImageIdIntoMapViewContext:](self, "insertImageIdIntoMapViewContext:", v8);
      break;
    case 1uLL:
      -[GEORPFeedbackSubmissionParameters insertImageIdIntoCommonCorrections:](self, "insertImageIdIntoCommonCorrections:", v8);
      break;
    case 2uLL:
      -[GEORPFeedbackSubmissionParameters insertOverviewDirectionsImageId:](self, "insertOverviewDirectionsImageId:", v8);
      break;
    case 3uLL:
      -[GEORPFeedbackSubmissionParameters insertDirectionStepImageId:withMatchingPhoto:](self, "insertDirectionStepImageId:withMatchingPhoto:", v8, v6);
      break;
    case 4uLL:
      -[GEORPFeedbackSubmissionParameters insertDirectionStepCommentId:withMatchingPhoto:](self, "insertDirectionStepCommentId:withMatchingPhoto:", v8, v6);
      break;
    case 5uLL:
      -[GEORPFeedbackSubmissionParameters insertImageIdIntoLookAroundContext:](self, "insertImageIdIntoLookAroundContext:", v8);
      break;
    case 6uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoMetadata"));
      -[GEORPFeedbackSubmissionParameters appendImageIdToPoiEnrichment:withPhotoMetadata:](self, "appendImageIdToPoiEnrichment:withPhotoMetadata:", v8, v7);

      break;
    default:
      break;
  }

}

- (void)appendImageIdToPoiEnrichment:(id)a3 withPhotoMetadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));

  if (!v7)
  {
    v8 = objc_alloc_init((Class)GEORPFeedbackDetails);
    -[GEORPFeedbackSubmissionParameters setDetails:](self, "setDetails:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "poiEnrichmentUpdate"));

  if (!v10)
  {
    v11 = objc_alloc_init((Class)GEORPPoiEnrichmentUpdate);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
    objc_msgSend(v12, "setPoiEnrichmentUpdate:", v11);

  }
  v13 = +[GEORPImageUpdate newImageUpdateWithImageId:photoMetadata:](GEORPImageUpdate, "newImageUpdateWithImageId:photoMetadata:", v16, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiEnrichmentUpdate"));
  objc_msgSend(v15, "addImageUpdate:", v13);

}

- (void)updatePOIEnrichmentWithCloudKitReceipts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "poiEnrichmentUpdate"));

  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "comparisonIdentifier"));
          objc_msgSend(v7, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v10);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackSubmissionParameters details](self, "details", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiEnrichmentUpdate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageUpdates"));

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v22, "action") == 1)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "comparisonIdentifier"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v23));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uploadResponse"));
            objc_msgSend(v22, "setUploadResponse:", v25);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v19);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: enrichment != ((void *)0)", buf, 2u);
  }

}

- (BOOL)isPOIEnrichment
{
  return -[GEORPFeedbackSubmissionParameters type](self, "type") == 10;
}

@end
