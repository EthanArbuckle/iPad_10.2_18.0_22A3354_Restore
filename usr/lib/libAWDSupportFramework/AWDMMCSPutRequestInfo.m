@implementation AWDMMCSPutRequestInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDMMCSPutRequestInfo setClientId:](self, "setClientId:", 0);
  -[AWDMMCSPutRequestInfo setCancelledErrorDomain:](self, "setCancelledErrorDomain:", 0);
  -[AWDMMCSPutRequestInfo setRequestErrorDomain:](self, "setRequestErrorDomain:", 0);
  -[AWDMMCSPutRequestInfo setChunkingInfos:](self, "setChunkingInfos:", 0);
  -[AWDMMCSPutRequestInfo setAuthHttpInfos:](self, "setAuthHttpInfos:", 0);
  -[AWDMMCSPutRequestInfo setContainerHttpInfos:](self, "setContainerHttpInfos:", 0);
  -[AWDMMCSPutRequestInfo setCompleteHttpInfos:](self, "setCompleteHttpInfos:", 0);
  -[AWDMMCSPutRequestInfo setCancelErrors:](self, "setCancelErrors:", 0);
  -[AWDMMCSPutRequestInfo setErrors:](self, "setErrors:", 0);
  -[AWDMMCSPutRequestInfo setCkContainerId:](self, "setCkContainerId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSPutRequestInfo;
  -[AWDMMCSPutRequestInfo dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (void)setStartTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasCancelledErrorDomain
{
  return self->_cancelledErrorDomain != 0;
}

- (void)setCancelledErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cancelledErrorCode = a3;
}

- (void)setHasCancelledErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCancelledErrorCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasRequestErrorDomain
{
  return self->_requestErrorDomain != 0;
}

- (void)setRequestErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_requestErrorCode = a3;
}

- (void)setHasRequestErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRequestErrorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setItemCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_itemCount = a3;
}

- (void)setHasItemCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasItemCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setItemsAlreadyPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_itemsAlreadyPresentCount = a3;
}

- (void)setHasItemsAlreadyPresentCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasItemsAlreadyPresentCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setItemsPartiallyPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_itemsPartiallyPresentCount = a3;
}

- (void)setHasItemsPartiallyPresentCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasItemsPartiallyPresentCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setItemsNotPresentCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_itemsNotPresentCount = a3;
}

- (void)setHasItemsNotPresentCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasItemsNotPresentCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setChunksUploaded:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_chunksUploaded = a3;
}

- (void)setHasChunksUploaded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasChunksUploaded
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearChunkingInfos
{
  -[NSMutableArray removeAllObjects](self->_chunkingInfos, "removeAllObjects");
}

- (void)addChunkingInfos:(id)a3
{
  NSMutableArray *chunkingInfos;

  chunkingInfos = self->_chunkingInfos;
  if (!chunkingInfos)
  {
    chunkingInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_chunkingInfos = chunkingInfos;
  }
  -[NSMutableArray addObject:](chunkingInfos, "addObject:", a3);
}

- (unint64_t)chunkingInfosCount
{
  return -[NSMutableArray count](self->_chunkingInfos, "count");
}

- (id)chunkingInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chunkingInfos, "objectAtIndex:", a3);
}

+ (Class)chunkingInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearAuthHttpInfos
{
  -[NSMutableArray removeAllObjects](self->_authHttpInfos, "removeAllObjects");
}

- (void)addAuthHttpInfos:(id)a3
{
  NSMutableArray *authHttpInfos;

  authHttpInfos = self->_authHttpInfos;
  if (!authHttpInfos)
  {
    authHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_authHttpInfos = authHttpInfos;
  }
  -[NSMutableArray addObject:](authHttpInfos, "addObject:", a3);
}

- (unint64_t)authHttpInfosCount
{
  return -[NSMutableArray count](self->_authHttpInfos, "count");
}

- (id)authHttpInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authHttpInfos, "objectAtIndex:", a3);
}

+ (Class)authHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearContainerHttpInfos
{
  -[NSMutableArray removeAllObjects](self->_containerHttpInfos, "removeAllObjects");
}

- (void)addContainerHttpInfos:(id)a3
{
  NSMutableArray *containerHttpInfos;

  containerHttpInfos = self->_containerHttpInfos;
  if (!containerHttpInfos)
  {
    containerHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_containerHttpInfos = containerHttpInfos;
  }
  -[NSMutableArray addObject:](containerHttpInfos, "addObject:", a3);
}

- (unint64_t)containerHttpInfosCount
{
  return -[NSMutableArray count](self->_containerHttpInfos, "count");
}

- (id)containerHttpInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_containerHttpInfos, "objectAtIndex:", a3);
}

+ (Class)containerHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearCompleteHttpInfos
{
  -[NSMutableArray removeAllObjects](self->_completeHttpInfos, "removeAllObjects");
}

