@implementation ATXTimelineEntryToInfoSuggestionMapping

- (ATXTimelineEntryToInfoSuggestionMapping)initWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5
{
  id v9;
  id v10;
  ATXTimelineEntryToInfoSuggestionMapping *v11;
  ATXTimelineEntryToInfoSuggestionMapping *v12;
  uint64_t v13;
  NSString *suggestionId;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXTimelineEntryToInfoSuggestionMapping;
  v11 = -[ATXTimelineEntryToInfoSuggestionMapping init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timelineEntry, a3);
    v13 = objc_msgSend(v10, "copy");
    suggestionId = v12->_suggestionId;
    v12->_suggestionId = (NSString *)v13;

    v12->_suggestionMappingReason = a5;
  }

  return v12;
}

+ (id)entryMappingWithTimelineEntry:(id)a3 suggestionId:(id)a4 withSuggestionMappingReason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimelineEntry:suggestionId:withSuggestionMappingReason:", v9, v8, a5);

  return v10;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (ATXInfoTimelineEntry)timelineEntry
{
  return self->_timelineEntry;
}

- (int64_t)suggestionMappingReason
{
  return self->_suggestionMappingReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineEntry, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
