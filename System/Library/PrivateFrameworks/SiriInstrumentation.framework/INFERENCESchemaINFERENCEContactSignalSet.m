@implementation INFERENCESchemaINFERENCEContactSignalSet

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)INFERENCESchemaINFERENCEContactSignalSet;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v24, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCEContactSignalSet deleteSpeechAlternativeRanks](self, "deleteSpeechAlternativeRanks");
  -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCEContactSignalSet deleteHistoryStats](self, "deleteHistoryStats");
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[INFERENCESchemaINFERENCEContactSignalSet deleteHistoryStatsInSameDomain](self, "deleteHistoryStatsInSameDomain");
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[INFERENCESchemaINFERENCEContactSignalSet deleteHistoryStatsInSiriRequests](self, "deleteHistoryStatsInSiriRequests");
  -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[INFERENCESchemaINFERENCEContactSignalSet deleteRequestMatchSignalSet](self, "deleteRequestMatchSignalSet");
  -[INFERENCESchemaINFERENCEContactSignalSet handlesWithPrivacySignalSets](self, "handlesWithPrivacySignalSets");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v21, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCEContactSignalSet setHandlesWithPrivacySignalSets:](self, "setHandlesWithPrivacySignalSets:", v22);

  return v5;
}

- (BOOL)hasSpeechAlternativeRanks
{
  return self->_speechAlternativeRanks != 0;
}

- (void)deleteSpeechAlternativeRanks
{
  -[INFERENCESchemaINFERENCEContactSignalSet setSpeechAlternativeRanks:](self, "setSpeechAlternativeRanks:", 0);
}

- (void)setIsQueryStrippedOfTitles:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 1u;
  self->_isQueryStrippedOfTitles = a3;
}

- (BOOL)hasIsQueryStrippedOfTitles
{
  return *(_DWORD *)(&self->_isAsrE3Signal + 1) & 1;
}

- (void)setHasIsQueryStrippedOfTitles:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFE | a3;
}

- (void)deleteIsQueryStrippedOfTitles
{
  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfTitles:](self, "setIsQueryStrippedOfTitles:", 0);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) &= ~1u;
}

- (void)setIsSuggestedContact:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 2u;
  self->_isSuggestedContact = a3;
}

- (BOOL)hasIsSuggestedContact
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 1) & 1;
}

- (void)setHasIsSuggestedContact:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 2;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFD | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFD | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsSuggestedContact
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsSuggestedContact:](self, "setIsSuggestedContact:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFFD;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setAreAllQueryTokensInContact:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 4u;
  self->_areAllQueryTokensInContact = a3;
}

- (BOOL)hasAreAllQueryTokensInContact
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 2) & 1;
}

- (void)setHasAreAllQueryTokensInContact:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 4;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFB | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFFB | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteAreAllQueryTokensInContact
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setAreAllQueryTokensInContact:](self, "setAreAllQueryTokensInContact:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFFB;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 8u;
  self->_areAllPrimaryContactTokensInQuery = a3;
}

- (BOOL)hasAreAllPrimaryContactTokensInQuery
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 3) & 1;
}

- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 8;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFF7 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFF7 | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteAreAllPrimaryContactTokensInQuery
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setAreAllPrimaryContactTokensInQuery:](self, "setAreAllPrimaryContactTokensInQuery:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFF7;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsHypocorism:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10u;
  self->_isHypocorism = a3;
}

- (BOOL)hasIsHypocorism
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 4) & 1;
}

- (void)setHasIsHypocorism:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 16;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFEF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFEF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsHypocorism
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsHypocorism:](self, "setIsHypocorism:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFEF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasSuggestedProperties:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20u;
  self->_hasSuggestedProperties = a3;
}

- (BOOL)hasHasSuggestedProperties
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 5) & 1;
}

- (void)setHasHasSuggestedProperties:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 32;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFDF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteHasSuggestedProperties
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setHasSuggestedProperties:](self, "setHasSuggestedProperties:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFDF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsPartialNameMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40u;
  self->_isPartialNameMatch = a3;
}

- (BOOL)hasIsPartialNameMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 6) & 1;
}

- (void)setHasIsPartialNameMatch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 64;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFFBF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsPartialNameMatch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsPartialNameMatch:](self, "setIsPartialNameMatch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFFBF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsFromStandardSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80u;
  self->_isFromStandardSearch = a3;
}

- (BOOL)hasIsFromStandardSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 7) & 1;
}

- (void)setHasIsFromStandardSearch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 128;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFF7F | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFF7F | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsFromStandardSearch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsFromStandardSearch:](self, "setIsFromStandardSearch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFF7F;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsFromNLXSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x100u;
  self->_isFromNLXSearch = a3;
}

- (BOOL)hasIsFromNLXSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 8) & 1;
}

- (void)setHasIsFromNLXSearch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 256;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFEFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsFromNLXSearch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsFromNLXSearch:](self, "setIsFromNLXSearch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFEFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsFromSRRSearch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x200u;
  self->_isFromSRRSearch = a3;
}

- (BOOL)hasIsFromSRRSearch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 9) & 1;
}

- (void)setHasIsFromSRRSearch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 512;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFDFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsFromSRRSearch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsFromSRRSearch:](self, "setIsFromSRRSearch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFFDFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setNlxScore:(float)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x400u;
  self->_nlxScore = a3;
}

- (BOOL)hasNlxScore
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 10) & 1;
}

- (void)setHasNlxScore:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFFBFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteNlxScore
{
  double v2;
  uint64_t v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactSignalSet setNlxScore:](self, "setNlxScore:", v2);
  v4 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v5 = v4 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v4 & 0xFFFFFBFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v5);
}

- (void)setSrrScore:(float)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x800u;
  self->_srrScore = a3;
}

- (BOOL)hasSrrScore
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 11) & 1;
}

- (void)setHasSrrScore:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFF7FF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFF7FF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteSrrScore
{
  double v2;
  uint64_t v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactSignalSet setSrrScore:](self, "setSrrScore:", v2);
  v4 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v5 = v4 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v4 & 0xFFFFF7FF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v5);
}

- (void)setIsRecent:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x1000u;
  self->_isRecent = a3;
}

- (BOOL)hasIsRecent
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 12) & 1;
}

- (void)setHasIsRecent:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFEFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFEFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsRecent
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsRecent:](self, "setIsRecent:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFEFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsRecentInSameDomain:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x2000u;
  self->_isRecentInSameDomain = a3;
}

- (BOOL)hasIsRecentInSameDomain
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 13) & 1;
}

- (void)setHasIsRecentInSameDomain:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFDFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFDFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsRecentInSameDomain
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSameDomain:](self, "setIsRecentInSameDomain:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFDFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsRecentInSiriRequest:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x4000u;
  self->_isRecentInSiriRequest = a3;
}

- (BOOL)hasIsRecentInSiriRequest
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 14) & 1;
}

- (void)setHasIsRecentInSiriRequest:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFFBFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsRecentInSiriRequest
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSiriRequest:](self, "setIsRecentInSiriRequest:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFFBFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsRecentlyCorrected:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x8000u;
  self->_isRecentlyCorrected = a3;
}

- (BOOL)hasIsRecentlyCorrected
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 15) & 1;
}

- (void)setHasIsRecentlyCorrected:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFF7FFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFF7FFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsRecentlyCorrected
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentlyCorrected:](self, "setIsRecentlyCorrected:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFF7FFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setRecencyRank:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10000u;
  self->_recencyRank = a3;
}

- (BOOL)hasRecencyRank
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 16) & 1;
}

- (void)setHasRecencyRank:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFEFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFEFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteRecencyRank
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRank:](self, "setRecencyRank:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFEFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setRecencyRankInSameDomain:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20000u;
  self->_recencyRankInSameDomain = a3;
}

- (BOOL)hasRecencyRankInSameDomain
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 17) & 1;
}

- (void)setHasRecencyRankInSameDomain:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFDFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFDFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteRecencyRankInSameDomain
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSameDomain:](self, "setRecencyRankInSameDomain:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFDFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setRecencyRankInSiriRequest:(int)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40000u;
  self->_recencyRankInSiriRequest = a3;
}

- (BOOL)hasRecencyRankInSiriRequest
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 18) & 1;
}

- (void)setHasRecencyRankInSiriRequest:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFBFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFFBFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteRecencyRankInSiriRequest
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSiriRequest:](self, "setRecencyRankInSiriRequest:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFFBFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasHistoryStats
{
  return self->_historyStats != 0;
}

- (void)deleteHistoryStats
{
  -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStats:](self, "setHistoryStats:", 0);
}

- (BOOL)hasHistoryStatsInSameDomain
{
  return self->_historyStatsInSameDomain != 0;
}

- (void)deleteHistoryStatsInSameDomain
{
  -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStatsInSameDomain:](self, "setHistoryStatsInSameDomain:", 0);
}

- (BOOL)hasHistoryStatsInSiriRequests
{
  return self->_historyStatsInSiriRequests != 0;
}

- (void)deleteHistoryStatsInSiriRequests
{
  -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStatsInSiriRequests:](self, "setHistoryStatsInSiriRequests:", 0);
}

- (void)setIsMeCard:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80000u;
  self->_isMeCard = a3;
}

- (BOOL)hasIsMeCard
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 19) & 1;
}

- (void)setHasIsMeCard:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFF7FFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFF7FFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsMeCard
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCard:](self, "setIsMeCard:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFF7FFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsMeCardRelation:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x100000u;
  self->_isMeCardRelation = a3;
}

- (BOOL)hasIsMeCardRelation
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 20) & 1;
}

- (void)setHasIsMeCardRelation:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFEFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFEFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsMeCardRelation
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelation:](self, "setIsMeCardRelation:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFEFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsMeCardRelationExactMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x200000u;
  self->_isMeCardRelationExactMatch = a3;
}

- (BOOL)hasIsMeCardRelationExactMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 21) & 1;
}

- (void)setHasIsMeCardRelationExactMatch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFDFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFDFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsMeCardRelationExactMatch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelationExactMatch:](self, "setIsMeCardRelationExactMatch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFDFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsRelationAlias:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x400000u;
  self->_isRelationAlias = a3;
}

- (BOOL)hasIsRelationAlias
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 22) & 1;
}

- (void)setHasIsRelationAlias:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFFBFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsRelationAlias
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsRelationAlias:](self, "setIsRelationAlias:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFFBFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setAreQueryDiacriticsRemoved:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x800000u;
  self->_areQueryDiacriticsRemoved = a3;
}

- (BOOL)hasAreQueryDiacriticsRemoved
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 23) & 1;
}

- (void)setHasAreQueryDiacriticsRemoved:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFF7FFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteAreQueryDiacriticsRemoved
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setAreQueryDiacriticsRemoved:](self, "setAreQueryDiacriticsRemoved:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFF7FFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x1000000u;
  self->_isQueryNameDerivedFromRelationshipLabel = a3;
}

- (BOOL)hasIsQueryNameDerivedFromRelationshipLabel
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 24) & 1;
}

- (void)setHasIsQueryNameDerivedFromRelationshipLabel:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFEFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryNameDerivedFromRelationshipLabel
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNameDerivedFromRelationshipLabel:](self, "setIsQueryNameDerivedFromRelationshipLabel:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFEFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsQueryRelationshipLabelDerivedFromName:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x2000000u;
  self->_isQueryRelationshipLabelDerivedFromName = a3;
}

- (BOOL)hasIsQueryRelationshipLabelDerivedFromName
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 25) & 1;
}

- (void)setHasIsQueryRelationshipLabelDerivedFromName:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFDFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFDFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryRelationshipLabelDerivedFromName
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryRelationshipLabelDerivedFromName:](self, "setIsQueryRelationshipLabelDerivedFromName:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFDFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsThirdPartyMatch:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x4000000u;
  self->_isThirdPartyMatch = a3;
}

- (BOOL)hasIsThirdPartyMatch
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 26) & 1;
}

- (void)setHasIsThirdPartyMatch:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xFBFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsThirdPartyMatch
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsThirdPartyMatch:](self, "setIsThirdPartyMatch:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xFBFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x8000000u;
  self->_isFavorite = a3;
}

- (BOOL)hasIsFavorite
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 27) & 1;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xF7FFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xF7FFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsFavorite
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsFavorite:](self, "setIsFavorite:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xF7FFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsTransliterated:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x10000000u;
  self->_isTransliterated = a3;
}

- (BOOL)hasIsTransliterated
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 28) & 1;
}

- (void)setHasIsTransliterated:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xEFFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsTransliterated
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsTransliterated:](self, "setIsTransliterated:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xEFFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasRequestMatchSignalSet
{
  return self->_requestMatchSignalSet != 0;
}

- (void)deleteRequestMatchSignalSet
{
  -[INFERENCESchemaINFERENCEContactSignalSet setRequestMatchSignalSet:](self, "setRequestMatchSignalSet:", 0);
}

- (void)clearHandlesWithPrivacySignalSets
{
  -[NSArray removeAllObjects](self->_handlesWithPrivacySignalSets, "removeAllObjects");
}

- (void)addHandlesWithPrivacySignalSets:(id)a3
{
  id v4;
  NSArray *handlesWithPrivacySignalSets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  handlesWithPrivacySignalSets = self->_handlesWithPrivacySignalSets;
  v8 = v4;
  if (!handlesWithPrivacySignalSets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_handlesWithPrivacySignalSets;
    self->_handlesWithPrivacySignalSets = v6;

    v4 = v8;
    handlesWithPrivacySignalSets = self->_handlesWithPrivacySignalSets;
  }
  -[NSArray addObject:](handlesWithPrivacySignalSets, "addObject:", v4);

}

- (unint64_t)handlesWithPrivacySignalSetsCount
{
  return -[NSArray count](self->_handlesWithPrivacySignalSets, "count");
}

- (id)handlesWithPrivacySignalSetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_handlesWithPrivacySignalSets, "objectAtIndexedSubscript:", a3);
}

- (void)setHasHandleWithPreferredType:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x20000000u;
  self->_hasHandleWithPreferredType = a3;
}

- (BOOL)hasHasHandleWithPreferredType
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 29) & 1;
}

- (void)setHasHasHandleWithPreferredType:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xDFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xDFFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteHasHandleWithPreferredType
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithPreferredType:](self, "setHasHandleWithPreferredType:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xDFFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setHasHandleWithAllowedType:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x40000000u;
  self->_hasHandleWithAllowedType = a3;
}

- (BOOL)hasHasHandleWithAllowedType
{
  return ((unint64_t)*(unsigned int *)(&self->_isAsrE3Signal + 1) >> 30) & 1;
}

- (void)setHasHasHandleWithAllowedType:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0xBFFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteHasHandleWithAllowedType
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithAllowedType:](self, "setHasHandleWithAllowedType:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0xBFFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsCommunalRequest:(BOOL)a3
{
  *(_DWORD *)(&self->_isAsrE3Signal + 1) |= 0x80000000;
  self->_isCommunalRequest = a3;
}

- (BOOL)hasIsCommunalRequest
{
  return *(_DWORD *)(&self->_isAsrE3Signal + 1) >> 31;
}

- (void)setHasIsCommunalRequest:(BOOL)a3
{
  unsigned int v3;
  unint64_t v4;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  v4 = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x7FFFFFFF | v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsCommunalRequest
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsCommunalRequest:](self, "setIsCommunalRequest:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = v3 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3 & 0x7FFFFFFF;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setFractionOfCommunalDevicesMatchingCandidate:(float)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x100000000) >> 32;
  self->_fractionOfCommunalDevicesMatchingCandidate = a3;
}

- (BOOL)hasFractionOfCommunalDevicesMatchingCandidate
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasFractionOfCommunalDevicesMatchingCandidate:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteFractionOfCommunalDevicesMatchingCandidate
{
  double v2;
  uint64_t v4;
  unint64_t v5;

  LODWORD(v2) = 0;
  -[INFERENCESchemaINFERENCEContactSignalSet setFractionOfCommunalDevicesMatchingCandidate:](self, "setFractionOfCommunalDevicesMatchingCandidate:", v2);
  v4 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v5 = (v4 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v4;
  *((_BYTE *)&self->_has + 1) = BYTE4(v5);
}

- (void)setIsPlusSignal:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x200000000) >> 32;
  self->_isPlusSignal = a3;
}

- (BOOL)hasIsPlusSignal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasIsPlusSignal:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsPlusSignal
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsPlusSignal:](self, "setIsPlusSignal:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsOnlyCandidate:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x400000000) >> 32;
  self->_isOnlyCandidate = a3;
}

- (BOOL)hasIsOnlyCandidate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasIsOnlyCandidate:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsOnlyCandidate
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsOnlyCandidate:](self, "setIsOnlyCandidate:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (BOOL)hasThirdPartyAppBundleId
{
  return self->_thirdPartyAppBundleId != 0;
}

- (void)deleteThirdPartyAppBundleId
{
  -[INFERENCESchemaINFERENCEContactSignalSet setThirdPartyAppBundleId:](self, "setThirdPartyAppBundleId:", 0);
}

- (void)setIsQueryNormalized:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x800000000) >> 32;
  self->_isQueryNormalized = a3;
}

- (BOOL)hasIsQueryNormalized
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasIsQueryNormalized:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryNormalized
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNormalized:](self, "setIsQueryNormalized:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsQueryStrippedOfPunctuation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x1000000000) >> 32;
  self->_isQueryStrippedOfPunctuation = a3;
}

- (BOOL)hasIsQueryStrippedOfPunctuation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasIsQueryStrippedOfPunctuation:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryStrippedOfPunctuation
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfPunctuation:](self, "setIsQueryStrippedOfPunctuation:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsQueryStrippedOfWhitespace:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x2000000000) >> 32;
  self->_isQueryStrippedOfWhitespace = a3;
}

- (BOOL)hasIsQueryStrippedOfWhitespace
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasIsQueryStrippedOfWhitespace:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryStrippedOfWhitespace
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfWhitespace:](self, "setIsQueryStrippedOfWhitespace:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsQueryStrippedOfSymbols:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x4000000000) >> 32;
  self->_isQueryStrippedOfSymbols = a3;
}

- (BOOL)hasIsQueryStrippedOfSymbols
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasIsQueryStrippedOfSymbols:(BOOL)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  v4 = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v3;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)deleteIsQueryStrippedOfSymbols
{
  uint64_t v3;
  unint64_t v4;

  -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfSymbols:](self, "setIsQueryStrippedOfSymbols:", 0);
  v3 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v4 = (v3 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)(&self->_isAsrE3Signal + 1) = v3;
  *((_BYTE *)&self->_has + 1) = BYTE4(v4);
}

- (void)setIsAsrE3Signal:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = (*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32) | 0x8000000000) >> 32;
  self->_isAsrE3Signal = a3;
}

- (BOOL)hasIsAsrE3Signal
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasIsAsrE3Signal:(BOOL)a3
{
  unint64_t v3;

  v3 = 0xFFFFFF8000000000;
  if (!a3)
    v3 = 0;
  *((_BYTE *)&self->_has + 1) = (v3 & 0xFFFFFF80FFFFFFFFLL | ((unint64_t)(*((_BYTE *)&self->_has + 1) & 0x7F) << 32)) >> 32;
}

