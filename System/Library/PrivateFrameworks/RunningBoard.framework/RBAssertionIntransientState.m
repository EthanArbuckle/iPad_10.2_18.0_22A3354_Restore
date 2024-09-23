@implementation RBAssertionIntransientState

- (void)setHasDomainAttribute:(BOOL)a3
{
  self->_hasDomainAttribute = a3;
}

- (void)setDomainAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributes, a3);
}

- (BOOL)hasHereditaryGrant
{
  return self->_hasHereditaryGrant;
}

- (double)invalidationDuration
{
  return self->_invalidationDuration;
}

- (unint64_t)endPolicy
{
  return self->_endPolicy;
}

- (NSMutableSet)sourceEnvironments
{
  NSMutableSet *sourceEnvironments;
  NSMutableSet *v4;
  NSMutableSet *v5;

  sourceEnvironments = self->_sourceEnvironments;
  if (!sourceEnvironments)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v5 = self->_sourceEnvironments;
    self->_sourceEnvironments = v4;

    sourceEnvironments = self->_sourceEnvironments;
  }
  return sourceEnvironments;
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (unint64_t)startPolicy
{
  return self->_startPolicy;
}

- (NSString)domainAttributes
{
  return self->_domainAttributes;
}

- (unint64_t)runningReason
{
  return self->_runningReason;
}

- (BOOL)definesRelativeStartTime
{
  return self->_definesRelativeStartTime;
}

- (unint64_t)legacyReason
{
  return self->_legacyReason;
}

- (void)setPreventsSuspension:(BOOL)a3
{
  self->_preventsSuspension = a3;
}

- (BOOL)hasDomainAttribute
{
  return self->_hasDomainAttribute;
}

- (double)warningDuration
{
  return self->_warningDuration;
}

- (void)setStartPolicy:(unint64_t)a3
{
  self->_startPolicy = a3;
}

- (void)setEndPolicy:(unint64_t)a3
{
  self->_endPolicy = a3;
}

- (void)setInvalidationDuration:(double)a3
{
  self->_invalidationDuration = a3;
}

- (BOOL)suspendsOnOriginatorSuspension
{
  return self->_suspendsOnOriginatorSuspension;
}

- (void)setWarningDuration:(double)a3
{
  self->_warningDuration = a3;
}

- (void)setLegacyReason:(unint64_t)a3
{
  self->_legacyReason = a3;
}

- (void)setInvalidatesOnConditions:(id)a3
{
  objc_storeStrong((id *)&self->_invalidatesOnConditions, a3);
}

- (NSMutableDictionary)invalidatesOnConditions
{
  return self->_invalidatesOnConditions;
}

- (BOOL)preventsSuspension
{
  return self->_preventsSuspension;
}

- (void)setRunningReason:(unint64_t)a3
{
  self->_runningReason = a3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSDurationStartPolicy();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSDurationEndPolicy();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("susp");
  v9 = &stru_24DD48378;
  if (!self->_suspendsOnOriginatorSuspension)
    v8 = &stru_24DD48378;
  if (self->_definesRelativeStartTime)
    v10 = CFSTR("drel");
  else
    v10 = &stru_24DD48378;
  if (self->_hasHereditaryGrant)
    v11 = CFSTR("herd");
  else
    v11 = &stru_24DD48378;
  if (self->_hasDomainAttribute)
    v12 = CFSTR("dom");
  else
    v12 = &stru_24DD48378;
  if (self->_terminateTargetOnOriginatorExit)
    v13 = CFSTR("term");
  else
    v13 = &stru_24DD48378;
  if (self->_invalidatesSynchronously)
    v14 = CFSTR("invalSync");
  else
    v14 = &stru_24DD48378;
  if (self->_preventsSuspension)
    v9 = CFSTR(" prevSus");
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| strt:%@ end:%@ nvld:%.2f warn:%.2f%@%@%@%@%@%@%@ runningReason:%lu legRes:%lu doms:%@ invOnConds:%@>"), v4, v5, v6, *(_QWORD *)&self->_invalidationDuration, *(_QWORD *)&self->_warningDuration, v8, v10, v11, v12, v13, v14, v9, self->_runningReason, self->_legacyReason, self->_domainAttributes, self->_invalidatesOnConditions);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatesOnConditions, 0);
  objc_storeStrong((id *)&self->_domainAttributes, 0);
  objc_storeStrong((id *)&self->_sourceEnvironments, 0);
}

- (void)setHasHereditaryGrant:(BOOL)a3
{
  self->_hasHereditaryGrant = a3;
}

- (BOOL)invalidatesSynchronously
{
  return self->_invalidatesSynchronously;
}

- (void)setSuspendsOnOriginatorSuspension:(BOOL)a3
{
  self->_suspendsOnOriginatorSuspension = a3;
}

