@implementation _PSZKWFTCalendarEventConfig

- (_PSZKWFTCalendarEventConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 urlDomainsToSkip:(id)a7 maxOtherParticipants:(unint64_t)a8
{
  id v15;
  _PSZKWFTCalendarEventConfig *v16;
  _PSZKWFTCalendarEventConfig *v17;
  objc_super v19;

  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_PSZKWFTCalendarEventConfig;
  v16 = -[_PSZKWFTCalendarEventConfig init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_isEnabled = a3;
    v16->_defaultConfidenceCategory = a4;
    v16->_startSecondsFromQuery = a5;
    v16->_endSecondsFromQuery = a6;
    objc_storeStrong((id *)&v16->_urlDomainsToSkip, a7);
    v17->_maxOtherParticipants = a8;
  }

  return v17;
}

- (_PSZKWFTCalendarEventConfig)initWithIsEnabled:(BOOL)a3 defaultConfidenceCategory:(int64_t)a4
{
  return -[_PSZKWFTCalendarEventConfig initWithIsEnabled:defaultConfidenceCategory:startSecondsFromQuery:endSecondsFromQuery:urlDomainsToSkip:maxOtherParticipants:](self, "initWithIsEnabled:defaultConfidenceCategory:startSecondsFromQuery:endSecondsFromQuery:urlDomainsToSkip:maxOtherParticipants:", a3, a4, MEMORY[0x1E0C9AA60], 4, 600.0, 600.0);
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

- (NSArray)urlDomainsToSkip
{
  return self->_urlDomainsToSkip;
}

- (unint64_t)maxOtherParticipants
{
  return self->_maxOtherParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlDomainsToSkip, 0);
}

@end