- (void)addCompleteHttpInfos:(id)a3
{
  NSMutableArray *completeHttpInfos;

  completeHttpInfos = self->_completeHttpInfos;
  if (!completeHttpInfos)
  {
    completeHttpInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_completeHttpInfos = completeHttpInfos;
  }
  -[NSMutableArray addObject:](completeHttpInfos, "addObject:", a3);
}

- (unint64_t)completeHttpInfosCount
{
  return -[NSMutableArray count](self->_completeHttpInfos, "count");
}

- (id)completeHttpInfosAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_completeHttpInfos, "objectAtIndex:", a3);
}

+ (Class)completeHttpInfosType
{
  return (Class)objc_opt_class();
}

- (void)clearCancelErrors
{
  -[NSMutableArray removeAllObjects](self->_cancelErrors, "removeAllObjects");
}

- (void)addCancelError:(id)a3
{
  NSMutableArray *cancelErrors;

  cancelErrors = self->_cancelErrors;
  if (!cancelErrors)
  {
    cancelErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_cancelErrors = cancelErrors;
  }
  -[NSMutableArray addObject:](cancelErrors, "addObject:", a3);
}

- (unint64_t)cancelErrorsCount
{
  return -[NSMutableArray count](self->_cancelErrors, "count");
}

- (id)cancelErrorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cancelErrors, "objectAtIndex:", a3);
}

+ (Class)cancelErrorType
{
  return (Class)objc_opt_class();
}

- (void)clearErrors
{
  -[NSMutableArray removeAllObjects](self->_errors, "removeAllObjects");
}

- (void)addError:(id)a3
{
  NSMutableArray *errors;

  errors = self->_errors;
  if (!errors)
  {
    errors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_errors = errors;
  }
  -[NSMutableArray addObject:](errors, "addObject:", a3);
}

- (unint64_t)errorsCount
{
  return -[NSMutableArray count](self->_errors, "count");
}

- (id)errorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_errors, "objectAtIndex:", a3);
}

+ (Class)errorType
{
  return (Class)objc_opt_class();
}

- (void)setAllItemsSuccessful:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_allItemsSuccessful = a3;
}

- (void)setHasAllItemsSuccessful:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAllItemsSuccessful
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setItemCountSuccessful:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_itemCountSuccessful = a3;
}

- (void)setHasItemCountSuccessful:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasItemCountSuccessful
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAllItemsFailed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_allItemsFailed = a3;
}

- (void)setHasAllItemsFailed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAllItemsFailed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setItemCountFailed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_itemCountFailed = a3;
}

- (void)setHasItemCountFailed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasItemCountFailed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasCkContainerId
{
  return self->_ckContainerId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSPutRequestInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMMCSPutRequestInfo description](&v3, sel_description), -[AWDMMCSPutRequestInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *clientId;
  __int16 has;
  NSString *cancelledErrorDomain;
  NSString *requestErrorDomain;
  __int16 v8;
  void *v9;
  NSMutableArray *chunkingInfos;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *authHttpInfos;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *containerHttpInfos;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *completeHttpInfos;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  NSMutableArray *cancelErrors;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  NSMutableArray *errors;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  __int16 v45;
  NSString *ckContainerId;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timestamp), CFSTR("timestamp"));
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("clientId"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTime), CFSTR("startTime"));
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duration), CFSTR("duration"));
  cancelledErrorDomain = self->_cancelledErrorDomain;
  if (cancelledErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", cancelledErrorDomain, CFSTR("cancelledErrorDomain"));
  if ((*(_WORD *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cancelledErrorCode), CFSTR("cancelledErrorCode"));
  requestErrorDomain = self->_requestErrorDomain;
  if (requestErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", requestErrorDomain, CFSTR("requestErrorDomain"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x800) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_requestErrorCode), CFSTR("requestErrorCode"));
    v8 = (__int16)self->_has;
    if ((v8 & 0x20) == 0)
    {
LABEL_17:
      if ((v8 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_86;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemCount), CFSTR("itemCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_18:
    if ((v8 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemsAlreadyPresentCount), CFSTR("itemsAlreadyPresentCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_19:
    if ((v8 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemsPartiallyPresentCount), CFSTR("itemsPartiallyPresentCount"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_20:
    if ((v8 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_88:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_itemsNotPresentCount), CFSTR("itemsNotPresentCount"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_21:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_chunksUploaded), CFSTR("chunksUploaded"));
LABEL_22:
  if (-[NSMutableArray count](self->_chunkingInfos, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_chunkingInfos, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    chunkingInfos = self->_chunkingInfos;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(chunkingInfos);
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v12);
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("chunkingInfos"));

  }
  if (-[NSMutableArray count](self->_authHttpInfos, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_authHttpInfos, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    authHttpInfos = self->_authHttpInfos;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(authHttpInfos);
          objc_msgSend(v15, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v18);
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("authHttpInfos"));

  }
  if (-[NSMutableArray count](self->_containerHttpInfos, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_containerHttpInfos, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    containerHttpInfos = self->_containerHttpInfos;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v61 != v25)
            objc_enumerationMutation(containerHttpInfos);
          objc_msgSend(v21, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      }
      while (v24);
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("containerHttpInfos"));

  }
  if (-[NSMutableArray count](self->_completeHttpInfos, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_completeHttpInfos, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    completeHttpInfos = self->_completeHttpInfos;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v57;
      do
      {
        for (m = 0; m != v30; ++m)
        {
          if (*(_QWORD *)v57 != v31)
            objc_enumerationMutation(completeHttpInfos);
          objc_msgSend(v27, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "dictionaryRepresentation"));
        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      }
      while (v30);
    }
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("completeHttpInfos"));

  }
  if (-[NSMutableArray count](self->_cancelErrors, "count"))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_cancelErrors, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    cancelErrors = self->_cancelErrors;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v53;
      do
      {
        for (n = 0; n != v36; ++n)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(cancelErrors);
          objc_msgSend(v33, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * n), "dictionaryRepresentation"));
        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
      }
      while (v36);
    }
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("cancelError"));

  }
  if (-[NSMutableArray count](self->_errors, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_errors, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    errors = self->_errors;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v49;
      do
      {
        for (ii = 0; ii != v42; ++ii)
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(errors);
          objc_msgSend(v39, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * ii), "dictionaryRepresentation"));
        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v48, v72, 16);
      }
      while (v42);
    }
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("error"));

  }
  v45 = (__int16)self->_has;
  if ((v45 & 0x2000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allItemsSuccessful), CFSTR("allItemsSuccessful"));
    v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_78:
      if ((v45 & 0x1000) == 0)
        goto LABEL_79;
      goto LABEL_92;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_78;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_itemCountSuccessful), CFSTR("itemCountSuccessful"));
  v45 = (__int16)self->_has;
  if ((v45 & 0x1000) == 0)
  {
LABEL_79:
    if ((v45 & 0x40) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_92:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allItemsFailed), CFSTR("allItemsFailed"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_80:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_itemCountFailed), CFSTR("itemCountFailed"));
