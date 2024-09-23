@implementation SASamplePrintOptions

- (BOOL)displayBlockedReasons
{
  return self->_displayBlockedReasons;
}

- (BOOL)printHeavyStacks
{
  return self->_printHeavyStacks;
}

- (BOOL)displaySymbolInformation
{
  return self->_displaySymbolInformation;
}

- (BOOL)tabDelineateBinaryImageSections
{
  return self->_tabDelineateBinaryImageSections;
}

- (void)setMicrostackshotsFormat:(BOOL)a3
{
  self->_microstackshotsFormat = a3;
  if (a3)
  {
    self->_aggregateFramesByOffsetIntoBinary = 1;
    self->_displayThreadRunningState = 0;
    self->_showThreadStateAsLeafFrame = 1;
    self->_printHeavyStacks = 1;
    self->_displayTrialInformation = 0;
  }
}

- (BOOL)includeUserIdleAndBatteryStateInStacks
{
  return self->_includeUserIdleAndBatteryStateInStacks;
}

- (BOOL)printTargetThreadOnly
{
  return self->_printTargetThreadOnly;
}

- (char)omitTasksBelowPercentOfTotalSamples
{
  return self->_omitTasksBelowPercentOfTotalSamples;
}

- (BOOL)aggregateStacksByProcess
{
  unint64_t callTreeAggregation;

  if (self)
  {
    callTreeAggregation = self->_callTreeAggregation;
    if (!callTreeAggregation)
    {
      callTreeAggregation = 3;
      if (!self->_microstackshotsFormat)
        callTreeAggregation = 1;
    }
  }
  else
  {
    callTreeAggregation = 0;
  }
  return callTreeAggregation == 3;
}

- (uint64_t)callTreeAggregationResolved
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 152);
    if (!result)
    {
      if (*(_BYTE *)(v1 + 11))
        return 3;
      else
        return 1;
    }
  }
  return result;
}

- (BOOL)displayProcessFirstLastTimes
{
  return 1;
}

- (BOOL)orderTasksBySampleCount
{
  void *v2;
  BOOL v3;

  -[NSMutableArray firstObject](self->_processSortAttributes, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue") == 11;

  return v3;
}

- (void)setOrderTasksBySampleCount:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[NSMutableArray firstObject](self->_processSortAttributes, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  if (a3)
  {
    if (v6 != 11)
      -[NSMutableArray insertObject:atIndex:](self->_processSortAttributes, "insertObject:atIndex:", &unk_1E71678D0, 0);
  }
  else if (v6 == 11)
  {
    do
    {
      -[NSMutableArray removeObjectAtIndex:](self->_processSortAttributes, "removeObjectAtIndex:", 0);
      -[NSMutableArray firstObject](self->_processSortAttributes, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedLongLongValue");

    }
    while (v8 == 11);
  }
}

- (BOOL)printTargetHIDEvent
{
  return (LOBYTE(self->_hidEventDisplayOptions) >> 2) & 1;
}

- (void)setPrintTargetHIDEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_hidEventDisplayOptions = self->_hidEventDisplayOptions & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)displayAllHIDEvents
{
  return (LOBYTE(self->_hidEventDisplayOptions) >> 4) & 1;
}

- (void)setDisplayAllHIDEvents:(BOOL)a3
{
  unint64_t hidEventDisplayOptions;
  unint64_t v4;
  unint64_t v5;

  hidEventDisplayOptions = self->_hidEventDisplayOptions;
  v4 = hidEventDisplayOptions & 0xFFFFFFFFFFFFFFE7 | 8;
  v5 = hidEventDisplayOptions | 0x10;
  if (!a3)
    v5 = v4;
  self->_hidEventDisplayOptions = v5;
}

- (BOOL)displayTimestampsInCallTrees
{
  return self->_callTreeTimestampsTimeDomain != 0;
}

- (void)setDisplayTimestampsInCallTrees:(BOOL)a3
{
  unint64_t v3;

  if (!a3)
  {
    v3 = 0;
LABEL_6:
    self->_callTreeTimestampsTimeDomain = v3;
    return;
  }
  if (!self->_callTreeTimestampsTimeDomain)
  {
    v3 = 1;
    goto LABEL_6;
  }
}

- (BOOL)displayStacksWithZeroCount
{
  return self->_displayCallTreesWithZeroCount;
}

- (BOOL)aggregateStacksByThread
{
  unint64_t callTreeAggregation;

  if (self)
  {
    callTreeAggregation = self->_callTreeAggregation;
    if (!callTreeAggregation)
    {
      callTreeAggregation = 3;
      if (!self->_microstackshotsFormat)
        callTreeAggregation = 1;
    }
  }
  else
  {
    callTreeAggregation = 0;
  }
  return callTreeAggregation == 2;
}

- (void)setAggregateStacksByThread:(BOOL)a3
{
  unint64_t v3;

  if (a3)
  {
    v3 = 2;
  }
  else
  {
    if (self->_callTreeAggregation != 2)
      return;
    v3 = 0;
  }
  self->_callTreeAggregation = v3;
}

- (void)setAggregateStacksByProcess:(BOOL)a3
{
  unint64_t v3;

  if (a3)
  {
    v3 = 3;
  }
  else
  {
    if (self->_callTreeAggregation != 3)
      return;
    v3 = 0;
  }
  self->_callTreeAggregation = v3;
}

- (BOOL)aggregateProcessesByExecutable
{
  unint64_t taskAggregation;

  if (self)
  {
    taskAggregation = self->_taskAggregation;
    if (!taskAggregation)
    {
      taskAggregation = 1;
      if (self->_microstackshotsFormat)
        taskAggregation = 2;
    }
  }
  else
  {
    taskAggregation = 0;
  }
  return taskAggregation == 2;
}

- (void)setAggregateProcessesByExecutable:(BOOL)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3)
    v3 = 2;
  self->_taskAggregation = v3;
}

