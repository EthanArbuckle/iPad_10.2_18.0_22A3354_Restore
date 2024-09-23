@implementation MapsSuggestionsShortcut

- (id)styleAttributes
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;

  switch((unint64_t)-[MapsSuggestionsShortcut type](self, "type"))
  {
    case 2uLL:
      v3 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
      goto LABEL_7;
    case 3uLL:
      v3 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      goto LABEL_7;
    case 5uLL:
      v3 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      goto LABEL_7;
    case 6uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut identifier](self, "identifier"));
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NearbyTransit"));

      if (!v5)
        goto LABEL_8;
      v3 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes nearbyTransitStyleAttributes](GEOFeatureStyleAttributes, "nearbyTransitStyleAttributes"));
LABEL_7:
      v6 = (void *)v3;
      break;
    default:
LABEL_8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self, "geoMapItem"));
      v8 = v7;
      if (!v7 || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_styleAttributes"))) == 0)
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));

      break;
  }
  return v6;
}

@end