LABEL_81:
  ckContainerId = self->_ckContainerId;
  if (ckContainerId)
    objc_msgSend(v3, "setObject:forKey:", ckContainerId, CFSTR("ckContainerId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSPutRequestInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  NSMutableArray *chunkingInfos;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *authHttpInfos;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *containerHttpInfos;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *completeHttpInfos;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *cancelErrors;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *errors;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  __int16 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_clientId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_cancelledErrorDomain)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_requestErrorDomain)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_17:
      if ((v5 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_74;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x200) == 0)
  {
LABEL_20:
    if ((v5 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_22:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  chunkingInfos = self->_chunkingInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(chunkingInfos);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v8);
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  authHttpInfos = self->_authHttpInfos;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(authHttpInfos);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v13);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(containerHttpInfos);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    }
    while (v18);
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(completeHttpInfos);
        PBDataWriterWriteSubmessage();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    }
    while (v23);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  cancelErrors = self->_cancelErrors;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(cancelErrors);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    }
    while (v28);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  errors = self->_errors;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v37, v61, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(errors);
        PBDataWriterWriteSubmessage();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v37, v61, 16);
    }
    while (v33);
  }
  v36 = (__int16)self->_has;
  if ((v36 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v36 = (__int16)self->_has;
    if ((v36 & 0x80) == 0)
    {
LABEL_66:
      if ((v36 & 0x1000) == 0)
        goto LABEL_67;
      goto LABEL_80;
    }
  }
  else if ((v36 & 0x80) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteUint32Field();
  v36 = (__int16)self->_has;
  if ((v36 & 0x1000) == 0)
  {
LABEL_67:
    if ((v36 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_68:
    PBDataWriterWriteUint32Field();
LABEL_69:
  if (self->_ckContainerId)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  __int16 v25;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 82) |= 4u;
  }
  if (self->_clientId)
    objc_msgSend(a3, "setClientId:");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_startTime;
    *((_WORD *)a3 + 82) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_WORD *)a3 + 82) |= 1u;
  }
  if (self->_cancelledErrorDomain)
    objc_msgSend(a3, "setCancelledErrorDomain:");
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_cancelledErrorCode;
    *((_WORD *)a3 + 82) |= 8u;
  }
  if (self->_requestErrorDomain)
    objc_msgSend(a3, "setRequestErrorDomain:");
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_DWORD *)a3 + 36) = self->_requestErrorCode;
    *((_WORD *)a3 + 82) |= 0x800u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_55;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 30) = self->_itemCount;
  *((_WORD *)a3 + 82) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 33) = self->_itemsAlreadyPresentCount;
  *((_WORD *)a3 + 82) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0)
      goto LABEL_20;