- (SASamplePrintOptions)init
{
  char *v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SASamplePrintOptions;
  v2 = -[SASamplePrintOptions init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)(v2 + 35) = 257;
    v2[37] = 1;
    *(_DWORD *)(v2 + 14) = 0;
    v2[18] = 0;
    *(_DWORD *)(v2 + 19) = 1;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = (void *)*((_QWORD *)v3 + 17);
    *((_QWORD *)v3 + 17) = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = (void *)*((_QWORD *)v3 + 18);
    *((_QWORD *)v3 + 18) = v6;

    *((_QWORD *)v3 + 23) = 0;
    *((_QWORD *)v3 + 24) = 0;
    *(_DWORD *)(v3 + 38) = 16843009;
    *(_DWORD *)(v3 + 42) = 0x1000000;
    v3[46] = 0;
    *(_DWORD *)(v3 + 47) = 16843009;
    v3[51] = 1;
    *((_DWORD *)v3 + 13) = 16777472;
    *((_WORD *)v3 + 28) = 0;
    v3[58] = 1;
    *(_DWORD *)(v3 + 59) = 0;
    v3[63] = 1;
    *((_DWORD *)v3 + 16) = 0;
    v3[68] = 0;
    *(_DWORD *)(v3 + 69) = 65537;
    v3[73] = 1;
    *((_QWORD *)v3 + 26) = 13;
    *((_QWORD *)v3 + 16) = 0;
    *((_QWORD *)v3 + 21) = 0;
    *((_QWORD *)v3 + 22) = 0;
    *((_QWORD *)v3 + 19) = 0;
    *((_QWORD *)v3 + 20) = 0;
    *(_DWORD *)(v3 + 23) = 0x1000000;
    *((_DWORD *)v3 + 2) = 0;
    *((_WORD *)v3 + 6) = 256;
    *((_DWORD *)v3 + 19) = 0;
    *((_DWORD *)v3 + 20) = 0;
    *(_QWORD *)(v3 + 27) = 0;
  }
  return (SASamplePrintOptions *)v3;
}

