@implementation VKAnalyticsAnalyzerEvent

- (VKAnalyticsAnalyzerEvent)initWithExecutionDurations:(id)a3 request:(id)a4 analysis:(id)a5 customIdentifier:(id)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  VKAnalyticsAnalyzerEvent *v17;
  VKAnalyticsAnalyzerEvent *v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)VKAnalyticsAnalyzerEvent;
  v17 = -[VKAnalyticsEvent initWithCustomIdentifier:](&v30, sel_initWithCustomIdentifier_, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_durations, a3);
    v18->_analysisTypes = objc_msgSend(v14, "analysisTypes");
    v18->_requestType = objc_msgSend(v14, "requestType");
    v18->_requestSource = objc_msgSend(v14, "imageSource");
    objc_msgSend(v14, "imageSize");
    v18->_imageSize.width = v19;
    v18->_imageSize.height = v20;
    objc_msgSend(v15, "imageAnalysisResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allLineQuads");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_lineCount = objc_msgSend(v22, "count");

    objc_msgSend(v15, "imageAnalysisResult");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_textLength = objc_msgSend(v24, "length");

    objc_msgSend(v23, "textDataDetectorElements");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_ddCount = objc_msgSend(v25, "count");

    objc_msgSend(v23, "mrcDataDetectorElements");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_mrcCount = objc_msgSend(v26, "count");

    objc_msgSend(v23, "visualSearchResult");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resultItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_visualSearchCount = objc_msgSend(v28, "count");

    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