LABEL_57:
    *((_DWORD *)a3 + 34) = self->_itemsNotPresentCount;
    *((_WORD *)a3 + 82) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_56:
  *((_DWORD *)a3 + 35) = self->_itemsPartiallyPresentCount;
  *((_WORD *)a3 + 82) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
    goto LABEL_57;
LABEL_20:
  if ((v6 & 0x10) != 0)
  {
LABEL_21:
    *((_DWORD *)a3 + 18) = self->_chunksUploaded;
    *((_WORD *)a3 + 82) |= 0x10u;
  }
LABEL_22:
  if (-[AWDMMCSPutRequestInfo chunkingInfosCount](self, "chunkingInfosCount"))
  {
    objc_msgSend(a3, "clearChunkingInfos");
    v7 = -[AWDMMCSPutRequestInfo chunkingInfosCount](self, "chunkingInfosCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addChunkingInfos:", -[AWDMMCSPutRequestInfo chunkingInfosAtIndex:](self, "chunkingInfosAtIndex:", i));
    }
  }
  if (-[AWDMMCSPutRequestInfo authHttpInfosCount](self, "authHttpInfosCount"))
  {
    objc_msgSend(a3, "clearAuthHttpInfos");
    v10 = -[AWDMMCSPutRequestInfo authHttpInfosCount](self, "authHttpInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(a3, "addAuthHttpInfos:", -[AWDMMCSPutRequestInfo authHttpInfosAtIndex:](self, "authHttpInfosAtIndex:", j));
    }
  }
  if (-[AWDMMCSPutRequestInfo containerHttpInfosCount](self, "containerHttpInfosCount"))
  {
    objc_msgSend(a3, "clearContainerHttpInfos");
    v13 = -[AWDMMCSPutRequestInfo containerHttpInfosCount](self, "containerHttpInfosCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(a3, "addContainerHttpInfos:", -[AWDMMCSPutRequestInfo containerHttpInfosAtIndex:](self, "containerHttpInfosAtIndex:", k));
    }
  }
  if (-[AWDMMCSPutRequestInfo completeHttpInfosCount](self, "completeHttpInfosCount"))
  {
    objc_msgSend(a3, "clearCompleteHttpInfos");
    v16 = -[AWDMMCSPutRequestInfo completeHttpInfosCount](self, "completeHttpInfosCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(a3, "addCompleteHttpInfos:", -[AWDMMCSPutRequestInfo completeHttpInfosAtIndex:](self, "completeHttpInfosAtIndex:", m));
    }
  }
  if (-[AWDMMCSPutRequestInfo cancelErrorsCount](self, "cancelErrorsCount"))
  {
    objc_msgSend(a3, "clearCancelErrors");
    v19 = -[AWDMMCSPutRequestInfo cancelErrorsCount](self, "cancelErrorsCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(a3, "addCancelError:", -[AWDMMCSPutRequestInfo cancelErrorAtIndex:](self, "cancelErrorAtIndex:", n));
    }
  }
  if (-[AWDMMCSPutRequestInfo errorsCount](self, "errorsCount"))
  {
    objc_msgSend(a3, "clearErrors");
    v22 = -[AWDMMCSPutRequestInfo errorsCount](self, "errorsCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(a3, "addError:", -[AWDMMCSPutRequestInfo errorAtIndex:](self, "errorAtIndex:", ii));
    }
  }
  v25 = (__int16)self->_has;
  if ((v25 & 0x2000) != 0)
  {
    *((_BYTE *)a3 + 161) = self->_allItemsSuccessful;
    *((_WORD *)a3 + 82) |= 0x2000u;
    v25 = (__int16)self->_has;
    if ((v25 & 0x80) == 0)
    {
LABEL_48:
      if ((v25 & 0x1000) == 0)
        goto LABEL_49;
      goto LABEL_61;
    }
  }
  else if ((v25 & 0x80) == 0)
  {
    goto LABEL_48;
  }
  *((_DWORD *)a3 + 32) = self->_itemCountSuccessful;
  *((_WORD *)a3 + 82) |= 0x80u;
  v25 = (__int16)self->_has;
  if ((v25 & 0x1000) == 0)
  {
LABEL_49:
    if ((v25 & 0x40) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_61:
  *((_BYTE *)a3 + 160) = self->_allItemsFailed;
  *((_WORD *)a3 + 82) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_50:
    *((_DWORD *)a3 + 31) = self->_itemCountFailed;
    *((_WORD *)a3 + 82) |= 0x40u;
  }
LABEL_51:
  if (self->_ckContainerId)
    objc_msgSend(a3, "setCkContainerId:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;
  NSMutableArray *chunkingInfos;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *authHttpInfos;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *containerHttpInfos;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  NSMutableArray *completeHttpInfos;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *cancelErrors;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  NSMutableArray *errors;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  __int16 v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 164) |= 4u;
  }

  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_startTime;
    *(_WORD *)(v6 + 164) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_duration;
    *(_WORD *)(v6 + 164) |= 1u;
  }

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_cancelledErrorDomain, "copyWithZone:", a3);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_cancelledErrorCode;
    *(_WORD *)(v6 + 164) |= 8u;
  }

  *(_QWORD *)(v6 + 152) = -[NSString copyWithZone:](self->_requestErrorDomain, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_requestErrorCode;
    *(_WORD *)(v6 + 164) |= 0x800u;
    v8 = (__int16)self->_has;
    if ((v8 & 0x20) == 0)
    {
LABEL_11:
      if ((v8 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_66;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 120) = self->_itemCount;
  *(_WORD *)(v6 + 164) |= 0x20u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_12:
    if ((v8 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v6 + 132) = self->_itemsAlreadyPresentCount;
  *(_WORD *)(v6 + 164) |= 0x100u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_13:
    if ((v8 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 140) = self->_itemsPartiallyPresentCount;
  *(_WORD *)(v6 + 164) |= 0x400u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_14:
    if ((v8 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_68:
  *(_DWORD *)(v6 + 136) = self->_itemsNotPresentCount;
  *(_WORD *)(v6 + 164) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 72) = self->_chunksUploaded;
    *(_WORD *)(v6 + 164) |= 0x10u;
  }
LABEL_16:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  chunkingInfos = self->_chunkingInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v68 != v12)
          objc_enumerationMutation(chunkingInfos);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChunkingInfos:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingInfos, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v11);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  authHttpInfos = self->_authHttpInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v64 != v18)
          objc_enumerationMutation(authHttpInfos);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAuthHttpInfos:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authHttpInfos, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v17);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  containerHttpInfos = self->_containerHttpInfos;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v60 != v24)
          objc_enumerationMutation(containerHttpInfos);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addContainerHttpInfos:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](containerHttpInfos, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v23);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  completeHttpInfos = self->_completeHttpInfos;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v56 != v30)
          objc_enumerationMutation(completeHttpInfos);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCompleteHttpInfos:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completeHttpInfos, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v29);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  cancelErrors = self->_cancelErrors;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(cancelErrors);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCancelError:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cancelErrors, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v35);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  errors = self->_errors;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v48;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(errors);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addError:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](errors, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v41);
  }
  v45 = (__int16)self->_has;
  if ((v45 & 0x2000) != 0)
  {
    *(_BYTE *)(v6 + 161) = self->_allItemsSuccessful;
    *(_WORD *)(v6 + 164) |= 0x2000u;
    v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_60:
      if ((v45 & 0x1000) == 0)
        goto LABEL_61;
LABEL_72:
      *(_BYTE *)(v6 + 160) = self->_allItemsFailed;
      *(_WORD *)(v6 + 164) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_63;
      goto LABEL_62;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_60;
  }
  *(_DWORD *)(v6 + 128) = self->_itemCountSuccessful;
  *(_WORD *)(v6 + 164) |= 0x80u;
  v45 = (__int16)self->_has;
  if ((v45 & 0x1000) != 0)
    goto LABEL_72;