- (BOOL)verbose
{
  _BOOL8 v2;

  if (self->_displayKernelFrames
    && self->_displayExclaveFrames
    && self->_displayUserFrames
    && self->_displayFrameAddresses
    && self->_displayDetailedCpuTime
    && self->_displayDetailedWallTime
    && self->_displayOffsetsFromUnnamedSymbols
    && self->_displayFullSourcePaths
    && self->_displaySymbolInformation
    && self->_displayBinaryImageAddresses
    && self->_displayBinaryImagesLackingNameOrPath
    && self->_displayRunningThreads
    && self->_displayRunnableThreads
    && self->_displayBlockedThreads
    && self->_displayCPUNumForRunningThreads
    && self->_displayCPUClusterInfoForRunningThreads
    && self->_displayCPUNumForNonRunningThreads
    && self->_displayThreadRunningState
    && self->_displayIdleWorkQueueThreads
    && self->_displayAllBinaries
    && self->_displayBlockedReasons
    && self->_displayBlockedReasonsLackingProcessOwners
    && self->_displayAddressesInBlockedReasons
    && self->_displayMultipleMatchingBlockedReasons
    && self->_displayEmptyBootArgs
    && self->_displayTasksWithZeroCount
    && self->_displayCallTreesWithZeroCount
    && self->_displayDifferentTypesOfSuspension
    && self->_displayAllTaskSizeChanges
    && self->_displayCodesigningIDsMatchingBundleIDs
    && self->_displayDefaultPowerModes
    && self->_displayIOInCallTrees
    && self->_displayEachIndividualIOInCallTrees
    && self->_displayOnBehalfOfInCallTrees
    && self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable
    && self->_displayTrialInformation
    && self->_swiftAsyncDisplayCRootCallstacks
    && self->_callTreeTimestampsTimeDomain == -1
    && (~LODWORD(self->_hidEventDisplayOptions) & 0x12) == 0)
  {
    return (self->_hidEventDisplayOptions >> 2) & 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)setVerbose:(BOOL)a3
{
  int8x16_t v3;
  unint64_t v4;

  v3 = vdupq_n_s8(a3);
  self->_swiftAsyncDisplayCRootCallstacks = a3;
  *(int8x16_t *)&self->_displayKernelFrames = v3;
  *(int8x16_t *)&self->_displayCPUNumForNonRunningThreads = v3;
  *(_DWORD *)&self->_displayEachIndividualIOInCallTrees = 16843009 * a3;
  v4 = 22;
  if (!a3)
    v4 = 0;
  self->_callTreeTimestampsTimeDomain = a3 << 63 >> 63;
  self->_hidEventDisplayOptions = v4;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDisplayHeader:", self->_displayHeader);
  objc_msgSend(v4, "setDisplayBody:", self->_displayBody);
  objc_msgSend(v4, "setDisplayFooter:", self->_displayFooter);
  objc_msgSend(v4, "setTabDelineateBinaryImageSections:", self->_tabDelineateBinaryImageSections);
  objc_msgSend(v4, "setBinaryImagesBeforeStacks:", self->_binaryImagesBeforeStacks);
  objc_msgSend(v4, "setPrintSpinSignatureStack:", self->_printSpinSignatureStack);
  objc_msgSend(v4, "setPrintTargetThreadOnly:", self->_printTargetThreadOnly);
  objc_msgSend(v4, "setPrintHeavyStacks:", self->_printHeavyStacks);
  objc_msgSend(v4, "setPrintJson:", self->_printJson);
  objc_msgSend(v4, "setForceOneBasedTimeIndexes:", self->_forceOneBasedTimeIndexes);
  objc_msgSend(v4, "setShowThreadStateAsLeafFrame:", self->_showThreadStateAsLeafFrame);
  objc_msgSend(v4, "setPatchTruncatedStacks:", self->_patchTruncatedStacks);
  objc_msgSend(v4, "processSortAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", self->_processSortAttributes);

  objc_msgSend(v4, "callTreeSortAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", self->_callTreeSortAttributes);

  objc_msgSend(v4, "setOmitTasksBelowPercentOfTotalSamples:", self->_omitTasksBelowPercentOfTotalSamples);
  objc_msgSend(v4, "setOmitStacksBelowPercentOfTaskSamples:", self->_omitStacksBelowPercentOfTaskSamples);
  objc_msgSend(v4, "setOmitFramesBelowPercentOfStackSamples:", self->_omitFramesBelowPercentOfStackSamples);
  objc_msgSend(v4, "setOmitTasksBelowSampleCount:", self->_omitTasksBelowSampleCount);
  objc_msgSend(v4, "setOmitStacksBelowSampleCount:", self->_omitStacksBelowSampleCount);
  objc_msgSend(v4, "setOmitFramesBelowSampleCount:", self->_omitFramesBelowSampleCount);
  objc_msgSend(v4, "setDisplayKernelFrames:", self->_displayKernelFrames);
  objc_msgSend(v4, "setDisplayExclaveFrames:", self->_displayExclaveFrames);
  objc_msgSend(v4, "setDisplayUserFrames:", self->_displayUserFrames);
  objc_msgSend(v4, "setDisplayFrameAddresses:", self->_displayFrameAddresses);
  objc_msgSend(v4, "setDisplayDetailedCpuTime:", self->_displayDetailedCpuTime);
  objc_msgSend(v4, "setDisplayDetailedWallTime:", self->_displayDetailedWallTime);
  objc_msgSend(v4, "setDisplayOffsetsFromUnnamedSymbols:", self->_displayOffsetsFromUnnamedSymbols);
  objc_msgSend(v4, "setDisplayFullSourcePaths:", self->_displayFullSourcePaths);
  objc_msgSend(v4, "setDisplaySymbolInformation:", self->_displaySymbolInformation);
  objc_msgSend(v4, "setDisplayBinaryImageAddresses:", self->_displayBinaryImageAddresses);
  objc_msgSend(v4, "setDisplayBinaryImagesLackingNameOrPath:", self->_displayBinaryImagesLackingNameOrPath);
  objc_msgSend(v4, "setDisplayRunningThreads:", self->_displayRunningThreads);
  objc_msgSend(v4, "setDisplayRunnableThreads:", self->_displayRunnableThreads);
  objc_msgSend(v4, "setDisplayBlockedThreads:", self->_displayBlockedThreads);
  objc_msgSend(v4, "setDisplayCPUNumForRunningThreads:", self->_displayCPUNumForRunningThreads);
  objc_msgSend(v4, "setDisplayCPUClusterInfoForRunningThreads:", self->_displayCPUClusterInfoForRunningThreads);
  objc_msgSend(v4, "setDisplayCPUNumForNonRunningThreads:", self->_displayCPUNumForNonRunningThreads);
  objc_msgSend(v4, "setDisplayThreadRunningState:", self->_displayThreadRunningState);
  objc_msgSend(v4, "setDisplayIdleWorkQueueThreads:", self->_displayIdleWorkQueueThreads);
  objc_msgSend(v4, "setDisplayAllBinaries:", self->_displayAllBinaries);
  objc_msgSend(v4, "setDisplayBlockedReasons:", self->_displayBlockedReasons);
  objc_msgSend(v4, "setDisplayBlockedReasonsLackingProcessOwners:", self->_displayBlockedReasonsLackingProcessOwners);
  objc_msgSend(v4, "setDisplayAddressesInBlockedReasons:", self->_displayAddressesInBlockedReasons);
  objc_msgSend(v4, "setDisplayMultipleMatchingBlockedReasons:", self->_displayMultipleMatchingBlockedReasons);
  objc_msgSend(v4, "setDisplayEmptyBootArgs:", self->_displayEmptyBootArgs);
  objc_msgSend(v4, "setDisplayTasksWithZeroCount:", self->_displayTasksWithZeroCount);
  objc_msgSend(v4, "setDisplayCallTreesWithZeroCount:", self->_displayCallTreesWithZeroCount);
  objc_msgSend(v4, "setDisplayDifferentTypesOfSuspension:", self->_displayDifferentTypesOfSuspension);
  objc_msgSend(v4, "setDisplayAllTaskSizeChanges:", self->_displayAllTaskSizeChanges);
  objc_msgSend(v4, "setDisplayCodesigningIDsMatchingBundleIDs:", self->_displayCodesigningIDsMatchingBundleIDs);
  objc_msgSend(v4, "setDisplayDefaultPowerModes:", self->_displayDefaultPowerModes);
  objc_msgSend(v4, "setDisplayIOInCallTrees:", self->_displayIOInCallTrees);
  objc_msgSend(v4, "setDisplayEachIndividualIOInCallTrees:", self->_displayEachIndividualIOInCallTrees);
  objc_msgSend(v4, "setDisplayOnBehalfOfInCallTrees:", self->_displayOnBehalfOfInCallTrees);
  objc_msgSend(v4, "setDisplayQoSTransitionsBetweenUnspecifiedAndUnavailable:", self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable);
  objc_msgSend(v4, "setDisplayTrialInformation:", self->_displayTrialInformation);
  objc_msgSend(v4, "setCallTreeTimestampsTimeDomain:", self->_callTreeTimestampsTimeDomain);
  objc_msgSend(v4, "setHidEventDisplayOptions:", self->_hidEventDisplayOptions);
  objc_msgSend(v4, "setCallTreeAggregation:", self->_callTreeAggregation);
  objc_msgSend(v4, "setSwiftAsyncCallTreeAggregation:", self->_swiftAsyncCallTreeAggregation);
  objc_msgSend(v4, "setTaskAggregation:", self->_taskAggregation);
  objc_msgSend(v4, "setAggregateFramesByOffsetIntoBinary:", self->_aggregateFramesByOffsetIntoBinary);
  objc_msgSend(v4, "setSwiftAsyncDisplayCRootCallstacks:", self->_swiftAsyncDisplayCRootCallstacks);
  objc_msgSend(v4, "setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:", self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways);
  objc_msgSend(v4, "setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:", self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways);
  objc_msgSend(v4, "setMicrostackshotsFormat:", self->_microstackshotsFormat);
  objc_msgSend(v4, "setSystemstatsFormat:", self->_systemstatsFormat);
  objc_msgSend(v4, "setIncludeUserIdleAndBatteryStateInStacks:", self->_includeUserIdleAndBatteryStateInStacks);
  objc_msgSend(v4, "setOmitStacksOnBattery:", self->_omitStacksOnBattery);
  objc_msgSend(v4, "setOmitStacksOnAC:", self->_omitStacksOnAC);
  objc_msgSend(v4, "setOmitStacksWithUserIdle:", self->_omitStacksWithUserIdle);
  objc_msgSend(v4, "setOmitStacksWithUserActive:", self->_omitStacksWithUserActive);
  objc_msgSend(v4, "setOmitStacksWithECore:", self->_omitStacksWithECore);
  objc_msgSend(v4, "setOmitStacksWithPCore:", self->_omitStacksWithPCore);
  objc_msgSend(v4, "setOmitStacksBelowBasePriority:", self->_omitStacksBelowBasePriority);
  objc_msgSend(v4, "setOmitStacksAboveBasePriority:", self->_omitStacksAboveBasePriority);
  objc_msgSend(v4, "setOmitAbsoluteWallTimes:", self->_omitAbsoluteWallTimes);
  objc_msgSend(v4, "setPrintProblematicProcessesAndThreads:", self->_printProblematicProcessesAndThreads);
  v7 = (void *)-[NSSet copy](self->_tidsToPrint, "copy");
  objc_msgSend(v4, "setTidsToPrint:", v7);

  v8 = (void *)-[NSSet copy](self->_pidsToPrint, "copy");
  objc_msgSend(v4, "setPidsToPrint:", v8);

  v9 = (void *)-[NSSet copy](self->_uniquePidsToPrint, "copy");
  objc_msgSend(v4, "setUniquePidsToPrint:", v9);

  v10 = (void *)-[NSSet copy](self->_processUUIDsToPrint, "copy");
  objc_msgSend(v4, "setProcessUUIDsToPrint:", v10);

  return v4;
}

- (void)setOmitTasksBelowPercentOfTotalSamples:(char)a3
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x65)
  {
    v4 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "omitTasksBelowPercentOfTotalSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14076, "omitTasksBelowPercentOfTotalSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitTasksBelowPercentOfTotalSamples = a3;
}