- (void)setDefinesRelativeStartTime:(BOOL)a3
{
  self->_definesRelativeStartTime = a3;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->_isPersistent = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBAssertionIntransientState *v4;
  uint64_t v5;
  NSMutableSet *sourceEnvironments;
  uint64_t v7;
  NSString *domainAttributes;
  uint64_t v9;
  NSMutableDictionary *invalidatesOnConditions;

  v4 = -[RBAssertionIntransientState init](+[RBAssertionIntransientState allocWithZone:](RBAssertionIntransientState, "allocWithZone:", a3), "init");
  v4->_endPolicy = self->_endPolicy;
  v4->_startPolicy = self->_startPolicy;
  v4->_warningDuration = self->_warningDuration;
  v4->_invalidationDuration = self->_invalidationDuration;
  v4->_suspendsOnOriginatorSuspension = self->_suspendsOnOriginatorSuspension;
  v4->_terminateTargetOnOriginatorExit = self->_terminateTargetOnOriginatorExit;
  v4->_invalidatesSynchronously = self->_invalidatesSynchronously;
  v4->_definesRelativeStartTime = self->_definesRelativeStartTime;
  v4->_preventsSuspension = self->_preventsSuspension;
  v4->_hasHereditaryGrant = self->_hasHereditaryGrant;
  v4->_hasDomainAttribute = self->_hasDomainAttribute;
  v5 = -[NSMutableSet mutableCopy](self->_sourceEnvironments, "mutableCopy");
  sourceEnvironments = v4->_sourceEnvironments;
  v4->_sourceEnvironments = (NSMutableSet *)v5;

  v4->_runningReason = self->_runningReason;
  v4->_legacyReason = self->_legacyReason;
  v7 = -[NSString copy](self->_domainAttributes, "copy");
  domainAttributes = v4->_domainAttributes;
  v4->_domainAttributes = (NSString *)v7;

  v9 = -[NSMutableDictionary mutableCopy](self->_invalidatesOnConditions, "mutableCopy");
  invalidatesOnConditions = v4->_invalidatesOnConditions;
  v4->_invalidatesOnConditions = (NSMutableDictionary *)v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RBAssertionIntransientState *v4;
  uint64_t v5;
  NSMutableSet *sourceEnvironments;
  NSMutableSet *v7;
  char v8;
  CFIndex Count;
  NSString *domainAttributes;
  NSMutableDictionary *invalidatesOnConditions;
  NSMutableDictionary *v12;
  const __CFSet *v14;
  const __CFSet *theSet;

  v4 = (RBAssertionIntransientState *)a3;
  if (self == v4)
    goto LABEL_27;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_definesRelativeStartTime != v4->_definesRelativeStartTime
    || self->_endPolicy != v4->_endPolicy
    || self->_invalidationDuration != v4->_invalidationDuration
    || self->_startPolicy != v4->_startPolicy
    || self->_suspendsOnOriginatorSuspension != v4->_suspendsOnOriginatorSuspension
    || self->_warningDuration != v4->_warningDuration
    || self->_hasHereditaryGrant != v4->_hasHereditaryGrant
    || self->_terminateTargetOnOriginatorExit != v4->_terminateTargetOnOriginatorExit
    || self->_invalidatesSynchronously != v4->_invalidatesSynchronously
    || self->_preventsSuspension != v4->_preventsSuspension)
  {
    goto LABEL_26;
  }
  sourceEnvironments = self->_sourceEnvironments;
  v7 = v4->_sourceEnvironments;
  if (sourceEnvironments != v7)
  {
    v8 = 0;
    theSet = (const __CFSet *)self->_sourceEnvironments;
    if (!sourceEnvironments)
      goto LABEL_28;
    v14 = (const __CFSet *)v4->_sourceEnvironments;
    if (!v7)
      goto LABEL_28;
    Count = CFSetGetCount(theSet);
    if (Count != CFSetGetCount(v14) || !-[__CFSet isEqualToSet:](theSet, "isEqualToSet:", v14))
      goto LABEL_26;
  }
  if (self->_runningReason != v4->_runningReason
    || self->_legacyReason != v4->_legacyReason
    || (domainAttributes = self->_domainAttributes, domainAttributes != v4->_domainAttributes)
    && !-[NSString isEqualToString:](domainAttributes, "isEqualToString:"))
  {
LABEL_26:
    v8 = 0;
    goto LABEL_28;
  }
  invalidatesOnConditions = self->_invalidatesOnConditions;
  v12 = v4->_invalidatesOnConditions;
  if (invalidatesOnConditions == v12)
  {
LABEL_27:
    v8 = 1;
    goto LABEL_28;
  }
  v8 = 0;
  if (invalidatesOnConditions && v12)
    v8 = -[NSMutableDictionary isEqual:](invalidatesOnConditions, "isEqual:");
LABEL_28:

  return v8;
}

- (void)setInvalidatesSynchronously:(BOOL)a3
{
  self->_invalidatesSynchronously = a3;
}

- (BOOL)terminateTargetOnOriginatorExit
{
  return self->_terminateTargetOnOriginatorExit;
}

- (void)setTerminateTargetOnOriginatorExit:(BOOL)a3
{
  self->_terminateTargetOnOriginatorExit = a3;
}

@end
