@implementation GEOFeatureStyleAttributes

+ (id)currentLocationStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65654, 0, 0);
}

+ (id)addStopStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65654, 1, 0);
}

+ (id)multipleWaypointsStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65654, 2, 0);
}

+ (id)shareETAAdvisoryStyleAttributes
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithAttributes:", 65618, 41, 0);
}

+ (id)styleAttributesForSearchResult:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;

  v3 = a3;
  switch((unint64_t)objc_msgSend(v3, "customizedLocationType"))
  {
    case 1uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
      goto LABEL_16;
    case 2uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      goto LABEL_16;
    case 3uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      goto LABEL_16;
    case 4uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes sharedLocationStyleAttributes](GEOFeatureStyleAttributes, "sharedLocationStyleAttributes"));
      goto LABEL_16;
    case 5uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
LABEL_16:
      v12 = (id)v4;
      goto LABEL_17;
    default:
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_styleAttributes"));
      v7 = objc_msgSend(v6, "copy");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locationOfInterest"));
      if (v8)
      {
        v9 = objc_msgSend(v7, "hasAttributes");

        if ((v9 & 1) == 0)
        {
          v18 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes frequentLocationStyleAttributes](GEOFeatureStyleAttributes, "frequentLocationStyleAttributes"));
LABEL_26:
          v12 = (id)v18;
          goto LABEL_27;
        }
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "place"));

      if (!v11)
      {
        v18 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
        goto LABEL_26;
      }
      v12 = v7;
      if ((objc_msgSend(v12, "hasAttributes") & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
        v14 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForPlace:](GEOFeatureStyleAttributes, "styleAttributesForPlace:", v13));

        v12 = (id)v14;
      }
      v15 = objc_msgSend(v12, "poiType");
      if (objc_msgSend(v3, "isFrequentLocation") && (v15 == 348 || v15 == -1))
      {
        v16 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes frequentLocationStyleAttributes](GEOFeatureStyleAttributes, "frequentLocationStyleAttributes"));
LABEL_22:
        v19 = (void *)v16;

        v12 = v19;
        goto LABEL_23;
      }
      if (objc_msgSend(v12, "isLabelPOI") && objc_msgSend(v3, "isPartOfMultipleResultsSet"))
      {
        v16 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
        goto LABEL_22;
      }
LABEL_23:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_geoMapItem"));
      v22 = objc_msgSend(v21, "isDisputed");

      if (v22)
      {
        v23 = 0x100000016;
        objc_msgSend(v12, "replaceAttributes:count:", &v23, 1);
      }
LABEL_27:

LABEL_17:
      return v12;
  }
}

@end