- (void)setOmitStacksBelowPercentOfTaskSamples:(char)a3
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x65)
  {
    v4 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "omitStacksBelowPercentOfTaskSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14085, "omitStacksBelowPercentOfTaskSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitStacksBelowPercentOfTaskSamples = a3;
}

- (char)omitStacksBelowPercentOfTaskSamples
{
  return self->_omitStacksBelowPercentOfTaskSamples;
}

- (void)setOmitFramesBelowPercentOfStackSamples:(char)a3
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (a3 >= 0x65)
  {
    v4 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "omitFramesBelowPercentOfStackSamples %d", buf, 8u);
    }

    *__error() = v4;
    _SASetCrashLogMessage(14094, "omitFramesBelowPercentOfStackSamples %d", v6, v7, v8, v9, v10, v11, v3);
    _os_crash();
    __break(1u);
  }
  self->_omitFramesBelowPercentOfStackSamples = a3;
}

- (char)omitFramesBelowPercentOfStackSamples
{
  return self->_omitFramesBelowPercentOfStackSamples;
}

- (BOOL)microstackshotsFormat
{
  return self->_microstackshotsFormat;
}

- (BOOL)systemstatsFormat
{
  return self->_systemstatsFormat;
}

- (void)setSystemstatsFormat:(BOOL)a3
{
  if (a3)
  {
    -[SASamplePrintOptions setMicrostackshotsFormat:](self, "setMicrostackshotsFormat:", 1);
    self->_displayIOInCallTrees = 0;
    self->_displayOnBehalfOfInCallTrees = 0;
  }
  self->_systemstatsFormat = a3;
}

