@implementation _SFPBMailRankingSignals

- (_SFPBMailRankingSignals)initWithFacade:(id)a3
{
  id v4;
  _SFPBMailRankingSignals *v5;
  void *v6;
  void *v7;
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
  _SFPBMailRankingSignals *v22;

  v4 = a3;
  v5 = -[_SFPBMailRankingSignals init](self, "init");

  if (v5)
  {
    if (objc_msgSend(v4, "hasWasReorderedByRecency"))
      -[_SFPBMailRankingSignals setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", objc_msgSend(v4, "wasReorderedByRecency"));
    if (objc_msgSend(v4, "hasNumEngagements"))
      -[_SFPBMailRankingSignals setNumEngagements:](v5, "setNumEngagements:", objc_msgSend(v4, "numEngagements"));
    if (objc_msgSend(v4, "hasNumDaysEngagedLast30Days"))
      -[_SFPBMailRankingSignals setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", objc_msgSend(v4, "numDaysEngagedLast30Days"));
    objc_msgSend(v4, "averageEngagementAgeLast7Days");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "averageEngagementAgeLast7Days");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast7Days:](v5, "setAverageEngagementAgeLast7Days:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast14Days");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "averageEngagementAgeLast14Days");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast14Days:](v5, "setAverageEngagementAgeLast14Days:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast21Days");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "averageEngagementAgeLast21Days");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast21Days:](v5, "setAverageEngagementAgeLast21Days:", objc_msgSend(v11, "intValue"));

    }
    objc_msgSend(v4, "averageEngagementAgeLast30Days");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "averageEngagementAgeLast30Days");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast30Days:](v5, "setAverageEngagementAgeLast30Days:", objc_msgSend(v13, "intValue"));

    }
    if (objc_msgSend(v4, "hasDaysSinceReceipt"))
      -[_SFPBMailRankingSignals setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", objc_msgSend(v4, "daysSinceReceipt"));
    objc_msgSend(v4, "l1Score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "l1Score");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[_SFPBMailRankingSignals setL1Score:](v5, "setL1Score:");

    }
    objc_msgSend(v4, "l2Score");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "l2Score");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      -[_SFPBMailRankingSignals setL2Score:](v5, "setL2Score:");

    }
    if (objc_msgSend(v4, "hasIsFlagged"))
      -[_SFPBMailRankingSignals setIsFlagged:](v5, "setIsFlagged:", objc_msgSend(v4, "isFlagged"));
    if (objc_msgSend(v4, "hasIsRepliedTo"))
      -[_SFPBMailRankingSignals setIsRepliedTo:](v5, "setIsRepliedTo:", objc_msgSend(v4, "isRepliedTo"));
    if (objc_msgSend(v4, "hasIsSemanticMatch"))
      -[_SFPBMailRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    if (objc_msgSend(v4, "hasIsSyntacticMatch"))
      -[_SFPBMailRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "semanticScore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "semanticScore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[_SFPBMailRankingSignals setSemanticScore:](v5, "setSemanticScore:");

    }
    objc_msgSend(v4, "syntacticScore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "syntacticScore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      -[_SFPBMailRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");

    }
    if (objc_msgSend(v4, "hasCountUnigramMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", objc_msgSend(v4, "countUnigramMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountBigramMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", objc_msgSend(v4, "countBigramMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountNgramMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", objc_msgSend(v4, "countNgramMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", objc_msgSend(v4, "countBigramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInAuthors"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", objc_msgSend(v4, "countNgramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInAuthorEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInSubject"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", objc_msgSend(v4, "countUnigramMatchInSubject"));
    if (objc_msgSend(v4, "hasCountBigramMatchInSubject"))
      -[_SFPBMailRankingSignals setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", objc_msgSend(v4, "countBigramMatchInSubject"));
    if (objc_msgSend(v4, "hasCountNgramMatchInSubject"))
      -[_SFPBMailRankingSignals setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", objc_msgSend(v4, "countNgramMatchInSubject"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInSubject"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", objc_msgSend(v4, "countUnigramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInSubject"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", objc_msgSend(v4, "countBigramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInSubject"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", objc_msgSend(v4, "countNgramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", objc_msgSend(v4, "countUnigramMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountBigramMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", objc_msgSend(v4, "countBigramMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountNgramMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", objc_msgSend(v4, "countNgramMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", objc_msgSend(v4, "countBigramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInTextContent"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", objc_msgSend(v4, "countNgramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", objc_msgSend(v4, "countUnigramMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountBigramMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", objc_msgSend(v4, "countBigramMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountNgramMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", objc_msgSend(v4, "countNgramMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", objc_msgSend(v4, "countBigramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInRecipients"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", objc_msgSend(v4, "countNgramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInRecipientEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", objc_msgSend(v4, "countBigramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", objc_msgSend(v4, "countNgramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInEmailAddresses"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountBigramMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountNgramMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInAttachmentTypes"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "hasCountUnigramMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "hasCountBigramMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", objc_msgSend(v4, "countBigramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "hasCountNgramMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", objc_msgSend(v4, "countNgramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "hasCountUnigramPrefixMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"));
    if (objc_msgSend(v4, "hasCountBigramPrefixMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentNames"));
    if (objc_msgSend(v4, "hasCountNgramPrefixMatchInAttachmentNames"))
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames"));
    v22 = v5;
  }

  return v5;
}

- (void)setWasReorderedByRecency:(BOOL)a3
{
  self->_wasReorderedByRecency = a3;
}

- (void)setNumEngagements:(unint64_t)a3
{
  self->_numEngagements = a3;
}

- (void)setNumDaysEngagedLast30Days:(unint64_t)a3
{
  self->_numDaysEngagedLast30Days = a3;
}

- (void)setAverageEngagementAgeLast7Days:(int)a3
{
  self->_averageEngagementAgeLast7Days = a3;
}

- (void)setAverageEngagementAgeLast14Days:(int)a3
{
  self->_averageEngagementAgeLast14Days = a3;
}

- (void)setAverageEngagementAgeLast21Days:(int)a3
{
  self->_averageEngagementAgeLast21Days = a3;
}

- (void)setAverageEngagementAgeLast30Days:(int)a3
{
  self->_averageEngagementAgeLast30Days = a3;
}

- (void)setDaysSinceReceipt:(unint64_t)a3
{
  self->_daysSinceReceipt = a3;
}

- (void)setL1Score:(float)a3
{
  self->_l1Score = a3;
}

- (void)setL2Score:(float)a3
{
  self->_l2Score = a3;
}

- (void)setIsFlagged:(BOOL)a3
{
  self->_isFlagged = a3;
}

- (void)setIsRepliedTo:(BOOL)a3
{
  self->_isRepliedTo = a3;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (void)setCountUnigramMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramMatchInAuthors = a3;
}

- (void)setCountBigramMatchInAuthors:(unsigned int)a3
{
  self->_countBigramMatchInAuthors = a3;
}

- (void)setCountNgramMatchInAuthors:(unsigned int)a3
{
  self->_countNgramMatchInAuthors = a3;
}

- (void)setCountUnigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthors = a3;
}

- (void)setCountBigramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthors = a3;
}

- (void)setCountNgramPrefixMatchInAuthors:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthors = a3;
}

- (void)setCountUnigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInAuthorEmailAddresses = a3;
}

- (void)setCountBigramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInAuthorEmailAddresses = a3;
}

- (void)setCountNgramMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInAuthorEmailAddresses = a3;
}

- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAuthorEmailAddresses = a3;
}

- (void)setCountUnigramMatchInSubject:(unsigned int)a3
{
  self->_countUnigramMatchInSubject = a3;
}

- (void)setCountBigramMatchInSubject:(unsigned int)a3
{
  self->_countBigramMatchInSubject = a3;
}

- (void)setCountNgramMatchInSubject:(unsigned int)a3
{
  self->_countNgramMatchInSubject = a3;
}

- (void)setCountUnigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInSubject = a3;
}

- (void)setCountBigramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countBigramPrefixMatchInSubject = a3;
}

- (void)setCountNgramPrefixMatchInSubject:(unsigned int)a3
{
  self->_countNgramPrefixMatchInSubject = a3;
}

- (void)setCountUnigramMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramMatchInTextContent = a3;
}

- (void)setCountBigramMatchInTextContent:(unsigned int)a3
{
  self->_countBigramMatchInTextContent = a3;
}

- (void)setCountNgramMatchInTextContent:(unsigned int)a3
{
  self->_countNgramMatchInTextContent = a3;
}

- (void)setCountUnigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInTextContent = a3;
}

- (void)setCountBigramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countBigramPrefixMatchInTextContent = a3;
}

- (void)setCountNgramPrefixMatchInTextContent:(unsigned int)a3
{
  self->_countNgramPrefixMatchInTextContent = a3;
}

- (void)setCountUnigramMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramMatchInRecipients = a3;
}

- (void)setCountBigramMatchInRecipients:(unsigned int)a3
{
  self->_countBigramMatchInRecipients = a3;
}

- (void)setCountNgramMatchInRecipients:(unsigned int)a3
{
  self->_countNgramMatchInRecipients = a3;
}

- (void)setCountUnigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipients = a3;
}

