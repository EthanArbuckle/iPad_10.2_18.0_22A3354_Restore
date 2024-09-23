@implementation MKLocalSearchCompletion

- (id)entryWithTicket:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion mapItem](self, "mapItem"));
  v6 = v5;
  if (v5)
    v7 = 1;
  else
    v7 = 8;

  v8 = objc_msgSend(objc_alloc((Class)GEORPSuggestionEntry), "initWithType:", v7);
  if (v4 && v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion mapItem](self, "mapItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_identifier"));

    objc_msgSend(v4, "applyToSuggestionEntry:withAutocompleteSearchResultIdentifier:", v8, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion title](self, "title"));
    objc_msgSend(v8, "safeAddDisplayLine:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion subtitle](self, "subtitle"));
    objc_msgSend(v8, "safeAddDisplayLine:", v10);
  }

  return v8;
}

- (void)updateModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion mapItem](self, "mapItem"));
  objc_msgSend(v4, "updateModel:", v9);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion displayLines](self, "displayLines"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v9, "setFirstLine:", v6);

  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v9, "setSecondLine:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[LocalSearch lines=%lu]"), objc_msgSend(v5, "count")));
  objc_msgSend(v9, "setDebugSubtitle:", v8);

}

@end
