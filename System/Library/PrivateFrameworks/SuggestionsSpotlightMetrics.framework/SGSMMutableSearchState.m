@implementation SGSMMutableSearchState

- (SGSMMutableSearchState)init
{
  SGSMMutableSearchState *v2;
  SGSMMutableSearchState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGSMMutableSearchState;
  v2 = -[SGSMMutableSearchState init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SGSMMutableSearchState resetCounts](v2, "resetCounts");
    -[SGSMMutableSearchState resetJustEngaged](v3, "resetJustEngaged");
  }
  return v3;
}

- (void)resetCounts
{
  uint64_t v3;
  NSMutableSet *resultsSeen;
  SGSMMutableSearchState *obj;

  -[SGSMMutableSearchState resetConversionCounts](self, "resetConversionCounts");
  *(_DWORD *)&self->_contactResultCount = 0;
  self->_curatedOrPseudoContactOpportunityCount = 0;
  obj = self;
  objc_sync_enter(obj);
  v3 = objc_opt_new();
  resultsSeen = obj->_resultsSeen;
  obj->_resultsSeen = (NSMutableSet *)v3;

  objc_sync_exit(obj);
}

- (void)resetConversionCounts
{
  *(_WORD *)&self->_otherSelectedCount = 0;
  *(_WORD *)&self->_contactConversionCount = 0;
}

- (void)resetJustEngaged
{
  self->_justEngaged = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsSeen, 0);
}

- (BOOL)isFirstTimeSeeingResult:(id)a3
{
  id v4;
  void *v5;
  SGSMMutableSearchState *v6;
  char v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = -[NSMutableSet containsObject:](v6->_resultsSeen, "containsObject:", v5);
    if ((v7 & 1) == 0)
      -[NSMutableSet addObject:](v6->_resultsSeen, "addObject:", v5);
    v8 = v7 ^ 1;
    objc_sync_exit(v6);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)scoreAsNonOpportunity
{
  self->_nonOpportunityCount = 1;
}

- (void)scoreAsOtherConversion
{
  self->_otherSelectedCount = 1;
}

- (void)scoreAsContactResult
{
  ++self->_contactResultCount;
}

- (void)scoreAsContactOpportunity
{
  ++self->_contactOpportunityCount;
}

- (void)scoreAsCuratedOrPseudoContactOpportunity
{
  ++self->_curatedOrPseudoContactOpportunityCount;
}

- (void)scoreAsContactConversion
{
  ++self->_contactConversionCount;
}

- (void)scoreAsContactLoss
{
  ++self->_contactLossCount;
}

- (void)setJustEngaged
{
  self->_justEngaged = 1;
}

- (BOOL)justEngaged
{
  return self->_justEngaged;
}

- (void)commit
{
  uint8_t v3[16];
  uint8_t v4[16];
  uint8_t v5[16];
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: committing", buf, 2u);
  }
  if (self->_contactResultCount && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact results", v6, 2u);
  }
  if (!self->_otherSelectedCount && !self->_nonOpportunityCount)
  {
    if (self->_contactOpportunityCount
      && (self->_contactLossCount || self->_contactConversionCount)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact opportunity", v5, 2u);
    }
    if (self->_curatedOrPseudoContactOpportunityCount
      && (self->_contactLossCount || self->_contactConversionCount)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: committing as curated or pseudo contact opportunity", v4, 2u);
    }
    if (self->_contactConversionCount)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_debug_impl(&dword_218DD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact conversion", v3, 2u);
      }
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<SGSMSearchState c:%d,%d,%d,%d,%d n:%d o:%d>"), self->_contactResultCount, self->_curatedOrPseudoContactOpportunityCount, self->_contactOpportunityCount, self->_contactConversionCount, self->_contactLossCount, self->_nonOpportunityCount, self->_otherSelectedCount);
}

@end
