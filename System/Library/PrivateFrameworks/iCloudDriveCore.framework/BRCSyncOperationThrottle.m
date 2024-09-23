@implementation BRCSyncOperationThrottle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCSyncOperationThrottle)initWithMangledID:(id)a3 isSyncDown:(BOOL)a4
{
  id v7;
  BRCSyncOperationThrottle *v8;
  BRCSyncOperationThrottle *v9;
  BRCSyncOperationThrottle *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v7 = a3;
  v8 = -[BRCSyncOperationThrottle init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mangledID, a3);
    v9->_isSyncDown = a4;
    v10 = v9;
    -[BRCSyncOperationThrottle mangledID](v10, "mangledID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9->_isSyncDown)
      objc_msgSend(v12, "syncDownThrottle");
    else
      objc_msgSend(v12, "syncUpThrottle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "minWait");
    v10->_delay = v14;

  }
  return v9;
}

- (BRCSyncOperationThrottle)initWithCoder:(id)a3
{
  id v4;
  BRCSyncOperationThrottle *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = -[BRCSyncOperationThrottle init](self, "init");
  if (v5)
  {
    v5->_isSyncDown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("t"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("d"));
    v5->_delay = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("e"));
    v5->_nextTry = v7;
    v5->_lastErrorKind = objc_msgSend(v4, "decodeIntForKey:", CFSTR("k"));
    v5->_graceNextRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("g"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t lastErrorKind;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSyncDown, CFSTR("t"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("d"), self->_delay);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("e"), self->_nextTry);
  lastErrorKind = self->_lastErrorKind;
  if ((_DWORD)lastErrorKind)
    objc_msgSend(v5, "encodeInt:forKey:", lastErrorKind, CFSTR("k"));
  if (self->_graceNextRequest)
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("g"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double nextTry;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ delay:%.1fs id:%@"), objc_opt_class(), *(_QWORD *)&self->_delay, self->_mangledID);
  v4 = v3;
  if (self->_graceNextRequest)
    objc_msgSend(v3, "appendString:", CFSTR(" graced"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  nextTry = self->_nextTry;
  if (nextTry >= v7)
    objc_msgSend(v4, "appendFormat:", CFSTR(" next-try in %.1fs>"), nextTry - v7);
  else
    objc_msgSend(v4, "appendString:", CFSTR(" expired>"));
  return v4;
}

- (void)updateAfterSchedulingTaskWithMinimumDelay:(double)a3
{
  BRCSyncOperationThrottle *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double delay;
  void *v19;
  double v20;
  double v22;
  double v23;
  id v24;
  id v25;

  v4 = self;
  -[BRCSyncOperationThrottle mangledID](v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = v4->_isSyncDown;
  if ((_DWORD)v5)
    objc_msgSend(v6, "syncDownThrottle");
  else
    objc_msgSend(v6, "syncUpThrottle");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  v10 = v9 - v4->_nextTry;
  objc_msgSend(v24, "inactivityKickbackDelay");
  v12 = v10 - v11;
  objc_msgSend(v24, "inactivityKickbackRatio");
  v14 = v12 * v13;
  objc_msgSend(v24, "minWait");
  if (v15 > a3)
  {
    objc_msgSend(v24, "minWait");
    a3 = v16;
  }
  delay = v4->_delay;
  if (v14 < delay || delay <= a3)
  {
    v19 = v24;
  }
  else
  {
    do
    {
      v14 = v14 - delay;
      objc_msgSend(v24, "ratioOnSuccess");
      v19 = v24;
      delay = v20 * v4->_delay;
      v4->_delay = delay;
    }
    while (v14 >= delay && delay > a3);
  }
  if (delay < a3)
  {
    v4->_delay = a3;
    delay = a3;
  }
  v25 = v19;
  objc_msgSend(v19, "maxWait");
  if (delay <= v22)
  {
    v23 = v4->_delay;
  }
  else
  {
    objc_msgSend(v25, "maxWait");
    v4->_delay = v23;
  }
  v4->_nextTry = v9 + v23;
  v4->_graceNextRequest = 0;

}

- (void)updateAfterSchedulingTask
{
  -[BRCSyncOperationThrottle updateAfterSchedulingTaskWithMinimumDelay:](self, "updateAfterSchedulingTaskWithMinimumDelay:", 0.0);
}

- (BOOL)updateForClearingOutOfQuota
{
  int lastErrorKind;
  BRCSyncOperationThrottle *v4;
  void *v5;
  void *v6;
  _BOOL4 isSyncDown;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  lastErrorKind = self->_lastErrorKind;
  if (lastErrorKind == 2)
  {
    v4 = self;
    -[BRCSyncOperationThrottle mangledID](v4, "mangledID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    isSyncDown = v4->_isSyncDown;
    if (isSyncDown)
      objc_msgSend(v6, "syncDownThrottle");
    else
      objc_msgSend(v6, "syncUpThrottle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4->_nextTry = v4->_nextTry - v4->_delay;
    objc_msgSend(v8, "ratioOnQuotaErrorClear");
    v10 = v9 * v4->_delay;
    v4->_delay = v10;
    objc_msgSend(v8, "minWait");
    if (v10 >= v11)
      v11 = v10;
    v12 = v4->_nextTry + v11;
    v4->_delay = v11;
    v4->_nextTry = v12;
    self->_lastErrorKind = 0;

  }
  return lastErrorKind == 2;
}

- (void)updateForError:(id)a3
{
  id v4;
  BRCSyncOperationThrottle *v5;
  void *v6;
  void *v7;
  _BOOL4 isSyncDown;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  double delay;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  -[BRCSyncOperationThrottle mangledID](v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  isSyncDown = v5->_isSyncDown;
  if (isSyncDown)
    objc_msgSend(v7, "syncDownThrottle");
  else
    objc_msgSend(v7, "syncUpThrottle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "brc_syncOperationErrorKind");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  if (!v4 || v10 == -1)
  {
    if (v5->_lastErrorKind == 2)
    {
      objc_msgSend(v9, "ratioOnQuotaErrorClear");
      v5->_delay = v20 * v5->_delay;
    }
    objc_msgSend(v9, "ratioOnSuccess");
    v17 = v21 * v5->_delay;
    v5->_delay = v17;
    objc_msgSend(v9, "minWait");
    if (v17 < v22)
      v17 = v22;
    goto LABEL_21;
  }
  if (v10 != 1)
  {
    if (v5->_isSyncDown && objc_msgSend(v4, "br_isCloudDocsErrorCode:", 32))
    {
      objc_msgSend(v9, "ratioOnSuccess");
      v5->_delay = v5->_delay / v14;
    }
    objc_msgSend(v9, "ratioOnFailure");
    v5->_delay = v15 * v5->_delay;
  }
  objc_msgSend(v4, "br_suggestedRetryTimeInterval");
  if (v16 != 0.0)
  {
    v17 = v16;
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      delay = v5->_delay;
      v27 = 134218498;
      v28 = v17;
      v29 = 2048;
      v30 = delay;
      v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] server provided backoff %.03fs (delay %.03fs)%@", (uint8_t *)&v27, 0x20u);
    }

    if (v5->_delay >= v17)
      v17 = v5->_delay;
LABEL_21:
    v5->_delay = v17;
    goto LABEL_22;
  }
  v17 = v5->_delay;
LABEL_22:
  objc_msgSend(v9, "maxWait");
  if (v17 < v23)
    v23 = v17;
  v5->_delay = v23;
  brc_bread_crumbs();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[BRCSyncOperationThrottle updateForError:].cold.1((uint64_t)v5, (uint64_t)v24, v25);

  v5->_lastErrorKind = v10;
  v5->_nextTry = v13 + v5->_delay;

}

- (void)clear
{
  self->_graceNextRequest = 0;
  self->_delay = 0.0;
  self->_nextTry = 0.0;
}

- (double)nextTry
{
  void *v3;
  double v4;
  double v5;
  double delay;
  double result;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  delay = 0.0;
  if (!self->_graceNextRequest)
    delay = self->_delay;
  result = v5 + delay;
  if (self->_nextTry < result)
    result = self->_nextTry;
  self->_nextTry = result;
  return result;
}

- (void)graceNextRequest
{
  self->_graceNextRequest = 1;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)isSyncDown
{
  return self->_isSyncDown;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (void)setMangledID:(id)a3
{
  objc_storeStrong((id *)&self->_mangledID, a3);
}

- (int)lastErrorKind
{
  return self->_lastErrorKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mangledID, 0);
}

- (BOOL)scheduleIfPossibleWithCurrentTimestamp:(int64_t)a3 signalSourceIfFailed:(id)a4 description:(id)a5
{
  id v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  BRCSyncOperationThrottle *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (__CFString *)a5;
  -[BRCSyncOperationThrottle nextTry](self, "nextTry");
  v10 = brc_interval_to_nsec();
  if (v10 - a3 >= 0x2540BE401)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (-[BRCSyncOperationThrottle isSyncDown](self, "isSyncDown"))
        v20 = CFSTR("down");
      else
        v20 = CFSTR("up");
      brc_interval_from_nsec();
      v24 = 138413314;
      v25 = v9;
      v26 = 2112;
      v27 = v20;
      v28 = 2048;
      v29 = v21;
      v30 = 2112;
      v31 = self;
      v32 = 2112;
      v33 = v11;
      _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ sync-%@ is throttled for more than 10s: %.1fs (%@)%@", (uint8_t *)&v24, 0x34u);
    }

  }
  if (v10 > a3)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRCSyncOperationThrottle(SchedulingAdditions) scheduleIfPossibleWithCurrentTimestamp:signalSourceIfFailed:description:].cold.1((uint64_t)v15, v16);

    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCSyncOperationThrottle(SchedulingAdditions) scheduleIfPossibleWithCurrentTimestamp:signalSourceIfFailed:description:].cold.2(v10 - a3, (uint64_t)v17, v18);

      objc_msgSend(v8, "signalWithDeadline:", v10);
    }
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v22 = -[BRCSyncOperationThrottle isSyncDown](self, "isSyncDown");
      v23 = CFSTR("up");
      v24 = 138412802;
      if (v22)
        v23 = CFSTR("down");
      v25 = v23;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] syncing %@ %@%@", (uint8_t *)&v24, 0x20u);
    }

    -[BRCSyncOperationThrottle updateAfterSchedulingTask](self, "updateAfterSchedulingTask");
  }

  return v10 <= a3;
}

- (void)updateForError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: Updated sync throttle %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