LABEL_61:
  if ((v45 & 0x40) != 0)
  {
LABEL_62:
    *(_DWORD *)(v6 + 124) = self->_itemCountFailed;
    *(_WORD *)(v6 + 164) |= 0x40u;
  }
LABEL_63:

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_ckContainerId, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *clientId;
  __int16 v9;
  NSString *cancelledErrorDomain;
  __int16 v11;
  NSString *requestErrorDomain;
  __int16 v13;
  NSMutableArray *chunkingInfos;
  NSMutableArray *authHttpInfos;
  NSMutableArray *containerHttpInfos;
  NSMutableArray *completeHttpInfos;
  NSMutableArray *cancelErrors;
  NSMutableArray *errors;
  __int16 v20;
  __int16 v21;
  NSString *ckContainerId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (__int16)self->_has;
    v7 = *((_WORD *)a3 + 82);
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_101;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_101;
    }
    clientId = self->_clientId;
    if ((unint64_t)clientId | *((_QWORD *)a3 + 11))
    {
      v5 = -[NSString isEqual:](clientId, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v9 = *((_WORD *)a3 + 82);
    if ((has & 2) != 0)
    {
      if ((v9 & 2) == 0 || self->_startTime != *((_QWORD *)a3 + 2))
        goto LABEL_101;
    }
    else if ((v9 & 2) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 1) != 0)
    {
      if ((v9 & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_101;
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_101;
    }
    cancelledErrorDomain = self->_cancelledErrorDomain;
    if ((unint64_t)cancelledErrorDomain | *((_QWORD *)a3 + 7))
    {
      v5 = -[NSString isEqual:](cancelledErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v11 = *((_WORD *)a3 + 82);
    if ((has & 8) != 0)
    {
      if ((v11 & 8) == 0 || self->_cancelledErrorCode != *((_DWORD *)a3 + 12))
        goto LABEL_101;
    }
    else if ((v11 & 8) != 0)
    {
      goto LABEL_101;
    }
    requestErrorDomain = self->_requestErrorDomain;
    if ((unint64_t)requestErrorDomain | *((_QWORD *)a3 + 19))
    {
      v5 = -[NSString isEqual:](requestErrorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (__int16)self->_has;
    }
    v13 = *((_WORD *)a3 + 82);
    if ((has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x800) == 0 || self->_requestErrorCode != *((_DWORD *)a3 + 36))
        goto LABEL_101;
    }
    else if ((*((_WORD *)a3 + 82) & 0x800) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x20) != 0)
    {
      if ((v13 & 0x20) == 0 || self->_itemCount != *((_DWORD *)a3 + 30))
        goto LABEL_101;
    }
    else if ((v13 & 0x20) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x100) == 0 || self->_itemsAlreadyPresentCount != *((_DWORD *)a3 + 33))
        goto LABEL_101;
    }
    else if ((*((_WORD *)a3 + 82) & 0x100) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x400) == 0 || self->_itemsPartiallyPresentCount != *((_DWORD *)a3 + 35))
        goto LABEL_101;
    }
    else if ((*((_WORD *)a3 + 82) & 0x400) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 82) & 0x200) == 0 || self->_itemsNotPresentCount != *((_DWORD *)a3 + 34))
        goto LABEL_101;
    }
    else if ((*((_WORD *)a3 + 82) & 0x200) != 0)
    {
      goto LABEL_101;
    }
    if ((has & 0x10) != 0)
    {
      if ((v13 & 0x10) == 0 || self->_chunksUploaded != *((_DWORD *)a3 + 18))
        goto LABEL_101;
    }
    else if ((v13 & 0x10) != 0)
    {
      goto LABEL_101;
    }
    chunkingInfos = self->_chunkingInfos;
    if (!((unint64_t)chunkingInfos | *((_QWORD *)a3 + 8))
      || (v5 = -[NSMutableArray isEqual:](chunkingInfos, "isEqual:")) != 0)
    {
      authHttpInfos = self->_authHttpInfos;
      if (!((unint64_t)authHttpInfos | *((_QWORD *)a3 + 4))
        || (v5 = -[NSMutableArray isEqual:](authHttpInfos, "isEqual:")) != 0)
      {
        containerHttpInfos = self->_containerHttpInfos;
        if (!((unint64_t)containerHttpInfos | *((_QWORD *)a3 + 13))
          || (v5 = -[NSMutableArray isEqual:](containerHttpInfos, "isEqual:")) != 0)
        {
          completeHttpInfos = self->_completeHttpInfos;
          if (!((unint64_t)completeHttpInfos | *((_QWORD *)a3 + 12))
            || (v5 = -[NSMutableArray isEqual:](completeHttpInfos, "isEqual:")) != 0)
          {
            cancelErrors = self->_cancelErrors;
            if (!((unint64_t)cancelErrors | *((_QWORD *)a3 + 5))
              || (v5 = -[NSMutableArray isEqual:](cancelErrors, "isEqual:")) != 0)
            {
              errors = self->_errors;
              if (!((unint64_t)errors | *((_QWORD *)a3 + 14))
                || (v5 = -[NSMutableArray isEqual:](errors, "isEqual:")) != 0)
              {
                v20 = (__int16)self->_has;
                v21 = *((_WORD *)a3 + 82);
                if ((v20 & 0x2000) != 0)
                {
                  if ((*((_WORD *)a3 + 82) & 0x2000) == 0)
                    goto LABEL_101;
                  if (self->_allItemsSuccessful)
                  {
                    if (!*((_BYTE *)a3 + 161))
                      goto LABEL_101;
                  }
                  else if (*((_BYTE *)a3 + 161))
                  {
                    goto LABEL_101;
                  }
                }
                else if ((*((_WORD *)a3 + 82) & 0x2000) != 0)
                {
                  goto LABEL_101;
                }
                if ((v20 & 0x80) != 0)
                {
                  if ((v21 & 0x80) == 0 || self->_itemCountSuccessful != *((_DWORD *)a3 + 32))
                    goto LABEL_101;
                }
                else if ((v21 & 0x80) != 0)
                {
                  goto LABEL_101;
                }
                if ((*(_WORD *)&self->_has & 0x1000) == 0)
                {
                  if ((*((_WORD *)a3 + 82) & 0x1000) != 0)
                    goto LABEL_101;
                  goto LABEL_94;
                }
                if ((*((_WORD *)a3 + 82) & 0x1000) != 0)
                {
                  if (self->_allItemsFailed)
                  {
                    if (!*((_BYTE *)a3 + 160))
                      goto LABEL_101;
                    goto LABEL_94;
                  }
                  if (!*((_BYTE *)a3 + 160))
                  {
LABEL_94:
                    if ((v20 & 0x40) != 0)
                    {
                      if ((v21 & 0x40) == 0 || self->_itemCountFailed != *((_DWORD *)a3 + 31))
                        goto LABEL_101;
                    }
                    else if ((v21 & 0x40) != 0)
                    {
                      goto LABEL_101;
                    }
                    ckContainerId = self->_ckContainerId;
                    if ((unint64_t)ckContainerId | *((_QWORD *)a3 + 10))
                      LOBYTE(v5) = -[NSString isEqual:](ckContainerId, "isEqual:");
                    else
                      LOBYTE(v5) = 1;
                    return v5;
                  }
                }
LABEL_101:
                LOBYTE(v5) = 0;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;

  if ((*(_WORD *)&self->_has & 4) != 0)
    v29 = 2654435761 * self->_timestamp;
  else
    v29 = 0;
  v28 = -[NSString hash](self->_clientId, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v27 = 2654435761 * self->_startTime;
    if ((has & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v27 = 0;
    if ((has & 1) != 0)
    {
LABEL_6:
      v26 = 2654435761 * self->_duration;
      goto LABEL_9;
    }
  }
  v26 = 0;
LABEL_9:
  v25 = -[NSString hash](self->_cancelledErrorDomain, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
    v24 = 2654435761 * self->_cancelledErrorCode;
  else
    v24 = 0;
  v23 = -[NSString hash](self->_requestErrorDomain, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x800) != 0)
  {
    v22 = 2654435761 * self->_requestErrorCode;
    if ((v4 & 0x20) != 0)
    {
LABEL_14:
      v21 = 2654435761 * self->_itemCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_15;
      goto LABEL_21;
    }
  }
  else
  {
    v22 = 0;
    if ((v4 & 0x20) != 0)
      goto LABEL_14;
  }
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    v20 = 2654435761 * self->_itemsAlreadyPresentCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_16;
    goto LABEL_22;
  }
LABEL_21:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    v19 = 2654435761 * self->_itemsPartiallyPresentCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_17;
LABEL_23:
    v5 = 0;
    if ((v4 & 0x10) != 0)
      goto LABEL_18;
    goto LABEL_24;
  }
LABEL_22:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_23;
LABEL_17:
  v5 = 2654435761 * self->_itemsNotPresentCount;
  if ((v4 & 0x10) != 0)
  {
LABEL_18:
    v6 = 2654435761 * self->_chunksUploaded;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
LABEL_25:
  v7 = -[NSMutableArray hash](self->_chunkingInfos, "hash");
  v8 = -[NSMutableArray hash](self->_authHttpInfos, "hash");
  v9 = -[NSMutableArray hash](self->_containerHttpInfos, "hash");
  v10 = -[NSMutableArray hash](self->_completeHttpInfos, "hash");
  v11 = -[NSMutableArray hash](self->_cancelErrors, "hash");
  v12 = -[NSMutableArray hash](self->_errors, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x2000) != 0)
  {
    v14 = 2654435761 * self->_allItemsSuccessful;
    if ((v13 & 0x80) != 0)
    {
LABEL_27:
      v15 = 2654435761 * self->_itemCountSuccessful;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_28;
LABEL_32:
      v16 = 0;
      if ((v13 & 0x40) != 0)
        goto LABEL_29;
LABEL_33:
      v17 = 0;
      return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_ckContainerId, "hash");
    }
  }
  else
  {
    v14 = 0;
    if ((v13 & 0x80) != 0)
      goto LABEL_27;
  }
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_32;
LABEL_28:
  v16 = 2654435761 * self->_allItemsFailed;
  if ((v13 & 0x40) == 0)
    goto LABEL_33;
LABEL_29:
  v17 = 2654435761 * self->_itemCountFailed;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_ckContainerId, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  __int16 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  if ((*((_WORD *)a3 + 82) & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 11))
    -[AWDMMCSPutRequestInfo setClientId:](self, "setClientId:");
  v5 = *((_WORD *)a3 + 82);
  if ((v5 & 2) != 0)
  {
    self->_startTime = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)a3 + 82);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 7))
    -[AWDMMCSPutRequestInfo setCancelledErrorDomain:](self, "setCancelledErrorDomain:");
  if ((*((_WORD *)a3 + 82) & 8) != 0)
  {
    self->_cancelledErrorCode = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 19))
    -[AWDMMCSPutRequestInfo setRequestErrorDomain:](self, "setRequestErrorDomain:");
  v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x800) != 0)
  {
    self->_requestErrorCode = *((_DWORD *)a3 + 36);
    *(_WORD *)&self->_has |= 0x800u;
    v6 = *((_WORD *)a3 + 82);
    if ((v6 & 0x20) == 0)
    {
LABEL_17:
      if ((v6 & 0x100) == 0)
        goto LABEL_18;
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  self->_itemCount = *((_DWORD *)a3 + 30);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_75;
  }
LABEL_74:
  self->_itemsAlreadyPresentCount = *((_DWORD *)a3 + 33);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_76;
  }
