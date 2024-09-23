@implementation SFMailRankingSignals

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setWasReorderedByRecency:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_wasReorderedByRecency = a3;
}

- (BOOL)hasWasReorderedByRecency
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setNumEngagements:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_numEngagements = a3;
}

- (BOOL)hasNumEngagements
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumDaysEngagedLast30Days:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_numDaysEngagedLast30Days = a3;
}

- (BOOL)hasNumDaysEngagedLast30Days
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDaysSinceReceipt:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_daysSinceReceipt = a3;
}

- (BOOL)hasDaysSinceReceipt
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsFlagged:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_isFlagged = a3;
}

- (BOOL)hasIsFlagged
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsRepliedTo:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_isRepliedTo = a3;
}

- (BOOL)hasIsRepliedTo
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_isSemanticMatch = a3;
}

- (BOOL)hasIsSemanticMatch
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_isSyntacticMatch = a3;
}

- (BOOL)hasIsSyntacticMatch
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCountUnigramMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_countUnigramMatchInAuthors = a3;
}

- (BOOL)hasCountUnigramMatchInAuthors
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCountBigramMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_countBigramMatchInAuthors = a3;
}

- (BOOL)hasCountBigramMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCountNgramMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_countNgramMatchInAuthors = a3;
}

- (BOOL)hasCountNgramMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCountUnigramPrefixMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_countUnigramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCountBigramPrefixMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_countBigramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCountNgramPrefixMatchInAuthors:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_countNgramPrefixMatchInAuthors = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAuthors
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCountUnigramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_countUnigramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCountBigramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_countBigramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInAuthorEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountNgramMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_countNgramMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInAuthorEmailAddresses
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCountUnigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_countUnigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCountBigramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_countBigramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCountNgramPrefixMatchInAuthorEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_countNgramPrefixMatchInAuthorEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAuthorEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCountUnigramMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_countUnigramMatchInSubject = a3;
}

- (BOOL)hasCountUnigramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCountBigramMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_countBigramMatchInSubject = a3;
}

- (BOOL)hasCountBigramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCountNgramMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_countNgramMatchInSubject = a3;
}

- (BOOL)hasCountNgramMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCountUnigramPrefixMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_countUnigramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInSubject
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setCountBigramPrefixMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_countBigramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountBigramPrefixMatchInSubject
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setCountNgramPrefixMatchInSubject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_countNgramPrefixMatchInSubject = a3;
}

- (BOOL)hasCountNgramPrefixMatchInSubject
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCountUnigramMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_countUnigramMatchInTextContent = a3;
}

- (BOOL)hasCountUnigramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCountBigramMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_countBigramMatchInTextContent = a3;
}

- (BOOL)hasCountBigramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setCountNgramMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_countNgramMatchInTextContent = a3;
}

- (BOOL)hasCountNgramMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCountUnigramPrefixMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_countUnigramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setCountBigramPrefixMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_countBigramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountBigramPrefixMatchInTextContent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCountNgramPrefixMatchInTextContent:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_countNgramPrefixMatchInTextContent = a3;
}

- (BOOL)hasCountNgramPrefixMatchInTextContent
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setCountUnigramMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_countUnigramMatchInRecipients = a3;
}

- (BOOL)hasCountUnigramMatchInRecipients
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setCountBigramMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_countBigramMatchInRecipients = a3;
}

- (BOOL)hasCountBigramMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setCountNgramMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_countNgramMatchInRecipients = a3;
}

- (BOOL)hasCountNgramMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setCountUnigramPrefixMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_countUnigramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCountBigramPrefixMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_countBigramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountBigramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCountNgramPrefixMatchInRecipients:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_countNgramPrefixMatchInRecipients = a3;
}

- (BOOL)hasCountNgramPrefixMatchInRecipients
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCountUnigramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_countUnigramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCountBigramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_countBigramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInRecipientEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCountNgramMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_countNgramMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInRecipientEmailAddresses
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setCountUnigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_countUnigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCountBigramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_countBigramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCountNgramPrefixMatchInRecipientEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_countNgramPrefixMatchInRecipientEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInRecipientEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setCountUnigramMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_countUnigramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountUnigramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setCountBigramMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_countBigramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountBigramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setCountNgramMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_countNgramMatchInEmailAddresses = a3;
}

- (BOOL)hasCountNgramMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCountUnigramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_countUnigramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInEmailAddresses
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setCountBigramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_countBigramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountBigramPrefixMatchInEmailAddresses
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setCountNgramPrefixMatchInEmailAddresses:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_countNgramPrefixMatchInEmailAddresses = a3;
}

- (BOOL)hasCountNgramPrefixMatchInEmailAddresses
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setCountUnigramMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_countUnigramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountUnigramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setCountBigramMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_countBigramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountBigramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setCountNgramMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_countNgramMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountNgramMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setCountUnigramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_countUnigramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setCountBigramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_countBigramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAttachmentTypes
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setCountNgramPrefixMatchInAttachmentTypes:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_countNgramPrefixMatchInAttachmentTypes = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAttachmentTypes
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setCountUnigramMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_countUnigramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountUnigramMatchInAttachmentNames
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setCountBigramMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_countBigramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountBigramMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setCountNgramMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_countNgramMatchInAttachmentNames = a3;
}

- (BOOL)hasCountNgramMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setCountUnigramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_countUnigramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountUnigramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setCountBigramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_countBigramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountBigramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setCountNgramPrefixMatchInAttachmentNames:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_countNgramPrefixMatchInAttachmentNames = a3;
}