- (double)madRoundTripAnalysisDuration
{
  void *v2;
  double v3;
  double v4;

  -[VKAnalyticsAnalyzerEvent durations](self, "durations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "madRoundTripAnalysisDuration");
  VKMReplaceIfNan();
  v4 = v3;

  return v4;
}

- (double)madDocumentDuration
{
  void *v2;
  double v3;
  double v4;

  -[VKAnalyticsAnalyzerEvent durations](self, "durations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "madDocumentDuration");
  VKMReplaceIfNan();
  v4 = v3;

  return v4;
}

- (double)madMRCDuration
{
  void *v2;
  double v3;
  double v4;

  -[VKAnalyticsAnalyzerEvent durations](self, "durations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "madMRCDuration");
  VKMReplaceIfNan();
  v4 = v3;

  return v4;
}

- (double)madVisualSearchDuration
{
  void *v2;
  double v3;
  double v4;

  -[VKAnalyticsAnalyzerEvent durations](self, "durations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "madVisualSearchDuration");
  VKMReplaceIfNan();
  v4 = v3;

  return v4;
}

- (double)mrcParseDuration
{
  void *v2;
  double v3;
  double v4;

  -[VKAnalyticsAnalyzerEvent durations](self, "durations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mrcParseDuration");
  VKMReplaceIfNan();
  v4 = v3;

  return v4;
}

- (id)eventKey
{
  return CFSTR("StaticImageAnalysisCompleted");
}

- (int64_t)type
{
  return 1;
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[19];
  _QWORD v38[21];

  v38[19] = *MEMORY[0x1E0C80C00];
  v37[0] = CFSTR("madAnalysisDuration");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent madRoundTripAnalysisDuration](self, "madRoundTripAnalysisDuration");
  objc_msgSend(v3, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v36;
  v37[1] = CFSTR("visionExecutionTimeInternal");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent madDocumentDuration](self, "madDocumentDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v35;
  v37[2] = CFSTR("mrcDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent madMRCDuration](self, "madMRCDuration");
  objc_msgSend(v5, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v34;
  v37[3] = CFSTR("vsDuration");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent madVisualSearchDuration](self, "madVisualSearchDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v33;
  v37[4] = CFSTR("mrcParseDuration");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent mrcParseDuration](self, "mrcParseDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v32;
  v37[5] = CFSTR("analysisTypes");
  VKMUIStringForAnalysisTypes(-[VKAnalyticsAnalyzerEvent analysisTypes](self, "analysisTypes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v31;
  v37[6] = CFSTR("imageSizeWidth");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent imageSize](self, "imageSize");
  objc_msgSend(v8, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v30;
  v37[7] = CFSTR("imageSizeHeight");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent imageSize](self, "imageSize");
  objc_msgSend(v9, "numberWithDouble:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v29;
  v37[8] = CFSTR("imageAspectRatio");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent imageSize](self, "imageSize");
  objc_msgSend(v11, "numberWithDouble:", VKMAspectRatio(v12, v13));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v28;
  v37[9] = CFSTR("requestType");
  VKMUIStringForAnalyzerRequestType(-[VKAnalyticsAnalyzerEvent requestType](self, "requestType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v27;
  v37[10] = CFSTR("requestSource");
  VKMUIStringForAnalyzerRequestSource(-[VKAnalyticsAnalyzerEvent requestSource](self, "requestSource"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v26;
  v37[11] = CFSTR("textLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsAnalyzerEvent textLength](self, "textLength"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v14;
  v37[12] = CFSTR("lineCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsAnalyzerEvent lineCount](self, "lineCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[12] = v15;
  v37[13] = CFSTR("ddCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsAnalyzerEvent ddCount](self, "ddCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[13] = v16;
  v37[14] = CFSTR("mrcCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsAnalyzerEvent mrcCount](self, "mrcCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[14] = v17;
  v37[15] = CFSTR("vsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VKAnalyticsAnalyzerEvent visualSearchCount](self, "visualSearchCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[15] = v18;
  v37[16] = CFSTR("bundleIdentifier");
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[16] = v19;
  v37[17] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[17] = v20;
  v37[18] = CFSTR("hadError");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsAnalyzerEvent error](self, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithInt:", v22 != 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[18] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t textLength;
  int64_t lineCount;
  int64_t ddCount;
  int64_t mrcCount;
  int64_t visualSearchCount;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v27 = (void *)MEMORY[0x1E0CB3940];
  v28.receiver = self;
  v28.super_class = (Class)VKAnalyticsAnalyzerEvent;
  -[VKAnalyticsAnalyzerEvent description](&v28, sel_description);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsAnalyzerEvent madRoundTripAnalysisDuration](self, "madRoundTripAnalysisDuration");
  v4 = v3;
  -[VKAnalyticsAnalyzerEvent madDocumentDuration](self, "madDocumentDuration");
  v6 = v5;
  -[VKAnalyticsAnalyzerEvent madVisualSearchDuration](self, "madVisualSearchDuration");
  v8 = v7;
  -[VKAnalyticsAnalyzerEvent madMRCDuration](self, "madMRCDuration");
  v10 = v9;
  -[VKAnalyticsAnalyzerEvent mrcParseDuration](self, "mrcParseDuration");
  v12 = v11;
  VKMUIStringForAnalysisTypes(self->_analysisTypes);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalyzerRequestType(self->_requestType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForAnalyzerRequestSource(self->_requestSource);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForSize(self->_imageSize.width, self->_imageSize.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  textLength = self->_textLength;
  lineCount = self->_lineCount;
  ddCount = self->_ddCount;
  mrcCount = self->_mrcCount;
  visualSearchCount = self->_visualSearchCount;
  VKMUIStringForBool(-[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsEvent bundleIdentifier](self, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ \n madRoundTripAnalysisDuration: %f \n madDocumentDuration: %f \n madVisualSearchDuration: %f \n madMRCDuration: %f \n mrcParseDuration: %f \n analysisTypes: %@ \n requestType: %@ \n requestSource: %@ \n imageSize: %@ \n textLength: %ld \n lineCount: %ld \n ddCount: %ld \n mrcCount: %ld \n visualSearchCount: %ld \n automatedTest: %@ \n bundleIdentifier: %@ \n error: %@ "), v26, v4, v6, v8, v10, v12, v25, v24, v13, v14, textLength, lineCount, ddCount, mrcCount, visualSearchCount, v20,
    v21,
    self->_error);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_textLength = a3;
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(int64_t)a3
{
  self->_lineCount = a3;
}

- (int64_t)ddCount
{
  return self->_ddCount;
}

- (void)setDdCount:(int64_t)a3
{
  self->_ddCount = a3;
}

- (int64_t)mrcCount
{
  return self->_mrcCount;
}

- (void)setMrcCount:(int64_t)a3
{
  self->_mrcCount = a3;
}

- (int64_t)visualSearchCount
{
  return self->_visualSearchCount;
}

- (void)setVisualSearchCount:(int64_t)a3
{
  self->_visualSearchCount = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (VKAnalysisExecutionDurations)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
  objc_storeStrong((id *)&self->_durations, a3);
}

- (unint64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unint64_t)a3
{
  self->_requestSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