- (id)debugDescription
{
  id v3;
  _BOOL8 displayMultipleMatchingBlockedReasons;
  _BOOL8 displayEmptyBootArgs;
  _BOOL8 displayTasksWithZeroCount;
  _BOOL8 displayAllTaskSizeChanges;
  _BOOL8 displayCodesigningIDsMatchingBundleIDs;
  _BOOL8 displayDefaultPowerModes;
  _BOOL8 displayIOInCallTrees;
  _BOOL8 displayEachIndividualIOInCallTrees;
  _BOOL8 displayOnBehalfOfInCallTrees;
  _BOOL8 displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
  _BOOL8 displayTrialInformation;
  unint64_t callTreeTimestampsTimeDomain;
  unint64_t callTreeAggregation;
  unint64_t swiftAsyncCallTreeAggregation;
  _BOOL8 swiftAsyncDisplayCRootCallstacks;
  _BOOL8 swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways = self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;
  swiftAsyncCallTreeAggregation = self->_swiftAsyncCallTreeAggregation;
  swiftAsyncDisplayCRootCallstacks = self->_swiftAsyncDisplayCRootCallstacks;
  callTreeTimestampsTimeDomain = self->_callTreeTimestampsTimeDomain;
  callTreeAggregation = self->_callTreeAggregation;
  displayQoSTransitionsBetweenUnspecifiedAndUnavailable = self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
  displayTrialInformation = self->_displayTrialInformation;
  displayEachIndividualIOInCallTrees = self->_displayEachIndividualIOInCallTrees;
  displayOnBehalfOfInCallTrees = self->_displayOnBehalfOfInCallTrees;
  displayDefaultPowerModes = self->_displayDefaultPowerModes;
  displayIOInCallTrees = self->_displayIOInCallTrees;
  displayAllTaskSizeChanges = self->_displayAllTaskSizeChanges;
  displayCodesigningIDsMatchingBundleIDs = self->_displayCodesigningIDsMatchingBundleIDs;
  displayTasksWithZeroCount = self->_displayTasksWithZeroCount;
  displayMultipleMatchingBlockedReasons = self->_displayMultipleMatchingBlockedReasons;
  displayEmptyBootArgs = self->_displayEmptyBootArgs;
  return objc_autoreleaseReturnValue((id)objc_msgSend(v3, "initWithFormat:", CFSTR("displayHeader: %d\ndisplayBody: %d\ndisplayFooter: %d\ntabDelineateBinaryImageSections: %d\nbinaryImagesBeforeStacks: %d\nprintSpinSignatureStack: %d\nprintTargetThreadOnly: %d\nprintHeavyStacks: %d\nprintJson: %d\nforceOneBasedTimeIndexes: %d\nshowThreadStateAsLeafFrame: %d\npatchTruncatedStacks: %d\nomitTasksBelowPercentOfTotalSamples: %d\nomitStacksBelowPercentOfTaskSamples: %d\nomitFramesBelowPercentOfStackSamples: %d\nomitTasksBelowSampleCount: %lld\nomitStacksBelowSampleCount: %lld\nomitFramesBelowSampleCount: %lld\nprocessSortAttributes: %@\ncallTreeSortAttributes: %@\ndisplayKernelFrames: %d\ndisplayExclaveFrames: %d\ndisplayUserFrames: %d\ndisplayFrameAddresses: %d\ndisplayDetailedCpuTime: %d\ndisplayDetailedWallTime: %d\ndisplayOffsetsFromUnnamedSymbols: %d\ndisplayFullSourcePaths: %d\ndisplaySymbolInformation: %d\ndisplayBinaryImageAddresses: %d\ndisplayBinaryImagesLackingNameOrPath: %d\ndisplayRunningThreads: %d\ndisplayRunnableThreads: %d\ndisplayBlockedThreads: %d\ndisplayCPUNumForRunningThreads: %d\ndisplayCPUClusterInfoForRunningThreads: %d\ndisplayCPUNumForNonRunningThreads: %d\ndisplayThreadRunningState: %d\ndisplayIdleWorkQueueThreads: %d\ndisplayAllBinaries: %d\ndisplayBlockedReasons: %d\ndisplayBlockedReasonsLackingProcessOwners: %d\ndisplayAddressesInBlockedReasons: %d\ndisplayMultipleMatchingBlockedReasons: %d\ndisplayEmptyBootArgs: %d\nhidEventDisplayOptions: 0x%llx\ndisplayTasksWithZeroCount: %d\ndisplayAllTaskSizeChanges: %d\ndisplayCodesigningIDsMatchingBundleIDs: %d\ndisplayDefaultPowerModes: %d\ndisplayIOInCallTrees: %d\ndisplayEachIndividualIOInCallTrees: %d\ndisplayOnBehalfOfInCallTrees: %d\ndisplayQoSTransitionsBetweenUnspecifiedAndUnavailable: %d\ndisplayTrialInformation: %d\ncallTreeTimestampsTimeDomain: 0x%llx\ncallTreeAggregation: %llu\nswiftAsyncCallTreeAggregation: %llu\nswiftAsyncDisplayCRootCallstacks: %d\nswiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways: %d\nswiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways: %d\ntaskAggregation: %llu\naggregateFramesByOffsetIntoBinary: %d\nmicrostackshotsFormat: %d\nsystemstatsFormat: %d\nincludeUserIdleAndBatteryStateInStacks: %d\nomitStacksOnBattery: %d\nomitStacksOnAC: %d\nomitStacksWithUserIdle: %d\nomitStacksWithUserActive: %d\nomitStacksWithECore: %d\nomitStacksWithPCore: %d\nomitStacksBelowBasePriority: %d\nomitStacksAboveBasePriority: %d\nomitAbsoluteWallTimes: %d\nprintProblematicProcessesAndThreads: %d\ntidsToPrint: %@\npidsToPrint: %@\nuniquePidsToPrint: %@\nprocessUUIDsToPrint: %@\n"), self->_displayHeader, self->_displayBody, self->_displayFooter, self->_tabDelineateBinaryImageSections, self->_binaryImagesBeforeStacks, self->_printSpinSignatureStack, self->_printTargetThreadOnly, self->_printHeavyStacks, self->_printJson, self->_forceOneBasedTimeIndexes, self->_showThreadStateAsLeafFrame, self->_patchTruncatedStacks, self->_omitTasksBelowPercentOfTotalSamples, self->_omitStacksBelowPercentOfTaskSamples, self->_omitFramesBelowPercentOfStackSamples, self->_omitTasksBelowSampleCount,
                                           self->_omitStacksBelowSampleCount,
                                           self->_omitFramesBelowSampleCount,
                                           self->_processSortAttributes,
                                           self->_callTreeSortAttributes,
                                           self->_displayKernelFrames,
                                           self->_displayExclaveFrames,
                                           self->_displayUserFrames,
                                           self->_displayFrameAddresses,
                                           self->_displayDetailedCpuTime,
                                           self->_displayDetailedWallTime,
                                           self->_displayOffsetsFromUnnamedSymbols,
                                           self->_displayFullSourcePaths,
                                           self->_displaySymbolInformation,
                                           self->_displayBinaryImageAddresses,
                                           self->_displayBinaryImagesLackingNameOrPath,
                                           self->_displayRunningThreads,
                                           self->_displayRunnableThreads,
                                           self->_displayBlockedThreads,
                                           self->_displayCPUNumForRunningThreads,
                                           self->_displayCPUClusterInfoForRunningThreads,
                                           self->_displayCPUNumForNonRunningThreads,
                                           self->_displayThreadRunningState,
                                           self->_displayIdleWorkQueueThreads,
                                           self->_displayAllBinaries,
                                           self->_displayBlockedReasons,
                                           self->_displayBlockedReasonsLackingProcessOwners,
                                           self->_displayAddressesInBlockedReasons,
                                           displayMultipleMatchingBlockedReasons,
                                           displayEmptyBootArgs,
                                           self->_hidEventDisplayOptions,
                                           displayTasksWithZeroCount,
                                           displayAllTaskSizeChanges,
                                           displayCodesigningIDsMatchingBundleIDs,
                                           displayDefaultPowerModes,
                                           displayIOInCallTrees,
                                           displayEachIndividualIOInCallTrees,
                                           displayOnBehalfOfInCallTrees,
                                           displayQoSTransitionsBetweenUnspecifiedAndUnavailable,
                                           displayTrialInformation,
                                           callTreeTimestampsTimeDomain,
                                           callTreeAggregation,
                                           swiftAsyncCallTreeAggregation,
                                           swiftAsyncDisplayCRootCallstacks,
                                           swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways));
}