- (BOOL)hasCountNgramPrefixMatchInAttachmentNames
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (SFMailRankingSignals)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMailRankingSignals *v6;
  SFMailRankingSignals *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMailRankingSignals initWithData:]([_SFPBMailRankingSignals alloc], "initWithData:", v5);
  v7 = -[SFMailRankingSignals initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMailRankingSignals *v6;

  v4 = a3;
  v6 = -[_SFPBMailRankingSignals initWithFacade:]([_SFPBMailRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBMailRankingSignals data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMailRankingSignals *v2;
  void *v3;

  v2 = -[_SFPBMailRankingSignals initWithFacade:]([_SFPBMailRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBMailRankingSignals dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMailRankingSignals *v2;
  void *v3;

  v2 = -[_SFPBMailRankingSignals initWithFacade:]([_SFPBMailRankingSignals alloc], "initWithFacade:", self);
  -[_SFPBMailRankingSignals jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setWasReorderedByRecency:", -[SFMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency"));
  objc_msgSend(v4, "setNumEngagements:", -[SFMailRankingSignals numEngagements](self, "numEngagements"));
  objc_msgSend(v4, "setNumDaysEngagedLast30Days:", -[SFMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"));
  -[SFMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAverageEngagementAgeLast7Days:", v6);

  -[SFMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setAverageEngagementAgeLast14Days:", v8);

  -[SFMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAverageEngagementAgeLast21Days:", v10);

  -[SFMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setAverageEngagementAgeLast30Days:", v12);

  objc_msgSend(v4, "setDaysSinceReceipt:", -[SFMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt"));
  -[SFMailRankingSignals l1Score](self, "l1Score");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setL1Score:", v14);

  -[SFMailRankingSignals l2Score](self, "l2Score");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setL2Score:", v16);

  objc_msgSend(v4, "setIsFlagged:", -[SFMailRankingSignals isFlagged](self, "isFlagged"));
  objc_msgSend(v4, "setIsRepliedTo:", -[SFMailRankingSignals isRepliedTo](self, "isRepliedTo"));
  objc_msgSend(v4, "setIsSemanticMatch:", -[SFMailRankingSignals isSemanticMatch](self, "isSemanticMatch"));
  objc_msgSend(v4, "setIsSyntacticMatch:", -[SFMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch"));
  -[SFMailRankingSignals semanticScore](self, "semanticScore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setSemanticScore:", v18);

  -[SFMailRankingSignals syntacticScore](self, "syntacticScore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setSyntacticScore:", v20);

  objc_msgSend(v4, "setCountUnigramMatchInAuthors:", -[SFMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors"));
  objc_msgSend(v4, "setCountBigramMatchInAuthors:", -[SFMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors"));
  objc_msgSend(v4, "setCountNgramMatchInAuthors:", -[SFMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAuthors:", -[SFMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAuthors:", -[SFMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAuthors:", -[SFMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors"));
  objc_msgSend(v4, "setCountUnigramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAuthorEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInSubject:", -[SFMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject"));
  objc_msgSend(v4, "setCountBigramMatchInSubject:", -[SFMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject"));
  objc_msgSend(v4, "setCountNgramMatchInSubject:", -[SFMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInSubject:", -[SFMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInSubject:", -[SFMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInSubject:", -[SFMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject"));
  objc_msgSend(v4, "setCountUnigramMatchInTextContent:", -[SFMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent"));
  objc_msgSend(v4, "setCountBigramMatchInTextContent:", -[SFMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent"));
  objc_msgSend(v4, "setCountNgramMatchInTextContent:", -[SFMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInTextContent:", -[SFMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInTextContent:", -[SFMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInTextContent:", -[SFMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent"));
  objc_msgSend(v4, "setCountUnigramMatchInRecipients:", -[SFMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients"));
  objc_msgSend(v4, "setCountBigramMatchInRecipients:", -[SFMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients"));
  objc_msgSend(v4, "setCountNgramMatchInRecipients:", -[SFMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInRecipients:", -[SFMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInRecipients:", -[SFMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInRecipients:", -[SFMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients"));
  objc_msgSend(v4, "setCountUnigramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInRecipientEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInEmailAddresses:", -[SFMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountBigramMatchInEmailAddresses:", -[SFMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountNgramMatchInEmailAddresses:", -[SFMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInEmailAddresses:", -[SFMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses"));
  objc_msgSend(v4, "setCountUnigramMatchInAttachmentTypes:", -[SFMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountBigramMatchInAttachmentTypes:", -[SFMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountNgramMatchInAttachmentTypes:", -[SFMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAttachmentTypes:", -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"));
  objc_msgSend(v4, "setCountUnigramMatchInAttachmentNames:", -[SFMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountBigramMatchInAttachmentNames:", -[SFMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountNgramMatchInAttachmentNames:", -[SFMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountUnigramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountBigramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"));
  objc_msgSend(v4, "setCountNgramPrefixMatchInAttachmentNames:", -[SFMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMailRankingSignals *v5;
  SFMailRankingSignals *v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  BOOL v100;
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

  v5 = (SFMailRankingSignals *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    if (-[SFMailRankingSignals isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency");
      if (v7 != -[SFMailRankingSignals wasReorderedByRecency](v6, "wasReorderedByRecency")
        || (v8 = -[SFMailRankingSignals numEngagements](self, "numEngagements"),
            v8 != -[SFMailRankingSignals numEngagements](v6, "numEngagements"))
        || (v9 = -[SFMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days"),
            v9 != -[SFMailRankingSignals numDaysEngagedLast30Days](v6, "numDaysEngagedLast30Days")))
      {
        v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[SFMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals averageEngagementAgeLast7Days](v6, "averageEngagementAgeLast7Days");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 == 0) == (v11 != 0))
      {
        v14 = 0;
LABEL_57:

        goto LABEL_13;
      }
      -[SFMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SFMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals averageEngagementAgeLast7Days](v6, "averageEngagementAgeLast7Days");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v3))
        {
          v14 = 0;
          goto LABEL_55;
        }
        v133 = v3;
        v134 = v13;
      }
      -[SFMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals averageEngagementAgeLast14Days](v6, "averageEngagementAgeLast14Days");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
        goto LABEL_53;
      -[SFMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[SFMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days");
        v19 = objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals averageEngagementAgeLast14Days](v6, "averageEngagementAgeLast14Days");
        v20 = objc_claimAutoreleasedReturnValue();
        v130 = (void *)v19;
        v21 = (void *)v19;
        v3 = (void *)v20;
        if (!objc_msgSend(v21, "isEqual:", v20))
          goto LABEL_52;
      }
      v131 = v16;
      v132 = v18;
      -[SFMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals averageEngagementAgeLast21Days](v6, "averageEngagementAgeLast21Days");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v22 == 0) == (v23 != 0))
      {

        goto LABEL_51;
      }
      v127 = v22;
      v128 = v23;
      -[SFMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      if (v129)
      {
        -[SFMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals averageEngagementAgeLast21Days](v6, "averageEngagementAgeLast21Days");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v24;
        if (!objc_msgSend(v24, "isEqual:", v125))
          goto LABEL_49;
      }
      -[SFMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals averageEngagementAgeLast30Days](v6, "averageEngagementAgeLast30Days");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v25 == 0) == (v26 != 0))
      {

        goto LABEL_48;
      }
      v124 = v26;
      v123 = v25;
      -[SFMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[SFMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days");
        v28 = v17;
        v29 = objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals averageEngagementAgeLast30Days](v6, "averageEngagementAgeLast30Days");
        v30 = objc_claimAutoreleasedReturnValue();
        v121 = (void *)v29;
        v31 = (void *)v29;
        v17 = v28;
        v25 = (void *)v30;
        if (!objc_msgSend(v31, "isEqual:", v30))
          goto LABEL_37;
      }
      v122 = v27;
      v32 = -[SFMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt");
      if (v32 != -[SFMailRankingSignals daysSinceReceipt](v6, "daysSinceReceipt"))
      {
        v27 = v122;
        if (!v122)
        {
LABEL_47:

LABEL_48:
          v18 = v132;
          if (!v129)
          {
LABEL_50:

LABEL_51:
            v16 = v131;
            if (v18)
            {
LABEL_52:

            }
LABEL_53:

            v14 = 0;
            if (!v12)
            {
LABEL_56:

              goto LABEL_57;
            }
            v3 = v133;
            v13 = v134;
LABEL_55:

            goto LABEL_56;
          }
LABEL_49:

          goto LABEL_50;
        }
LABEL_37:

        goto LABEL_47;
      }
      v120 = v25;
      -[SFMailRankingSignals l1Score](self, "l1Score");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals l1Score](v6, "l1Score");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v33 == 0) == (v34 != 0))
      {

        goto LABEL_46;
      }
      v118 = v33;
      v119 = v34;
      -[SFMailRankingSignals l1Score](self, "l1Score");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        -[SFMailRankingSignals l1Score](self, "l1Score");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals l1Score](v6, "l1Score");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = v36;
        if (!objc_msgSend(v36, "isEqual:"))
        {
LABEL_44:

LABEL_45:
LABEL_46:
          v27 = v122;
          v25 = v120;
          if (!v122)
            goto LABEL_47;
          goto LABEL_37;
        }
      }
      v117 = v35;
      -[SFMailRankingSignals l2Score](self, "l2Score");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals l2Score](v6, "l2Score");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v37 == 0) == (v116 != 0))
      {

        v35 = v117;
        if (!v117)
          goto LABEL_45;
        goto LABEL_44;
      }
      v113 = v3;
      -[SFMailRankingSignals l2Score](self, "l2Score");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        -[SFMailRankingSignals l2Score](self, "l2Score");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMailRankingSignals l2Score](v6, "l2Score");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v39;
        if (!objc_msgSend(v39, "isEqual:"))
          goto LABEL_69;
      }
      v40 = -[SFMailRankingSignals isFlagged](self, "isFlagged");
      if (v40 == -[SFMailRankingSignals isFlagged](v6, "isFlagged"))
      {
        v41 = -[SFMailRankingSignals isRepliedTo](self, "isRepliedTo");
        if (v41 == -[SFMailRankingSignals isRepliedTo](v6, "isRepliedTo"))
        {
          v42 = -[SFMailRankingSignals isSemanticMatch](self, "isSemanticMatch");
          if (v42 == -[SFMailRankingSignals isSemanticMatch](v6, "isSemanticMatch"))
          {
            v43 = -[SFMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch");
            if (v43 == -[SFMailRankingSignals isSyntacticMatch](v6, "isSyntacticMatch"))
            {
              -[SFMailRankingSignals semanticScore](self, "semanticScore");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMailRankingSignals semanticScore](v6, "semanticScore");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v110 == 0) != (v109 != 0))
              {
                -[SFMailRankingSignals semanticScore](self, "semanticScore");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                if (v108)
                {
                  -[SFMailRankingSignals semanticScore](self, "semanticScore");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFMailRankingSignals semanticScore](v6, "semanticScore");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    v14 = 0;
                    goto LABEL_145;
                  }
                }
                -[SFMailRankingSignals syntacticScore](self, "syntacticScore");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFMailRankingSignals syntacticScore](v6, "syntacticScore");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v107 == 0) == (v106 != 0))
                {

                  v14 = 0;
                  goto LABEL_144;
                }
                -[SFMailRankingSignals syntacticScore](self, "syntacticScore");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v103
                  || (-[SFMailRankingSignals syntacticScore](self, "syntacticScore"),
                      v45 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFMailRankingSignals syntacticScore](v6, "syntacticScore"),
                      v101 = (void *)objc_claimAutoreleasedReturnValue(),
                      v102 = v45,
                      objc_msgSend(v45, "isEqual:")))
                {
                  v46 = -[SFMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors");
                  if (v46 != -[SFMailRankingSignals countUnigramMatchInAuthors](v6, "countUnigramMatchInAuthors"))
                    goto LABEL_140;
                  v47 = -[SFMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors");
                  if (v47 != -[SFMailRankingSignals countBigramMatchInAuthors](v6, "countBigramMatchInAuthors"))
                    goto LABEL_140;
                  v48 = -[SFMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors");
                  if (v48 != -[SFMailRankingSignals countNgramMatchInAuthors](v6, "countNgramMatchInAuthors"))
                    goto LABEL_140;
                  v49 = -[SFMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors");
                  if (v49 != -[SFMailRankingSignals countUnigramPrefixMatchInAuthors](v6, "countUnigramPrefixMatchInAuthors"))goto LABEL_140;
                  v50 = -[SFMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors");
                  if (v50 != -[SFMailRankingSignals countBigramPrefixMatchInAuthors](v6, "countBigramPrefixMatchInAuthors"))goto LABEL_140;
                  v51 = -[SFMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors");
                  if (v51 != -[SFMailRankingSignals countNgramPrefixMatchInAuthors](v6, "countNgramPrefixMatchInAuthors"))goto LABEL_140;
                  v52 = -[SFMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses");
                  if (v52 != -[SFMailRankingSignals countUnigramMatchInAuthorEmailAddresses](v6, "countUnigramMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v53 = -[SFMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses");
                  if (v53 != -[SFMailRankingSignals countBigramMatchInAuthorEmailAddresses](v6, "countBigramMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v54 = -[SFMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses");
                  if (v54 != -[SFMailRankingSignals countNgramMatchInAuthorEmailAddresses](v6, "countNgramMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v55 = -[SFMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses");
                  if (v55 != -[SFMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](v6, "countUnigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v56 = -[SFMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses");
                  if (v56 != -[SFMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](v6, "countBigramPrefixMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v57 = -[SFMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses");
                  if (v57 != -[SFMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](v6, "countNgramPrefixMatchInAuthorEmailAddresses"))goto LABEL_140;
                  v58 = -[SFMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject");
                  if (v58 != -[SFMailRankingSignals countUnigramMatchInSubject](v6, "countUnigramMatchInSubject"))
                    goto LABEL_140;
                  v59 = -[SFMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject");
                  if (v59 != -[SFMailRankingSignals countBigramMatchInSubject](v6, "countBigramMatchInSubject"))
                    goto LABEL_140;
                  v60 = -[SFMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject");
                  if (v60 != -[SFMailRankingSignals countNgramMatchInSubject](v6, "countNgramMatchInSubject"))
                    goto LABEL_140;
                  v61 = -[SFMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject");
                  if (v61 != -[SFMailRankingSignals countUnigramPrefixMatchInSubject](v6, "countUnigramPrefixMatchInSubject"))goto LABEL_140;
                  v62 = -[SFMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject");
                  if (v62 != -[SFMailRankingSignals countBigramPrefixMatchInSubject](v6, "countBigramPrefixMatchInSubject"))goto LABEL_140;
                  v63 = -[SFMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject");
                  if (v63 != -[SFMailRankingSignals countNgramPrefixMatchInSubject](v6, "countNgramPrefixMatchInSubject"))goto LABEL_140;
                  v64 = -[SFMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent");
                  if (v64 != -[SFMailRankingSignals countUnigramMatchInTextContent](v6, "countUnigramMatchInTextContent"))goto LABEL_140;
                  v65 = -[SFMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent");
                  if (v65 != -[SFMailRankingSignals countBigramMatchInTextContent](v6, "countBigramMatchInTextContent"))
                    goto LABEL_140;
                  v66 = -[SFMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent");
                  if (v66 != -[SFMailRankingSignals countNgramMatchInTextContent](v6, "countNgramMatchInTextContent"))
                    goto LABEL_140;
                  v67 = -[SFMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent");
                  if (v67 != -[SFMailRankingSignals countUnigramPrefixMatchInTextContent](v6, "countUnigramPrefixMatchInTextContent"))goto LABEL_140;
                  v68 = -[SFMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent");
                  if (v68 != -[SFMailRankingSignals countBigramPrefixMatchInTextContent](v6, "countBigramPrefixMatchInTextContent"))goto LABEL_140;
                  v69 = -[SFMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent");
                  if (v69 != -[SFMailRankingSignals countNgramPrefixMatchInTextContent](v6, "countNgramPrefixMatchInTextContent"))goto LABEL_140;
                  v70 = -[SFMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients");
                  if (v70 != -[SFMailRankingSignals countUnigramMatchInRecipients](v6, "countUnigramMatchInRecipients"))
                    goto LABEL_140;
                  v71 = -[SFMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients");
                  if (v71 != -[SFMailRankingSignals countBigramMatchInRecipients](v6, "countBigramMatchInRecipients"))
                    goto LABEL_140;
                  v72 = -[SFMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients");
                  if (v72 != -[SFMailRankingSignals countNgramMatchInRecipients](v6, "countNgramMatchInRecipients"))
                    goto LABEL_140;
                  v73 = -[SFMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients");
                  if (v73 != -[SFMailRankingSignals countUnigramPrefixMatchInRecipients](v6, "countUnigramPrefixMatchInRecipients"))goto LABEL_140;
                  v74 = -[SFMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients");
                  if (v74 != -[SFMailRankingSignals countBigramPrefixMatchInRecipients](v6, "countBigramPrefixMatchInRecipients"))goto LABEL_140;
                  v75 = -[SFMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients");
                  if (v75 != -[SFMailRankingSignals countNgramPrefixMatchInRecipients](v6, "countNgramPrefixMatchInRecipients"))goto LABEL_140;
                  v76 = -[SFMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses");
                  if (v76 != -[SFMailRankingSignals countUnigramMatchInRecipientEmailAddresses](v6, "countUnigramMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v77 = -[SFMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses");
                  if (v77 != -[SFMailRankingSignals countBigramMatchInRecipientEmailAddresses](v6, "countBigramMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v78 = -[SFMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses");
                  if (v78 != -[SFMailRankingSignals countNgramMatchInRecipientEmailAddresses](v6, "countNgramMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v79 = -[SFMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses");
                  if (v79 != -[SFMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](v6, "countUnigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v80 = -[SFMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses");
                  if (v80 != -[SFMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](v6, "countBigramPrefixMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v81 = -[SFMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses");
                  if (v81 != -[SFMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](v6, "countNgramPrefixMatchInRecipientEmailAddresses"))goto LABEL_140;
                  v82 = -[SFMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses");
                  if (v82 != -[SFMailRankingSignals countUnigramMatchInEmailAddresses](v6, "countUnigramMatchInEmailAddresses"))goto LABEL_140;
                  v83 = -[SFMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses");
                  if (v83 != -[SFMailRankingSignals countBigramMatchInEmailAddresses](v6, "countBigramMatchInEmailAddresses"))goto LABEL_140;
                  v84 = -[SFMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses");
                  if (v84 != -[SFMailRankingSignals countNgramMatchInEmailAddresses](v6, "countNgramMatchInEmailAddresses"))goto LABEL_140;
                  v85 = -[SFMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses");
                  if (v85 != -[SFMailRankingSignals countUnigramPrefixMatchInEmailAddresses](v6, "countUnigramPrefixMatchInEmailAddresses"))goto LABEL_140;
                  v86 = -[SFMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses");
                  if (v86 != -[SFMailRankingSignals countBigramPrefixMatchInEmailAddresses](v6, "countBigramPrefixMatchInEmailAddresses"))goto LABEL_140;
                  v87 = -[SFMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses");
                  if (v87 != -[SFMailRankingSignals countNgramPrefixMatchInEmailAddresses](v6, "countNgramPrefixMatchInEmailAddresses"))goto LABEL_140;
                  v88 = -[SFMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes");
                  if (v88 != -[SFMailRankingSignals countUnigramMatchInAttachmentTypes](v6, "countUnigramMatchInAttachmentTypes"))goto LABEL_140;
                  v89 = -[SFMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes");
                  if (v89 != -[SFMailRankingSignals countBigramMatchInAttachmentTypes](v6, "countBigramMatchInAttachmentTypes"))goto LABEL_140;
                  v90 = -[SFMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes");
                  if (v90 != -[SFMailRankingSignals countNgramMatchInAttachmentTypes](v6, "countNgramMatchInAttachmentTypes"))goto LABEL_140;
                  v91 = -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes");
                  if (v91 != -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](v6, "countUnigramPrefixMatchInAttachmentTypes"))goto LABEL_140;
                  v92 = -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes");
                  if (v92 == -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](v6, "countBigramPrefixMatchInAttachmentTypes")&& (v93 = -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes"), v93 == -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](v6, "countNgramPrefixMatchInAttachmentTypes"))&& (v94 = -[SFMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames"), v94 == -[SFMailRankingSignals countUnigramMatchInAttachmentNames](v6, "countUnigramMatchInAttachmentNames"))&& (v95 = -[SFMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames"), v95 == -[SFMailRankingSignals countBigramMatchInAttachmentNames](v6,
                                 "countBigramMatchInAttachmentNames"))
                    && (v96 = -[SFMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames"), v96 == -[SFMailRankingSignals countNgramMatchInAttachmentNames](v6, "countNgramMatchInAttachmentNames"))&& (v97 = -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames"), v97 == -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentNames](v6, "countUnigramPrefixMatchInAttachmentNames"))&& (v98 = -[SFMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames"), v98 == -[SFMailRankingSignals countBigramPrefixMatchInAttachmentNames](v6, "countBigramPrefixMatchInAttachmentNames")))
                  {
                    v99 = -[SFMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames");
                    v14 = v99 == -[SFMailRankingSignals countNgramPrefixMatchInAttachmentNames](v6, "countNgramPrefixMatchInAttachmentNames");
                    v100 = v14;
                  }
                  else
                  {
LABEL_140:
                    v14 = 0;
                    v100 = 0;
                  }
                  if (!v103)
                  {

                    v14 = v100;
LABEL_144:
                    if (!v108)
                    {
LABEL_146:

                      if (v38)
                      {

                      }
                      if (v117)
                      {

                      }
                      if (v122)
                      {

                      }
                      if (v129)
                      {

                      }
                      if (v132)
                      {

                      }
LABEL_79:
                      v3 = v133;
                      v13 = v134;
                      if (!v12)
                        goto LABEL_56;
                      goto LABEL_55;
                    }
LABEL_145:

                    goto LABEL_146;
                  }
                }
                else
                {
                  v14 = 0;
                }

                goto LABEL_144;
              }

            }
          }
        }
      }
      if (!v38)
      {
LABEL_70:

        if (v117)
        {

        }
        if (v122)
        {

        }
        if (v129)
        {

        }
        if (v132)
        {

        }
        v14 = 0;
        goto LABEL_79;
      }
LABEL_69:

      goto LABEL_70;
    }
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  void *v81;

  v3 = -[SFMailRankingSignals wasReorderedByRecency](self, "wasReorderedByRecency");
  v4 = -[SFMailRankingSignals numEngagements](self, "numEngagements");
  v5 = v4 ^ -[SFMailRankingSignals numDaysEngagedLast30Days](self, "numDaysEngagedLast30Days");
  -[SFMailRankingSignals averageEngagementAgeLast7Days](self, "averageEngagementAgeLast7Days");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v81, "hash") ^ v3;
  -[SFMailRankingSignals averageEngagementAgeLast14Days](self, "averageEngagementAgeLast14Days");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFMailRankingSignals averageEngagementAgeLast21Days](self, "averageEngagementAgeLast21Days");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[SFMailRankingSignals averageEngagementAgeLast30Days](self, "averageEngagementAgeLast30Days");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v10 ^ objc_msgSend(v11, "hash");
  v13 = -[SFMailRankingSignals daysSinceReceipt](self, "daysSinceReceipt");
  -[SFMailRankingSignals l1Score](self, "l1Score");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SFMailRankingSignals l2Score](self, "l2Score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  v18 = v12 ^ v17 ^ -[SFMailRankingSignals isFlagged](self, "isFlagged");
  v19 = -[SFMailRankingSignals isRepliedTo](self, "isRepliedTo");
  v20 = v19 ^ -[SFMailRankingSignals isSemanticMatch](self, "isSemanticMatch");
  v21 = v20 ^ -[SFMailRankingSignals isSyntacticMatch](self, "isSyntacticMatch");
  -[SFMailRankingSignals semanticScore](self, "semanticScore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v18 ^ v21 ^ objc_msgSend(v22, "hash");
  -[SFMailRankingSignals syntacticScore](self, "syntacticScore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  v26 = v25 ^ -[SFMailRankingSignals countUnigramMatchInAuthors](self, "countUnigramMatchInAuthors");
  v27 = v26 ^ -[SFMailRankingSignals countBigramMatchInAuthors](self, "countBigramMatchInAuthors");
  v28 = v27 ^ -[SFMailRankingSignals countNgramMatchInAuthors](self, "countNgramMatchInAuthors");
  v29 = v28 ^ -[SFMailRankingSignals countUnigramPrefixMatchInAuthors](self, "countUnigramPrefixMatchInAuthors");
  v30 = v23 ^ v29 ^ -[SFMailRankingSignals countBigramPrefixMatchInAuthors](self, "countBigramPrefixMatchInAuthors");
  v31 = -[SFMailRankingSignals countNgramPrefixMatchInAuthors](self, "countNgramPrefixMatchInAuthors");
  v32 = v31 ^ -[SFMailRankingSignals countUnigramMatchInAuthorEmailAddresses](self, "countUnigramMatchInAuthorEmailAddresses");
  v33 = v32 ^ -[SFMailRankingSignals countBigramMatchInAuthorEmailAddresses](self, "countBigramMatchInAuthorEmailAddresses");
  v34 = v33 ^ -[SFMailRankingSignals countNgramMatchInAuthorEmailAddresses](self, "countNgramMatchInAuthorEmailAddresses");
  v35 = v34 ^ -[SFMailRankingSignals countUnigramPrefixMatchInAuthorEmailAddresses](self, "countUnigramPrefixMatchInAuthorEmailAddresses");
  v36 = v35 ^ -[SFMailRankingSignals countBigramPrefixMatchInAuthorEmailAddresses](self, "countBigramPrefixMatchInAuthorEmailAddresses");
  v37 = v36 ^ -[SFMailRankingSignals countNgramPrefixMatchInAuthorEmailAddresses](self, "countNgramPrefixMatchInAuthorEmailAddresses");
  v38 = v30 ^ v37 ^ -[SFMailRankingSignals countUnigramMatchInSubject](self, "countUnigramMatchInSubject");
  v39 = -[SFMailRankingSignals countBigramMatchInSubject](self, "countBigramMatchInSubject");
  v40 = v39 ^ -[SFMailRankingSignals countNgramMatchInSubject](self, "countNgramMatchInSubject");
  v41 = v40 ^ -[SFMailRankingSignals countUnigramPrefixMatchInSubject](self, "countUnigramPrefixMatchInSubject");
  v42 = v41 ^ -[SFMailRankingSignals countBigramPrefixMatchInSubject](self, "countBigramPrefixMatchInSubject");
  v43 = v42 ^ -[SFMailRankingSignals countNgramPrefixMatchInSubject](self, "countNgramPrefixMatchInSubject");
  v44 = v43 ^ -[SFMailRankingSignals countUnigramMatchInTextContent](self, "countUnigramMatchInTextContent");
  v45 = v44 ^ -[SFMailRankingSignals countBigramMatchInTextContent](self, "countBigramMatchInTextContent");
  v46 = v45 ^ -[SFMailRankingSignals countNgramMatchInTextContent](self, "countNgramMatchInTextContent");
  v47 = v38 ^ v46 ^ -[SFMailRankingSignals countUnigramPrefixMatchInTextContent](self, "countUnigramPrefixMatchInTextContent");
  v48 = -[SFMailRankingSignals countBigramPrefixMatchInTextContent](self, "countBigramPrefixMatchInTextContent");
  v49 = v48 ^ -[SFMailRankingSignals countNgramPrefixMatchInTextContent](self, "countNgramPrefixMatchInTextContent");
  v50 = v49 ^ -[SFMailRankingSignals countUnigramMatchInRecipients](self, "countUnigramMatchInRecipients");
  v51 = v50 ^ -[SFMailRankingSignals countBigramMatchInRecipients](self, "countBigramMatchInRecipients");
  v52 = v51 ^ -[SFMailRankingSignals countNgramMatchInRecipients](self, "countNgramMatchInRecipients");
  v53 = v52 ^ -[SFMailRankingSignals countUnigramPrefixMatchInRecipients](self, "countUnigramPrefixMatchInRecipients");
  v54 = v53 ^ -[SFMailRankingSignals countBigramPrefixMatchInRecipients](self, "countBigramPrefixMatchInRecipients");
  v55 = v54 ^ -[SFMailRankingSignals countNgramPrefixMatchInRecipients](self, "countNgramPrefixMatchInRecipients");
  v56 = v55 ^ -[SFMailRankingSignals countUnigramMatchInRecipientEmailAddresses](self, "countUnigramMatchInRecipientEmailAddresses");
  v57 = v47 ^ v56 ^ -[SFMailRankingSignals countBigramMatchInRecipientEmailAddresses](self, "countBigramMatchInRecipientEmailAddresses");
  v58 = -[SFMailRankingSignals countNgramMatchInRecipientEmailAddresses](self, "countNgramMatchInRecipientEmailAddresses");
  v59 = v58 ^ -[SFMailRankingSignals countUnigramPrefixMatchInRecipientEmailAddresses](self, "countUnigramPrefixMatchInRecipientEmailAddresses");
  v60 = v59 ^ -[SFMailRankingSignals countBigramPrefixMatchInRecipientEmailAddresses](self, "countBigramPrefixMatchInRecipientEmailAddresses");
  v61 = v60 ^ -[SFMailRankingSignals countNgramPrefixMatchInRecipientEmailAddresses](self, "countNgramPrefixMatchInRecipientEmailAddresses");
  v62 = v61 ^ -[SFMailRankingSignals countUnigramMatchInEmailAddresses](self, "countUnigramMatchInEmailAddresses");
  v63 = v62 ^ -[SFMailRankingSignals countBigramMatchInEmailAddresses](self, "countBigramMatchInEmailAddresses");
  v64 = v63 ^ -[SFMailRankingSignals countNgramMatchInEmailAddresses](self, "countNgramMatchInEmailAddresses");
  v65 = v64 ^ -[SFMailRankingSignals countUnigramPrefixMatchInEmailAddresses](self, "countUnigramPrefixMatchInEmailAddresses");
  v66 = v65 ^ -[SFMailRankingSignals countBigramPrefixMatchInEmailAddresses](self, "countBigramPrefixMatchInEmailAddresses");
  v67 = v66 ^ -[SFMailRankingSignals countNgramPrefixMatchInEmailAddresses](self, "countNgramPrefixMatchInEmailAddresses");
  v68 = v57 ^ v67 ^ -[SFMailRankingSignals countUnigramMatchInAttachmentTypes](self, "countUnigramMatchInAttachmentTypes");
  v69 = -[SFMailRankingSignals countBigramMatchInAttachmentTypes](self, "countBigramMatchInAttachmentTypes");
  v70 = v69 ^ -[SFMailRankingSignals countNgramMatchInAttachmentTypes](self, "countNgramMatchInAttachmentTypes");
  v71 = v70 ^ -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentTypes](self, "countUnigramPrefixMatchInAttachmentTypes");
  v72 = v71 ^ -[SFMailRankingSignals countBigramPrefixMatchInAttachmentTypes](self, "countBigramPrefixMatchInAttachmentTypes");
  v73 = v72 ^ -[SFMailRankingSignals countNgramPrefixMatchInAttachmentTypes](self, "countNgramPrefixMatchInAttachmentTypes");
  v74 = v73 ^ -[SFMailRankingSignals countUnigramMatchInAttachmentNames](self, "countUnigramMatchInAttachmentNames");
  v75 = v74 ^ -[SFMailRankingSignals countBigramMatchInAttachmentNames](self, "countBigramMatchInAttachmentNames");
  v76 = v75 ^ -[SFMailRankingSignals countNgramMatchInAttachmentNames](self, "countNgramMatchInAttachmentNames");
  v77 = v76 ^ -[SFMailRankingSignals countUnigramPrefixMatchInAttachmentNames](self, "countUnigramPrefixMatchInAttachmentNames");
  v78 = v77 ^ -[SFMailRankingSignals countBigramPrefixMatchInAttachmentNames](self, "countBigramPrefixMatchInAttachmentNames");
  v79 = v68 ^ v78 ^ -[SFMailRankingSignals countNgramPrefixMatchInAttachmentNames](self, "countNgramPrefixMatchInAttachmentNames");

  return v79;
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

- (NSNumber)averageEngagementAgeLast7Days
{
  return self->_averageEngagementAgeLast7Days;
}

- (void)setAverageEngagementAgeLast7Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)averageEngagementAgeLast14Days
{
  return self->_averageEngagementAgeLast14Days;
}

- (void)setAverageEngagementAgeLast14Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)averageEngagementAgeLast21Days
{
  return self->_averageEngagementAgeLast21Days;
}

- (void)setAverageEngagementAgeLast21Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)averageEngagementAgeLast30Days
{
  return self->_averageEngagementAgeLast30Days;
}

- (void)setAverageEngagementAgeLast30Days:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)daysSinceReceipt
{
  return self->_daysSinceReceipt;
}

- (NSNumber)l1Score
{
  return self->_l1Score;
}

- (void)setL1Score:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)l2Score
{
  return self->_l2Score;
}

- (void)setL2Score:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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

- (NSNumber)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setSyntacticScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)countUnigramMatchInAuthors
{
  return self->_countUnigramMatchInAuthors;
}

- (unint64_t)countBigramMatchInAuthors
{
  return self->_countBigramMatchInAuthors;
}

- (unint64_t)countNgramMatchInAuthors
{
  return self->_countNgramMatchInAuthors;
}

- (unint64_t)countUnigramPrefixMatchInAuthors
{
  return self->_countUnigramPrefixMatchInAuthors;
}

- (unint64_t)countBigramPrefixMatchInAuthors
{
  return self->_countBigramPrefixMatchInAuthors;
}

- (unint64_t)countNgramPrefixMatchInAuthors
{
  return self->_countNgramPrefixMatchInAuthors;
}

- (unint64_t)countUnigramMatchInAuthorEmailAddresses
{
  return self->_countUnigramMatchInAuthorEmailAddresses;
}

- (unint64_t)countBigramMatchInAuthorEmailAddresses
{
  return self->_countBigramMatchInAuthorEmailAddresses;
}

- (unint64_t)countNgramMatchInAuthorEmailAddresses
{
  return self->_countNgramMatchInAuthorEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countUnigramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInAuthorEmailAddresses
{
  return self->_countBigramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInAuthorEmailAddresses
{
  return self->_countNgramPrefixMatchInAuthorEmailAddresses;
}

- (unint64_t)countUnigramMatchInSubject
{
  return self->_countUnigramMatchInSubject;
}

- (unint64_t)countBigramMatchInSubject
{
  return self->_countBigramMatchInSubject;
}

- (unint64_t)countNgramMatchInSubject
{
  return self->_countNgramMatchInSubject;
}

- (unint64_t)countUnigramPrefixMatchInSubject
{
  return self->_countUnigramPrefixMatchInSubject;
}

- (unint64_t)countBigramPrefixMatchInSubject
{
  return self->_countBigramPrefixMatchInSubject;
}

- (unint64_t)countNgramPrefixMatchInSubject
{
  return self->_countNgramPrefixMatchInSubject;
}

- (unint64_t)countUnigramMatchInTextContent
{
  return self->_countUnigramMatchInTextContent;
}

- (unint64_t)countBigramMatchInTextContent
{
  return self->_countBigramMatchInTextContent;
}

- (unint64_t)countNgramMatchInTextContent
{
  return self->_countNgramMatchInTextContent;
}

- (unint64_t)countUnigramPrefixMatchInTextContent
{
  return self->_countUnigramPrefixMatchInTextContent;
}

- (unint64_t)countBigramPrefixMatchInTextContent
{
  return self->_countBigramPrefixMatchInTextContent;
}

- (unint64_t)countNgramPrefixMatchInTextContent
{
  return self->_countNgramPrefixMatchInTextContent;
}

- (unint64_t)countUnigramMatchInRecipients
{
  return self->_countUnigramMatchInRecipients;
}

- (unint64_t)countBigramMatchInRecipients
{
  return self->_countBigramMatchInRecipients;
}

- (unint64_t)countNgramMatchInRecipients
{
  return self->_countNgramMatchInRecipients;
}

- (unint64_t)countUnigramPrefixMatchInRecipients
{
  return self->_countUnigramPrefixMatchInRecipients;
}

- (unint64_t)countBigramPrefixMatchInRecipients
{
  return self->_countBigramPrefixMatchInRecipients;
}

- (unint64_t)countNgramPrefixMatchInRecipients
{
  return self->_countNgramPrefixMatchInRecipients;
}

- (unint64_t)countUnigramMatchInRecipientEmailAddresses
{
  return self->_countUnigramMatchInRecipientEmailAddresses;
}

- (unint64_t)countBigramMatchInRecipientEmailAddresses
{
  return self->_countBigramMatchInRecipientEmailAddresses;
}

- (unint64_t)countNgramMatchInRecipientEmailAddresses
{
  return self->_countNgramMatchInRecipientEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countUnigramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInRecipientEmailAddresses
{
  return self->_countBigramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInRecipientEmailAddresses
{
  return self->_countNgramPrefixMatchInRecipientEmailAddresses;
}

- (unint64_t)countUnigramMatchInEmailAddresses
{
  return self->_countUnigramMatchInEmailAddresses;
}

- (unint64_t)countBigramMatchInEmailAddresses
{
  return self->_countBigramMatchInEmailAddresses;
}

- (unint64_t)countNgramMatchInEmailAddresses
{
  return self->_countNgramMatchInEmailAddresses;
}

- (unint64_t)countUnigramPrefixMatchInEmailAddresses
{
  return self->_countUnigramPrefixMatchInEmailAddresses;
}

- (unint64_t)countBigramPrefixMatchInEmailAddresses
{
  return self->_countBigramPrefixMatchInEmailAddresses;
}

- (unint64_t)countNgramPrefixMatchInEmailAddresses
{
  return self->_countNgramPrefixMatchInEmailAddresses;
}

- (unint64_t)countUnigramMatchInAttachmentTypes
{
  return self->_countUnigramMatchInAttachmentTypes;
}

- (unint64_t)countBigramMatchInAttachmentTypes
{
  return self->_countBigramMatchInAttachmentTypes;
}

- (unint64_t)countNgramMatchInAttachmentTypes
{
  return self->_countNgramMatchInAttachmentTypes;
}

- (unint64_t)countUnigramPrefixMatchInAttachmentTypes
{
  return self->_countUnigramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countBigramPrefixMatchInAttachmentTypes
{
  return self->_countBigramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countNgramPrefixMatchInAttachmentTypes
{
  return self->_countNgramPrefixMatchInAttachmentTypes;
}

- (unint64_t)countUnigramMatchInAttachmentNames
{
  return self->_countUnigramMatchInAttachmentNames;
}

- (unint64_t)countBigramMatchInAttachmentNames
{
  return self->_countBigramMatchInAttachmentNames;
}

- (unint64_t)countNgramMatchInAttachmentNames
{
  return self->_countNgramMatchInAttachmentNames;
}

- (unint64_t)countUnigramPrefixMatchInAttachmentNames
{
  return self->_countUnigramPrefixMatchInAttachmentNames;
}

- (unint64_t)countBigramPrefixMatchInAttachmentNames
{
  return self->_countBigramPrefixMatchInAttachmentNames;
}

- (unint64_t)countNgramPrefixMatchInAttachmentNames
{
  return self->_countNgramPrefixMatchInAttachmentNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntacticScore, 0);
  objc_storeStrong((id *)&self->_semanticScore, 0);
  objc_storeStrong((id *)&self->_l2Score, 0);
  objc_storeStrong((id *)&self->_l1Score, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast30Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast21Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast14Days, 0);
  objc_storeStrong((id *)&self->_averageEngagementAgeLast7Days, 0);
}

- (SFMailRankingSignals)initWithProtobuf:(id)a3
{
  id v4;
  SFMailRankingSignals *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  SFMailRankingSignals *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFMailRankingSignals;
  v5 = -[SFMailRankingSignals init](&v24, sel_init);

  if (v5)
  {
    if (objc_msgSend(v4, "wasReorderedByRecency"))
      -[SFMailRankingSignals setWasReorderedByRecency:](v5, "setWasReorderedByRecency:", objc_msgSend(v4, "wasReorderedByRecency"));
    if (objc_msgSend(v4, "numEngagements"))
      -[SFMailRankingSignals setNumEngagements:](v5, "setNumEngagements:", objc_msgSend(v4, "numEngagements"));
    if (objc_msgSend(v4, "numDaysEngagedLast30Days"))
      -[SFMailRankingSignals setNumDaysEngagedLast30Days:](v5, "setNumDaysEngagedLast30Days:", objc_msgSend(v4, "numDaysEngagedLast30Days"));
    if (objc_msgSend(v4, "averageEngagementAgeLast7Days"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast7Days"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setAverageEngagementAgeLast7Days:](v5, "setAverageEngagementAgeLast7Days:", v6);

    }
    if (objc_msgSend(v4, "averageEngagementAgeLast14Days"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast14Days"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setAverageEngagementAgeLast14Days:](v5, "setAverageEngagementAgeLast14Days:", v7);

    }
    if (objc_msgSend(v4, "averageEngagementAgeLast21Days"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast21Days"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setAverageEngagementAgeLast21Days:](v5, "setAverageEngagementAgeLast21Days:", v8);

    }
    if (objc_msgSend(v4, "averageEngagementAgeLast30Days"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "averageEngagementAgeLast30Days"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setAverageEngagementAgeLast30Days:](v5, "setAverageEngagementAgeLast30Days:", v9);

    }
    if (objc_msgSend(v4, "daysSinceReceipt"))
      -[SFMailRankingSignals setDaysSinceReceipt:](v5, "setDaysSinceReceipt:", objc_msgSend(v4, "daysSinceReceipt"));
    objc_msgSend(v4, "l1Score");
    if (v10 != 0.0)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "l1Score");
      objc_msgSend(v11, "numberWithFloat:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setL1Score:](v5, "setL1Score:", v12);

    }
    objc_msgSend(v4, "l2Score");
    if (v13 != 0.0)
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "l2Score");
      objc_msgSend(v14, "numberWithFloat:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setL2Score:](v5, "setL2Score:", v15);

    }
    if (objc_msgSend(v4, "isFlagged"))
      -[SFMailRankingSignals setIsFlagged:](v5, "setIsFlagged:", objc_msgSend(v4, "isFlagged"));
    if (objc_msgSend(v4, "isRepliedTo"))
      -[SFMailRankingSignals setIsRepliedTo:](v5, "setIsRepliedTo:", objc_msgSend(v4, "isRepliedTo"));
    if (objc_msgSend(v4, "isSemanticMatch"))
      -[SFMailRankingSignals setIsSemanticMatch:](v5, "setIsSemanticMatch:", objc_msgSend(v4, "isSemanticMatch"));
    if (objc_msgSend(v4, "isSyntacticMatch"))
      -[SFMailRankingSignals setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", objc_msgSend(v4, "isSyntacticMatch"));
    objc_msgSend(v4, "semanticScore");
    if (v16 != 0.0)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "semanticScore");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setSemanticScore:](v5, "setSemanticScore:", v18);

    }
    objc_msgSend(v4, "syntacticScore");
    if (v19 != 0.0)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "syntacticScore");
      objc_msgSend(v20, "numberWithFloat:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMailRankingSignals setSyntacticScore:](v5, "setSyntacticScore:", v21);

    }
    if (objc_msgSend(v4, "countUnigramMatchInAuthors"))
      -[SFMailRankingSignals setCountUnigramMatchInAuthors:](v5, "setCountUnigramMatchInAuthors:", objc_msgSend(v4, "countUnigramMatchInAuthors"));
    if (objc_msgSend(v4, "countBigramMatchInAuthors"))
      -[SFMailRankingSignals setCountBigramMatchInAuthors:](v5, "setCountBigramMatchInAuthors:", objc_msgSend(v4, "countBigramMatchInAuthors"));
    if (objc_msgSend(v4, "countNgramMatchInAuthors"))
      -[SFMailRankingSignals setCountNgramMatchInAuthors:](v5, "setCountNgramMatchInAuthors:", objc_msgSend(v4, "countNgramMatchInAuthors"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAuthors:](v5, "setCountUnigramPrefixMatchInAuthors:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInAuthors"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInAuthors:](v5, "setCountBigramPrefixMatchInAuthors:", objc_msgSend(v4, "countBigramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInAuthors"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInAuthors:](v5, "setCountNgramPrefixMatchInAuthors:", objc_msgSend(v4, "countNgramPrefixMatchInAuthors"));
    if (objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramMatchInAuthorEmailAddresses:](v5, "setCountUnigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountBigramMatchInAuthorEmailAddresses:](v5, "setCountBigramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountNgramMatchInAuthorEmailAddresses:](v5, "setCountNgramMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountUnigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInAuthorEmailAddresses:](v5, "setCountBigramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInAuthorEmailAddresses:](v5, "setCountNgramPrefixMatchInAuthorEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInAuthorEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramMatchInSubject"))
      -[SFMailRankingSignals setCountUnigramMatchInSubject:](v5, "setCountUnigramMatchInSubject:", objc_msgSend(v4, "countUnigramMatchInSubject"));
    if (objc_msgSend(v4, "countBigramMatchInSubject"))
      -[SFMailRankingSignals setCountBigramMatchInSubject:](v5, "setCountBigramMatchInSubject:", objc_msgSend(v4, "countBigramMatchInSubject"));
    if (objc_msgSend(v4, "countNgramMatchInSubject"))
      -[SFMailRankingSignals setCountNgramMatchInSubject:](v5, "setCountNgramMatchInSubject:", objc_msgSend(v4, "countNgramMatchInSubject"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInSubject"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInSubject:](v5, "setCountUnigramPrefixMatchInSubject:", objc_msgSend(v4, "countUnigramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInSubject"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInSubject:](v5, "setCountBigramPrefixMatchInSubject:", objc_msgSend(v4, "countBigramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInSubject"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInSubject:](v5, "setCountNgramPrefixMatchInSubject:", objc_msgSend(v4, "countNgramPrefixMatchInSubject"));
    if (objc_msgSend(v4, "countUnigramMatchInTextContent"))
      -[SFMailRankingSignals setCountUnigramMatchInTextContent:](v5, "setCountUnigramMatchInTextContent:", objc_msgSend(v4, "countUnigramMatchInTextContent"));
    if (objc_msgSend(v4, "countBigramMatchInTextContent"))
      -[SFMailRankingSignals setCountBigramMatchInTextContent:](v5, "setCountBigramMatchInTextContent:", objc_msgSend(v4, "countBigramMatchInTextContent"));
    if (objc_msgSend(v4, "countNgramMatchInTextContent"))
      -[SFMailRankingSignals setCountNgramMatchInTextContent:](v5, "setCountNgramMatchInTextContent:", objc_msgSend(v4, "countNgramMatchInTextContent"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInTextContent:](v5, "setCountUnigramPrefixMatchInTextContent:", objc_msgSend(v4, "countUnigramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInTextContent"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInTextContent:](v5, "setCountBigramPrefixMatchInTextContent:", objc_msgSend(v4, "countBigramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInTextContent"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInTextContent:](v5, "setCountNgramPrefixMatchInTextContent:", objc_msgSend(v4, "countNgramPrefixMatchInTextContent"));
    if (objc_msgSend(v4, "countUnigramMatchInRecipients"))
      -[SFMailRankingSignals setCountUnigramMatchInRecipients:](v5, "setCountUnigramMatchInRecipients:", objc_msgSend(v4, "countUnigramMatchInRecipients"));
    if (objc_msgSend(v4, "countBigramMatchInRecipients"))
      -[SFMailRankingSignals setCountBigramMatchInRecipients:](v5, "setCountBigramMatchInRecipients:", objc_msgSend(v4, "countBigramMatchInRecipients"));
    if (objc_msgSend(v4, "countNgramMatchInRecipients"))
      -[SFMailRankingSignals setCountNgramMatchInRecipients:](v5, "setCountNgramMatchInRecipients:", objc_msgSend(v4, "countNgramMatchInRecipients"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInRecipients:](v5, "setCountUnigramPrefixMatchInRecipients:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInRecipients"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInRecipients:](v5, "setCountBigramPrefixMatchInRecipients:", objc_msgSend(v4, "countBigramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInRecipients"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInRecipients:](v5, "setCountNgramPrefixMatchInRecipients:", objc_msgSend(v4, "countNgramPrefixMatchInRecipients"));
    if (objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramMatchInRecipientEmailAddresses:](v5, "setCountUnigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountBigramMatchInRecipientEmailAddresses:](v5, "setCountBigramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountNgramMatchInRecipientEmailAddresses:](v5, "setCountNgramMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountUnigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInRecipientEmailAddresses:](v5, "setCountBigramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInRecipientEmailAddresses:](v5, "setCountNgramPrefixMatchInRecipientEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInRecipientEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramMatchInEmailAddresses:](v5, "setCountUnigramMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countBigramMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountBigramMatchInEmailAddresses:](v5, "setCountBigramMatchInEmailAddresses:", objc_msgSend(v4, "countBigramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countNgramMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountNgramMatchInEmailAddresses:](v5, "setCountNgramMatchInEmailAddresses:", objc_msgSend(v4, "countNgramMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInEmailAddresses:](v5, "setCountUnigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countUnigramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInEmailAddresses:](v5, "setCountBigramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countBigramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInEmailAddresses:](v5, "setCountNgramPrefixMatchInEmailAddresses:", objc_msgSend(v4, "countNgramPrefixMatchInEmailAddresses"));
    if (objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountUnigramMatchInAttachmentTypes:](v5, "setCountUnigramMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countBigramMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountBigramMatchInAttachmentTypes:](v5, "setCountBigramMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countNgramMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountNgramMatchInAttachmentTypes:](v5, "setCountNgramMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAttachmentTypes:](v5, "setCountUnigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInAttachmentTypes:](v5, "setCountBigramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInAttachmentTypes:](v5, "setCountNgramPrefixMatchInAttachmentTypes:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentTypes"));
    if (objc_msgSend(v4, "countUnigramMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountUnigramMatchInAttachmentNames:](v5, "setCountUnigramMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "countBigramMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountBigramMatchInAttachmentNames:](v5, "setCountBigramMatchInAttachmentNames:", objc_msgSend(v4, "countBigramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "countNgramMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountNgramMatchInAttachmentNames:](v5, "setCountNgramMatchInAttachmentNames:", objc_msgSend(v4, "countNgramMatchInAttachmentNames"));
    if (objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountUnigramPrefixMatchInAttachmentNames:](v5, "setCountUnigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countUnigramPrefixMatchInAttachmentNames"));
    if (objc_msgSend(v4, "countBigramPrefixMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountBigramPrefixMatchInAttachmentNames:](v5, "setCountBigramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countBigramPrefixMatchInAttachmentNames"));
    if (objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames"))
      -[SFMailRankingSignals setCountNgramPrefixMatchInAttachmentNames:](v5, "setCountNgramPrefixMatchInAttachmentNames:", objc_msgSend(v4, "countNgramPrefixMatchInAttachmentNames"));
    v22 = v5;
  }

  return v5;
}

@end