LABEL_75:
  self->_itemsPartiallyPresentCount = *((_DWORD *)a3 + 35);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)a3 + 82);
  if ((v6 & 0x200) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_76:
  self->_itemsNotPresentCount = *((_DWORD *)a3 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 82) & 0x10) != 0)
  {
LABEL_21:
    self->_chunksUploaded = *((_DWORD *)a3 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_22:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v59 != v10)
          objc_enumerationMutation(v7);
        -[AWDMMCSPutRequestInfo addChunkingInfos:](self, "addChunkingInfos:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v9);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        -[AWDMMCSPutRequestInfo addAuthHttpInfos:](self, "addAuthHttpInfos:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v14);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 13);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(v17);
        -[AWDMMCSPutRequestInfo addContainerHttpInfos:](self, "addContainerHttpInfos:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v19);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = (void *)*((_QWORD *)a3 + 12);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v22);
        -[AWDMMCSPutRequestInfo addCompleteHttpInfos:](self, "addCompleteHttpInfos:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v24);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = (void *)*((_QWORD *)a3 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        -[AWDMMCSPutRequestInfo addCancelError:](self, "addCancelError:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * n));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    }
    while (v29);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = (void *)*((_QWORD *)a3 + 14);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        -[AWDMMCSPutRequestInfo addError:](self, "addError:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * ii));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v34);
  }
  v37 = *((_WORD *)a3 + 82);
  if ((v37 & 0x2000) != 0)
  {
    self->_allItemsSuccessful = *((_BYTE *)a3 + 161);
    *(_WORD *)&self->_has |= 0x2000u;
    v37 = *((_WORD *)a3 + 82);
    if ((v37 & 0x80) == 0)
    {
LABEL_66:
      if ((v37 & 0x1000) == 0)
        goto LABEL_67;
      goto LABEL_80;
    }
  }
  else if ((v37 & 0x80) == 0)
  {
    goto LABEL_66;
  }
  self->_itemCountSuccessful = *((_DWORD *)a3 + 32);
  *(_WORD *)&self->_has |= 0x80u;
  v37 = *((_WORD *)a3 + 82);
  if ((v37 & 0x1000) == 0)
  {
LABEL_67:
    if ((v37 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_80:
  self->_allItemsFailed = *((_BYTE *)a3 + 160);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)a3 + 82) & 0x40) != 0)
  {
LABEL_68:
    self->_itemCountFailed = *((_DWORD *)a3 + 31);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_69:
  if (*((_QWORD *)a3 + 10))
    -[AWDMMCSPutRequestInfo setCkContainerId:](self, "setCkContainerId:");
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)cancelledErrorDomain
{
  return self->_cancelledErrorDomain;
}

