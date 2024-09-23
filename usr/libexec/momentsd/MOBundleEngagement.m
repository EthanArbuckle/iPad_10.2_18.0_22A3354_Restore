@implementation MOBundleEngagement

- (MOBundleEngagement)initWithType:(int)a3 timestamp:(id)a4 clientIdentifier:(id)a5 viewContainerName:(id)a6 viewVisibleTime:(double)a7 suggestionType:(id)a8 viewVisibleSuggestionsCount:(id)a9 viewTotalSuggestionsCount:(id)a10 typeAppEntry:(int)a11 typeAppEntryStr:(id)a12 timestampAppEntry:(id)a13 startTimeAppEntry:(id)a14 endTimeAppEntry:(id)a15 clientIdentifierAppEntry:(id)a16 totalCharactersAppEntry:(id)a17 addedCharactersAppEntry:(id)a18 engagementSource:(unint64_t)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  MOBundleEngagement *v31;
  MOBundleEngagement *v32;
  id v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a4;
  v36 = a5;
  v42 = a5;
  v40 = a6;
  v37 = a8;
  v24 = a8;
  v38 = a9;
  v25 = a9;
  v44 = a10;
  v43 = a12;
  v41 = a13;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v46.receiver = self;
  v46.super_class = (Class)MOBundleEngagement;
  v31 = -[MOBundleEngagement init](&v46, "init");
  v32 = v31;
  if (v31)
  {
    v31->_type = a3;
    objc_storeStrong((id *)&v31->_timestamp, a4);
    objc_storeStrong((id *)&v32->_clientIdentifier, v36);
    objc_storeStrong((id *)&v32->_viewContainerName, a6);
    v32->_viewVisibleTime = a7;
    objc_storeStrong((id *)&v32->_suggestionType, v37);
    objc_storeStrong((id *)&v32->_viewVisibleSuggestionsCount, v38);
    objc_storeStrong((id *)&v32->_viewTotalSuggestionsCount, a10);
    v32->_typeAppEntry = a11;
    objc_storeStrong((id *)&v32->_typeAppEntryStr, a12);
    objc_storeStrong((id *)&v32->_timestampAppEntry, a13);
    objc_storeStrong((id *)&v32->_startTimeAppEntry, a14);
    objc_storeStrong((id *)&v32->_endTimeAppEntry, a15);
    objc_storeStrong((id *)&v32->_clientIdentifierAppEntry, a16);
    objc_storeStrong((id *)&v32->_totalCharactersAppEntry, a17);
    objc_storeStrong((id *)&v32->_addedCharactersAppEntry, a18);
    v32->_engagementSource = a19;
  }

  return v32;
}

- (int)type
{
  return self->_type;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)viewContainerName
{
  return self->_viewContainerName;
}

- (double)viewVisibleTime
{
  return self->_viewVisibleTime;
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (NSNumber)viewVisibleSuggestionsCount
{
  return self->_viewVisibleSuggestionsCount;
}

- (NSNumber)viewTotalSuggestionsCount
{
  return self->_viewTotalSuggestionsCount;
}

- (int)typeAppEntry
{
  return self->_typeAppEntry;
}

- (NSString)typeAppEntryStr
{
  return self->_typeAppEntryStr;
}

- (NSDate)timestampAppEntry
{
  return self->_timestampAppEntry;
}

- (NSDate)startTimeAppEntry
{
  return self->_startTimeAppEntry;
}

- (NSDate)endTimeAppEntry
{
  return self->_endTimeAppEntry;
}

- (NSString)clientIdentifierAppEntry
{
  return self->_clientIdentifierAppEntry;
}

- (NSNumber)totalCharactersAppEntry
{
  return self->_totalCharactersAppEntry;
}

- (NSNumber)addedCharactersAppEntry
{
  return self->_addedCharactersAppEntry;
}

- (unint64_t)engagementSource
{
  return self->_engagementSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedCharactersAppEntry, 0);
  objc_storeStrong((id *)&self->_totalCharactersAppEntry, 0);
  objc_storeStrong((id *)&self->_clientIdentifierAppEntry, 0);
  objc_storeStrong((id *)&self->_endTimeAppEntry, 0);
  objc_storeStrong((id *)&self->_startTimeAppEntry, 0);
  objc_storeStrong((id *)&self->_timestampAppEntry, 0);
  objc_storeStrong((id *)&self->_typeAppEntryStr, 0);
  objc_storeStrong((id *)&self->_viewTotalSuggestionsCount, 0);
  objc_storeStrong((id *)&self->_viewVisibleSuggestionsCount, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_viewContainerName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