- (void)deleteIsAsrE3Signal
{
  -[INFERENCESchemaINFERENCEContactSignalSet setIsAsrE3Signal:](self, "setIsAsrE3Signal:", 0);
  *((_BYTE *)&self->_has + 1) &= ~0x80u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return INFERENCESchemaINFERENCEContactSignalSetReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0)
        goto LABEL_6;
      goto LABEL_66;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0)
      goto LABEL_7;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_14:
    if ((v7 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteFloatField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x800) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteFloatField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x2000) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x4000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x8000) == 0)
  {
LABEL_19:
    if ((v7 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x10000) == 0)
  {
LABEL_20:
    if ((v7 & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  v7 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v7 & 0x20000) == 0)
  {
LABEL_21:
    if ((v7 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40000) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    if ((v14 & 0x100000) == 0)
    {
LABEL_31:
      if ((v14 & 0x200000) == 0)
        goto LABEL_32;
      goto LABEL_85;
    }
  }
  else if ((v14 & 0x100000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x200000) == 0)
  {
LABEL_32:
    if ((v14 & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x400000) == 0)
  {
LABEL_33:
    if ((v14 & 0x800000) == 0)
      goto LABEL_34;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x800000) == 0)
  {
LABEL_34:
    if ((v14 & 0x1000000) == 0)
      goto LABEL_35;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v14 & 0x2000000) == 0)
      goto LABEL_36;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v14 & 0x4000000) == 0)
      goto LABEL_37;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x4000000) == 0)
  {
LABEL_37:
    if ((v14 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v14 & 0x10000000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x10000000) != 0)
LABEL_39:
    PBDataWriterWriteBOOLField();
LABEL_40:
  -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_handlesWithPrivacySignalSets;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  v22 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v23 = v22 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v22 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v26 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    v23 = v26 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v26 & 0x40000000) == 0)
    {
LABEL_51:
      if ((v23 & 0x80000000) == 0)
        goto LABEL_52;
      goto LABEL_95;
    }
  }
  else if ((v22 & 0x40000000) == 0)
  {
    goto LABEL_51;
  }
  PBDataWriterWriteBOOLField();
  v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000000) == 0)
  {
LABEL_52:
    if ((v23 & 0x100000000) == 0)
      goto LABEL_53;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v23 & 0x100000000) == 0)
  {
LABEL_53:
    if ((v23 & 0x200000000) == 0)
      goto LABEL_54;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteFloatField();
  v23 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v23 & 0x200000000) == 0)
  {
LABEL_54:
    if ((v23 & 0x400000000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x400000000) != 0)
LABEL_55:
    PBDataWriterWriteBOOLField();
LABEL_56:
  -[INFERENCESchemaINFERENCEContactSignalSet thirdPartyAppBundleId](self, "thirdPartyAppBundleId", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x800000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v25 & 0x1000000000) == 0)
    {
LABEL_60:
      if ((v25 & 0x2000000000) == 0)
        goto LABEL_61;
      goto LABEL_101;
    }
  }
  else if ((v25 & 0x1000000000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteBOOLField();
  v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x2000000000) == 0)
  {
LABEL_61:
    if ((v25 & 0x4000000000) == 0)
      goto LABEL_62;
LABEL_102:
    PBDataWriterWriteBOOLField();
    if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x8000000000) == 0)
      goto LABEL_63;
LABEL_103:
    PBDataWriterWriteBOOLField();
    goto LABEL_63;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  v25 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v25 & 0x4000000000) != 0)
    goto LABEL_102;
LABEL_62:
  if ((v25 & 0x8000000000) != 0)
    goto LABEL_103;