- (void)setCancelledErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)cancelledErrorCode
{
  return self->_cancelledErrorCode;
}

- (NSString)requestErrorDomain
{
  return self->_requestErrorDomain;
}

- (void)setRequestErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (int)requestErrorCode
{
  return self->_requestErrorCode;
}

- (int)itemCount
{
  return self->_itemCount;
}

- (int)itemsAlreadyPresentCount
{
  return self->_itemsAlreadyPresentCount;
}

- (int)itemsPartiallyPresentCount
{
  return self->_itemsPartiallyPresentCount;
}

- (int)itemsNotPresentCount
{
  return self->_itemsNotPresentCount;
}

- (int)chunksUploaded
{
  return self->_chunksUploaded;
}

- (NSMutableArray)chunkingInfos
{
  return self->_chunkingInfos;
}

- (void)setChunkingInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)authHttpInfos
{
  return self->_authHttpInfos;
}

- (void)setAuthHttpInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)containerHttpInfos
{
  return self->_containerHttpInfos;
}

- (void)setContainerHttpInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSMutableArray)completeHttpInfos
{
  return self->_completeHttpInfos;
}

- (void)setCompleteHttpInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)cancelErrors
{
  return self->_cancelErrors;
}

- (void)setCancelErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)allItemsSuccessful
{
  return self->_allItemsSuccessful;
}

- (unsigned)itemCountSuccessful
{
  return self->_itemCountSuccessful;
}

- (BOOL)allItemsFailed
{
  return self->_allItemsFailed;
}

- (unsigned)itemCountFailed
{
  return self->_itemCountFailed;
}

- (NSString)ckContainerId
{
  return self->_ckContainerId;
}

- (void)setCkContainerId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
