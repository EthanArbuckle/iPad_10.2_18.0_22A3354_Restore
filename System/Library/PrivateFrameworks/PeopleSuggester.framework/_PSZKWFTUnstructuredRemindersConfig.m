@implementation _PSZKWFTUnstructuredRemindersConfig

- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7
{
  _PSZKWFTUnstructuredRemindersConfig *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_PSZKWFTUnstructuredRemindersConfig;
  result = -[_PSZKWFTUnstructuredRemindersConfig init](&v13, sel_init);
  if (result)
  {
    result->_isEnabled = a3;
    result->_defaultConfidenceCategory = a4;
    result->_startSecondsFromQuery = a5;
    result->_endSecondsFromQuery = a6;
    result->_priorScoreThreshold = a7;
  }
  return result;
}

- (_PSZKWFTUnstructuredRemindersConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4
{
  double v4;

  LODWORD(v4) = 0.5;
  return -[_PSZKWFTUnstructuredRemindersConfig initWithIsEnabled:defaultConfidenceCategory:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:](self, "initWithIsEnabled:defaultConfidenceCategory:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:", a3, a4, 600.0, 600.0, v4);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)defaultConfidenceCategory
{
  return self->_defaultConfidenceCategory;
}

- (double)startSecondsFromQuery
{
  return self->_startSecondsFromQuery;
}

- (double)endSecondsFromQuery
{
  return self->_endSecondsFromQuery;
}

- (float)priorScoreThreshold
{
  return self->_priorScoreThreshold;
}

@end