- (NSSet)pidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPidsToPrint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSSet)uniquePidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUniquePidsToPrint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSSet)processNamesToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcessNamesToPrint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSSet)processUUIDsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProcessUUIDsToPrint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSSet)tidsToPrint
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTidsToPrint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (BOOL)printProblematicProcessesAndThreads
{
  return self->_printProblematicProcessesAndThreads;
}

- (void)setPrintProblematicProcessesAndThreads:(BOOL)a3
{
  self->_printProblematicProcessesAndThreads = a3;
}

- (unint64_t)callTreeTimestampsTimeDomain
{
  return self->_callTreeTimestampsTimeDomain;
}

- (void)setCallTreeTimestampsTimeDomain:(unint64_t)a3
{
  self->_callTreeTimestampsTimeDomain = a3;
}

- (void)setPrintHeavyStacks:(BOOL)a3
{
  self->_printHeavyStacks = a3;
}

- (BOOL)printJson
{
  return self->_printJson;
}

- (void)setPrintJson:(BOOL)a3
{
  self->_printJson = a3;
}

- (BOOL)printSpinSignatureStack
{
  return self->_printSpinSignatureStack;
}

- (void)setPrintSpinSignatureStack:(BOOL)a3
{
  self->_printSpinSignatureStack = a3;
}

- (void)setPrintTargetThreadOnly:(BOOL)a3
{
  self->_printTargetThreadOnly = a3;
}

- (BOOL)forceOneBasedTimeIndexes
{
  return self->_forceOneBasedTimeIndexes;
}

- (void)setForceOneBasedTimeIndexes:(BOOL)a3
{
  self->_forceOneBasedTimeIndexes = a3;
}

- (BOOL)patchTruncatedStacks
{
  return self->_patchTruncatedStacks;
}

- (void)setPatchTruncatedStacks:(BOOL)a3
{
  self->_patchTruncatedStacks = a3;
}

- (void)setTabDelineateBinaryImageSections:(BOOL)a3
{
  self->_tabDelineateBinaryImageSections = a3;
}

- (BOOL)binaryImagesBeforeStacks
{
  return self->_binaryImagesBeforeStacks;
}

- (void)setBinaryImagesBeforeStacks:(BOOL)a3
{
  self->_binaryImagesBeforeStacks = a3;
}

- (BOOL)showThreadStateAsLeafFrame
{
  return self->_showThreadStateAsLeafFrame;
}

- (void)setShowThreadStateAsLeafFrame:(BOOL)a3
{
  self->_showThreadStateAsLeafFrame = a3;
}

- (NSMutableArray)processSortAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSMutableArray)callTreeSortAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (unint64_t)callTreeAggregation
{
  return self->_callTreeAggregation;
}

- (void)setCallTreeAggregation:(unint64_t)a3
{
  self->_callTreeAggregation = a3;
}

- (unint64_t)swiftAsyncCallTreeAggregation
{
  return self->_swiftAsyncCallTreeAggregation;
}

- (void)setSwiftAsyncCallTreeAggregation:(unint64_t)a3
{
  self->_swiftAsyncCallTreeAggregation = a3;
}

- (BOOL)swiftAsyncDisplayCRootCallstacks
{
  return self->_swiftAsyncDisplayCRootCallstacks;
}

- (void)setSwiftAsyncDisplayCRootCallstacks:(BOOL)a3
{
  self->_swiftAsyncDisplayCRootCallstacks = a3;
}

- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways
{
  return self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways;
}

- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways:(BOOL)a3
{
  self->_swiftAsyncPrintLeafyCCallstackOnTopOfSwiftAsyncCallstacksAlways = a3;
}

- (BOOL)swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways
{
  return self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways;
}

- (void)setSwiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways:(BOOL)a3
{
  self->_swiftAsyncPrintLeafyCCallstackOnTopOfCRootCallstacksAlways = a3;
}

- (unint64_t)taskAggregation
{
  return self->_taskAggregation;
}

- (void)setTaskAggregation:(unint64_t)a3
{
  self->_taskAggregation = a3;
}

- (BOOL)aggregateFramesByOffsetIntoBinary
{
  return self->_aggregateFramesByOffsetIntoBinary;
}

- (void)setAggregateFramesByOffsetIntoBinary:(BOOL)a3
{
  self->_aggregateFramesByOffsetIntoBinary = a3;
}

- (void)setIncludeUserIdleAndBatteryStateInStacks:(BOOL)a3
{
  self->_includeUserIdleAndBatteryStateInStacks = a3;
}

- (BOOL)omitStacksOnBattery
{
  return self->_omitStacksOnBattery;
}

- (void)setOmitStacksOnBattery:(BOOL)a3
{
  self->_omitStacksOnBattery = a3;
}

- (BOOL)omitStacksOnAC
{
  return self->_omitStacksOnAC;
}

- (void)setOmitStacksOnAC:(BOOL)a3
{
  self->_omitStacksOnAC = a3;
}

- (BOOL)omitStacksWithUserIdle
{
  return self->_omitStacksWithUserIdle;
}

- (void)setOmitStacksWithUserIdle:(BOOL)a3
{
  self->_omitStacksWithUserIdle = a3;
}

- (BOOL)omitStacksWithUserActive
{
  return self->_omitStacksWithUserActive;
}

- (void)setOmitStacksWithUserActive:(BOOL)a3
{
  self->_omitStacksWithUserActive = a3;
}

- (BOOL)omitStacksWithPCore
{
  return self->_omitStacksWithPCore;
}