LABEL_63:

}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int isQueryStrippedOfTitles;
  int v15;
  int isSuggestedContact;
  int v17;
  int areAllQueryTokensInContact;
  int v19;
  int areAllPrimaryContactTokensInQuery;
  int v21;
  int isHypocorism;
  int v23;
  int hasSuggestedProperties;
  int v25;
  int isPartialNameMatch;
  int v27;
  int isFromStandardSearch;
  int v29;
  int isFromNLXSearch;
  int v31;
  int isFromSRRSearch;
  int v33;
  float nlxScore;
  float v35;
  int v36;
  float srrScore;
  float v38;
  int v39;
  int isRecent;
  int v41;
  int isRecentInSameDomain;
  int v43;
  int isRecentInSiriRequest;
  int v45;
  int isRecentlyCorrected;
  int v47;
  int recencyRank;
  int v49;
  int recencyRankInSameDomain;
  int v51;
  int recencyRankInSiriRequest;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  int isMeCard;
  int v72;
  int isMeCardRelation;
  int v74;
  int isMeCardRelationExactMatch;
  int v76;
  int isRelationAlias;
  int v78;
  int areQueryDiacriticsRemoved;
  int v80;
  int isQueryNameDerivedFromRelationshipLabel;
  int v82;
  int isQueryRelationshipLabelDerivedFromName;
  int v84;
  int isThirdPartyMatch;
  int v86;
  int isFavorite;
  int v88;
  int isTransliterated;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  int hasHandleWithPreferredType;
  unsigned int v106;
  int hasHandleWithAllowedType;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  int isCommunalRequest;
  int v115;
  float fractionOfCommunalDevicesMatchingCandidate;
  float v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  int isPlusSignal;
  int v122;
  int isOnlyCandidate;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  BOOL v129;
  uint64_t v131;
  unsigned int v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  int isQueryNormalized;
  unsigned int v141;
  uint64_t v142;
  int isQueryStrippedOfPunctuation;
  unsigned int v144;
  uint64_t v145;
  int isQueryStrippedOfWhitespace;
  unsigned int v147;
  uint64_t v148;
  int isQueryStrippedOfSymbols;
  int isAsrE3Signal;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_176;
  -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechAlternativeRanks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechAlternativeRanks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_176;
  }
  else
  {

  }
  v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  v13 = *(_DWORD *)(v4 + 141);
  if ((v12 & 1) != (v13 & 1))
    goto LABEL_176;
  if ((v12 & 1) != 0)
  {
    isQueryStrippedOfTitles = self->_isQueryStrippedOfTitles;
    if (isQueryStrippedOfTitles != objc_msgSend(v4, "isQueryStrippedOfTitles"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v15 = (v12 >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_176;
  if (v15)
  {
    isSuggestedContact = self->_isSuggestedContact;
    if (isSuggestedContact != objc_msgSend(v4, "isSuggestedContact"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v17 = (v12 >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_176;
  if (v17)
  {
    areAllQueryTokensInContact = self->_areAllQueryTokensInContact;
    if (areAllQueryTokensInContact != objc_msgSend(v4, "areAllQueryTokensInContact"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v19 = (v12 >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_176;
  if (v19)
  {
    areAllPrimaryContactTokensInQuery = self->_areAllPrimaryContactTokensInQuery;
    if (areAllPrimaryContactTokensInQuery != objc_msgSend(v4, "areAllPrimaryContactTokensInQuery"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v21 = (v12 >> 4) & 1;
  if (v21 != ((v13 >> 4) & 1))
    goto LABEL_176;
  if (v21)
  {
    isHypocorism = self->_isHypocorism;
    if (isHypocorism != objc_msgSend(v4, "isHypocorism"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v23 = (v12 >> 5) & 1;
  if (v23 != ((v13 >> 5) & 1))
    goto LABEL_176;
  if (v23)
  {
    hasSuggestedProperties = self->_hasSuggestedProperties;
    if (hasSuggestedProperties != objc_msgSend(v4, "hasSuggestedProperties"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v25 = (v12 >> 6) & 1;
  if (v25 != ((v13 >> 6) & 1))
    goto LABEL_176;
  if (v25)
  {
    isPartialNameMatch = self->_isPartialNameMatch;
    if (isPartialNameMatch != objc_msgSend(v4, "isPartialNameMatch"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v27 = (v12 >> 7) & 1;
  if (v27 != ((v13 >> 7) & 1))
    goto LABEL_176;
  if (v27)
  {
    isFromStandardSearch = self->_isFromStandardSearch;
    if (isFromStandardSearch != objc_msgSend(v4, "isFromStandardSearch"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v29 = (v12 >> 8) & 1;
  if (v29 != ((v13 >> 8) & 1))
    goto LABEL_176;
  if (v29)
  {
    isFromNLXSearch = self->_isFromNLXSearch;
    if (isFromNLXSearch != objc_msgSend(v4, "isFromNLXSearch"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v31 = (v12 >> 9) & 1;
  if (v31 != ((v13 >> 9) & 1))
    goto LABEL_176;
  if (v31)
  {
    isFromSRRSearch = self->_isFromSRRSearch;
    if (isFromSRRSearch != objc_msgSend(v4, "isFromSRRSearch"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v33 = (v12 >> 10) & 1;
  if (v33 != ((v13 >> 10) & 1))
    goto LABEL_176;
  if (v33)
  {
    nlxScore = self->_nlxScore;
    objc_msgSend(v4, "nlxScore");
    if (nlxScore != v35)
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v36 = (v12 >> 11) & 1;
  if (v36 != ((v13 >> 11) & 1))
    goto LABEL_176;
  if (v36)
  {
    srrScore = self->_srrScore;
    objc_msgSend(v4, "srrScore");
    if (srrScore != v38)
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v39 = (v12 >> 12) & 1;
  if (v39 != ((v13 >> 12) & 1))
    goto LABEL_176;
  if (v39)
  {
    isRecent = self->_isRecent;
    if (isRecent != objc_msgSend(v4, "isRecent"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v41 = (v12 >> 13) & 1;
  if (v41 != ((v13 >> 13) & 1))
    goto LABEL_176;
  if (v41)
  {
    isRecentInSameDomain = self->_isRecentInSameDomain;
    if (isRecentInSameDomain != objc_msgSend(v4, "isRecentInSameDomain"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v43 = (v12 >> 14) & 1;
  if (v43 != ((v13 >> 14) & 1))
    goto LABEL_176;
  if (v43)
  {
    isRecentInSiriRequest = self->_isRecentInSiriRequest;
    if (isRecentInSiriRequest != objc_msgSend(v4, "isRecentInSiriRequest"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v45 = (v12 >> 15) & 1;
  if (v45 != ((v13 >> 15) & 1))
    goto LABEL_176;
  if (v45)
  {
    isRecentlyCorrected = self->_isRecentlyCorrected;
    if (isRecentlyCorrected != objc_msgSend(v4, "isRecentlyCorrected"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v47 = HIWORD(v12) & 1;
  if (v47 != (HIWORD(v13) & 1))
    goto LABEL_176;
  if (v47)
  {
    recencyRank = self->_recencyRank;
    if (recencyRank != objc_msgSend(v4, "recencyRank"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v49 = (v12 >> 17) & 1;
  if (v49 != ((v13 >> 17) & 1))
    goto LABEL_176;
  if (v49)
  {
    recencyRankInSameDomain = self->_recencyRankInSameDomain;
    if (recencyRankInSameDomain != objc_msgSend(v4, "recencyRankInSameDomain"))
      goto LABEL_176;
    v12 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v13 = *(_DWORD *)(v4 + 141);
  }
  v51 = (v12 >> 18) & 1;
  if (v51 != ((v13 >> 18) & 1))
    goto LABEL_176;
  if (v51)
  {
    recencyRankInSiriRequest = self->_recencyRankInSiriRequest;
    if (recencyRankInSiriRequest != objc_msgSend(v4, "recencyRankInSiriRequest"))
      goto LABEL_176;
  }
  -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "historyStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "historyStats");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_176;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "historyStatsInSameDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "historyStatsInSameDomain");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_176;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "historyStatsInSiriRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "historyStatsInSiriRequests");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_176;
  }
  else
  {

  }
  v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  v69 = (v68 >> 19) & 1;
  v70 = *(_DWORD *)(v4 + 141);
  if (v69 != ((v70 >> 19) & 1))
    goto LABEL_176;
  if (v69)
  {
    isMeCard = self->_isMeCard;
    if (isMeCard != objc_msgSend(v4, "isMeCard"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v72 = (v68 >> 20) & 1;
  if (v72 != ((v70 >> 20) & 1))
    goto LABEL_176;
  if (v72)
  {
    isMeCardRelation = self->_isMeCardRelation;
    if (isMeCardRelation != objc_msgSend(v4, "isMeCardRelation"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v74 = (v68 >> 21) & 1;
  if (v74 != ((v70 >> 21) & 1))
    goto LABEL_176;
  if (v74)
  {
    isMeCardRelationExactMatch = self->_isMeCardRelationExactMatch;
    if (isMeCardRelationExactMatch != objc_msgSend(v4, "isMeCardRelationExactMatch"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v76 = (v68 >> 22) & 1;
  if (v76 != ((v70 >> 22) & 1))
    goto LABEL_176;
  if (v76)
  {
    isRelationAlias = self->_isRelationAlias;
    if (isRelationAlias != objc_msgSend(v4, "isRelationAlias"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v78 = (v68 >> 23) & 1;
  if (v78 != ((v70 >> 23) & 1))
    goto LABEL_176;
  if (v78)
  {
    areQueryDiacriticsRemoved = self->_areQueryDiacriticsRemoved;
    if (areQueryDiacriticsRemoved != objc_msgSend(v4, "areQueryDiacriticsRemoved"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v80 = HIBYTE(v68) & 1;
  if (v80 != (HIBYTE(v70) & 1))
    goto LABEL_176;
  if (v80)
  {
    isQueryNameDerivedFromRelationshipLabel = self->_isQueryNameDerivedFromRelationshipLabel;
    if (isQueryNameDerivedFromRelationshipLabel != objc_msgSend(v4, "isQueryNameDerivedFromRelationshipLabel"))goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v82 = (v68 >> 25) & 1;
  if (v82 != ((v70 >> 25) & 1))
    goto LABEL_176;
  if (v82)
  {
    isQueryRelationshipLabelDerivedFromName = self->_isQueryRelationshipLabelDerivedFromName;
    if (isQueryRelationshipLabelDerivedFromName != objc_msgSend(v4, "isQueryRelationshipLabelDerivedFromName"))goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v84 = (v68 >> 26) & 1;
  if (v84 != ((v70 >> 26) & 1))
    goto LABEL_176;
  if (v84)
  {
    isThirdPartyMatch = self->_isThirdPartyMatch;
    if (isThirdPartyMatch != objc_msgSend(v4, "isThirdPartyMatch"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v86 = (v68 >> 27) & 1;
  if (v86 != ((v70 >> 27) & 1))
    goto LABEL_176;
  if (v86)
  {
    isFavorite = self->_isFavorite;
    if (isFavorite != objc_msgSend(v4, "isFavorite"))
      goto LABEL_176;
    v68 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
    v70 = *(_DWORD *)(v4 + 141);
  }
  v88 = (v68 >> 28) & 1;
  if (v88 != ((v70 >> 28) & 1))
    goto LABEL_176;
  if (v88)
  {
    isTransliterated = self->_isTransliterated;
    if (isTransliterated != objc_msgSend(v4, "isTransliterated"))
      goto LABEL_176;
  }
  -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestMatchSignalSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestMatchSignalSet");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqual:", v93);

    if (!v94)
      goto LABEL_176;
  }
  else
  {

  }
  -[INFERENCESchemaINFERENCEContactSignalSet handlesWithPrivacySignalSets](self, "handlesWithPrivacySignalSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlesWithPrivacySignalSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_175;
  -[INFERENCESchemaINFERENCEContactSignalSet handlesWithPrivacySignalSets](self, "handlesWithPrivacySignalSets");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    -[INFERENCESchemaINFERENCEContactSignalSet handlesWithPrivacySignalSets](self, "handlesWithPrivacySignalSets");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handlesWithPrivacySignalSets");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v97, "isEqual:", v98);

    if (!v99)
      goto LABEL_176;
  }
  else
  {

  }
  v100 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v101 = (v100 >> 29) & 1;
  v102 = *(unsigned int *)(v4 + 141);
  if (v101 != ((v102 >> 29) & 1))
    goto LABEL_176;
  if (v101)
  {
    hasHandleWithPreferredType = self->_hasHandleWithPreferredType;
    if (hasHandleWithPreferredType != objc_msgSend(v4, "hasHandleWithPreferredType"))
      goto LABEL_176;
    v103 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    v102 = *(unsigned int *)(v4 + 141);
    v104 = v102 | ((unint64_t)v4[145] << 32);
    LODWORD(v100) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  }
  else
  {
    v103 = v100 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    v104 = v102 | ((unint64_t)v4[145] << 32);
  }
  v106 = (v100 >> 30) & 1;
  if (v106 != ((v102 >> 30) & 1))
    goto LABEL_176;
  if (v106)
  {
    hasHandleWithAllowedType = self->_hasHandleWithAllowedType;
    if (hasHandleWithAllowedType != objc_msgSend(v4, "hasHandleWithAllowedType"))
      goto LABEL_176;
    v103 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    v104 = *(unsigned int *)(v4 + 141) | ((unint64_t)v4[145] << 32);
  }
  if (((v104 ^ v103) & 0x80000000) != 0)
    goto LABEL_176;
  if ((v103 & 0x80000000) != 0)
  {
    isCommunalRequest = self->_isCommunalRequest;
    if (isCommunalRequest != objc_msgSend(v4, "isCommunalRequest"))
      goto LABEL_176;
    v108 = v4[145];
    LODWORD(v109) = v108 >> 1;
    v111 = *((unsigned __int8 *)&self->_has + 1);
    LODWORD(v112) = v111 >> 1;
    LODWORD(v110) = v108 >> 2;
    LODWORD(v113) = v111 >> 2;
  }
  else
  {
    LOBYTE(v108) = BYTE4(v104);
    v109 = (v104 >> 33) & 0x7F;
    v110 = (v104 >> 34) & 0x3F;
    LOBYTE(v111) = BYTE4(v103);
    v112 = (v103 >> 33) & 0x7F;
    v113 = (v103 >> 34) & 0x3F;
  }
  v115 = v111 & 1;
  if (v115 != (v108 & 1))
    goto LABEL_176;
  if (v115)
  {
    fractionOfCommunalDevicesMatchingCandidate = self->_fractionOfCommunalDevicesMatchingCandidate;
    objc_msgSend(v4, "fractionOfCommunalDevicesMatchingCandidate");
    if (fractionOfCommunalDevicesMatchingCandidate != v117)
      goto LABEL_176;
    v118 = *((unsigned __int8 *)&self->_has + 1);
    LODWORD(v113) = v4[145];
    LODWORD(v109) = v113 >> 1;
    LODWORD(v112) = v118 >> 1;
    v119 = v118 >> 2;
    LODWORD(v110) = v113 >> 2;
    LOBYTE(v113) = v119;
  }
  v120 = v112 & 1;
  if (v120 != (v109 & 1))
    goto LABEL_176;
  if (v120)
  {
    isPlusSignal = self->_isPlusSignal;
    if (isPlusSignal != objc_msgSend(v4, "isPlusSignal"))
      goto LABEL_176;
    LODWORD(v110) = v4[145] >> 2;
    LODWORD(v113) = *((unsigned __int8 *)&self->_has + 1) >> 2;
  }
  v122 = v113 & 1;
  if (v122 != (v110 & 1))
    goto LABEL_176;
  if (v122)
  {
    isOnlyCandidate = self->_isOnlyCandidate;
    if (isOnlyCandidate != objc_msgSend(v4, "isOnlyCandidate"))
      goto LABEL_176;
  }
  -[INFERENCESchemaINFERENCEContactSignalSet thirdPartyAppBundleId](self, "thirdPartyAppBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thirdPartyAppBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_175:

    goto LABEL_176;
  }
  -[INFERENCESchemaINFERENCEContactSignalSet thirdPartyAppBundleId](self, "thirdPartyAppBundleId");
  v124 = objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    v125 = (void *)v124;
    -[INFERENCESchemaINFERENCEContactSignalSet thirdPartyAppBundleId](self, "thirdPartyAppBundleId");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thirdPartyAppBundleId");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v126, "isEqual:", v127);

    if (!v128)
      goto LABEL_176;
  }
  else
  {

  }
  v131 = *((unsigned __int8 *)&self->_has + 1);
  v132 = (v131 >> 3) & 1;
  v133 = v4[145];
  if (v132 == ((v133 >> 3) & 1))
  {
    if (v132)
    {
      isQueryNormalized = self->_isQueryNormalized;
      if (isQueryNormalized != objc_msgSend(v4, "isQueryNormalized"))
        goto LABEL_176;
      v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
      v141 = v4[145];
      LODWORD(v136) = v141 >> 4;
      LODWORD(v137) = v141 >> 5;
      LODWORD(v138) = v141 >> 6;
      LODWORD(v139) = v141 >> 7;
    }
    else
    {
      v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | (unint64_t)(v131 << 32);
      v135 = *(unsigned int *)(v4 + 141) | (unint64_t)(v133 << 32);
      v136 = v135 >> 36;
      v137 = v135 >> 37;
      v138 = v135 >> 38;
      v139 = v135 >> 39;
    }
    v142 = (v134 >> 36) & 1;
    if ((_DWORD)v142 == (v136 & 1))
    {
      if ((_DWORD)v142)
      {
        isQueryStrippedOfPunctuation = self->_isQueryStrippedOfPunctuation;
        if (isQueryStrippedOfPunctuation != objc_msgSend(v4, "isQueryStrippedOfPunctuation"))
          goto LABEL_176;
        v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
        v144 = v4[145];
        LODWORD(v137) = v144 >> 5;
        LODWORD(v138) = v144 >> 6;
        LODWORD(v139) = v144 >> 7;
      }
      v145 = (v134 >> 37) & 1;
      if ((_DWORD)v145 == (v137 & 1))
      {
        if ((_DWORD)v145)
        {
          isQueryStrippedOfWhitespace = self->_isQueryStrippedOfWhitespace;
          if (isQueryStrippedOfWhitespace != objc_msgSend(v4, "isQueryStrippedOfWhitespace"))
            goto LABEL_176;
          v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
          v147 = v4[145];
          LODWORD(v138) = v147 >> 6;
          LODWORD(v139) = v147 >> 7;
        }
        v148 = (v134 >> 38) & 1;
        if ((_DWORD)v148 == (v138 & 1))
        {
          if ((_DWORD)v148)
          {
            isQueryStrippedOfSymbols = self->_isQueryStrippedOfSymbols;
            if (isQueryStrippedOfSymbols != objc_msgSend(v4, "isQueryStrippedOfSymbols"))
              goto LABEL_176;
            v134 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
            LODWORD(v139) = v4[145] >> 7;
          }
          if ((_DWORD)v139 == ((v134 >> 39) & 1))
          {
            if ((v134 & 0x8000000000) == 0
              || (isAsrE3Signal = self->_isAsrE3Signal, isAsrE3Signal == objc_msgSend(v4, "isAsrE3Signal")))
            {
              v129 = 1;
              goto LABEL_177;
            }
          }
        }
      }
    }
  }
LABEL_176:
  v129 = 0;
LABEL_177:

  return v129;
}

- (unint64_t)hash
{
  int v3;
  float nlxScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float srrScore;
  double v11;
  long double v12;
  double v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float fractionOfCommunalDevicesMatchingCandidate;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v68 = -[INFERENCESchemaINFERENCESpeechAlternativeRanks hash](self->_speechAlternativeRanks, "hash");
  v3 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v3 & 1) != 0)
  {
    v67 = 2654435761 * self->_isQueryStrippedOfTitles;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v66 = 2654435761 * self->_isSuggestedContact;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v67 = 0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  v66 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v65 = 2654435761 * self->_areAllQueryTokensInContact;
    if ((v3 & 8) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v65 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    v64 = 2654435761 * self->_areAllPrimaryContactTokensInQuery;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v64 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    v63 = 2654435761 * self->_isHypocorism;
    if ((v3 & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v63 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    v62 = 2654435761 * self->_hasSuggestedProperties;
    if ((v3 & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v62 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    v61 = 2654435761 * self->_isPartialNameMatch;
    if ((v3 & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v61 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    v60 = 2654435761 * self->_isFromStandardSearch;
    if ((v3 & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v60 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    v59 = 2654435761 * self->_isFromNLXSearch;
    if ((v3 & 0x200) != 0)
      goto LABEL_11;
LABEL_25:
    v58 = 0;
    if ((v3 & 0x400) != 0)
      goto LABEL_12;
LABEL_26:
    v8 = 0;
    goto LABEL_29;
  }
LABEL_24:
  v59 = 0;
  if ((v3 & 0x200) == 0)
    goto LABEL_25;
LABEL_11:
  v58 = 2654435761 * self->_isFromSRRSearch;
  if ((v3 & 0x400) == 0)
    goto LABEL_26;
LABEL_12:
  nlxScore = self->_nlxScore;
  v5 = nlxScore;
  if (nlxScore < 0.0)
    v5 = -nlxScore;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_29:
  if ((v3 & 0x800) != 0)
  {
    srrScore = self->_srrScore;
    v11 = srrScore;
    if (srrScore < 0.0)
      v11 = -srrScore;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((v3 & 0x1000) != 0)
  {
    v56 = 2654435761 * self->_isRecent;
    if ((v3 & 0x2000) != 0)
    {
LABEL_39:
      v55 = 2654435761 * self->_isRecentInSameDomain;
      if ((v3 & 0x4000) != 0)
        goto LABEL_40;
      goto LABEL_46;
    }
  }
  else
  {
    v56 = 0;
    if ((v3 & 0x2000) != 0)
      goto LABEL_39;
  }
  v55 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_40:
    v54 = 2654435761 * self->_isRecentInSiriRequest;
    if ((v3 & 0x8000) != 0)
      goto LABEL_41;
    goto LABEL_47;
  }
LABEL_46:
  v54 = 0;
  if ((v3 & 0x8000) != 0)
  {
LABEL_41:
    v53 = 2654435761 * self->_isRecentlyCorrected;
    if ((v3 & 0x10000) != 0)
      goto LABEL_42;
LABEL_48:
    v52 = 0;
    if ((v3 & 0x20000) != 0)
      goto LABEL_43;
    goto LABEL_49;
  }
LABEL_47:
  v53 = 0;
  if ((v3 & 0x10000) == 0)
    goto LABEL_48;
LABEL_42:
  v52 = 2654435761 * self->_recencyRank;
  if ((v3 & 0x20000) != 0)
  {
LABEL_43:
    v51 = 2654435761 * self->_recencyRankInSameDomain;
    goto LABEL_50;
  }
LABEL_49:
  v51 = 0;
LABEL_50:
  v57 = v9;
  if ((v3 & 0x40000) != 0)
    v50 = 2654435761 * self->_recencyRankInSiriRequest;
  else
    v50 = 0;
  v49 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats hash](self->_historyStats, "hash");
  v48 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats hash](self->_historyStatsInSameDomain, "hash");
  v47 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats hash](self->_historyStatsInSiriRequests, "hash");
  v14 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v14 & 0x80000) != 0)
  {
    v46 = 2654435761 * self->_isMeCard;
    if ((v14 & 0x100000) != 0)
    {
LABEL_55:
      v45 = 2654435761 * self->_isMeCardRelation;
      if ((v14 & 0x200000) != 0)
        goto LABEL_56;
      goto LABEL_66;
    }
  }
  else
  {
    v46 = 0;
    if ((v14 & 0x100000) != 0)
      goto LABEL_55;
  }
  v45 = 0;
  if ((v14 & 0x200000) != 0)
  {
LABEL_56:
    v44 = 2654435761 * self->_isMeCardRelationExactMatch;
    if ((v14 & 0x400000) != 0)
      goto LABEL_57;
    goto LABEL_67;
  }
LABEL_66:
  v44 = 0;
  if ((v14 & 0x400000) != 0)
  {
LABEL_57:
    v43 = 2654435761 * self->_isRelationAlias;
    if ((v14 & 0x800000) != 0)
      goto LABEL_58;
    goto LABEL_68;
  }
LABEL_67:
  v43 = 0;
  if ((v14 & 0x800000) != 0)
  {
LABEL_58:
    v42 = 2654435761 * self->_areQueryDiacriticsRemoved;
    if ((v14 & 0x1000000) != 0)
      goto LABEL_59;
    goto LABEL_69;
  }
LABEL_68:
  v42 = 0;
  if ((v14 & 0x1000000) != 0)
  {
LABEL_59:
    v41 = 2654435761 * self->_isQueryNameDerivedFromRelationshipLabel;
    if ((v14 & 0x2000000) != 0)
      goto LABEL_60;
    goto LABEL_70;
  }
LABEL_69:
  v41 = 0;
  if ((v14 & 0x2000000) != 0)
  {
LABEL_60:
    v40 = 2654435761 * self->_isQueryRelationshipLabelDerivedFromName;
    if ((v14 & 0x4000000) != 0)
      goto LABEL_61;
    goto LABEL_71;
  }
LABEL_70:
  v40 = 0;
  if ((v14 & 0x4000000) != 0)
  {
LABEL_61:
    v39 = 2654435761 * self->_isThirdPartyMatch;
    if ((v14 & 0x8000000) != 0)
      goto LABEL_62;
LABEL_72:
    v38 = 0;
    if ((v14 & 0x10000000) != 0)
      goto LABEL_63;
    goto LABEL_73;
  }
LABEL_71:
  v39 = 0;
  if ((v14 & 0x8000000) == 0)
    goto LABEL_72;
LABEL_62:
  v38 = 2654435761 * self->_isFavorite;
  if ((v14 & 0x10000000) != 0)
  {
LABEL_63:
    v37 = 2654435761 * self->_isTransliterated;
    goto LABEL_74;
  }
LABEL_73:
  v37 = 0;
LABEL_74:
  v36 = -[INFERENCESchemaINFERENCERequestMatchSignalSet hash](self->_requestMatchSignalSet, "hash");
  v35 = -[NSArray hash](self->_handlesWithPrivacySignalSets, "hash");
  v15 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v16 = v15 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v15 & 0x20000000) != 0)
  {
    v17 = 2654435761 * self->_hasHandleWithPreferredType;
    if ((v15 & 0x40000000) != 0)
    {
LABEL_76:
      v18 = 2654435761 * self->_hasHandleWithAllowedType;
      if ((v15 & 0x80000000) != 0)
        goto LABEL_77;
LABEL_84:
      v19 = 0;
      if ((v16 & 0x100000000) != 0)
        goto LABEL_78;
LABEL_85:
      v24 = 0;
      goto LABEL_88;
    }
  }
  else
  {
    v17 = 0;
    if ((v15 & 0x40000000) != 0)
      goto LABEL_76;
  }
  v18 = 0;
  if ((v15 & 0x80000000) == 0)
    goto LABEL_84;
LABEL_77:
  v19 = 2654435761 * self->_isCommunalRequest;
  if ((v16 & 0x100000000) == 0)
    goto LABEL_85;
LABEL_78:
  fractionOfCommunalDevicesMatchingCandidate = self->_fractionOfCommunalDevicesMatchingCandidate;
  v21 = fractionOfCommunalDevicesMatchingCandidate;
  if (fractionOfCommunalDevicesMatchingCandidate < 0.0)
    v21 = -fractionOfCommunalDevicesMatchingCandidate;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_88:
  if ((v16 & 0x200000000) != 0)
  {
    v25 = 2654435761 * self->_isPlusSignal;
    if ((v16 & 0x400000000) != 0)
      goto LABEL_90;
  }
  else
  {
    v25 = 0;
    if ((v16 & 0x400000000) != 0)
    {
LABEL_90:
      v26 = 2654435761 * self->_isOnlyCandidate;
      goto LABEL_93;
    }
  }
  v26 = 0;
LABEL_93:
  v27 = -[NSString hash](self->_thirdPartyAppBundleId, "hash");
  v28 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v28 & 0x800000000) != 0)
  {
    v29 = 2654435761 * self->_isQueryNormalized;
    if ((v28 & 0x1000000000) != 0)
    {
LABEL_95:
      v30 = 2654435761 * self->_isQueryStrippedOfPunctuation;
      if ((v28 & 0x2000000000) != 0)
        goto LABEL_96;
      goto LABEL_101;
    }
  }
  else
  {
    v29 = 0;
    if ((v28 & 0x1000000000) != 0)
      goto LABEL_95;
  }
  v30 = 0;
  if ((v28 & 0x2000000000) != 0)
  {
LABEL_96:
    v31 = 2654435761 * self->_isQueryStrippedOfWhitespace;
    if ((v28 & 0x4000000000) != 0)
      goto LABEL_97;
LABEL_102:
    v32 = 0;
    if ((v28 & 0x8000000000) != 0)
      goto LABEL_98;
LABEL_103:
    v33 = 0;
    return v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v8 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v17 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
  }
LABEL_101:
  v31 = 0;
  if ((v28 & 0x4000000000) == 0)
    goto LABEL_102;
LABEL_97:
  v32 = 2654435761 * self->_isQueryStrippedOfSymbols;
  if ((v28 & 0x8000000000) == 0)
    goto LABEL_103;
LABEL_98:
  v33 = 2654435761 * self->_isAsrE3Signal;
  return v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v8 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v17 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
  v5 = v4 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v4 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areAllPrimaryContactTokensInQuery](self, "areAllPrimaryContactTokensInQuery"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("areAllPrimaryContactTokensInQuery"));

    v22 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    v5 = v22 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v22 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x800000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areAllQueryTokensInContact](self, "areAllQueryTokensInContact"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("areAllQueryTokensInContact"));

  v5 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x800000) == 0)
  {
LABEL_4:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet areQueryDiacriticsRemoved](self, "areQueryDiacriticsRemoved"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("areQueryDiacriticsRemoved"));

  if (((*(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32)) & 0x100000000) != 0)
  {
LABEL_5:
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactSignalSet fractionOfCommunalDevicesMatchingCandidate](self, "fractionOfCommunalDevicesMatchingCandidate");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fractionOfCommunalDevicesMatchingCandidate"));

  }
LABEL_6:
  if (-[NSArray count](self->_handlesWithPrivacySignalSets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v9 = self->_handlesWithPrivacySignalSets;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v82 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("handlesWithPrivacySignalSets"));
  }
  v16 = &self->_isAsrE3Signal + 1;
  v17 = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v17 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasHandleWithAllowedType](self, "hasHandleWithAllowedType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("hasHandleWithAllowedType"));

    LOBYTE(v17) = *(_DWORD *)v16;
    if ((*(_DWORD *)v16 & 0x20000000) == 0)
    {
LABEL_20:
      if ((v17 & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v17 & 0x20000000) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasHandleWithPreferredType](self, "hasHandleWithPreferredType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("hasHandleWithPreferredType"));

  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x20) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet hasSuggestedProperties](self, "hasSuggestedProperties"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasSuggestedProperties"));

  }
LABEL_22:
  if (self->_historyStats)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStats](self, "historyStats");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("historyStats"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("historyStats"));

    }
  }
  if (self->_historyStatsInSameDomain)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSameDomain](self, "historyStatsInSameDomain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("historyStatsInSameDomain"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("historyStatsInSameDomain"));

    }
  }
  if (self->_historyStatsInSiriRequests)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet historyStatsInSiriRequests](self, "historyStatsInSiriRequests");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("historyStatsInSiriRequests"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("historyStatsInSiriRequests"));

    }
  }
  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isAsrE3Signal](self, "isAsrE3Signal"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isAsrE3Signal"));

    v39 = *(unsigned int *)(&self->_isAsrE3Signal + 1);
    v34 = v39 | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
    if ((v39 & 0x80000000) == 0)
    {
LABEL_46:
      if ((v34 & 0x8000000) == 0)
        goto LABEL_47;
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000000) == 0)
  {
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isCommunalRequest](self, "isCommunalRequest"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("isCommunalRequest"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x8000000) == 0)
  {
LABEL_47:
    if ((v34 & 0x100) == 0)
      goto LABEL_48;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFavorite](self, "isFavorite"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isFavorite"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x100) == 0)
  {
LABEL_48:
    if ((v34 & 0x200) == 0)
      goto LABEL_49;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromNLXSearch](self, "isFromNLXSearch"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isFromNLXSearch"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x200) == 0)
  {
LABEL_49:
    if ((v34 & 0x80) == 0)
      goto LABEL_50;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromSRRSearch](self, "isFromSRRSearch"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("isFromSRRSearch"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80) == 0)
  {
LABEL_50:
    if ((v34 & 0x10) == 0)
      goto LABEL_51;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isFromStandardSearch](self, "isFromStandardSearch"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isFromStandardSearch"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x10) == 0)
  {
LABEL_51:
    if ((v34 & 0x80000) == 0)
      goto LABEL_52;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isHypocorism](self, "isHypocorism"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("isHypocorism"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x80000) == 0)
  {
LABEL_52:
    if ((v34 & 0x100000) == 0)
      goto LABEL_53;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCard](self, "isMeCard"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("isMeCard"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x100000) == 0)
  {
LABEL_53:
    if ((v34 & 0x200000) == 0)
      goto LABEL_54;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCardRelation](self, "isMeCardRelation"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("isMeCardRelation"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x200000) == 0)
  {
LABEL_54:
    if ((v34 & 0x400000000) == 0)
      goto LABEL_55;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isMeCardRelationExactMatch](self, "isMeCardRelationExactMatch"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("isMeCardRelationExactMatch"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x400000000) == 0)
  {
LABEL_55:
    if ((v34 & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isOnlyCandidate](self, "isOnlyCandidate"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("isOnlyCandidate"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40) == 0)
  {
LABEL_56:
    if ((v34 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isPartialNameMatch](self, "isPartialNameMatch"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("isPartialNameMatch"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v34 & 0x1000000) == 0)
      goto LABEL_58;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isPlusSignal](self, "isPlusSignal"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("isPlusSignal"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x1000000) == 0)
  {
LABEL_58:
    if ((v34 & 0x800000000) == 0)
      goto LABEL_59;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryNameDerivedFromRelationshipLabel](self, "isQueryNameDerivedFromRelationshipLabel"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("isQueryNameDerivedFromRelationshipLabel"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x800000000) == 0)
  {
LABEL_59:
    if ((v34 & 0x2000000) == 0)
      goto LABEL_60;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryNormalized](self, "isQueryNormalized"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("isQueryNormalized"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x2000000) == 0)
  {
LABEL_60:
    if ((v34 & 0x1000000000) == 0)
      goto LABEL_61;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryRelationshipLabelDerivedFromName](self, "isQueryRelationshipLabelDerivedFromName"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("isQueryRelationshipLabelDerivedFromName"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x1000000000) == 0)
  {
LABEL_61:
    if ((v34 & 0x4000000000) == 0)
      goto LABEL_62;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfPunctuation](self, "isQueryStrippedOfPunctuation"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("isQueryStrippedOfPunctuation"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x4000000000) == 0)
  {
LABEL_62:
    if ((v34 & 1) == 0)
      goto LABEL_63;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfSymbols](self, "isQueryStrippedOfSymbols"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("isQueryStrippedOfSymbols"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 1) == 0)
  {
LABEL_63:
    if ((v34 & 0x2000000000) == 0)
      goto LABEL_64;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfTitles](self, "isQueryStrippedOfTitles"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("isQueryStrippedOfTitles"));

  v34 = *(unsigned int *)(&self->_isAsrE3Signal + 1) | ((unint64_t)*((unsigned __int8 *)&self->_has + 1) << 32);
  if ((v34 & 0x2000000000) == 0)
  {
LABEL_64:
    if ((v34 & 0x1000) == 0)
      goto LABEL_65;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isQueryStrippedOfWhitespace](self, "isQueryStrippedOfWhitespace"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("isQueryStrippedOfWhitespace"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x1000) == 0)
  {
LABEL_65:
    if ((v34 & 0x2000) == 0)
      goto LABEL_66;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecent](self, "isRecent"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("isRecent"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x2000) == 0)
  {
LABEL_66:
    if ((v34 & 0x4000) == 0)
      goto LABEL_67;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentInSameDomain](self, "isRecentInSameDomain"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("isRecentInSameDomain"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x4000) == 0)
  {
LABEL_67:
    if ((v34 & 0x8000) == 0)
      goto LABEL_68;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentInSiriRequest](self, "isRecentInSiriRequest"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("isRecentInSiriRequest"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x8000) == 0)
  {
LABEL_68:
    if ((v34 & 0x400000) == 0)
      goto LABEL_69;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRecentlyCorrected](self, "isRecentlyCorrected"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("isRecentlyCorrected"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x400000) == 0)
  {
LABEL_69:
    if ((v34 & 2) == 0)
      goto LABEL_70;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isRelationAlias](self, "isRelationAlias"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("isRelationAlias"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 2) == 0)
  {
LABEL_70:
    if ((v34 & 0x4000000) == 0)
      goto LABEL_71;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isSuggestedContact](self, "isSuggestedContact"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("isSuggestedContact"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x4000000) == 0)
  {
LABEL_71:
    if ((v34 & 0x10000000) == 0)
      goto LABEL_72;
    goto LABEL_107;
  }
LABEL_106:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isThirdPartyMatch](self, "isThirdPartyMatch"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("isThirdPartyMatch"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x10000000) == 0)
  {
LABEL_72:
    if ((v34 & 0x400) == 0)
      goto LABEL_73;
    goto LABEL_108;
  }
LABEL_107:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEContactSignalSet isTransliterated](self, "isTransliterated"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("isTransliterated"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x400) == 0)
  {
LABEL_73:
    if ((v34 & 0x10000) == 0)
      goto LABEL_74;
    goto LABEL_109;
  }
LABEL_108:
  v67 = (void *)MEMORY[0x1E0CB37E8];
  -[INFERENCESchemaINFERENCEContactSignalSet nlxScore](self, "nlxScore");
  objc_msgSend(v67, "numberWithFloat:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("nlxScore"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x10000) == 0)
  {
LABEL_74:
    if ((v34 & 0x20000) == 0)
      goto LABEL_75;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRank](self, "recencyRank"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("recencyRank"));

  LODWORD(v34) = *(_DWORD *)(&self->_isAsrE3Signal + 1);
  if ((v34 & 0x20000) == 0)
  {
LABEL_75:
    if ((v34 & 0x40000) == 0)
      goto LABEL_77;
    goto LABEL_76;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRankInSameDomain](self, "recencyRankInSameDomain"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("recencyRankInSameDomain"));

  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x40000) != 0)
  {
LABEL_76:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[INFERENCESchemaINFERENCEContactSignalSet recencyRankInSiriRequest](self, "recencyRankInSiriRequest"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("recencyRankInSiriRequest"));

  }
LABEL_77:
  if (self->_requestMatchSignalSet)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet requestMatchSignalSet](self, "requestMatchSignalSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("requestMatchSignalSet"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("requestMatchSignalSet"));

    }
  }
  if (self->_speechAlternativeRanks)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet speechAlternativeRanks](self, "speechAlternativeRanks");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "dictionaryRepresentation");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("speechAlternativeRanks"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("speechAlternativeRanks"));

    }
  }
  if ((*(_DWORD *)(&self->_isAsrE3Signal + 1) & 0x800) != 0)
  {
    v75 = (void *)MEMORY[0x1E0CB37E8];
    -[INFERENCESchemaINFERENCEContactSignalSet srrScore](self, "srrScore");
    objc_msgSend(v75, "numberWithFloat:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("srrScore"));

  }
  if (self->_thirdPartyAppBundleId)
  {
    -[INFERENCESchemaINFERENCEContactSignalSet thirdPartyAppBundleId](self, "thirdPartyAppBundleId");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(v77, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("thirdPartyAppBundleId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v79 = v3;

  return v79;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEContactSignalSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (INFERENCESchemaINFERENCEContactSignalSet)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEContactSignalSet *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[INFERENCESchemaINFERENCEContactSignalSet initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEContactSignalSet)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEContactSignalSet *v5;
  uint64_t v6;
  INFERENCESchemaINFERENCESpeechAlternativeRanks *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v25;
  void *v26;
  uint64_t v27;
  INFERENCESchemaINFERENCEPrivatizedHistoryStats *v28;
  uint64_t v29;
  INFERENCESchemaINFERENCEPrivatizedHistoryStats *v30;
  uint64_t v31;
  INFERENCESchemaINFERENCEPrivatizedHistoryStats *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  INFERENCESchemaINFERENCERequestMatchSignalSet *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  INFERENCESchemaINFERENCEContactHandleSignalSet *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  INFERENCESchemaINFERENCEContactSignalSet *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  objc_super v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)INFERENCESchemaINFERENCEContactSignalSet;
  v5 = -[INFERENCESchemaINFERENCEContactSignalSet init](&v112, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechAlternativeRanks"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[INFERENCESchemaINFERENCESpeechAlternativeRanks initWithDictionary:]([INFERENCESchemaINFERENCESpeechAlternativeRanks alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCEContactSignalSet setSpeechAlternativeRanks:](v5, "setSpeechAlternativeRanks:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryStrippedOfTitles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfTitles:](v5, "setIsQueryStrippedOfTitles:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuggestedContact"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v106 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsSuggestedContact:](v5, "setIsSuggestedContact:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("areAllQueryTokensInContact"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v105 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setAreAllQueryTokensInContact:](v5, "setAreAllQueryTokensInContact:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("areAllPrimaryContactTokensInQuery"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v104 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setAreAllPrimaryContactTokensInQuery:](v5, "setAreAllPrimaryContactTokensInQuery:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHypocorism"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v103 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsHypocorism:](v5, "setIsHypocorism:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSuggestedProperties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setHasSuggestedProperties:](v5, "setHasSuggestedProperties:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPartialNameMatch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsPartialNameMatch:](v5, "setIsPartialNameMatch:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromStandardSearch"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v100 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromStandardSearch:](v5, "setIsFromStandardSearch:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromNLXSearch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v99 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromNLXSearch:](v5, "setIsFromNLXSearch:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFromSRRSearch"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFromSRRSearch:](v5, "setIsFromSRRSearch:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlxScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[INFERENCESchemaINFERENCEContactSignalSet setNlxScore:](v5, "setNlxScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srrScore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[INFERENCESchemaINFERENCEContactSignalSet setSrrScore:](v5, "setSrrScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecent"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecent:](v5, "setIsRecent:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInSameDomain"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSameDomain:](v5, "setIsRecentInSameDomain:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentInSiriRequest"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentInSiriRequest:](v5, "setIsRecentInSiriRequest:", objc_msgSend(v22, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRecentlyCorrected"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRecentlyCorrected:](v5, "setIsRecentlyCorrected:", objc_msgSend(v23, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRank"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRank:](v5, "setRecencyRank:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRankInSameDomain"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSameDomain:](v5, "setRecencyRankInSameDomain:", objc_msgSend(v25, "intValue"));
    v74 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recencyRankInSiriRequest"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setRecencyRankInSiriRequest:](v5, "setRecencyRankInSiriRequest:", objc_msgSend(v26, "intValue"));
    v73 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historyStats"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = (void *)v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats initWithDictionary:]([INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc], "initWithDictionary:", v27);
      -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStats:](v5, "setHistoryStats:", v28);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historyStatsInSameDomain"));
    v29 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = (void *)v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats initWithDictionary:]([INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc], "initWithDictionary:", v29);
      -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStatsInSameDomain:](v5, "setHistoryStatsInSameDomain:", v30);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historyStatsInSiriRequests"));
    v31 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = (void *)v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = -[INFERENCESchemaINFERENCEPrivatizedHistoryStats initWithDictionary:]([INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc], "initWithDictionary:", v31);
      -[INFERENCESchemaINFERENCEContactSignalSet setHistoryStatsInSiriRequests:](v5, "setHistoryStatsInSiriRequests:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMeCard"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCard:](v5, "setIsMeCard:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMeCardRelation"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelation:](v5, "setIsMeCardRelation:", objc_msgSend(v34, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMeCardRelationExactMatch"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsMeCardRelationExactMatch:](v5, "setIsMeCardRelationExactMatch:", objc_msgSend(v35, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRelationAlias"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsRelationAlias:](v5, "setIsRelationAlias:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("areQueryDiacriticsRemoved"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setAreQueryDiacriticsRemoved:](v5, "setAreQueryDiacriticsRemoved:", objc_msgSend(v37, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryNameDerivedFromRelationshipLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNameDerivedFromRelationshipLabel:](v5, "setIsQueryNameDerivedFromRelationshipLabel:", objc_msgSend(v38, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryRelationshipLabelDerivedFromName"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryRelationshipLabelDerivedFromName:](v5, "setIsQueryRelationshipLabelDerivedFromName:", objc_msgSend(v39, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isThirdPartyMatch"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsThirdPartyMatch:](v5, "setIsThirdPartyMatch:", objc_msgSend(v40, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsFavorite:](v5, "setIsFavorite:", objc_msgSend(v41, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTransliterated"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsTransliterated:](v5, "setIsTransliterated:", objc_msgSend(v42, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestMatchSignalSet"));
    v43 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = (void *)v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = -[INFERENCESchemaINFERENCERequestMatchSignalSet initWithDictionary:]([INFERENCESchemaINFERENCERequestMatchSignalSet alloc], "initWithDictionary:", v43);
      -[INFERENCESchemaINFERENCEContactSignalSet setRequestMatchSignalSet:](v5, "setRequestMatchSignalSet:", v44);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handlesWithPrivacySignalSets"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v109 != v49)
              objc_enumerationMutation(v46);
            v51 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v52 = -[INFERENCESchemaINFERENCEContactHandleSignalSet initWithDictionary:]([INFERENCESchemaINFERENCEContactHandleSignalSet alloc], "initWithDictionary:", v51);
              -[INFERENCESchemaINFERENCEContactSignalSet addHandlesWithPrivacySignalSets:](v5, "addHandlesWithPrivacySignalSets:", v52);

            }
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
        }
        while (v48);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHandleWithPreferredType"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithPreferredType:](v5, "setHasHandleWithPreferredType:", objc_msgSend(v53, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHandleWithAllowedType"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setHasHandleWithAllowedType:](v5, "setHasHandleWithAllowedType:", objc_msgSend(v54, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCommunalRequest"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsCommunalRequest:](v5, "setIsCommunalRequest:", objc_msgSend(v55, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfCommunalDevicesMatchingCandidate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v56, "floatValue");
      -[INFERENCESchemaINFERENCEContactSignalSet setFractionOfCommunalDevicesMatchingCandidate:](v5, "setFractionOfCommunalDevicesMatchingCandidate:");
    }
    v72 = v53;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPlusSignal"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsPlusSignal:](v5, "setIsPlusSignal:", objc_msgSend(v57, "BOOLValue"));
    v70 = v55;
    v71 = v54;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOnlyCandidate"), v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsOnlyCandidate:](v5, "setIsOnlyCandidate:", objc_msgSend(v58, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thirdPartyAppBundleId"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = (void *)objc_msgSend(v59, "copy");
      -[INFERENCESchemaINFERENCEContactSignalSet setThirdPartyAppBundleId:](v5, "setThirdPartyAppBundleId:", v60);

    }
    v69 = v56;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryNormalized"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryNormalized:](v5, "setIsQueryNormalized:", objc_msgSend(v61, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryStrippedOfPunctuation"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfPunctuation:](v5, "setIsQueryStrippedOfPunctuation:", objc_msgSend(v62, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryStrippedOfWhitespace"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfWhitespace:](v5, "setIsQueryStrippedOfWhitespace:", objc_msgSend(v63, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isQueryStrippedOfSymbols"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsQueryStrippedOfSymbols:](v5, "setIsQueryStrippedOfSymbols:", objc_msgSend(v64, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAsrE3Signal"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEContactSignalSet setIsAsrE3Signal:](v5, "setIsAsrE3Signal:", objc_msgSend(v65, "BOOLValue"));
    v66 = v5;

  }
  return v5;
}

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)speechAlternativeRanks
{
  return self->_speechAlternativeRanks;
}

- (void)setSpeechAlternativeRanks:(id)a3
{
  objc_storeStrong((id *)&self->_speechAlternativeRanks, a3);
}

- (BOOL)isQueryStrippedOfTitles
{
  return self->_isQueryStrippedOfTitles;
}

- (BOOL)isSuggestedContact
{
  return self->_isSuggestedContact;
}

- (BOOL)areAllQueryTokensInContact
{
  return self->_areAllQueryTokensInContact;
}

- (BOOL)areAllPrimaryContactTokensInQuery
{
  return self->_areAllPrimaryContactTokensInQuery;
}

- (BOOL)isHypocorism
{
  return self->_isHypocorism;
}

- (BOOL)hasSuggestedProperties
{
  return self->_hasSuggestedProperties;
}

- (BOOL)isPartialNameMatch
{
  return self->_isPartialNameMatch;
}

- (BOOL)isFromStandardSearch
{
  return self->_isFromStandardSearch;
}

- (BOOL)isFromNLXSearch
{
  return self->_isFromNLXSearch;
}

- (BOOL)isFromSRRSearch
{
  return self->_isFromSRRSearch;
}

- (float)nlxScore
{
  return self->_nlxScore;
}

- (float)srrScore
{
  return self->_srrScore;
}

- (BOOL)isRecent
{
  return self->_isRecent;
}

- (BOOL)isRecentInSameDomain
{
  return self->_isRecentInSameDomain;
}

- (BOOL)isRecentInSiriRequest
{
  return self->_isRecentInSiriRequest;
}

- (BOOL)isRecentlyCorrected
{
  return self->_isRecentlyCorrected;
}

- (int)recencyRank
{
  return self->_recencyRank;
}

- (int)recencyRankInSameDomain
{
  return self->_recencyRankInSameDomain;
}

- (int)recencyRankInSiriRequest
{
  return self->_recencyRankInSiriRequest;
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats
{
  return self->_historyStats;
}

- (void)setHistoryStats:(id)a3
{
  objc_storeStrong((id *)&self->_historyStats, a3);
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSameDomain
{
  return self->_historyStatsInSameDomain;
}

- (void)setHistoryStatsInSameDomain:(id)a3
{
  objc_storeStrong((id *)&self->_historyStatsInSameDomain, a3);
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStatsInSiriRequests
{
  return self->_historyStatsInSiriRequests;
}

- (void)setHistoryStatsInSiriRequests:(id)a3
{
  objc_storeStrong((id *)&self->_historyStatsInSiriRequests, a3);
}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (BOOL)isMeCardRelation
{
  return self->_isMeCardRelation;
}

- (BOOL)isMeCardRelationExactMatch
{
  return self->_isMeCardRelationExactMatch;
}

- (BOOL)isRelationAlias
{
  return self->_isRelationAlias;
}

- (BOOL)areQueryDiacriticsRemoved
{
  return self->_areQueryDiacriticsRemoved;
}

- (BOOL)isQueryNameDerivedFromRelationshipLabel
{
  return self->_isQueryNameDerivedFromRelationshipLabel;
}

- (BOOL)isQueryRelationshipLabelDerivedFromName
{
  return self->_isQueryRelationshipLabelDerivedFromName;
}

- (BOOL)isThirdPartyMatch
{
  return self->_isThirdPartyMatch;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isTransliterated
{
  return self->_isTransliterated;
}

- (INFERENCESchemaINFERENCERequestMatchSignalSet)requestMatchSignalSet
{
  return self->_requestMatchSignalSet;
}

- (void)setRequestMatchSignalSet:(id)a3
{
  objc_storeStrong((id *)&self->_requestMatchSignalSet, a3);
}

- (NSArray)handlesWithPrivacySignalSets
{
  return self->_handlesWithPrivacySignalSets;
}

- (void)setHandlesWithPrivacySignalSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)hasHandleWithPreferredType
{
  return self->_hasHandleWithPreferredType;
}

- (BOOL)hasHandleWithAllowedType
{
  return self->_hasHandleWithAllowedType;
}

- (BOOL)isCommunalRequest
{
  return self->_isCommunalRequest;
}

- (float)fractionOfCommunalDevicesMatchingCandidate
{
  return self->_fractionOfCommunalDevicesMatchingCandidate;
}

- (BOOL)isPlusSignal
{
  return self->_isPlusSignal;
}

- (BOOL)isOnlyCandidate
{
  return self->_isOnlyCandidate;
}

- (NSString)thirdPartyAppBundleId
{
  return self->_thirdPartyAppBundleId;
}

- (void)setThirdPartyAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isQueryNormalized
{
  return self->_isQueryNormalized;
}

- (BOOL)isQueryStrippedOfPunctuation
{
  return self->_isQueryStrippedOfPunctuation;
}

- (BOOL)isQueryStrippedOfWhitespace
{
  return self->_isQueryStrippedOfWhitespace;
}

- (BOOL)isQueryStrippedOfSymbols
{
  return self->_isQueryStrippedOfSymbols;
}

- (BOOL)isAsrE3Signal
{
  return self->_isAsrE3Signal;
}

- (void)setHasSpeechAlternativeRanks:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasHistoryStats:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasHistoryStatsInSameDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 4) = a3;
}

- (void)setHasHistoryStatsInSiriRequests:(BOOL)a3
{
  *((_BYTE *)&self->_has + 5) = a3;
}

- (void)setHasRequestMatchSignalSet:(BOOL)a3
{
  *((_BYTE *)&self->_has + 6) = a3;
}

- (void)setHasThirdPartyAppBundleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 7) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyAppBundleId, 0);
  objc_storeStrong((id *)&self->_handlesWithPrivacySignalSets, 0);
  objc_storeStrong((id *)&self->_requestMatchSignalSet, 0);
  objc_storeStrong((id *)&self->_historyStatsInSiriRequests, 0);
  objc_storeStrong((id *)&self->_historyStatsInSameDomain, 0);
  objc_storeStrong((id *)&self->_historyStats, 0);
  objc_storeStrong((id *)&self->_speechAlternativeRanks, 0);
}

@end
