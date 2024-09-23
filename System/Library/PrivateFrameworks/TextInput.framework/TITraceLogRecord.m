@implementation TITraceLogRecord

- (TITraceLogRecord)initWithRecordUUID:(id)a3 logText:(id)a4 logVersion:(unint64_t)a5
{
  id v8;
  id v9;
  TITraceLogRecord *v10;
  uint64_t v11;
  NSUUID *recordUUID;
  NSMutableArray *v13;
  NSMutableArray *parsedSections;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TITraceLogRecord;
  v10 = -[TITraceLogRecord init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    recordUUID = v10->_recordUUID;
    v10->_recordUUID = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_logText, a4);
    v10->_logVersion = a5;
    v10->_parsingStatus = 0;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parsedSections = v10->_parsedSections;
    v10->_parsedSections = v13;

  }
  return v10;
}

- (NSString)logTextWithHeader
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RECORD ID: %@\n\n%@\n"), self->_recordUUID, self->_logText);
}

- (TITraceLogRecord)initWithRecordUUID:(id)a3 context:(id)a4 logText:(id)a5 logVersion:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TITraceLogRecord *v13;
  uint64_t v14;
  NSUUID *recordUUID;
  NSMutableArray *v16;
  NSMutableArray *parsedSections;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TITraceLogRecord;
  v13 = -[TITraceLogRecord init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    recordUUID = v13->_recordUUID;
    v13->_recordUUID = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_logText, a5);
    v13->_logVersion = a6;
    v13->_parsingStatus = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    parsedSections = v13->_parsedSections;
    v13->_parsedSections = v16;

  }
  return v13;
}

- (unint64_t)parse
{
  return 0;
}

- (void)addParsedSection:(id)a3
{
  -[NSMutableArray addObject:](self->_parsedSections, "addObject:", a3);
}

- (NSUUID)recordUUID
{
  return self->_recordUUID;
}

- (void)setRecordUUID:(id)a3
{
  objc_storeStrong((id *)&self->_recordUUID, a3);
}

- (NSString)logText
{
  return self->_logText;
}

- (void)setLogText:(id)a3
{
  objc_storeStrong((id *)&self->_logText, a3);
}

- (NSArray)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (unint64_t)logVersion
{
  return self->_logVersion;
}

- (void)setLogVersion:(unint64_t)a3
{
  self->_logVersion = a3;
}

- (unint64_t)parsingStatus
{
  return self->_parsingStatus;
}

- (void)setParsingStatus:(unint64_t)a3
{
  self->_parsingStatus = a3;
}

- (NSString)typedString
{
  return self->_typedString;
}

- (void)setTypedString:(id)a3
{
  objc_storeStrong((id *)&self->_typedString, a3);
}

- (NSArray)parsedSections
{
  return &self->_parsedSections->super;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
}

- (NSArray)rawAutocorrectionCandidates
{
  return self->_rawAutocorrectionCandidates;
}

- (void)setRawAutocorrectionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_rawAutocorrectionCandidates, a3);
}

- (NSArray)removedAutocorrectionCandidates
{
  return self->_removedAutocorrectionCandidates;
}

- (void)setRemovedAutocorrectionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_removedAutocorrectionCandidates, a3);
}

- (NSArray)finalAutocorrectionCandidates
{
  return self->_finalAutocorrectionCandidates;
}

- (void)setFinalAutocorrectionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_finalAutocorrectionCandidates, a3);
}

- (NSArray)rawCompletionCandidates
{
  return self->_rawCompletionCandidates;
}

- (void)setRawCompletionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_rawCompletionCandidates, a3);
}

- (NSArray)removedCompletionCandidates
{
  return self->_removedCompletionCandidates;
}

- (void)setRemovedCompletionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_removedCompletionCandidates, a3);
}

- (NSArray)finalCompletionCandidates
{
  return self->_finalCompletionCandidates;
}

- (void)setFinalCompletionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_finalCompletionCandidates, a3);
}

- (NSArray)rawPredictionCandidates
{
  return self->_rawPredictionCandidates;
}

- (void)setRawPredictionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_rawPredictionCandidates, a3);
}

- (NSArray)removedPredictionCandidates
{
  return self->_removedPredictionCandidates;
}

- (void)setRemovedPredictionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_removedPredictionCandidates, a3);
}

- (NSArray)finalPredictionCandidates
{
  return self->_finalPredictionCandidates;
}

- (void)setFinalPredictionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_finalPredictionCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_removedPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_rawPredictionCandidates, 0);
  objc_storeStrong((id *)&self->_finalCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_removedCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_rawCompletionCandidates, 0);
  objc_storeStrong((id *)&self->_finalAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_removedAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_rawAutocorrectionCandidates, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_logText, 0);
  objc_storeStrong((id *)&self->_recordUUID, 0);
  objc_storeStrong((id *)&self->_parsedSections, 0);
}

@end
