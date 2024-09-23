@implementation PersonalizedItemSignalPack

- (PersonalizedItemSignalPack)init
{
  PersonalizedItemSignalPack *v2;
  uint64_t v3;
  NSMutableDictionary *signalScalarValuesByFeatureType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PersonalizedItemSignalPack;
  v2 = -[PersonalizedItemSignalPack init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    signalScalarValuesByFeatureType = v2->_signalScalarValuesByFeatureType;
    v2->_signalScalarValuesByFeatureType = (NSMutableDictionary *)v3;

    v2->_itemSuggestionTypeSource = 0;
  }
  return v2;
}

- (PersonalizedItemSignalPack)initWithItem:(id)a3 suggestionEntry:(id)a4
{
  id v6;
  id v7;
  PersonalizedItemSignalPack *v8;
  unsigned int v9;
  float v10;
  float v11;
  PersonalizedItemSignalPack *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[PersonalizedItemSignalPack init](self, "init");

  if (v8)
  {
    -[PersonalizedItemSignalPack setItemSuggestionTypeSource:](v8, "setItemSuggestionTypeSource:", objc_msgSend(v7, "suggestionType"));
    -[PersonalizedItemSignalPack setItemServerEntryTypeSource:](v8, "setItemServerEntryTypeSource:", objc_msgSend(v7, "serverEntryType"));
    if (objc_msgSend(v7, "hasShownToUser"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "shownToUser"), 1);
    if (objc_msgSend(v7, "hasFractionOfMatch"))
    {
      objc_msgSend(v7, "fractionOfMatch");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 2);
    }
    if (objc_msgSend(v7, "hasDistanceToSuggestion"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 3, (float)(int)objc_msgSend(v7, "distanceToSuggestion"));
    if (objc_msgSend(v7, "hasContactRelevanceScore"))
    {
      objc_msgSend(v7, "contactRelevanceScore");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 4);
    }
    if (objc_msgSend(v7, "hasMatchedUsingName"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "matchedUsingName"), 5);
    if (objc_msgSend(v7, "hasMatchedUsingOrganization"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "matchedUsingOrganization"), 6);
    if (objc_msgSend(v7, "hasMatchedUsingAddress"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "matchedUsingAddress"), 7);
    if (objc_msgSend(v7, "hasMatchedUsingLabel"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "matchedUsingLabel"), 8);
    if (objc_msgSend(v7, "hasMatchedUsingEventName"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "matchedUsingEventName"), 9);
    if (objc_msgSend(v7, "hasPeopleSuggesterRank"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 10, (double)(int)objc_msgSend(v7, "peopleSuggesterRank"));
    if (objc_msgSend(v7, "hasAge"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 11, (double)(int)objc_msgSend(v7, "age"));
    if (objc_msgSend(v7, "hasIsFavorite"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isFavorite"), 12);
    if (objc_msgSend(v7, "hasPoiOpenState"))
    {
      v9 = objc_msgSend(v7, "poiOpenState");
      if (v9 <= 4 && ((0x1Bu >> v9) & 1) != 0)
        -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", 1, qword_100E34FE0[v9]);
    }
    if (objc_msgSend(v7, "hasMapsSuggestionsContactRevelanceScore"))
    {
      objc_msgSend(v7, "mapsSuggestionsContactRevelanceScore");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 17);
    }
    if (objc_msgSend(v7, "hasMapsSuggestionsPoiRevelanceScore"))
    {
      objc_msgSend(v7, "mapsSuggestionsPoiRevelanceScore");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 18);
    }
    if (objc_msgSend(v7, "hasMapsSuggestionsIsTouristScore"))
    {
      objc_msgSend(v7, "mapsSuggestionsIsTouristScore");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 19);
    }
    if (objc_msgSend(v7, "hasTimeSinceLastInteractedSeconds"))
    {
      objc_msgSend(v7, "timeSinceLastInteractedSeconds");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 20);
    }
    if (objc_msgSend(v7, "hasDistanceToSuggestionFromViewportCenter"))
    {
      objc_msgSend(v7, "distanceToSuggestionFromViewportCenter");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 21);
    }
    if (objc_msgSend(v7, "hasIsContainedInViewport"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContainedInViewport"), 22);
    if (objc_msgSend(v7, "hasTimeSinceMapViewportChangedSeconds"))
    {
      objc_msgSend(v7, "timeSinceMapViewportChangedSeconds");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 23);
    }
    if (objc_msgSend(v7, "hasIsContactWithHomeLocation"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContactWithHomeLocation"), 24);
    if (objc_msgSend(v7, "hasIsContactWithWorkLocation"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContactWithWorkLocation"), 25);
    if (objc_msgSend(v7, "hasIsContactWithSchoolLocation"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContactWithSchoolLocation"), 26);
    if (objc_msgSend(v7, "hasIsContactWithOtherLocation"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContactWithOtherLocation"), 27);
    if (objc_msgSend(v7, "hasIsContactWithLiveLocation"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "isContactWithLiveLocation"), 28);
    if (objc_msgSend(v7, "hasPrefixLastTokenMatchCover"))
    {
      objc_msgSend(v7, "prefixLastTokenMatchCover");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 30, v10);
    }
    if (objc_msgSend(v7, "hasPrefixMatchCover"))
    {
      objc_msgSend(v7, "prefixMatchCover");
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 31, v11);
    }
    if (objc_msgSend(v7, "hasPrefixMatchPosition"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 32, (double)(int)objc_msgSend(v7, "prefixMatchPosition"));
    if (objc_msgSend(v7, "hasPrefixMatchWordBoundary"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 33, (double)(int)objc_msgSend(v7, "prefixMatchWordBoundary"));
    if (objc_msgSend(v7, "hasPrefixTokenMatchLengthFirstQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 34, (double)(int)objc_msgSend(v7, "prefixTokenMatchLengthFirstQueryToken"));
    if (objc_msgSend(v7, "hasPrefixTokenMatchPositionFirstQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 35, (double)(int)objc_msgSend(v7, "prefixTokenMatchPositionFirstQueryToken"));
    if (objc_msgSend(v7, "hasPrefixTokenIsNumberFirstQueryToken"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "prefixTokenIsNumberFirstQueryToken"), 36);
    if (objc_msgSend(v7, "hasPrefixTokenMatchLocationFirstQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 37, (double)(int)objc_msgSend(v7, "prefixTokenMatchLocationFirstQueryToken"));
    if (objc_msgSend(v7, "hasPrefixTokenMatchLengthSecondQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 38, (double)(int)objc_msgSend(v7, "prefixTokenMatchLengthSecondQueryToken"));
    if (objc_msgSend(v7, "hasPrefixTokenMatchPositionSecondQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 39, (double)(int)objc_msgSend(v7, "prefixTokenMatchPositionSecondQueryToken"));
    if (objc_msgSend(v7, "hasPrefixTokenIsNumberSecondQueryToken"))
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", objc_msgSend(v7, "hasPrefixTokenIsNumberSecondQueryToken"), 40);
    if (objc_msgSend(v7, "hasPrefixTokenMatchLocationSecondQueryToken"))
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 41, (double)(int)objc_msgSend(v7, "prefixTokenMatchLocationSecondQueryToken"));
  }
  v12 = v8;

  return v12;
}

- (void)setScalarValue:(double)a3 forFeatureType:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (a4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSignalPack signalScalarValuesByFeatureType](self, "signalScalarValuesByFeatureType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (void)setBooleanValue:(BOOL)a3 forFeatureType:(int64_t)a4
{
  double v4;

  v4 = 0.0;
  if (a3)
    v4 = 1.0;
  -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](self, "setScalarValue:forFeatureType:", a4, v4);
}

- (BOOL)hasValueForFeatureType:(int64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSignalPack signalScalarValuesByFeatureType](self, "signalScalarValuesByFeatureType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
    LOBYTE(v3) = v6 != 0;

  }
  return v3;
}

- (double)valueForFeatureType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!a3)
    return 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSignalPack signalScalarValuesByFeatureType](self, "signalScalarValuesByFeatureType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (int)itemSuggestionTypeSource
{
  return self->_itemSuggestionTypeSource;
}

- (void)setItemSuggestionTypeSource:(int)a3
{
  self->_itemSuggestionTypeSource = a3;
}

- (int)itemServerEntryTypeSource
{
  return self->_itemServerEntryTypeSource;
}

- (void)setItemServerEntryTypeSource:(int)a3
{
  self->_itemServerEntryTypeSource = a3;
}

- (NSMutableDictionary)signalScalarValuesByFeatureType
{
  return self->_signalScalarValuesByFeatureType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalScalarValuesByFeatureType, 0);
}

@end