- (void)setCountBigramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipients = a3;
}

- (void)setCountNgramPrefixMatchInRecipients:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipients = a3;
}

- (void)setCountUnigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInRecipientEmailAddresses = a3;
}

- (void)setCountBigramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInRecipientEmailAddresses = a3;
}

- (void)setCountNgramMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInRecipientEmailAddresses = a3;
}

- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInRecipientEmailAddresses = a3;
}

- (void)setCountUnigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramMatchInEmailAddresses = a3;
}

- (void)setCountBigramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramMatchInEmailAddresses = a3;
}

- (void)setCountNgramMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramMatchInEmailAddresses = a3;
}

- (void)setCountUnigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInEmailAddresses = a3;
}

- (void)setCountBigramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countBigramPrefixMatchInEmailAddresses = a3;
}

- (void)setCountNgramPrefixMatchInEmailAddresses:(unsigned int)a3
{
  self->_countNgramPrefixMatchInEmailAddresses = a3;
}

- (void)setCountUnigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentTypes = a3;
}

- (void)setCountBigramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentTypes = a3;
}

- (void)setCountNgramMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentTypes = a3;
}

- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentTypes = a3;
}

- (void)setCountBigramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentTypes = a3;
}

- (void)setCountNgramPrefixMatchInAttachmentTypes:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentTypes = a3;
}

- (void)setCountUnigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramMatchInAttachmentNames = a3;
}

- (void)setCountBigramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramMatchInAttachmentNames = a3;
}

- (void)setCountNgramMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramMatchInAttachmentNames = a3;
}

- (void)setCountUnigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countUnigramPrefixMatchInAttachmentNames = a3;
}

- (void)setCountBigramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countBigramPrefixMatchInAttachmentNames = a3;
}