- (void)setOmitStacksWithPCore:(BOOL)a3
{
  self->_omitStacksWithPCore = a3;
}

- (BOOL)omitStacksWithECore
{
  return self->_omitStacksWithECore;
}

- (void)setOmitStacksWithECore:(BOOL)a3
{
  self->_omitStacksWithECore = a3;
}

- (int)omitStacksBelowBasePriority
{
  return self->_omitStacksBelowBasePriority;
}

- (void)setOmitStacksBelowBasePriority:(int)a3
{
  self->_omitStacksBelowBasePriority = a3;
}

- (int)omitStacksAboveBasePriority
{
  return self->_omitStacksAboveBasePriority;
}

- (void)setOmitStacksAboveBasePriority:(int)a3
{
  self->_omitStacksAboveBasePriority = a3;
}

- (BOOL)omitAbsoluteWallTimes
{
  return self->_omitAbsoluteWallTimes;
}

- (void)setOmitAbsoluteWallTimes:(BOOL)a3
{
  self->_omitAbsoluteWallTimes = a3;
}

- (BOOL)displayHeader
{
  return self->_displayHeader;
}

- (void)setDisplayHeader:(BOOL)a3
{
  self->_displayHeader = a3;
}

- (BOOL)displayBody
{
  return self->_displayBody;
}

- (void)setDisplayBody:(BOOL)a3
{
  self->_displayBody = a3;
}

- (BOOL)displayFooter
{
  return self->_displayFooter;
}

- (void)setDisplayFooter:(BOOL)a3
{
  self->_displayFooter = a3;
}

- (int64_t)omitTasksBelowSampleCount
{
  return self->_omitTasksBelowSampleCount;
}

- (void)setOmitTasksBelowSampleCount:(int64_t)a3
{
  self->_omitTasksBelowSampleCount = a3;
}

- (int64_t)omitStacksBelowSampleCount
{
  return self->_omitStacksBelowSampleCount;
}

- (void)setOmitStacksBelowSampleCount:(int64_t)a3
{
  self->_omitStacksBelowSampleCount = a3;
}

- (int64_t)omitFramesBelowSampleCount
{
  return self->_omitFramesBelowSampleCount;
}

- (void)setOmitFramesBelowSampleCount:(int64_t)a3
{
  self->_omitFramesBelowSampleCount = a3;
}

- (int64_t)omitFramesAfterLineCount
{
  return self->_omitFramesAfterLineCount;
}

- (void)setOmitFramesAfterLineCount:(int64_t)a3
{
  self->_omitFramesAfterLineCount = a3;
}

- (BOOL)displayKernelFrames
{
  return self->_displayKernelFrames;
}

- (void)setDisplayKernelFrames:(BOOL)a3
{
  self->_displayKernelFrames = a3;
}

- (BOOL)displayExclaveFrames
{
  return self->_displayExclaveFrames;
}

- (void)setDisplayExclaveFrames:(BOOL)a3
{
  self->_displayExclaveFrames = a3;
}

- (BOOL)displayUserFrames
{
  return self->_displayUserFrames;
}

- (void)setDisplayUserFrames:(BOOL)a3
{
  self->_displayUserFrames = a3;
}

- (BOOL)displayFrameAddresses
{
  return self->_displayFrameAddresses;
}

- (void)setDisplayFrameAddresses:(BOOL)a3
{
  self->_displayFrameAddresses = a3;
}

- (BOOL)displayDetailedCpuTime
{
  return self->_displayDetailedCpuTime;
}

- (void)setDisplayDetailedCpuTime:(BOOL)a3
{
  self->_displayDetailedCpuTime = a3;
}

- (BOOL)displayDetailedWallTime
{
  return self->_displayDetailedWallTime;
}

- (void)setDisplayDetailedWallTime:(BOOL)a3
{
  self->_displayDetailedWallTime = a3;
}

- (BOOL)displayOffsetsFromUnnamedSymbols
{
  return self->_displayOffsetsFromUnnamedSymbols;
}

- (void)setDisplayOffsetsFromUnnamedSymbols:(BOOL)a3
{
  self->_displayOffsetsFromUnnamedSymbols = a3;
}

- (void)setDisplaySymbolInformation:(BOOL)a3
{
  self->_displaySymbolInformation = a3;
}

- (BOOL)displayFullSourcePaths
{
  return self->_displayFullSourcePaths;
}

- (void)setDisplayFullSourcePaths:(BOOL)a3
{
  self->_displayFullSourcePaths = a3;
}

- (BOOL)displayBinaryImageAddresses
{
  return self->_displayBinaryImageAddresses;
}

- (void)setDisplayBinaryImageAddresses:(BOOL)a3
{
  self->_displayBinaryImageAddresses = a3;
}

- (BOOL)displayBinaryImagesLackingNameOrPath
{
  return self->_displayBinaryImagesLackingNameOrPath;
}

- (void)setDisplayBinaryImagesLackingNameOrPath:(BOOL)a3
{
  self->_displayBinaryImagesLackingNameOrPath = a3;
}

- (BOOL)displayRunningThreads
{
  return self->_displayRunningThreads;
}

- (void)setDisplayRunningThreads:(BOOL)a3
{
  self->_displayRunningThreads = a3;
}

- (BOOL)displayRunnableThreads
{
  return self->_displayRunnableThreads;
}

- (void)setDisplayRunnableThreads:(BOOL)a3
{
  self->_displayRunnableThreads = a3;
}

- (BOOL)displayBlockedThreads
{
  return self->_displayBlockedThreads;
}

- (void)setDisplayBlockedThreads:(BOOL)a3
{
  self->_displayBlockedThreads = a3;
}

- (BOOL)displayCPUNumForRunningThreads
{
  return self->_displayCPUNumForRunningThreads;
}

- (void)setDisplayCPUNumForRunningThreads:(BOOL)a3
{
  self->_displayCPUNumForRunningThreads = a3;
}

- (BOOL)displayCPUClusterInfoForRunningThreads
{
  return self->_displayCPUClusterInfoForRunningThreads;
}

