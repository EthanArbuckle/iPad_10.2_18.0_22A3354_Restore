@implementation MapsSuggestionsDGVAnnotation

- (MapsSuggestionsDGVAnnotation)initWithDictFromJSONDeserialization:(id)a3
{
  id v4;
  MapsSuggestionsDGVAnnotation *v5;
  MapsSuggestionsDGVAnnotation *v6;
  MapsSuggestionsDGVAnnotation *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsDGVAnnotation;
  v5 = -[MapsSuggestionsDGVAnnotation init](&v9, "init");
  v6 = v5;
  if (v5
    && !-[MapsSuggestionsDGVAnnotation _populateWithDictFromJSONDeserialization:](v5, "_populateWithDictFromJSONDeserialization:", v4))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (BOOL)_populateWithDictFromJSONDeserialization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CLLocationDegrees v9;
  BOOL v10;
  void *v11;
  CLLocationDegrees v12;
  NSArray *v13;
  NSArray *entriesDictionaries;
  NSString *v15;
  NSString *title;
  uint64_t Log;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("likelyLocation")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("label")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("entries")));

  if (!v5)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVAnnotation");
    v18 = objc_claimAutoreleasedReturnValue(Log);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    v24 = 136446978;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVAnnotation.m";
    v26 = 1024;
    v27 = 35;
    v28 = 2082;
    v29 = "-[MapsSuggestionsDGVAnnotation _populateWithDictFromJSONDeserialization:]";
    v30 = 2082;
    v31 = "likelyLocationCoordinates == nil";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination must have coordinates";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v24, 0x26u);
    goto LABEL_15;
  }
  if (!v6)
  {
    v20 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVAnnotation");
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    v24 = 136446978;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVAnnotation.m";
    v26 = 1024;
    v27 = 36;
    v28 = 2082;
    v29 = "-[MapsSuggestionsDGVAnnotation _populateWithDictFromJSONDeserialization:]";
    v30 = 2082;
    v31 = "nil == (labelValue)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination label must have a value";
    goto LABEL_14;
  }
  if (!v7)
  {
    v21 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVAnnotation");
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    v24 = 136446978;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVAnnotation.m";
    v26 = 1024;
    v27 = 37;
    v28 = 2082;
    v29 = "-[MapsSuggestionsDGVAnnotation _populateWithDictFromJSONDeserialization:]";
    v30 = 2082;
    v31 = "nil == (entriesDicts)";
    v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Entries dictionary cannot be nil";
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "count") != (id)2)
  {
    v22 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "DGVAnnotation");
    v18 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVAnnotation.m";
      v26 = 1024;
      v27 = 38;
      v28 = 2082;
      v29 = "-[MapsSuggestionsDGVAnnotation _populateWithDictFromJSONDeserialization:]";
      v30 = 2082;
      v31 = "[likelyLocationCoordinates count] != 2u";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. Coordinates array must have exactly two items";
      goto LABEL_14;
    }
LABEL_15:

    v10 = 0;
    goto LABEL_16;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
  objc_msgSend(v8, "doubleValue");
  self->_coordinate.latitude = v9;

  v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 1));
  objc_msgSend(v11, "doubleValue");
  self->_coordinate.longitude = v12;

  v13 = (NSArray *)objc_msgSend(v7, "copy");
  entriesDictionaries = self->_entriesDictionaries;
  self->_entriesDictionaries = v13;

  v15 = (NSString *)objc_msgSend(v6, "copy");
  title = self->_title;
  self->_title = v15;

LABEL_16:
  return v10;
}

- (NSArray)entriesDictionaries
{
  return self->_entriesDictionaries;
}

- (void)setEntriesDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_entriesDictionaries, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_entriesDictionaries, 0);
}

@end