- (void)setCountNgramPrefixMatchInAttachmentNames:(unsigned int)a3
{
  self->_countNgramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBMailRankingSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[_SFPBMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMailRankingSignals numEngagements](self, "numEngagements"))
    PBDataWriterWriteUint64Field();
  if (-[_SFPBMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"))
    PBDataWriterWriteUint64Field();
  if (-[_SFPBMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt"))
    PBDataWriterWriteUint64Field();
  -[_SFPBMailRankingSignals l1Score](self, "l1Score");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBMailRankingSignals l2Score](self, "l2Score");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBMailRankingSignals isFlagged](self, "isFlagged"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMailRankingSignals isRepliedTo](self, "isRepliedTo"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMailRankingSignals isSemanticMatch](self, "isSemanticMatch"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch"))
    PBDataWriterWriteBOOLField();
  -[_SFPBMailRankingSignals semanticScore](self, "semanticScore");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_SFPBMailRankingSignals syntacticScore](self, "syntacticScore");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"))
    PBDataWriterWriteUint32Field();
  if (-[_SFPBMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"))
  {
    PBDataWriterWriteUint32Field();
  }
  if (-[_SFPBMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"))
  {
    PBDataWriterWriteUint32Field();
  }
  v8 = -[_SFPBMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames");
  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteUint32Field();
    v9 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int wasReorderedByRecency;
  unint64_t numEngagements;
  unint64_t numDaysEngagedLast30Days;
  int averageEngagementAgeLast7Days;
  int averageEngagementAgeLast14Days;
  int averageEngagementAgeLast21Days;
  int averageEngagementAgeLast30Days;
  unint64_t daysSinceReceipt;
  float l1Score;
  float v14;
  float l2Score;
  float v16;
  int isFlagged;
  int isRepliedTo;
  int isSemanticMatch;
  int isSyntacticMatch;
  float semanticScore;
  float v22;
  float syntacticScore;
  float v24;
  unsigned int countUnigramMatchInAuthors;
  unsigned int countBigramMatchInAuthors;
  unsigned int countNgramMatchInAuthors;
  unsigned int countUnigramPrefixMatchInAuthors;
  unsigned int countBigramPrefixMatchInAuthors;
  unsigned int countNgramPrefixMatchInAuthors;
  unsigned int countUnigramMatchInAuthorEmailAddresses;
  unsigned int countBigramMatchInAuthorEmailAddresses;
  unsigned int countNgramMatchInAuthorEmailAddresses;
  unsigned int countUnigramPrefixMatchInAuthorEmailAddresses;
  unsigned int countBigramPrefixMatchInAuthorEmailAddresses;
  unsigned int countNgramPrefixMatchInAuthorEmailAddresses;
  unsigned int countUnigramMatchInSubject;
  unsigned int countBigramMatchInSubject;
  unsigned int countNgramMatchInSubject;
  unsigned int countUnigramPrefixMatchInSubject;
  unsigned int countBigramPrefixMatchInSubject;
  unsigned int countNgramPrefixMatchInSubject;
  unsigned int countUnigramMatchInTextContent;
  unsigned int countBigramMatchInTextContent;
  unsigned int countNgramMatchInTextContent;
  unsigned int countUnigramPrefixMatchInTextContent;
  unsigned int countBigramPrefixMatchInTextContent;
  unsigned int countNgramPrefixMatchInTextContent;
  unsigned int countUnigramMatchInRecipients;
  unsigned int countBigramMatchInRecipients;
  unsigned int countNgramMatchInRecipients;
  unsigned int countUnigramPrefixMatchInRecipients;
  unsigned int countBigramPrefixMatchInRecipients;
  unsigned int countNgramPrefixMatchInRecipients;
  unsigned int countUnigramMatchInRecipientEmailAddresses;
  unsigned int countBigramMatchInRecipientEmailAddresses;
  unsigned int countNgramMatchInRecipientEmailAddresses;
  unsigned int countUnigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countBigramPrefixMatchInRecipientEmailAddresses;
  unsigned int countNgramPrefixMatchInRecipientEmailAddresses;
  unsigned int countUnigramMatchInEmailAddresses;
  unsigned int countBigramMatchInEmailAddresses;
  unsigned int countNgramMatchInEmailAddresses;
  unsigned int countUnigramPrefixMatchInEmailAddresses;
  unsigned int countBigramPrefixMatchInEmailAddresses;
  unsigned int countNgramPrefixMatchInEmailAddresses;
  unsigned int countUnigramMatchInAttachmentTypes;
  unsigned int countBigramMatchInAttachmentTypes;
  unsigned int countNgramMatchInAttachmentTypes;
  unsigned int countUnigramPrefixMatchInAttachmentTypes;
  unsigned int countBigramPrefixMatchInAttachmentTypes;
  unsigned int countNgramPrefixMatchInAttachmentTypes;
  unsigned int countUnigramMatchInAttachmentNames;
  unsigned int countBigramMatchInAttachmentNames;
  unsigned int countNgramMatchInAttachmentNames;
  unsigned int countUnigramPrefixMatchInAttachmentNames;
  unsigned int countBigramPrefixMatchInAttachmentNames;
  unsigned int countNgramPrefixMatchInAttachmentNames;
  BOOL v79;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_72;
  wasReorderedByRecency = self->_wasReorderedByRecency;
  if (wasReorderedByRecency != objc_msgSend(v4, "wasReorderedByRecency"))
    goto LABEL_72;
  numEngagements = self->_numEngagements;
  if (numEngagements != objc_msgSend(v4, "numEngagements"))
    goto LABEL_72;
  numDaysEngagedLast30Days = self->_numDaysEngagedLast30Days;
  if (numDaysEngagedLast30Days != objc_msgSend(v4, "numDaysEngagedLast30Days"))
    goto LABEL_72;
  averageEngagementAgeLast7Days = self->_averageEngagementAgeLast7Days;
  if (averageEngagementAgeLast7Days != objc_msgSend(v4, "averageEngagementAgeLast7Days"))
    goto LABEL_72;
  averageEngagementAgeLast14Days = self->_averageEngagementAgeLast14Days;
  if (averageEngagementAgeLast14Days != objc_msgSend(v4, "averageEngagementAgeLast14Days"))
    goto LABEL_72;
  averageEngagementAgeLast21Days = self->_averageEngagementAgeLast21Days;
  if (averageEngagementAgeLast21Days != objc_msgSend(v4, "averageEngagementAgeLast21Days"))
    goto LABEL_72;
  averageEngagementAgeLast30Days = self->_averageEngagementAgeLast30Days;
  if (averageEngagementAgeLast30Days != objc_msgSend(v4, "averageEngagementAgeLast30Days"))
    goto LABEL_72;
  daysSinceReceipt = self->_daysSinceReceipt;
  if (daysSinceReceipt != objc_msgSend(v4, "daysSinceReceipt"))
    goto LABEL_72;
  l1Score = self->_l1Score;
  objc_msgSend(v4, "l1Score");
  if (l1Score != v14)
    goto LABEL_72;
  l2Score = self->_l2Score;
  objc_msgSend(v4, "l2Score");
  if (l2Score != v16)
    goto LABEL_72;
  isFlagged = self->_isFlagged;
  if (isFlagged != objc_msgSend(v4, "isFlagged"))
    goto LABEL_72;
  isRepliedTo = self->_isRepliedTo;
  if (isRepliedTo != objc_msgSend(v4, "isRepliedTo"))
    goto LABEL_72;
  isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch != objc_msgSend(v4, "isSemanticMatch"))
    goto LABEL_72;
  isSyntacticMatch = self->_isSyntacticMatch;
  if (isSyntacticMatch != objc_msgSend(v4, "isSyntacticMatch"))
    goto LABEL_72;
  semanticScore = self->_semanticScore;
  objc_msgSend(v4, "semanticScore");
  if (semanticScore != v22)
    goto LABEL_72;
  syntacticScore = self->_syntacticScore;
  objc_msgSend(v4, "syntacticScore");
  if (syntacticScore != v24)
    goto LABEL_72;
  countUnigramMatchInAuthors = self->_countUnigramMatchInAuthors;
  if (countUnigramMatchInAuthors != objc_msgSend(v4, "countUnigramMatchInAuthors"))
    goto LABEL_72;
  countBigramMatchInAuthors = self->_countBigramMatchInAuthors;
  if (countBigramMatchInAuthors != objc_msgSend(v4, "countBigramMatchInAuthors"))
    goto LABEL_72;
  countNgramMatchInAuthors = self->_countNgramMatchInAuthors;
  if (countNgramMatchInAuthors != objc_msgSend(v4, "countNgramMatchInAuthors"))
    goto LABEL_72;
  countUnigramPrefixMatchInAuthors = self->_countUnigramPrefixMatchInAuthors;
  if (countUnigramPrefixMatchInAuthors != objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"))
    goto LABEL_72;
  countBigramPrefixMatchInAuthors = self->_countBigramPrefixMatchInAuthors;
  if (countBigramPrefixMatchInAuthors != objc_msgSend(v4, "countBigramPrefixMatchInAuthors"))
    goto LABEL_72;
  countNgramPrefixMatchInAuthors = self->_countNgramPrefixMatchInAuthors;
  if (countNgramPrefixMatchInAuthors != objc_msgSend(v4, "countNgramPrefixMatchInAuthors"))
    goto LABEL_72;
  countUnigramMatchInAuthorEmailAddresses = self->_countUnigramMatchInAuthorEmailAddresses;
  if (countUnigramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"))goto LABEL_72;
  countBigramMatchInAuthorEmailAddresses = self->_countBigramMatchInAuthorEmailAddresses;
  if (countBigramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"))goto LABEL_72;
  countNgramMatchInAuthorEmailAddresses = self->_countNgramMatchInAuthorEmailAddresses;
  if (countNgramMatchInAuthorEmailAddresses != objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"))
    goto LABEL_72;
  countUnigramPrefixMatchInAuthorEmailAddresses = self->_countUnigramPrefixMatchInAuthorEmailAddresses;
  if (countUnigramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInAuthorEmailAddresses = self->_countBigramPrefixMatchInAuthorEmailAddresses;
  if (countBigramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInAuthorEmailAddresses = self->_countNgramPrefixMatchInAuthorEmailAddresses;
  if (countNgramPrefixMatchInAuthorEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"))goto LABEL_72;
  countUnigramMatchInSubject = self->_countUnigramMatchInSubject;
  if (countUnigramMatchInSubject != objc_msgSend(v4, "countUnigramMatchInSubject"))
    goto LABEL_72;
  countBigramMatchInSubject = self->_countBigramMatchInSubject;
  if (countBigramMatchInSubject != objc_msgSend(v4, "countBigramMatchInSubject"))
    goto LABEL_72;
  countNgramMatchInSubject = self->_countNgramMatchInSubject;
  if (countNgramMatchInSubject != objc_msgSend(v4, "countNgramMatchInSubject"))
    goto LABEL_72;
  countUnigramPrefixMatchInSubject = self->_countUnigramPrefixMatchInSubject;
  if (countUnigramPrefixMatchInSubject != objc_msgSend(v4, "countUnigramPrefixMatchInSubject"))
    goto LABEL_72;
  countBigramPrefixMatchInSubject = self->_countBigramPrefixMatchInSubject;
  if (countBigramPrefixMatchInSubject != objc_msgSend(v4, "countBigramPrefixMatchInSubject"))
    goto LABEL_72;
  countNgramPrefixMatchInSubject = self->_countNgramPrefixMatchInSubject;
  if (countNgramPrefixMatchInSubject != objc_msgSend(v4, "countNgramPrefixMatchInSubject"))
    goto LABEL_72;
  countUnigramMatchInTextContent = self->_countUnigramMatchInTextContent;
  if (countUnigramMatchInTextContent != objc_msgSend(v4, "countUnigramMatchInTextContent"))
    goto LABEL_72;
  countBigramMatchInTextContent = self->_countBigramMatchInTextContent;
  if (countBigramMatchInTextContent != objc_msgSend(v4, "countBigramMatchInTextContent"))
    goto LABEL_72;
  countNgramMatchInTextContent = self->_countNgramMatchInTextContent;
  if (countNgramMatchInTextContent != objc_msgSend(v4, "countNgramMatchInTextContent"))
    goto LABEL_72;
  countUnigramPrefixMatchInTextContent = self->_countUnigramPrefixMatchInTextContent;
  if (countUnigramPrefixMatchInTextContent != objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"))
    goto LABEL_72;
  countBigramPrefixMatchInTextContent = self->_countBigramPrefixMatchInTextContent;
  if (countBigramPrefixMatchInTextContent != objc_msgSend(v4, "countBigramPrefixMatchInTextContent"))
    goto LABEL_72;
  countNgramPrefixMatchInTextContent = self->_countNgramPrefixMatchInTextContent;
  if (countNgramPrefixMatchInTextContent != objc_msgSend(v4, "countNgramPrefixMatchInTextContent"))
    goto LABEL_72;
  countUnigramMatchInRecipients = self->_countUnigramMatchInRecipients;
  if (countUnigramMatchInRecipients != objc_msgSend(v4, "countUnigramMatchInRecipients"))
    goto LABEL_72;
  countBigramMatchInRecipients = self->_countBigramMatchInRecipients;
  if (countBigramMatchInRecipients != objc_msgSend(v4, "countBigramMatchInRecipients"))
    goto LABEL_72;
  countNgramMatchInRecipients = self->_countNgramMatchInRecipients;
  if (countNgramMatchInRecipients != objc_msgSend(v4, "countNgramMatchInRecipients"))
    goto LABEL_72;
  countUnigramPrefixMatchInRecipients = self->_countUnigramPrefixMatchInRecipients;
  if (countUnigramPrefixMatchInRecipients != objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"))
    goto LABEL_72;
  countBigramPrefixMatchInRecipients = self->_countBigramPrefixMatchInRecipients;
  if (countBigramPrefixMatchInRecipients != objc_msgSend(v4, "countBigramPrefixMatchInRecipients"))
    goto LABEL_72;
  countNgramPrefixMatchInRecipients = self->_countNgramPrefixMatchInRecipients;
  if (countNgramPrefixMatchInRecipients != objc_msgSend(v4, "countNgramPrefixMatchInRecipients"))
    goto LABEL_72;
  countUnigramMatchInRecipientEmailAddresses = self->_countUnigramMatchInRecipientEmailAddresses;
  if (countUnigramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countBigramMatchInRecipientEmailAddresses = self->_countBigramMatchInRecipientEmailAddresses;
  if (countBigramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countNgramMatchInRecipientEmailAddresses = self->_countNgramMatchInRecipientEmailAddresses;
  if (countNgramMatchInRecipientEmailAddresses != objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"))goto LABEL_72;
  countUnigramPrefixMatchInRecipientEmailAddresses = self->_countUnigramPrefixMatchInRecipientEmailAddresses;
  if (countUnigramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInRecipientEmailAddresses = self->_countBigramPrefixMatchInRecipientEmailAddresses;
  if (countBigramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInRecipientEmailAddresses = self->_countNgramPrefixMatchInRecipientEmailAddresses;
  if (countNgramPrefixMatchInRecipientEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"))goto LABEL_72;
  countUnigramMatchInEmailAddresses = self->_countUnigramMatchInEmailAddresses;
  if (countUnigramMatchInEmailAddresses != objc_msgSend(v4, "countUnigramMatchInEmailAddresses"))
    goto LABEL_72;
  countBigramMatchInEmailAddresses = self->_countBigramMatchInEmailAddresses;
  if (countBigramMatchInEmailAddresses != objc_msgSend(v4, "countBigramMatchInEmailAddresses"))
    goto LABEL_72;
  countNgramMatchInEmailAddresses = self->_countNgramMatchInEmailAddresses;
  if (countNgramMatchInEmailAddresses != objc_msgSend(v4, "countNgramMatchInEmailAddresses"))
    goto LABEL_72;
  countUnigramPrefixMatchInEmailAddresses = self->_countUnigramPrefixMatchInEmailAddresses;
  if (countUnigramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"))goto LABEL_72;
  countBigramPrefixMatchInEmailAddresses = self->_countBigramPrefixMatchInEmailAddresses;
  if (countBigramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"))goto LABEL_72;
  countNgramPrefixMatchInEmailAddresses = self->_countNgramPrefixMatchInEmailAddresses;
  if (countNgramPrefixMatchInEmailAddresses != objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"))
    goto LABEL_72;
  countUnigramMatchInAttachmentTypes = self->_countUnigramMatchInAttachmentTypes;
  if (countUnigramMatchInAttachmentTypes != objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"))
    goto LABEL_72;
  countBigramMatchInAttachmentTypes = self->_countBigramMatchInAttachmentTypes;
  if (countBigramMatchInAttachmentTypes != objc_msgSend(v4, "countBigramMatchInAttachmentTypes"))
    goto LABEL_72;
  countNgramMatchInAttachmentTypes = self->_countNgramMatchInAttachmentTypes;
  if (countNgramMatchInAttachmentTypes != objc_msgSend(v4, "countNgramMatchInAttachmentTypes"))
    goto LABEL_72;
  countUnigramPrefixMatchInAttachmentTypes = self->_countUnigramPrefixMatchInAttachmentTypes;
  if (countUnigramPrefixMatchInAttachmentTypes != objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"))goto LABEL_72;
  countBigramPrefixMatchInAttachmentTypes = self->_countBigramPrefixMatchInAttachmentTypes;
  if (countBigramPrefixMatchInAttachmentTypes == objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes")&& (countNgramPrefixMatchInAttachmentTypes = self->_countNgramPrefixMatchInAttachmentTypes, countNgramPrefixMatchInAttachmentTypes == objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"))&& (countUnigramMatchInAttachmentNames = self->_countUnigramMatchInAttachmentNames, countUnigramMatchInAttachmentNames == objc_msgSend(v4, "countUnigramMatchInAttachmentNames"))&& (countBigramMatchInAttachmentNames = self->_countBigramMatchInAttachmentNames, countBigramMatchInAttachmentNames == objc_msgSend(v4, "countBigramMatchInAttachmentNames"))&& (countNgramMatchInAttachmentNames = self->_countNgramMatchInAttachmentNames, countNgramMatchInAttachmentNames == objc_msgSend(v4, "countNgramMatchInAttachmentNames"))&& (countUnigramPrefixMatchInAttachmentNames = self->_countUnigramPrefixMatchInAttachmentNames, countUnigramPrefixMatchInAttachmentNames == objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"))&& (countBigramPrefixMatchInAttachmentNames = self->_countBigramPrefixMatchInAttachmentNames, countBigramPrefixMatchInAttachmentNames == objc_msgSend(v4,
                                                                   "countBigramPrefixMatchInAttachmentNames")))
  {
    countNgramPrefixMatchInAttachmentNames = self->_countNgramPrefixMatchInAttachmentNames;
    v79 = countNgramPrefixMatchInAttachmentNames == objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames");
  }
  else
  {
LABEL_72:
    v79 = 0;
  }

  return v79;
}

- (unint64_t)hash
{
  _BOOL4 wasReorderedByRecency;
  unint64_t numEngagements;
  unint64_t numDaysEngagedLast30Days;
  uint64_t averageEngagementAgeLast7Days;
  uint64_t averageEngagementAgeLast14Days;
  uint64_t averageEngagementAgeLast21Days;
  uint64_t averageEngagementAgeLast30Days;
  float l1Score;
  BOOL v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float l2Score;
  BOOL v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  _BOOL4 isFlagged;
  _BOOL4 isRepliedTo;
  _BOOL4 isSemanticMatch;
  _BOOL4 isSyntacticMatch;
  float semanticScore;
  BOOL v29;
  double v30;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  float syntacticScore;
  BOOL v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t daysSinceReceipt;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;

  wasReorderedByRecency = self->_wasReorderedByRecency;
  numEngagements = self->_numEngagements;
  numDaysEngagedLast30Days = self->_numDaysEngagedLast30Days;
  averageEngagementAgeLast7Days = self->_averageEngagementAgeLast7Days;
  averageEngagementAgeLast14Days = self->_averageEngagementAgeLast14Days;
  averageEngagementAgeLast21Days = self->_averageEngagementAgeLast21Days;
  averageEngagementAgeLast30Days = self->_averageEngagementAgeLast30Days;
  l1Score = self->_l1Score;
  v11 = l1Score < 0.0;
  daysSinceReceipt = self->_daysSinceReceipt;
  if (l1Score == 0.0)
  {
    v16 = 0;
  }
  else
  {
    v12 = l1Score;
    v13 = -v12;
    if (!v11)
      v13 = v12;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v16 += (unint64_t)v15;
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  l2Score = self->_l2Score;
  v18 = l2Score < 0.0;
  v54 = v16;
  v55 = numDaysEngagedLast30Days;
  v51 = averageEngagementAgeLast30Days;
  v52 = averageEngagementAgeLast21Days;
  if (l2Score == 0.0)
  {
    v23 = 0;
  }
  else
  {
    v19 = l2Score;
    v20 = -v19;
    if (!v18)
      v20 = v19;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v23 += (unint64_t)v22;
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  v53 = v23;
  isFlagged = self->_isFlagged;
  isRepliedTo = self->_isRepliedTo;
  isSemanticMatch = self->_isSemanticMatch;
  isSyntacticMatch = self->_isSyntacticMatch;
  semanticScore = self->_semanticScore;
  v29 = semanticScore < 0.0;
  if (semanticScore == 0.0)
  {
    v34 = 0;
  }
  else
  {
    v30 = semanticScore;
    v31 = -v30;
    if (!v29)
      v31 = v30;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v34 += (unint64_t)v33;
    }
    else
    {
      v34 -= (unint64_t)fabs(v33);
    }
  }
  syntacticScore = self->_syntacticScore;
  v36 = syntacticScore < 0.0;
  if (syntacticScore == 0.0)
  {
    v41 = 0;
  }
  else
  {
    v37 = syntacticScore;
    v38 = -v37;
    if (!v36)
      v38 = v37;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v41 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v41 += (unint64_t)v40;
    }
    else
    {
      v41 -= (unint64_t)fabs(v40);
    }
  }
  if (isSyntacticMatch)
    v42 = 2654435761;
  else
    v42 = 0;
  if (isSemanticMatch)
    v43 = 2654435761;
  else
    v43 = 0;
  if (isRepliedTo)
    v44 = 2654435761;
  else
    v44 = 0;
  if (isFlagged)
    v45 = 2654435761;
  else
    v45 = 0;
  if (wasReorderedByRecency)
    v46 = 2654435761;
  else
    v46 = 0;
  v47 = (2654435761u * numEngagements) ^ v46 ^ (2654435761u * v55) ^ (2654435761 * averageEngagementAgeLast7Days) ^ (2654435761 * averageEngagementAgeLast14Days) ^ (2654435761 * v52) ^ (2654435761 * v51) ^ (2654435761u * daysSinceReceipt) ^ v54 ^ v53 ^ v45 ^ v44 ^ v43 ^ v42 ^ v34 ^ v41 ^ (2654435761 * self->_countUnigramMatchInAuthors) ^ (2654435761 * self->_countBigramMatchInAuthors) ^ (2654435761 * self->_countNgramMatchInAuthors) ^ (2654435761 * self->_countUnigramPrefixMatchInAuthors) ^ (2654435761 * self->_countBigramPrefixMatchInAuthors) ^ (2654435761 * self->_countNgramPrefixMatchInAuthors) ^ (2654435761 * self->_countUnigramMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countBigramMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countNgramMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countUnigramPrefixMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countBigramPrefixMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countNgramPrefixMatchInAuthorEmailAddresses) ^ (2654435761 * self->_countUnigramMatchInSubject) ^ (2654435761 * self->_countBigramMatchInSubject) ^ (2654435761 * self->_countNgramMatchInSubject) ^ (2654435761 * self->_countUnigramPrefixMatchInSubject) ^ (2654435761 * self->_countBigramPrefixMatchInSubject) ^ (2654435761 * self->_countNgramPrefixMatchInSubject);
  v48 = v47 ^ (2654435761 * self->_countUnigramMatchInTextContent) ^ (2654435761
                                                                      * self->_countBigramMatchInTextContent) ^ (2654435761 * self->_countNgramMatchInTextContent) ^ (2654435761 * self->_countUnigramPrefixMatchInTextContent) ^ (2654435761 * self->_countBigramPrefixMatchInTextContent) ^ (2654435761 * self->_countNgramPrefixMatchInTextContent) ^ (2654435761 * self->_countUnigramMatchInRecipients) ^ (2654435761 * self->_countBigramMatchInRecipients) ^ (2654435761 * self->_countNgramMatchInRecipients) ^ (2654435761 * self->_countUnigramPrefixMatchInRecipients) ^ (2654435761 * self->_countBigramPrefixMatchInRecipients) ^ (2654435761 * self->_countNgramPrefixMatchInRecipients) ^ (2654435761 * self->_countUnigramMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countBigramMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countNgramMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countUnigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countBigramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countNgramPrefixMatchInRecipientEmailAddresses) ^ (2654435761 * self->_countUnigramMatchInEmailAddresses);
  return v48 ^ (2654435761 * self->_countBigramMatchInEmailAddresses) ^ (2654435761
                                                                         * self->_countNgramMatchInEmailAddresses) ^ (2654435761 * self->_countUnigramPrefixMatchInEmailAddresses) ^ (2654435761 * self->_countBigramPrefixMatchInEmailAddresses) ^ (2654435761 * self->_countNgramPrefixMatchInEmailAddresses) ^ (2654435761 * self->_countUnigramMatchInAttachmentTypes) ^ (2654435761 * self->_countBigramMatchInAttachmentTypes) ^ (2654435761 * self->_countNgramMatchInAttachmentTypes) ^ (2654435761 * self->_countUnigramPrefixMatchInAttachmentTypes) ^ (2654435761 * self->_countBigramPrefixMatchInAttachmentTypes) ^ (2654435761 * self->_countNgramPrefixMatchInAttachmentTypes) ^ (2654435761 * self->_countUnigramMatchInAttachmentNames) ^ (2654435761 * self->_countBigramMatchInAttachmentNames) ^ (2654435761 * self->_countNgramMatchInAttachmentNames) ^ (2654435761 * self->_countUnigramPrefixMatchInAttachmentNames) ^ (2654435761 * self->_countBigramPrefixMatchInAttachmentNames) ^ (2654435761 * self->_countNgramPrefixMatchInAttachmentNames);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v37;
  void *v38;
  void *v39;
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
  id v78;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_averageEngagementAgeLast14Days)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("averageEngagementAgeLast14Days"));

  }
  if (self->_averageEngagementAgeLast21Days)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("averageEngagementAgeLast21Days"));

  }
  if (self->_averageEngagementAgeLast30Days)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("averageEngagementAgeLast30Days"));

  }
  if (self->_averageEngagementAgeLast7Days)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("averageEngagementAgeLast7Days"));

  }
  if (self->_countBigramMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("countBigramMatchInAttachmentNames"));

  }
  if (self->_countBigramMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("countBigramMatchInAttachmentTypes"));

  }
  if (self->_countBigramMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("countBigramMatchInAuthorEmailAddresses"));

  }
  if (self->_countBigramMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("countBigramMatchInAuthors"));

  }
  if (self->_countBigramMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("countBigramMatchInEmailAddresses"));

  }
  if (self->_countBigramMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("countBigramMatchInRecipientEmailAddresses"));

  }
  if (self->_countBigramMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("countBigramMatchInRecipients"));

  }
  if (self->_countBigramMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("countBigramMatchInSubject"));

  }
  if (self->_countBigramMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("countBigramMatchInTextContent"));

  }
  if (self->_countBigramPrefixMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("countBigramPrefixMatchInAttachmentNames"));

  }
  if (self->_countBigramPrefixMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("countBigramPrefixMatchInAttachmentTypes"));

  }
  if (self->_countBigramPrefixMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("countBigramPrefixMatchInAuthorEmailAddresses"));

  }
  if (self->_countBigramPrefixMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("countBigramPrefixMatchInAuthors"));

  }
  if (self->_countBigramPrefixMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("countBigramPrefixMatchInEmailAddresses"));

  }
  if (self->_countBigramPrefixMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("countBigramPrefixMatchInRecipientEmailAddresses"));

  }
  if (self->_countBigramPrefixMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("countBigramPrefixMatchInRecipients"));

  }
  if (self->_countBigramPrefixMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("countBigramPrefixMatchInSubject"));

  }
  if (self->_countBigramPrefixMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("countBigramPrefixMatchInTextContent"));

  }
  if (self->_countNgramMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("countNgramMatchInAttachmentNames"));

  }
  if (self->_countNgramMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("countNgramMatchInAttachmentTypes"));

  }
  if (self->_countNgramMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("countNgramMatchInAuthorEmailAddresses"));

  }
  if (self->_countNgramMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("countNgramMatchInAuthors"));

  }
  if (self->_countNgramMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("countNgramMatchInEmailAddresses"));

  }
  if (self->_countNgramMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("countNgramMatchInRecipientEmailAddresses"));

  }
  if (self->_countNgramMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("countNgramMatchInRecipients"));

  }
  if (self->_countNgramMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("countNgramMatchInSubject"));

  }
  if (self->_countNgramMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("countNgramMatchInTextContent"));

  }
  if (self->_countNgramPrefixMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("countNgramPrefixMatchInAttachmentNames"));

  }
  if (self->_countNgramPrefixMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("countNgramPrefixMatchInAttachmentTypes"));

  }
  if (self->_countNgramPrefixMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("countNgramPrefixMatchInAuthorEmailAddresses"));

  }
  if (self->_countNgramPrefixMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("countNgramPrefixMatchInAuthors"));

  }
  if (self->_countNgramPrefixMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("countNgramPrefixMatchInEmailAddresses"));

  }
  if (self->_countNgramPrefixMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("countNgramPrefixMatchInRecipientEmailAddresses"));

  }
  if (self->_countNgramPrefixMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("countNgramPrefixMatchInRecipients"));

  }
  if (self->_countNgramPrefixMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("countNgramPrefixMatchInSubject"));

  }
  if (self->_countNgramPrefixMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("countNgramPrefixMatchInTextContent"));

  }
  if (self->_countUnigramMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("countUnigramMatchInAttachmentNames"));

  }
  if (self->_countUnigramMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("countUnigramMatchInAttachmentTypes"));

  }
  if (self->_countUnigramMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("countUnigramMatchInAuthorEmailAddresses"));

  }
  if (self->_countUnigramMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("countUnigramMatchInAuthors"));

  }
  if (self->_countUnigramMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("countUnigramMatchInEmailAddresses"));

  }
  if (self->_countUnigramMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("countUnigramMatchInRecipientEmailAddresses"));

  }
  if (self->_countUnigramMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("countUnigramMatchInRecipients"));

  }
  if (self->_countUnigramMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("countUnigramMatchInSubject"));

  }
  if (self->_countUnigramMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("countUnigramMatchInTextContent"));

  }
  if (self->_countUnigramPrefixMatchInAttachmentNames)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("countUnigramPrefixMatchInAttachmentNames"));

  }
  if (self->_countUnigramPrefixMatchInAttachmentTypes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("countUnigramPrefixMatchInAttachmentTypes"));

  }
  if (self->_countUnigramPrefixMatchInAuthorEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("countUnigramPrefixMatchInAuthorEmailAddresses"));

  }
  if (self->_countUnigramPrefixMatchInAuthors)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("countUnigramPrefixMatchInAuthors"));

  }
  if (self->_countUnigramPrefixMatchInEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("countUnigramPrefixMatchInEmailAddresses"));

  }
  if (self->_countUnigramPrefixMatchInRecipientEmailAddresses)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("countUnigramPrefixMatchInRecipientEmailAddresses"));

  }
  if (self->_countUnigramPrefixMatchInRecipients)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("countUnigramPrefixMatchInRecipients"));

  }
  if (self->_countUnigramPrefixMatchInSubject)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("countUnigramPrefixMatchInSubject"));

  }
  if (self->_countUnigramPrefixMatchInTextContent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("countUnigramPrefixMatchInTextContent"));

  }
  if (self->_daysSinceReceipt)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("daysSinceReceipt"));

  }
  if (self->_isFlagged)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMailRankingSignals isFlagged](self, "isFlagged"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("isFlagged"));

  }
  if (self->_isRepliedTo)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMailRankingSignals isRepliedTo](self, "isRepliedTo"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("isRepliedTo"));

  }
  if (self->_isSemanticMatch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMailRankingSignals isSemanticMatch](self, "isSemanticMatch"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("isSemanticMatch"));

  }
  if (self->_isSyntacticMatch)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("isSyntacticMatch"));

  }
  if (self->_l1Score != 0.0)
  {
    v67 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMailRankingSignals l1Score](self, "l1Score");
    objc_msgSend(v67, "numberWithFloat:");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("l1Score"));

  }
  if (self->_l2Score != 0.0)
  {
    v69 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMailRankingSignals l2Score](self, "l2Score");
    objc_msgSend(v69, "numberWithFloat:");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("l2Score"));

  }
  if (self->_numDaysEngagedLast30Days)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("numDaysEngagedLast30Days"));

  }
  if (self->_numEngagements)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBMailRankingSignals numEngagements](self, "numEngagements"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("numEngagements"));

  }
  if (self->_semanticScore != 0.0)
  {
    v73 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMailRankingSignals semanticScore](self, "semanticScore");
    objc_msgSend(v73, "numberWithFloat:");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("semanticScore"));

  }
  if (self->_syntacticScore != 0.0)
  {
    v75 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBMailRankingSignals syntacticScore](self, "syntacticScore");
    objc_msgSend(v75, "numberWithFloat:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("syntacticScore"));

  }
  if (self->_wasReorderedByRecency)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("wasReorderedByRecency"));

  }
  v78 = v3;

  return v78;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMailRankingSignals dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMailRankingSignals)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMailRankingSignals *v5;
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
    self = -[_SFPBMailRankingSignals initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMailRankingSignals)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMailRankingSignals *v5;
  void *v6;
  void *v7;
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
  void *v37;
  void *v38;
  void *v39;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _SFPBMailRankingSignals *v85;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  objc_super v150;

  v4 = a3;
  v150.receiver = self;
  v150.super_class = (Class)_SFPBMailRankingSignals;
  v5 = -[_SFPBMailRankingSignals init](&v150, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasReorderedByRecency"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numEngagements"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setNumEngagements:](v5, "setNumEngagements:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numDaysEngagedLast30Days"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", objc_msgSend(v8, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageEngagementAgeLast7Days"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast7Days:](v5, "setAverageEngagementAgeLast7Days:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageEngagementAgeLast14Days"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast14Days:](v5, "setAverageEngagementAgeLast14Days:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageEngagementAgeLast21Days"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast21Days:](v5, "setAverageEngagementAgeLast21Days:", objc_msgSend(v11, "intValue"));
    v117 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageEngagementAgeLast30Days"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setAverageEngagementAgeLast30Days:](v5, "setAverageEngagementAgeLast30Days:", objc_msgSend(v12, "intValue"));
    v111 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysSinceReceipt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v149 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", objc_msgSend(v13, "unsignedLongLongValue"));
    v116 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("l1Score"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[_SFPBMailRankingSignals setL1Score:](v5, "setL1Score:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("l2Score"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v148 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[_SFPBMailRankingSignals setL2Score:](v5, "setL2Score:");
    }
    v115 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFlagged"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setIsFlagged:](v5, "setIsFlagged:", objc_msgSend(v16, "BOOLValue"));
    v17 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRepliedTo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v147 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setIsRepliedTo:](v5, "setIsRepliedTo:", objc_msgSend(v18, "BOOLValue"));
    v19 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSemanticMatch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSyntacticMatch"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v146 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[_SFPBMailRankingSignals setSemanticScore:](v5, "setSemanticScore:");
    }
    v107 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("syntacticScore"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v145 = v23;
    v114 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "floatValue");
      -[_SFPBMailRankingSignals setSyntacticScore:](v5, "setSyntacticScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInAuthors"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v144 = v24;
    v113 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", objc_msgSend(v24, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInAuthors"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v143 = v25;
    v112 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", objc_msgSend(v25, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInAuthors"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", objc_msgSend(v26, "unsignedIntValue"));
    v106 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInAuthors"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v142 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", objc_msgSend(v27, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInAuthors"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", objc_msgSend(v28, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInAuthors"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v141 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", objc_msgSend(v29, "unsignedIntValue"));
    v30 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInAuthorEmailAddresses"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", objc_msgSend(v31, "unsignedIntValue"));
    v104 = v31;
    v32 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInAuthorEmailAddresses"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v140 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", objc_msgSend(v33, "unsignedIntValue"));
    v34 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInAuthorEmailAddresses"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", objc_msgSend(v35, "unsignedIntValue"));
    v103 = v35;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInAuthorEmailAddresses"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v139 = v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v36, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInAuthorEmailAddresses"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v37, "unsignedIntValue"));
    v102 = v37;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInAuthorEmailAddresses"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v138 = v38;
    v110 = v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v38, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInSubject"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v137 = v39;
    v109 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", objc_msgSend(v39, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInSubject"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v136 = v40;
    v108 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", objc_msgSend(v40, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInSubject"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v135 = v41;
    v105 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", objc_msgSend(v41, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInSubject"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", objc_msgSend(v42, "unsignedIntValue"));
    v101 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInSubject"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v134 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", objc_msgSend(v43, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInSubject"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", objc_msgSend(v44, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInTextContent"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v133 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", objc_msgSend(v45, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInTextContent"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", objc_msgSend(v46, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInTextContent"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v132 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", objc_msgSend(v47, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInTextContent"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", objc_msgSend(v48, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInTextContent"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v131 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", objc_msgSend(v49, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInTextContent"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", objc_msgSend(v50, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInRecipients"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v130 = v51;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", objc_msgSend(v51, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInRecipients"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", objc_msgSend(v52, "unsignedIntValue"));
    v96 = v52;
    v53 = v50;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInRecipients"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v129 = v54;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", objc_msgSend(v54, "unsignedIntValue"));
    v55 = v48;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInRecipients"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", objc_msgSend(v56, "unsignedIntValue"));
    v95 = v56;
    v57 = v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInRecipients"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v128 = v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", objc_msgSend(v58, "unsignedIntValue"));
    v59 = v44;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInRecipients"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", objc_msgSend(v60, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInRecipientEmailAddresses"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v127 = v61;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", objc_msgSend(v61, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInRecipientEmailAddresses"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", objc_msgSend(v62, "unsignedIntValue"));
    v93 = v62;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInRecipientEmailAddresses"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v126 = v63;
    v100 = v59;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", objc_msgSend(v63, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInRecipientEmailAddresses"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v125 = v64;
    v99 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v64, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInRecipientEmailAddresses"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v124 = v65;
    v98 = v55;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v65, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInRecipientEmailAddresses"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v123 = v66;
    v97 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v66, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInEmailAddresses"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", objc_msgSend(v67, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInEmailAddresses"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", objc_msgSend(v68, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInEmailAddresses"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", objc_msgSend(v69, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInEmailAddresses"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v121 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", objc_msgSend(v70, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInEmailAddresses"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", objc_msgSend(v71, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInEmailAddresses"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v120 = v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", objc_msgSend(v72, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInAttachmentTypes"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", objc_msgSend(v73, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInAttachmentTypes"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", objc_msgSend(v74, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInAttachmentTypes"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", objc_msgSend(v75, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInAttachmentTypes"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", objc_msgSend(v76, "unsignedIntValue"));
    v94 = v60;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInAttachmentTypes"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", objc_msgSend(v77, "unsignedIntValue"));
    v91 = v69;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInAttachmentTypes"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", objc_msgSend(v78, "unsignedIntValue"));
    v90 = v71;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramMatchInAttachmentNames"), v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", objc_msgSend(v79, "unsignedIntValue"));
    v89 = v73;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramMatchInAttachmentNames"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", objc_msgSend(v80, "unsignedIntValue"));
    v88 = v75;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramMatchInAttachmentNames"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", objc_msgSend(v81, "unsignedIntValue"));
    v92 = v67;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countUnigramPrefixMatchInAttachmentNames"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", objc_msgSend(v82, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countBigramPrefixMatchInAttachmentNames"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", objc_msgSend(v83, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countNgramPrefixMatchInAttachmentNames"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMailRankingSignals setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", objc_msgSend(v84, "unsignedIntValue"));
    v85 = v5;

  }
  return v5;
}

- (BOOL)wasReorderedByRecency
{
  return self->_wasReorderedByRecency;
}

- (unint64_t)numEngagements
{
  return self->_numEngagements;
}

- (unint64_t)numDaysEngagedLast30Days
{
  return self->_numDaysEngagedLast30Days;
}

- (int)averageEngagementAgeLast7Days
{
  return self->_averageEngagementAgeLast7Days;
}

- (int)averageEngagementAgeLast14Days
{
  return self->_averageEngagementAgeLast14Days;
}

- (int)averageEngagementAgeLast21Days
{
  return self->_averageEngagementAgeLast21Days;
}

- (int)averageEngagementAgeLast30Days
{
  return self->_averageEngagementAgeLast30Days;
}

- (unint64_t)daysSinceReceipt
{
  return self->_daysSinceReceipt;
}

- (float)l1Score
{
  return self->_l1Score;
}

- (float)l2Score
{
  return self->_l2Score;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (BOOL)isRepliedTo
{
  return self->_isRepliedTo;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (unsigned)countUnigramMatchInAuthors
{
  return self->_countUnigramMatchInAuthors;
}

- (unsigned)countBigramMatchInAuthors
{
  return self->_countBigramMatchInAuthors;
}

- (unsigned)countNgramMatchInAuthors
{
  return self->_countNgramMatchInAuthors;
}

- (unsigned)countUnigramPrefixMatchInAuthors
{
  return self->_countUnigramPrefixMatchInAuthors;
}

- (unsigned)countBigramPrefixMatchInAuthors
{
  return self->_countBigramPrefixMatchInAuthors;
}

- (unsigned)countNgramPrefixMatchInAuthors
{
  return self->_countNgramPrefixMatchInAuthors;
}

- (unsigned)countUnigramMatchInAuthorEmailAddresses
{
  return self->_countUnigramMatchInAuthorEmailAddresses;
}

- (unsigned)countBigramMatchInAuthorEmailAddresses
{
  return self->_countBigramMatchInAuthorEmailAddresses;
}

- (unsigned)countNgramMatchInAuthorEmailAddresses
{
  return self->_countNgramMatchInAuthorEmailAddresses;
}

- (unsigned)countUnigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countUnigramPrefixMatchInAuthorEmailAddresses;
}

- (unsigned)countBigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countBigramPrefixMatchInAuthorEmailAddresses;
}

- (unsigned)countNgramPrefixMatchInAuthorEmailAddresses
{
  return self->_countNgramPrefixMatchInAuthorEmailAddresses;
}

- (unsigned)countUnigramMatchInSubject
{
  return self->_countUnigramMatchInSubject;
}

- (unsigned)countBigramMatchInSubject
{
  return self->_countBigramMatchInSubject;
}

- (unsigned)countNgramMatchInSubject
{
  return self->_countNgramMatchInSubject;
}

- (unsigned)countUnigramPrefixMatchInSubject
{
  return self->_countUnigramPrefixMatchInSubject;
}

- (unsigned)countBigramPrefixMatchInSubject
{
  return self->_countBigramPrefixMatchInSubject;
}

- (unsigned)countNgramPrefixMatchInSubject
{
  return self->_countNgramPrefixMatchInSubject;
}

- (unsigned)countUnigramMatchInTextContent
{
  return self->_countUnigramMatchInTextContent;
}

- (unsigned)countBigramMatchInTextContent
{
  return self->_countBigramMatchInTextContent;
}

- (unsigned)countNgramMatchInTextContent
{
  return self->_countNgramMatchInTextContent;
}

- (unsigned)countUnigramPrefixMatchInTextContent
{
  return self->_countUnigramPrefixMatchInTextContent;
}

- (unsigned)countBigramPrefixMatchInTextContent
{
  return self->_countBigramPrefixMatchInTextContent;
}

- (unsigned)countNgramPrefixMatchInTextContent
{
  return self->_countNgramPrefixMatchInTextContent;
}

- (unsigned)countUnigramMatchInRecipients
{
  return self->_countUnigramMatchInRecipients;
}

- (unsigned)countBigramMatchInRecipients
{
  return self->_countBigramMatchInRecipients;
}

- (unsigned)countNgramMatchInRecipients
{
  return self->_countNgramMatchInRecipients;
}

- (unsigned)countUnigramPrefixMatchInRecipients
{
  return self->_countUnigramPrefixMatchInRecipients;
}

- (unsigned)countBigramPrefixMatchInRecipients
{
  return self->_countBigramPrefixMatchInRecipients;
}

- (unsigned)countNgramPrefixMatchInRecipients
{
  return self->_countNgramPrefixMatchInRecipients;
}

- (unsigned)countUnigramMatchInRecipientEmailAddresses
{
  return self->_countUnigramMatchInRecipientEmailAddresses;
}

- (unsigned)countBigramMatchInRecipientEmailAddresses
{
  return self->_countBigramMatchInRecipientEmailAddresses;
}

- (unsigned)countNgramMatchInRecipientEmailAddresses
{
  return self->_countNgramMatchInRecipientEmailAddresses;
}

- (unsigned)countUnigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countUnigramPrefixMatchInRecipientEmailAddresses;
}

- (unsigned)countBigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countBigramPrefixMatchInRecipientEmailAddresses;
}

- (unsigned)countNgramPrefixMatchInRecipientEmailAddresses
{
  return self->_countNgramPrefixMatchInRecipientEmailAddresses;
}

- (unsigned)countUnigramMatchInEmailAddresses
{
  return self->_countUnigramMatchInEmailAddresses;
}

- (unsigned)countBigramMatchInEmailAddresses
{
  return self->_countBigramMatchInEmailAddresses;
}

- (unsigned)countNgramMatchInEmailAddresses
{
  return self->_countNgramMatchInEmailAddresses;
}

- (unsigned)countUnigramPrefixMatchInEmailAddresses
{
  return self->_countUnigramPrefixMatchInEmailAddresses;
}

- (unsigned)countBigramPrefixMatchInEmailAddresses
{
  return self->_countBigramPrefixMatchInEmailAddresses;
}

- (unsigned)countNgramPrefixMatchInEmailAddresses
{
  return self->_countNgramPrefixMatchInEmailAddresses;
}

- (unsigned)countUnigramMatchInAttachmentTypes
{
  return self->_countUnigramMatchInAttachmentTypes;
}

- (unsigned)countBigramMatchInAttachmentTypes
{
  return self->_countBigramMatchInAttachmentTypes;
}

- (unsigned)countNgramMatchInAttachmentTypes
{
  return self->_countNgramMatchInAttachmentTypes;
}

- (unsigned)countUnigramPrefixMatchInAttachmentTypes
{
  return self->_countUnigramPrefixMatchInAttachmentTypes;
}

- (unsigned)countBigramPrefixMatchInAttachmentTypes
{
  return self->_countBigramPrefixMatchInAttachmentTypes;
}

- (unsigned)countNgramPrefixMatchInAttachmentTypes
{
  return self->_countNgramPrefixMatchInAttachmentTypes;
}

- (unsigned)countUnigramMatchInAttachmentNames
{
  return self->_countUnigramMatchInAttachmentNames;
}

- (unsigned)countBigramMatchInAttachmentNames
{
  return self->_countBigramMatchInAttachmentNames;
}

- (unsigned)countNgramMatchInAttachmentNames
{
  return self->_countNgramMatchInAttachmentNames;
}

- (unsigned)countUnigramPrefixMatchInAttachmentNames
{
  return self->_countUnigramPrefixMatchInAttachmentNames;
}

- (unsigned)countBigramPrefixMatchInAttachmentNames
{
  return self->_countBigramPrefixMatchInAttachmentNames;
}

- (unsigned)countNgramPrefixMatchInAttachmentNames
{
  return self->_countNgramPrefixMatchInAttachmentNames;
}

@end