- (void)setDisplayCPUClusterInfoForRunningThreads:(BOOL)a3
{
  self->_displayCPUClusterInfoForRunningThreads = a3;
}

- (BOOL)displayCPUNumForNonRunningThreads
{
  return self->_displayCPUNumForNonRunningThreads;
}

- (void)setDisplayCPUNumForNonRunningThreads:(BOOL)a3
{
  self->_displayCPUNumForNonRunningThreads = a3;
}

- (BOOL)displayThreadRunningState
{
  return self->_displayThreadRunningState;
}

- (void)setDisplayThreadRunningState:(BOOL)a3
{
  self->_displayThreadRunningState = a3;
}

- (BOOL)displayIdleWorkQueueThreads
{
  return self->_displayIdleWorkQueueThreads;
}

- (void)setDisplayIdleWorkQueueThreads:(BOOL)a3
{
  self->_displayIdleWorkQueueThreads = a3;
}

- (BOOL)displayAllBinaries
{
  return self->_displayAllBinaries;
}

- (void)setDisplayAllBinaries:(BOOL)a3
{
  self->_displayAllBinaries = a3;
}

- (void)setDisplayBlockedReasons:(BOOL)a3
{
  self->_displayBlockedReasons = a3;
}

- (BOOL)displayBlockedReasonsLackingProcessOwners
{
  return self->_displayBlockedReasonsLackingProcessOwners;
}

- (void)setDisplayBlockedReasonsLackingProcessOwners:(BOOL)a3
{
  self->_displayBlockedReasonsLackingProcessOwners = a3;
}

- (BOOL)displayAddressesInBlockedReasons
{
  return self->_displayAddressesInBlockedReasons;
}

- (void)setDisplayAddressesInBlockedReasons:(BOOL)a3
{
  self->_displayAddressesInBlockedReasons = a3;
}

- (BOOL)displayMultipleMatchingBlockedReasons
{
  return self->_displayMultipleMatchingBlockedReasons;
}

- (void)setDisplayMultipleMatchingBlockedReasons:(BOOL)a3
{
  self->_displayMultipleMatchingBlockedReasons = a3;
}

- (BOOL)displayEmptyBootArgs
{
  return self->_displayEmptyBootArgs;
}

- (void)setDisplayEmptyBootArgs:(BOOL)a3
{
  self->_displayEmptyBootArgs = a3;
}

- (unint64_t)hidEventDisplayOptions
{
  return self->_hidEventDisplayOptions;
}

- (void)setHidEventDisplayOptions:(unint64_t)a3
{
  self->_hidEventDisplayOptions = a3;
}

- (BOOL)displayTasksWithZeroCount
{
  return self->_displayTasksWithZeroCount;
}

- (void)setDisplayTasksWithZeroCount:(BOOL)a3
{
  self->_displayTasksWithZeroCount = a3;
}

- (BOOL)displayCallTreesWithZeroCount
{
  return self->_displayCallTreesWithZeroCount;
}

- (void)setDisplayCallTreesWithZeroCount:(BOOL)a3
{
  self->_displayCallTreesWithZeroCount = a3;
}

- (BOOL)displayDifferentTypesOfSuspension
{
  return self->_displayDifferentTypesOfSuspension;
}

- (void)setDisplayDifferentTypesOfSuspension:(BOOL)a3
{
  self->_displayDifferentTypesOfSuspension = a3;
}

- (BOOL)displayAllTaskSizeChanges
{
  return self->_displayAllTaskSizeChanges;
}

- (void)setDisplayAllTaskSizeChanges:(BOOL)a3
{
  self->_displayAllTaskSizeChanges = a3;
}

- (BOOL)displayCodesigningIDsMatchingBundleIDs
{
  return self->_displayCodesigningIDsMatchingBundleIDs;
}

- (void)setDisplayCodesigningIDsMatchingBundleIDs:(BOOL)a3
{
  self->_displayCodesigningIDsMatchingBundleIDs = a3;
}

- (BOOL)displayDefaultPowerModes
{
  return self->_displayDefaultPowerModes;
}

- (void)setDisplayDefaultPowerModes:(BOOL)a3
{
  self->_displayDefaultPowerModes = a3;
}

- (BOOL)displayIOInCallTrees
{
  return self->_displayIOInCallTrees;
}

- (void)setDisplayIOInCallTrees:(BOOL)a3
{
  self->_displayIOInCallTrees = a3;
}

- (BOOL)displayEachIndividualIOInCallTrees
{
  return self->_displayEachIndividualIOInCallTrees;
}

- (void)setDisplayEachIndividualIOInCallTrees:(BOOL)a3
{
  self->_displayEachIndividualIOInCallTrees = a3;
}

- (BOOL)displayOnBehalfOfInCallTrees
{
  return self->_displayOnBehalfOfInCallTrees;
}

- (void)setDisplayOnBehalfOfInCallTrees:(BOOL)a3
{
  self->_displayOnBehalfOfInCallTrees = a3;
}

- (BOOL)displayQoSTransitionsBetweenUnspecifiedAndUnavailable
{
  return self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable;
}

- (void)setDisplayQoSTransitionsBetweenUnspecifiedAndUnavailable:(BOOL)a3
{
  self->_displayQoSTransitionsBetweenUnspecifiedAndUnavailable = a3;
}

- (BOOL)displayTrialInformation
{
  return self->_displayTrialInformation;
}

- (void)setDisplayTrialInformation:(BOOL)a3
{
  self->_displayTrialInformation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callTreeSortAttributes, 0);
  objc_storeStrong((id *)&self->_processSortAttributes, 0);
  objc_storeStrong((id *)&self->_tidsToPrint, 0);
  objc_storeStrong((id *)&self->_processUUIDsToPrint, 0);
  objc_storeStrong((id *)&self->_processNamesToPrint, 0);
  objc_storeStrong((id *)&self->_uniquePidsToPrint, 0);
  objc_storeStrong((id *)&self->_pidsToPrint, 0);
}

@end
