@implementation REMDistributedEvaluationCollectionOptions

+ (id)optionsWithDefaultValues
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(v2, "setIncludeListNames:", 0);
  objc_msgSend(v2, "setIncludeReminderTitles:", 0);
  objc_msgSend(v2, "setIncludeListNameFuzzedEmbeddings:", 0);
  objc_msgSend(v2, "setIncludeReminderTitleFuzzedEmbeddings:", 0);
  objc_msgSend(v2, "setIncludeSystemLanguage:", 0);
  objc_msgSend(v2, "setIncludeSystemTimezone:", 0);
  objc_msgSend(v2, "setIncludeAccountType:", 0);
  objc_msgSend(v2, "setIncludeListGroupInfo:", 0);
  objc_msgSend(v2, "setIncludeReminderTitleSaltedHash:", 0);
  objc_msgSend(v2, "setIncludeDayOfWeek:", 0);
  objc_msgSend(v2, "setIncludeDates:", 0);
  objc_msgSend(v2, "setIncludeRecurrenceInfo:", 0);
  objc_msgSend(v2, "setIncludeLocationInfo:", 0);
  objc_msgSend(v2, "setIncludeAttachmentUTIs:", 0);
  objc_msgSend(v2, "setIncludeRemindMeWhenMessagingInfo:", 0);
  objc_msgSend(v2, "setIncludeAlarmDates:", 0);
  objc_msgSend(v2, "setIncludeSubtaskInfo:", 0);
  objc_msgSend(v2, "setIncludeUserActivityInfo:", 0);
  objc_msgSend(v2, "setIncludeIsFlagged:", 0);
  objc_msgSend(v2, "setIncludePriority:", 0);
  objc_msgSend(v2, "setRelevantWordTagsIncludeOtherWord:", 0);
  objc_msgSend(v2, "setDateResolutionInSeconds:", 10);
  objc_msgSend(v2, "setCreationDateWithinDays:", 0);
  objc_msgSend(v2, "setReminderTitleCategoryEmbeddingURL:", 0);
  objc_msgSend(v2, "setIncludeReminderTitleCategorySentence2Vec:", 0);
  objc_msgSend(v2, "setIncludeReminderTitleCategoryUniversalGrammar:", 0);
  objc_msgSend(v2, "setIncludeReminderTitleCategoryFilteredStopWords:", 0);
  objc_msgSend(v2, "setReminderTitleCategoryDistanceTolerance:", 1.0);
  return v2;
}

+ (id)optionsWithEverythingOff
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

+ (id)optionsFromJSONRepresentation:(id)a3 attachmentURLs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKey:", CFSTR("reminderTitleCategoryEmbeddingFilename"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = 0;
    goto LABEL_5;
  }
  objc_msgSend(a1, "_attachmentURLFromFilenameWithKey:inJSONRepresentation:attachmentURLs:error:", CFSTR("reminderTitleCategoryEmbeddingFilename"), v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_5:
    objc_msgSend(a1, "optionsWithDefaultValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIncludeListNames:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeListNames"), objc_msgSend(v12, "includeListNames")));
    objc_msgSend(v12, "setIncludeListNameFuzzedEmbeddings:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeListNameFuzzedEmbeddings"), objc_msgSend(v12, "includeListNameFuzzedEmbeddings")));
    objc_msgSend(v12, "setIncludeReminderTitles:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitles"), objc_msgSend(v12, "includeReminderTitles")));
    objc_msgSend(v12, "setIncludeReminderTitleFuzzedEmbeddings:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitleFuzzedEmbeddings"), objc_msgSend(v12, "includeReminderTitleFuzzedEmbeddings")));
    objc_msgSend(v12, "setIncludeSystemLanguage:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeSystemLanguage"), objc_msgSend(v12, "includeSystemLanguage")));
    objc_msgSend(v12, "setIncludeSystemTimezone:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeSystemTimezone"), objc_msgSend(v12, "includeSystemTimezone")));
    objc_msgSend(v12, "setIncludeAccountType:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeAccountType"), objc_msgSend(v12, "includeAccountType")));
    objc_msgSend(v12, "setIncludeListGroupInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeListGroupInfo"), objc_msgSend(v12, "includeListGroupInfo")));
    objc_msgSend(v12, "setIncludeReminderTitleSaltedHash:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitleSaltedHash"), objc_msgSend(v12, "includeReminderTitleSaltedHash")));
    objc_msgSend(v12, "setIncludeDates:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeDates"), objc_msgSend(v12, "includeDates")));
    objc_msgSend(v12, "setIncludeRecurrenceInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeRecurrenceInfo"), objc_msgSend(v12, "includeRecurrenceInfo")));
    objc_msgSend(v12, "setIncludeLocationInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeLocationInfo"), objc_msgSend(v12, "includeLocationInfo")));
    objc_msgSend(v12, "setIncludeAttachmentUTIs:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeAttachmentUTIs"), objc_msgSend(v12, "includeAttachmentUTIs")));
    objc_msgSend(v12, "setIncludeRemindMeWhenMessagingInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeRemindMeWhenMessagingInfo"), objc_msgSend(v12, "includeRemindMeWhenMessagingInfo")));
    objc_msgSend(v12, "setIncludeAlarmDates:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeAlarmDates"), objc_msgSend(v12, "includeAlarmDates")));
    objc_msgSend(v12, "setIncludeSubtaskInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeSubtaskInfo"), objc_msgSend(v12, "includeSubtaskInfo")));
    objc_msgSend(v12, "setIncludeUserActivityInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeUserActivityInfo"), objc_msgSend(v12, "includeUserActivityInfo")));
    objc_msgSend(v12, "setIncludeIsFlagged:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeIsFlagged"), objc_msgSend(v12, "includeIsFlagged")));
    objc_msgSend(v12, "setIncludePriority:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includePriority"), objc_msgSend(v12, "includePriority")));
    objc_msgSend(v12, "setRelevantWordTagsIncludeOtherWord:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("relevantWordTagsIncludeOtherWord"), objc_msgSend(v12, "relevantWordTagsIncludeOtherWord")));
    objc_msgSend(v12, "setDateResolutionInSeconds:", objc_msgSend(v8, "remdes_nsuintegerForKey:defaultValue:", CFSTR("dateResolutionInSeconds"), 10));
    objc_msgSend(v12, "setIncludeReminderTitleCategoryFilteredStopWords:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitleCategoryFilteredStopWords"), objc_msgSend(v12, "includeReminderTitleCategoryFilteredStopWords")));
    objc_msgSend(v12, "setIncludeReminderTitleCategoryUniversalGrammar:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitleCategoryUniversalGrammar"), objc_msgSend(v12, "includeReminderTitleCategoryUniversalGrammar")));
    objc_msgSend(v12, "setIncludeReminderTitleCategorySentence2Vec:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", CFSTR("includeReminderTitleCategorySentence2Vec"), objc_msgSend(v12, "includeReminderTitleCategorySentence2Vec")));
    objc_msgSend(v8, "remdes_doubleForKey:defaultValue:", CFSTR("reminderTitleCategoryDistanceTolerance"), 1.0);
    objc_msgSend(v12, "setReminderTitleCategoryDistanceTolerance:");
    objc_msgSend(v12, "setReminderTitleCategoryEmbeddingURL:", v11);

    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMDistributedEvaluationCollectionOptions;
  result = -[REMDistributedEvaluationCollectionOptions init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 4) = 0x3FF0000000000000;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDistributedEvaluationCollectionOptions)initWithCoder:(id)a3
{
  id v4;
  REMDistributedEvaluationCollectionOptions *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[REMDistributedEvaluationCollectionOptions _init](self, "_init");
  if (v5)
  {
    -[REMDistributedEvaluationCollectionOptions setIncludeListNames:](v5, "setIncludeListNames:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeListNames")));
    -[REMDistributedEvaluationCollectionOptions setIncludeListNameFuzzedEmbeddings:](v5, "setIncludeListNameFuzzedEmbeddings:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeListNameFuzzedEmbeddings")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitles:](v5, "setIncludeReminderTitles:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitles")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleFuzzedEmbeddings:](v5, "setIncludeReminderTitleFuzzedEmbeddings:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitleFuzzedEmbeddings")));
    -[REMDistributedEvaluationCollectionOptions setIncludeSystemLanguage:](v5, "setIncludeSystemLanguage:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeSystemLanguage")));
    -[REMDistributedEvaluationCollectionOptions setIncludeSystemTimezone:](v5, "setIncludeSystemTimezone:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeSystemTimezone")));
    -[REMDistributedEvaluationCollectionOptions setIncludeAccountType:](v5, "setIncludeAccountType:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAccountType")));
    -[REMDistributedEvaluationCollectionOptions setIncludeListGroupInfo:](v5, "setIncludeListGroupInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeListGroupInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleSaltedHash:](v5, "setIncludeReminderTitleSaltedHash:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitleSaltedHash")));
    -[REMDistributedEvaluationCollectionOptions setIncludeDates:](v5, "setIncludeDates:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDates")));
    -[REMDistributedEvaluationCollectionOptions setIncludeRecurrenceInfo:](v5, "setIncludeRecurrenceInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeRecurrenceInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeLocationInfo:](v5, "setIncludeLocationInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeLocationInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeAttachmentUTIs:](v5, "setIncludeAttachmentUTIs:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAttachmentUTIs")));
    -[REMDistributedEvaluationCollectionOptions setIncludeRemindMeWhenMessagingInfo:](v5, "setIncludeRemindMeWhenMessagingInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeRemindMeWhenMessagingInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeAlarmDates:](v5, "setIncludeAlarmDates:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAlarmDates")));
    -[REMDistributedEvaluationCollectionOptions setIncludeSubtaskInfo:](v5, "setIncludeSubtaskInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeSubtaskInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeUserActivityInfo:](v5, "setIncludeUserActivityInfo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeUserActivityInfo")));
    -[REMDistributedEvaluationCollectionOptions setIncludeIsFlagged:](v5, "setIncludeIsFlagged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeIsFlagged")));
    -[REMDistributedEvaluationCollectionOptions setIncludePriority:](v5, "setIncludePriority:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includePriority")));
    -[REMDistributedEvaluationCollectionOptions setRelevantWordTagsIncludeOtherWord:](v5, "setRelevantWordTagsIncludeOtherWord:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("relevantWordTagsIncludeOtherWord")));
    -[REMDistributedEvaluationCollectionOptions setDateResolutionInSeconds:](v5, "setDateResolutionInSeconds:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateResolutionInSeconds")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategoryFilteredStopWords:](v5, "setIncludeReminderTitleCategoryFilteredStopWords:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitleCategoryFilteredStopWords")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategoryUniversalGrammar:](v5, "setIncludeReminderTitleCategoryUniversalGrammar:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitleCategoryUniversalGrammar")));
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategorySentence2Vec:](v5, "setIncludeReminderTitleCategorySentence2Vec:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeReminderTitleCategorySentence2Vec")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("reminderTitleCategoryDistanceTolerance"));
    -[REMDistributedEvaluationCollectionOptions setReminderTitleCategoryDistanceTolerance:](v5, "setReminderTitleCategoryDistanceTolerance:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderTitleCategoryEmbeddingURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDistributedEvaluationCollectionOptions setReminderTitleCategoryEmbeddingURL:](v5, "setReminderTitleCategoryEmbeddingURL:", v8);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListNames](self, "includeListNames"), CFSTR("includeListNames"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListNameFuzzedEmbeddings](self, "includeListNameFuzzedEmbeddings"), CFSTR("includeListNameFuzzedEmbeddings"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitles](self, "includeReminderTitles"), CFSTR("includeReminderTitles"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleFuzzedEmbeddings](self, "includeReminderTitleFuzzedEmbeddings"), CFSTR("includeReminderTitleFuzzedEmbeddings"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSystemLanguage](self, "includeSystemLanguage"), CFSTR("includeSystemLanguage"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSystemTimezone](self, "includeSystemTimezone"), CFSTR("includeSystemTimezone"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAccountType](self, "includeAccountType"), CFSTR("includeAccountType"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListGroupInfo](self, "includeListGroupInfo"), CFSTR("includeListGroupInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleSaltedHash](self, "includeReminderTitleSaltedHash"), CFSTR("includeReminderTitleSaltedHash"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeDates](self, "includeDates"), CFSTR("includeDates"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeRecurrenceInfo](self, "includeRecurrenceInfo"), CFSTR("includeRecurrenceInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeLocationInfo](self, "includeLocationInfo"), CFSTR("includeLocationInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAttachmentUTIs](self, "includeAttachmentUTIs"), CFSTR("includeAttachmentUTIs"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeRemindMeWhenMessagingInfo](self, "includeRemindMeWhenMessagingInfo"), CFSTR("includeRemindMeWhenMessagingInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAlarmDates](self, "includeAlarmDates"), CFSTR("includeAlarmDates"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSubtaskInfo](self, "includeSubtaskInfo"), CFSTR("includeSubtaskInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeUserActivityInfo](self, "includeUserActivityInfo"), CFSTR("includeUserActivityInfo"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeIsFlagged](self, "includeIsFlagged"), CFSTR("includeIsFlagged"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includePriority](self, "includePriority"), CFSTR("includePriority"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions relevantWordTagsIncludeOtherWord](self, "relevantWordTagsIncludeOtherWord"), CFSTR("relevantWordTagsIncludeOtherWord"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[REMDistributedEvaluationCollectionOptions dateResolutionInSeconds](self, "dateResolutionInSeconds"), CFSTR("dateResolutionInSeconds"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryFilteredStopWords](self, "includeReminderTitleCategoryFilteredStopWords"), CFSTR("includeReminderTitleCategoryFilteredStopWords"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryUniversalGrammar](self, "includeReminderTitleCategoryUniversalGrammar"), CFSTR("includeReminderTitleCategoryUniversalGrammar"));
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategorySentence2Vec](self, "includeReminderTitleCategorySentence2Vec"), CFSTR("includeReminderTitleCategorySentence2Vec"));
  -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryEmbeddingURL](self, "reminderTitleCategoryEmbeddingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3910]);
    -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryEmbeddingURL](self, "reminderTitleCategoryEmbeddingURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithURL:readonly:", v6, 1);

    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("reminderTitleCategoryEmbeddingURL"));
  }
  -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryDistanceTolerance](self, "reminderTitleCategoryDistanceTolerance");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("reminderTitleCategoryDistanceTolerance"));

}

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;

  +[REMDistributedEvaluationCollectionOptions optionsWithDefaultValues](REMDistributedEvaluationCollectionOptions, "optionsWithDefaultValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p "), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMDistributedEvaluationCollectionOptions includeListNames](self, "includeListNames");
  if (v5 != objc_msgSend(v3, "includeListNames"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeListNames"), -[REMDistributedEvaluationCollectionOptions includeListNames](self, "includeListNames"));
  v6 = -[REMDistributedEvaluationCollectionOptions includeReminderTitles](self, "includeReminderTitles");
  if (v6 != objc_msgSend(v3, "includeReminderTitles"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitles"), -[REMDistributedEvaluationCollectionOptions includeReminderTitles](self, "includeReminderTitles"));
  v7 = -[REMDistributedEvaluationCollectionOptions includeSystemLanguage](self, "includeSystemLanguage");
  if (v7 != objc_msgSend(v3, "includeSystemLanguage"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeSystemLanguage"), -[REMDistributedEvaluationCollectionOptions includeSystemLanguage](self, "includeSystemLanguage"));
  v8 = -[REMDistributedEvaluationCollectionOptions includeSystemTimezone](self, "includeSystemTimezone");
  if (v8 != objc_msgSend(v3, "includeSystemTimezone"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeSystemTimezone"), -[REMDistributedEvaluationCollectionOptions includeSystemTimezone](self, "includeSystemTimezone"));
  v9 = -[REMDistributedEvaluationCollectionOptions includeAccountType](self, "includeAccountType");
  if (v9 != objc_msgSend(v3, "includeAccountType"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeAccountType"), -[REMDistributedEvaluationCollectionOptions includeAccountType](self, "includeAccountType"));
  v10 = -[REMDistributedEvaluationCollectionOptions includeListGroupInfo](self, "includeListGroupInfo");
  if (v10 != objc_msgSend(v3, "includeListGroupInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeListGroupInfo"), -[REMDistributedEvaluationCollectionOptions includeListGroupInfo](self, "includeListGroupInfo"));
  v11 = -[REMDistributedEvaluationCollectionOptions includeListNameFuzzedEmbeddings](self, "includeListNameFuzzedEmbeddings");
  if (v11 != objc_msgSend(v3, "includeListNameFuzzedEmbeddings"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeListNameFuzzedEmbeddings"), -[REMDistributedEvaluationCollectionOptions includeListNameFuzzedEmbeddings](self, "includeListNameFuzzedEmbeddings"));
  v12 = -[REMDistributedEvaluationCollectionOptions includeReminderTitleFuzzedEmbeddings](self, "includeReminderTitleFuzzedEmbeddings");
  if (v12 != objc_msgSend(v3, "includeReminderTitleFuzzedEmbeddings"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitleFuzzedEmbeddings"), -[REMDistributedEvaluationCollectionOptions includeReminderTitleFuzzedEmbeddings](self, "includeReminderTitleFuzzedEmbeddings"));
  v13 = -[REMDistributedEvaluationCollectionOptions includeReminderTitleSaltedHash](self, "includeReminderTitleSaltedHash");
  if (v13 != objc_msgSend(v3, "includeReminderTitleSaltedHash"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitleSaltedHash"), -[REMDistributedEvaluationCollectionOptions includeReminderTitleSaltedHash](self, "includeReminderTitleSaltedHash"));
  v14 = -[REMDistributedEvaluationCollectionOptions includeDates](self, "includeDates");
  if (v14 != objc_msgSend(v3, "includeDates"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeDates"), -[REMDistributedEvaluationCollectionOptions includeDates](self, "includeDates"));
  v15 = -[REMDistributedEvaluationCollectionOptions includeRecurrenceInfo](self, "includeRecurrenceInfo");
  if (v15 != objc_msgSend(v3, "includeRecurrenceInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeRecurrenceInfo"), -[REMDistributedEvaluationCollectionOptions includeRecurrenceInfo](self, "includeRecurrenceInfo"));
  v16 = -[REMDistributedEvaluationCollectionOptions includeLocationInfo](self, "includeLocationInfo");
  if (v16 != objc_msgSend(v3, "includeLocationInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeLocationInfo"), -[REMDistributedEvaluationCollectionOptions includeLocationInfo](self, "includeLocationInfo"));
  v17 = -[REMDistributedEvaluationCollectionOptions includeAttachmentUTIs](self, "includeAttachmentUTIs");
  if (v17 != objc_msgSend(v3, "includeAttachmentUTIs"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeAttachmentUTIs"), -[REMDistributedEvaluationCollectionOptions includeAttachmentUTIs](self, "includeAttachmentUTIs"));
  v18 = -[REMDistributedEvaluationCollectionOptions includeRemindMeWhenMessagingInfo](self, "includeRemindMeWhenMessagingInfo");
  if (v18 != objc_msgSend(v3, "includeRemindMeWhenMessagingInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeRemindMeWhenMessagingInfo"), -[REMDistributedEvaluationCollectionOptions includeRemindMeWhenMessagingInfo](self, "includeRemindMeWhenMessagingInfo"));
  v19 = -[REMDistributedEvaluationCollectionOptions includeAlarmDates](self, "includeAlarmDates");
  if (v19 != objc_msgSend(v3, "includeAlarmDates"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeAlarmDates"), -[REMDistributedEvaluationCollectionOptions includeAlarmDates](self, "includeAlarmDates"));
  v20 = -[REMDistributedEvaluationCollectionOptions includeSubtaskInfo](self, "includeSubtaskInfo");
  if (v20 != objc_msgSend(v3, "includeSubtaskInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeSubtaskInfo"), -[REMDistributedEvaluationCollectionOptions includeSubtaskInfo](self, "includeSubtaskInfo"));
  v21 = -[REMDistributedEvaluationCollectionOptions includeUserActivityInfo](self, "includeUserActivityInfo");
  if (v21 != objc_msgSend(v3, "includeUserActivityInfo"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeUserActivityInfo"), -[REMDistributedEvaluationCollectionOptions includeUserActivityInfo](self, "includeUserActivityInfo"));
  v22 = -[REMDistributedEvaluationCollectionOptions includeIsFlagged](self, "includeIsFlagged");
  if (v22 != objc_msgSend(v3, "includeIsFlagged"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeIsFlagged"), -[REMDistributedEvaluationCollectionOptions includeIsFlagged](self, "includeIsFlagged"));
  v23 = -[REMDistributedEvaluationCollectionOptions includePriority](self, "includePriority");
  if (v23 != objc_msgSend(v3, "includePriority"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includePriority"), -[REMDistributedEvaluationCollectionOptions includePriority](self, "includePriority"));
  v24 = -[REMDistributedEvaluationCollectionOptions relevantWordTagsIncludeOtherWord](self, "relevantWordTagsIncludeOtherWord");
  if (v24 != objc_msgSend(v3, "relevantWordTagsIncludeOtherWord"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("relevantWordTagsIncludeOtherWord"), -[REMDistributedEvaluationCollectionOptions relevantWordTagsIncludeOtherWord](self, "relevantWordTagsIncludeOtherWord"));
  v25 = -[REMDistributedEvaluationCollectionOptions dateResolutionInSeconds](self, "dateResolutionInSeconds");
  if (v25 != objc_msgSend(v3, "dateResolutionInSeconds"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("dateResolutionInSeconds"), -[REMDistributedEvaluationCollectionOptions dateResolutionInSeconds](self, "dateResolutionInSeconds"));
  v26 = -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryFilteredStopWords](self, "includeReminderTitleCategoryFilteredStopWords");
  if (v26 != objc_msgSend(v3, "includeReminderTitleCategoryFilteredStopWords"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitleCategoryFilteredStopWords"), -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryFilteredStopWords](self, "includeReminderTitleCategoryFilteredStopWords"));
  v27 = -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryUniversalGrammar](self, "includeReminderTitleCategoryUniversalGrammar");
  if (v27 != objc_msgSend(v3, "includeReminderTitleCategoryUniversalGrammar"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitleCategoryUniversalGrammar"), -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryUniversalGrammar](self, "includeReminderTitleCategoryUniversalGrammar"));
  v28 = -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategorySentence2Vec](self, "includeReminderTitleCategorySentence2Vec");
  if (v28 != objc_msgSend(v3, "includeReminderTitleCategorySentence2Vec"))
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%ld "), CFSTR("includeReminderTitleCategorySentence2Vec"), -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategorySentence2Vec](self, "includeReminderTitleCategorySentence2Vec"));
  -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryDistanceTolerance](self, "reminderTitleCategoryDistanceTolerance");
  v30 = v29;
  objc_msgSend(v3, "reminderTitleCategoryDistanceTolerance");
  v32 = v30 - v31;
  if (v32 < 0.0)
    v32 = -v32;
  if (v32 > 0.0001)
  {
    -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryDistanceTolerance](self, "reminderTitleCategoryDistanceTolerance");
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%.3f "), CFSTR("reminderTitleCategoryDistanceTolerance"), v33);
  }
  -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryEmbeddingURL](self, "reminderTitleCategoryEmbeddingURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[REMDistributedEvaluationCollectionOptions reminderTitleCategoryEmbeddingURL](self, "reminderTitleCategoryEmbeddingURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@:%@ "), CFSTR("reminderTitleCategoryEmbeddingURL"), v35);

  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));

  return v4;
}

- (BOOL)includeListNames
{
  _BOOL4 v3;

  v3 = +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall");
  if (v3)
    LOBYTE(v3) = self->_includeListNames;
  return v3;
}

- (BOOL)includeListNameFuzzedEmbeddings
{
  _BOOL4 v3;

  v3 = +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall");
  if (v3)
    LOBYTE(v3) = self->_includeListNameFuzzedEmbeddings;
  return v3;
}

- (BOOL)includeReminderTitles
{
  _BOOL4 v3;

  v3 = +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall");
  if (v3)
    LOBYTE(v3) = self->_includeReminderTitles;
  return v3;
}

- (BOOL)includeReminderTitleFuzzedEmbeddings
{
  _BOOL4 v3;

  v3 = +[REMSystemUtilities isInternalInstall](REMSystemUtilities, "isInternalInstall");
  if (v3)
    LOBYTE(v3) = self->_includeReminderTitleFuzzedEmbeddings;
  return v3;
}

+ (id)_attachmentURLFromFilenameWithKey:(id)a3 inJSONRepresentation:(id)a4 attachmentURLs:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = a6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v14)
    {

      goto LABEL_19;
    }
    v15 = v14;
    v26 = v11;
    v27 = v10;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v12);

        if (v21)
        {
          v22 = v19;

          v16 = v22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);

    v11 = v26;
    v10 = v27;
    if (!v16)
    {
LABEL_19:
      a6 = v28;
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Did not find url {filename: %@, key: %@, urls: %@}"), v12, v9, v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", v24);
        *v28 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      goto LABEL_22;
    }
LABEL_15:
    a6 = v16;
    goto LABEL_22;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected type for fileame {filename: %@, key: %@}"), v12, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", v23);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    a6 = 0;
  }
LABEL_22:

  return a6;
}

- (void)setIncludeListNames:(BOOL)a3
{
  self->_includeListNames = a3;
}

- (void)setIncludeReminderTitles:(BOOL)a3
{
  self->_includeReminderTitles = a3;
}

- (void)setIncludeListNameFuzzedEmbeddings:(BOOL)a3
{
  self->_includeListNameFuzzedEmbeddings = a3;
}

- (void)setIncludeReminderTitleFuzzedEmbeddings:(BOOL)a3
{
  self->_includeReminderTitleFuzzedEmbeddings = a3;
}

- (BOOL)includeSystemLanguage
{
  return self->_includeSystemLanguage;
}

- (void)setIncludeSystemLanguage:(BOOL)a3
{
  self->_includeSystemLanguage = a3;
}

- (BOOL)includeSystemTimezone
{
  return self->_includeSystemTimezone;
}

- (void)setIncludeSystemTimezone:(BOOL)a3
{
  self->_includeSystemTimezone = a3;
}

- (BOOL)includeAccountType
{
  return self->_includeAccountType;
}

- (void)setIncludeAccountType:(BOOL)a3
{
  self->_includeAccountType = a3;
}

- (BOOL)includeListGroupInfo
{
  return self->_includeListGroupInfo;
}

- (void)setIncludeListGroupInfo:(BOOL)a3
{
  self->_includeListGroupInfo = a3;
}

- (BOOL)includeReminderTitleSaltedHash
{
  return self->_includeReminderTitleSaltedHash;
}

- (void)setIncludeReminderTitleSaltedHash:(BOOL)a3
{
  self->_includeReminderTitleSaltedHash = a3;
}

- (BOOL)includeDates
{
  return self->_includeDates;
}

- (void)setIncludeDates:(BOOL)a3
{
  self->_includeDates = a3;
}

- (BOOL)includeDayOfWeek
{
  return self->_includeDayOfWeek;
}

- (void)setIncludeDayOfWeek:(BOOL)a3
{
  self->_includeDayOfWeek = a3;
}

- (BOOL)includeRecurrenceInfo
{
  return self->_includeRecurrenceInfo;
}

- (void)setIncludeRecurrenceInfo:(BOOL)a3
{
  self->_includeRecurrenceInfo = a3;
}

- (BOOL)includeLocationInfo
{
  return self->_includeLocationInfo;
}

- (void)setIncludeLocationInfo:(BOOL)a3
{
  self->_includeLocationInfo = a3;
}

- (BOOL)includeAttachmentUTIs
{
  return self->_includeAttachmentUTIs;
}

- (void)setIncludeAttachmentUTIs:(BOOL)a3
{
  self->_includeAttachmentUTIs = a3;
}

- (BOOL)includeRemindMeWhenMessagingInfo
{
  return self->_includeRemindMeWhenMessagingInfo;
}

- (void)setIncludeRemindMeWhenMessagingInfo:(BOOL)a3
{
  self->_includeRemindMeWhenMessagingInfo = a3;
}

- (BOOL)includeAlarmDates
{
  return self->_includeAlarmDates;
}

- (void)setIncludeAlarmDates:(BOOL)a3
{
  self->_includeAlarmDates = a3;
}

- (BOOL)includeSubtaskInfo
{
  return self->_includeSubtaskInfo;
}

- (void)setIncludeSubtaskInfo:(BOOL)a3
{
  self->_includeSubtaskInfo = a3;
}

- (BOOL)includeUserActivityInfo
{
  return self->_includeUserActivityInfo;
}

- (void)setIncludeUserActivityInfo:(BOOL)a3
{
  self->_includeUserActivityInfo = a3;
}

- (BOOL)includeIsFlagged
{
  return self->_includeIsFlagged;
}

- (void)setIncludeIsFlagged:(BOOL)a3
{
  self->_includeIsFlagged = a3;
}

- (BOOL)includePriority
{
  return self->_includePriority;
}

- (void)setIncludePriority:(BOOL)a3
{
  self->_includePriority = a3;
}

- (BOOL)relevantWordTagsIncludeOtherWord
{
  return self->_relevantWordTagsIncludeOtherWord;
}

- (void)setRelevantWordTagsIncludeOtherWord:(BOOL)a3
{
  self->_relevantWordTagsIncludeOtherWord = a3;
}

- (BOOL)includeReminderTitleCategoryFilteredStopWords
{
  return self->_includeReminderTitleCategoryFilteredStopWords;
}

- (void)setIncludeReminderTitleCategoryFilteredStopWords:(BOOL)a3
{
  self->_includeReminderTitleCategoryFilteredStopWords = a3;
}

- (BOOL)includeReminderTitleCategoryUniversalGrammar
{
  return self->_includeReminderTitleCategoryUniversalGrammar;
}

- (void)setIncludeReminderTitleCategoryUniversalGrammar:(BOOL)a3
{
  self->_includeReminderTitleCategoryUniversalGrammar = a3;
}

- (BOOL)includeReminderTitleCategorySentence2Vec
{
  return self->_includeReminderTitleCategorySentence2Vec;
}

- (void)setIncludeReminderTitleCategorySentence2Vec:(BOOL)a3
{
  self->_includeReminderTitleCategorySentence2Vec = a3;
}

- (double)reminderTitleCategoryDistanceTolerance
{
  return self->_reminderTitleCategoryDistanceTolerance;
}

- (void)setReminderTitleCategoryDistanceTolerance:(double)a3
{
  self->_reminderTitleCategoryDistanceTolerance = a3;
}

- (NSURL)reminderTitleCategoryEmbeddingURL
{
  return self->_reminderTitleCategoryEmbeddingURL;
}

- (void)setReminderTitleCategoryEmbeddingURL:(id)a3
{
  objc_storeStrong((id *)&self->_reminderTitleCategoryEmbeddingURL, a3);
}

- (unint64_t)dateResolutionInSeconds
{
  return self->_dateResolutionInSeconds;
}

- (void)setDateResolutionInSeconds:(unint64_t)a3
{
  self->_dateResolutionInSeconds = a3;
}

- (unint64_t)creationDateWithinDays
{
  return self->_creationDateWithinDays;
}

- (void)setCreationDateWithinDays:(unint64_t)a3
{
  self->_creationDateWithinDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderTitleCategoryEmbeddingURL, 0);
}

@end
