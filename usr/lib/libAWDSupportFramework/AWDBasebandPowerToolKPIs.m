@implementation AWDBasebandPowerToolKPIs

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDBasebandPowerToolKPIs;
  -[AWDBasebandPowerToolKPIs dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRadarPriority:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_radarPriority = a3;
}

- (void)setHasRadarPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRadarPriority
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setArmUtilityThresholdPoint:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_armUtilityThresholdPoint = a3;
}

- (void)setHasArmUtilityThresholdPoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArmUtilityThresholdPoint
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)armUtilityPDFsCount
{
  return self->_armUtilityPDFs.count;
}

- (int)armUtilityPDFs
{
  return self->_armUtilityPDFs.list;
}

- (void)clearArmUtilityPDFs
{
  PBRepeatedInt32Clear();
}

- (void)addArmUtilityPDF:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)armUtilityPDFAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_armUtilityPDFs;
  unint64_t count;

  p_armUtilityPDFs = &self->_armUtilityPDFs;
  count = self->_armUtilityPDFs.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_armUtilityPDFs->list[a3];
}

- (void)setArmUtilityPDFs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeOOSARMUtilitysCount
{
  return self->_causeCodeOOSARMUtilitys.count;
}

- (int)causeCodeOOSARMUtilitys
{
  return self->_causeCodeOOSARMUtilitys.list;
}

- (void)clearCauseCodeOOSARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeOOSARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeOOSARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeOOSARMUtilitys;
  unint64_t count;

  p_causeCodeOOSARMUtilitys = &self->_causeCodeOOSARMUtilitys;
  count = self->_causeCodeOOSARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeOOSARMUtilitys->list[a3];
}

- (void)setCauseCodeOOSARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeOOSDurationsCount
{
  return self->_causeCodeOOSDurations.count;
}

- (int)causeCodeOOSDurations
{
  return self->_causeCodeOOSDurations.list;
}

- (void)clearCauseCodeOOSDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeOOSDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeOOSDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeOOSDurations;
  unint64_t count;

  p_causeCodeOOSDurations = &self->_causeCodeOOSDurations;
  count = self->_causeCodeOOSDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeOOSDurations->list[a3];
}

- (void)setCauseCodeOOSDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeTcXONotShuttingARMUtilitysCount
{
  return self->_causeCodeTcXONotShuttingARMUtilitys.count;
}

- (int)causeCodeTcXONotShuttingARMUtilitys
{
  return self->_causeCodeTcXONotShuttingARMUtilitys.list;
}

- (void)clearCauseCodeTcXONotShuttingARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeTcXONotShuttingARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeTcXONotShuttingARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeTcXONotShuttingARMUtilitys;
  unint64_t count;

  p_causeCodeTcXONotShuttingARMUtilitys = &self->_causeCodeTcXONotShuttingARMUtilitys;
  count = self->_causeCodeTcXONotShuttingARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeTcXONotShuttingARMUtilitys->list[a3];
}

- (void)setCauseCodeTcXONotShuttingARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeTcXONotShuttingDurationsCount
{
  return self->_causeCodeTcXONotShuttingDurations.count;
}

- (int)causeCodeTcXONotShuttingDurations
{
  return self->_causeCodeTcXONotShuttingDurations.list;
}

- (void)clearCauseCodeTcXONotShuttingDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeTcXONotShuttingDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeTcXONotShuttingDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeTcXONotShuttingDurations;
  unint64_t count;

  p_causeCodeTcXONotShuttingDurations = &self->_causeCodeTcXONotShuttingDurations;
  count = self->_causeCodeTcXONotShuttingDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeTcXONotShuttingDurations->list[a3];
}

- (void)setCauseCodeTcXONotShuttingDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeBackgroundActivityARMUtilitysCount
{
  return self->_causeCodeBackgroundActivityARMUtilitys.count;
}

- (int)causeCodeBackgroundActivityARMUtilitys
{
  return self->_causeCodeBackgroundActivityARMUtilitys.list;
}

- (void)clearCauseCodeBackgroundActivityARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeBackgroundActivityARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeBackgroundActivityARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeBackgroundActivityARMUtilitys;
  unint64_t count;

  p_causeCodeBackgroundActivityARMUtilitys = &self->_causeCodeBackgroundActivityARMUtilitys;
  count = self->_causeCodeBackgroundActivityARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeBackgroundActivityARMUtilitys->list[a3];
}

- (void)setCauseCodeBackgroundActivityARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeBackgroundActivityDurationsCount
{
  return self->_causeCodeBackgroundActivityDurations.count;
}

- (int)causeCodeBackgroundActivityDurations
{
  return self->_causeCodeBackgroundActivityDurations.list;
}

- (void)clearCauseCodeBackgroundActivityDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeBackgroundActivityDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeBackgroundActivityDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeBackgroundActivityDurations;
  unint64_t count;

  p_causeCodeBackgroundActivityDurations = &self->_causeCodeBackgroundActivityDurations;
  count = self->_causeCodeBackgroundActivityDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeBackgroundActivityDurations->list[a3];
}

- (void)setCauseCodeBackgroundActivityDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeRACHFailARMUtilitysCount
{
  return self->_causeCodeRACHFailARMUtilitys.count;
}

- (int)causeCodeRACHFailARMUtilitys
{
  return self->_causeCodeRACHFailARMUtilitys.list;
}

- (void)clearCauseCodeRACHFailARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeRACHFailARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeRACHFailARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeRACHFailARMUtilitys;
  unint64_t count;

  p_causeCodeRACHFailARMUtilitys = &self->_causeCodeRACHFailARMUtilitys;
  count = self->_causeCodeRACHFailARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeRACHFailARMUtilitys->list[a3];
}

- (void)setCauseCodeRACHFailARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeRACHFailDurationsCount
{
  return self->_causeCodeRACHFailDurations.count;
}

- (int)causeCodeRACHFailDurations
{
  return self->_causeCodeRACHFailDurations.list;
}

- (void)clearCauseCodeRACHFailDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeRACHFailDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeRACHFailDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeRACHFailDurations;
  unint64_t count;

  p_causeCodeRACHFailDurations = &self->_causeCodeRACHFailDurations;
  count = self->_causeCodeRACHFailDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeRACHFailDurations->list[a3];
}

- (void)setCauseCodeRACHFailDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeStruckInDCHARMUtilitysCount
{
  return self->_causeCodeStruckInDCHARMUtilitys.count;
}

- (int)causeCodeStruckInDCHARMUtilitys
{
  return self->_causeCodeStruckInDCHARMUtilitys.list;
}

- (void)clearCauseCodeStruckInDCHARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeStruckInDCHARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeStruckInDCHARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeStruckInDCHARMUtilitys;
  unint64_t count;

  p_causeCodeStruckInDCHARMUtilitys = &self->_causeCodeStruckInDCHARMUtilitys;
  count = self->_causeCodeStruckInDCHARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeStruckInDCHARMUtilitys->list[a3];
}

- (void)setCauseCodeStruckInDCHARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeStruckInDCHDurationsCount
{
  return self->_causeCodeStruckInDCHDurations.count;
}

- (int)causeCodeStruckInDCHDurations
{
  return self->_causeCodeStruckInDCHDurations.list;
}

- (void)clearCauseCodeStruckInDCHDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeStruckInDCHDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeStruckInDCHDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeStruckInDCHDurations;
  unint64_t count;

  p_causeCodeStruckInDCHDurations = &self->_causeCodeStruckInDCHDurations;
  count = self->_causeCodeStruckInDCHDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeStruckInDCHDurations->list[a3];
}

- (void)setCauseCodeStruckInDCHDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeMarginalCoverageARMUtilitysCount
{
  return self->_causeCodeMarginalCoverageARMUtilitys.count;
}

- (int)causeCodeMarginalCoverageARMUtilitys
{
  return self->_causeCodeMarginalCoverageARMUtilitys.list;
}

- (void)clearCauseCodeMarginalCoverageARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeMarginalCoverageARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeMarginalCoverageARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeMarginalCoverageARMUtilitys;
  unint64_t count;

  p_causeCodeMarginalCoverageARMUtilitys = &self->_causeCodeMarginalCoverageARMUtilitys;
  count = self->_causeCodeMarginalCoverageARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeMarginalCoverageARMUtilitys->list[a3];
}

- (void)setCauseCodeMarginalCoverageARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeMarginalCoverageDurationsCount
{
  return self->_causeCodeMarginalCoverageDurations.count;
}

- (int)causeCodeMarginalCoverageDurations
{
  return self->_causeCodeMarginalCoverageDurations.list;
}

- (void)clearCauseCodeMarginalCoverageDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeMarginalCoverageDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeMarginalCoverageDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeMarginalCoverageDurations;
  unint64_t count;

  p_causeCodeMarginalCoverageDurations = &self->_causeCodeMarginalCoverageDurations;
  count = self->_causeCodeMarginalCoverageDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeMarginalCoverageDurations->list[a3];
}

- (void)setCauseCodeMarginalCoverageDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeUnknownARMUtilitysCount
{
  return self->_causeCodeUnknownARMUtilitys.count;
}

- (int)causeCodeUnknownARMUtilitys
{
  return self->_causeCodeUnknownARMUtilitys.list;
}

- (void)clearCauseCodeUnknownARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeUnknownARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeUnknownARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeUnknownARMUtilitys;
  unint64_t count;

  p_causeCodeUnknownARMUtilitys = &self->_causeCodeUnknownARMUtilitys;
  count = self->_causeCodeUnknownARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeUnknownARMUtilitys->list[a3];
}

- (void)setCauseCodeUnknownARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeUnknownDurationsCount
{
  return self->_causeCodeUnknownDurations.count;
}

- (int)causeCodeUnknownDurations
{
  return self->_causeCodeUnknownDurations.list;
}

- (void)clearCauseCodeUnknownDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeUnknownDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeUnknownDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeUnknownDurations;
  unint64_t count;

  p_causeCodeUnknownDurations = &self->_causeCodeUnknownDurations;
  count = self->_causeCodeUnknownDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeUnknownDurations->list[a3];
}

- (void)setCauseCodeUnknownDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeCumulativeARMUtilitysCount
{
  return self->_causeCodeCumulativeARMUtilitys.count;
}

- (int)causeCodeCumulativeARMUtilitys
{
  return self->_causeCodeCumulativeARMUtilitys.list;
}

- (void)clearCauseCodeCumulativeARMUtilitys
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeCumulativeARMUtility:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeCumulativeARMUtilityAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeCumulativeARMUtilitys;
  unint64_t count;

  p_causeCodeCumulativeARMUtilitys = &self->_causeCodeCumulativeARMUtilitys;
  count = self->_causeCodeCumulativeARMUtilitys.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeCumulativeARMUtilitys->list[a3];
}

- (void)setCauseCodeCumulativeARMUtilitys:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)causeCodeCumulativeDurationsCount
{
  return self->_causeCodeCumulativeDurations.count;
}

- (int)causeCodeCumulativeDurations
{
  return self->_causeCodeCumulativeDurations.list;
}

- (void)clearCauseCodeCumulativeDurations
{
  PBRepeatedInt32Clear();
}

- (void)addCauseCodeCumulativeDurations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)causeCodeCumulativeDurationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeCumulativeDurations;
  unint64_t count;

  p_causeCodeCumulativeDurations = &self->_causeCodeCumulativeDurations;
  count = self->_causeCodeCumulativeDurations.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_causeCodeCumulativeDurations->list[a3];
}

- (void)setCauseCodeCumulativeDurations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDBasebandPowerToolKPIs;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDBasebandPowerToolKPIs description](&v3, sel_description), -[AWDBasebandPowerToolKPIs dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_radarPriority), CFSTR("radarPriority"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_armUtilityThresholdPoint), CFSTR("armUtilityThresholdPoint"));
LABEL_5:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("armUtilityPDF"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_OOS_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_OOS_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_TcXONotShutting_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_TcXONotShutting_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_BackgroundActivity_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_BackgroundActivity_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_RACHFail_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_RACHFail_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_StruckInDCH_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_StruckInDCH_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_MarginalCoverage_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_MarginalCoverage_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_Unknown_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_Unknown_Durations"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_Cumulative_ARMUtility"));
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("causeCode_Cumulative_Durations"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBasebandPowerToolKPIsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_causeCodeCumulativeDurations;
  unint64_t v22;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_armUtilityPDFs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_armUtilityPDFs.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_armUtilityPDFs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeOOSARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeOOSARMUtilitys.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_causeCodeOOSARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeOOSDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeOOSDurations.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_causeCodeOOSDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeTcXONotShuttingARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeTcXONotShuttingARMUtilitys.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v8;
      }
      while (v8 < self->_causeCodeTcXONotShuttingARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeTcXONotShuttingDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeTcXONotShuttingDurations.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v9 < self->_causeCodeTcXONotShuttingDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeBackgroundActivityARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeBackgroundActivityARMUtilitys.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_causeCodeBackgroundActivityARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeBackgroundActivityDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeBackgroundActivityDurations.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_causeCodeBackgroundActivityDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeRACHFailARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeRACHFailARMUtilitys.count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_causeCodeRACHFailARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeRACHFailDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeRACHFailDurations.count)
    {
      v13 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v13;
      }
      while (v13 < self->_causeCodeRACHFailDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeStruckInDCHARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeStruckInDCHARMUtilitys.count)
    {
      v14 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v14 < self->_causeCodeStruckInDCHARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeStruckInDCHDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeStruckInDCHDurations.count)
    {
      v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_causeCodeStruckInDCHDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeMarginalCoverageARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeMarginalCoverageARMUtilitys.count)
    {
      v16 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v16;
      }
      while (v16 < self->_causeCodeMarginalCoverageARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeMarginalCoverageDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeMarginalCoverageDurations.count)
    {
      v17 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v17;
      }
      while (v17 < self->_causeCodeMarginalCoverageDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeUnknownARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeUnknownARMUtilitys.count)
    {
      v18 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v18;
      }
      while (v18 < self->_causeCodeUnknownARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeUnknownDurations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeUnknownDurations.count)
    {
      v19 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v19 < self->_causeCodeUnknownDurations.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_causeCodeCumulativeARMUtilitys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCodeCumulativeARMUtilitys.count)
    {
      v20 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v20 < self->_causeCodeCumulativeARMUtilitys.count);
    }
    PBDataWriterRecallMark();
  }
  p_causeCodeCumulativeDurations = &self->_causeCodeCumulativeDurations;
  if (p_causeCodeCumulativeDurations->count)
  {
    PBDataWriterPlaceMark();
    if (p_causeCodeCumulativeDurations->count)
    {
      v22 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v22;
      }
      while (v22 < p_causeCodeCumulativeDurations->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  unint64_t v21;
  unint64_t v22;
  uint64_t ii;
  unint64_t v24;
  unint64_t v25;
  uint64_t jj;
  unint64_t v27;
  unint64_t v28;
  uint64_t kk;
  unint64_t v30;
  unint64_t v31;
  uint64_t mm;
  unint64_t v33;
  unint64_t v34;
  uint64_t nn;
  unint64_t v36;
  unint64_t v37;
  uint64_t i1;
  unint64_t v39;
  unint64_t v40;
  uint64_t i2;
  unint64_t v42;
  unint64_t v43;
  uint64_t i3;
  unint64_t v45;
  unint64_t v46;
  uint64_t i4;
  unint64_t v48;
  unint64_t v49;
  uint64_t i5;
  unint64_t v51;
  unint64_t v52;
  uint64_t i6;
  unint64_t v54;
  unint64_t v55;
  uint64_t i7;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_75:
    *((_DWORD *)a3 + 107) = self->_radarPriority;
    *((_BYTE *)a3 + 432) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)a3 + 52) = self->_timestamp;
  *((_BYTE *)a3 + 432) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_75;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 106) = self->_armUtilityThresholdPoint;
    *((_BYTE *)a3 + 432) |= 2u;
  }
LABEL_5:
  if (-[AWDBasebandPowerToolKPIs armUtilityPDFsCount](self, "armUtilityPDFsCount"))
  {
    objc_msgSend(a3, "clearArmUtilityPDFs");
    v6 = -[AWDBasebandPowerToolKPIs armUtilityPDFsCount](self, "armUtilityPDFsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addArmUtilityPDF:", -[AWDBasebandPowerToolKPIs armUtilityPDFAtIndex:](self, "armUtilityPDFAtIndex:", i));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeOOSARMUtilitysCount](self, "causeCodeOOSARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeOOSARMUtilitys");
    v9 = -[AWDBasebandPowerToolKPIs causeCodeOOSARMUtilitysCount](self, "causeCodeOOSARMUtilitysCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addCauseCodeOOSARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeOOSARMUtilityAtIndex:](self, "causeCodeOOSARMUtilityAtIndex:", j));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeOOSDurationsCount](self, "causeCodeOOSDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeOOSDurations");
    v12 = -[AWDBasebandPowerToolKPIs causeCodeOOSDurationsCount](self, "causeCodeOOSDurationsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addCauseCodeOOSDurations:", -[AWDBasebandPowerToolKPIs causeCodeOOSDurationsAtIndex:](self, "causeCodeOOSDurationsAtIndex:", k));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingARMUtilitysCount](self, "causeCodeTcXONotShuttingARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeTcXONotShuttingARMUtilitys");
    v15 = -[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingARMUtilitysCount](self, "causeCodeTcXONotShuttingARMUtilitysCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addCauseCodeTcXONotShuttingARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingARMUtilityAtIndex:](self, "causeCodeTcXONotShuttingARMUtilityAtIndex:", m));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingDurationsCount](self, "causeCodeTcXONotShuttingDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeTcXONotShuttingDurations");
    v18 = -[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingDurationsCount](self, "causeCodeTcXONotShuttingDurationsCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(a3, "addCauseCodeTcXONotShuttingDurations:", -[AWDBasebandPowerToolKPIs causeCodeTcXONotShuttingDurationsAtIndex:](self, "causeCodeTcXONotShuttingDurationsAtIndex:", n));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityARMUtilitysCount](self, "causeCodeBackgroundActivityARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeBackgroundActivityARMUtilitys");
    v21 = -[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityARMUtilitysCount](self, "causeCodeBackgroundActivityARMUtilitysCount");
    if (v21)
    {
      v22 = v21;
      for (ii = 0; ii != v22; ++ii)
        objc_msgSend(a3, "addCauseCodeBackgroundActivityARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityARMUtilityAtIndex:](self, "causeCodeBackgroundActivityARMUtilityAtIndex:", ii));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityDurationsCount](self, "causeCodeBackgroundActivityDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeBackgroundActivityDurations");
    v24 = -[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityDurationsCount](self, "causeCodeBackgroundActivityDurationsCount");
    if (v24)
    {
      v25 = v24;
      for (jj = 0; jj != v25; ++jj)
        objc_msgSend(a3, "addCauseCodeBackgroundActivityDurations:", -[AWDBasebandPowerToolKPIs causeCodeBackgroundActivityDurationsAtIndex:](self, "causeCodeBackgroundActivityDurationsAtIndex:", jj));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeRACHFailARMUtilitysCount](self, "causeCodeRACHFailARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeRACHFailARMUtilitys");
    v27 = -[AWDBasebandPowerToolKPIs causeCodeRACHFailARMUtilitysCount](self, "causeCodeRACHFailARMUtilitysCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
        objc_msgSend(a3, "addCauseCodeRACHFailARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeRACHFailARMUtilityAtIndex:](self, "causeCodeRACHFailARMUtilityAtIndex:", kk));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeRACHFailDurationsCount](self, "causeCodeRACHFailDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeRACHFailDurations");
    v30 = -[AWDBasebandPowerToolKPIs causeCodeRACHFailDurationsCount](self, "causeCodeRACHFailDurationsCount");
    if (v30)
    {
      v31 = v30;
      for (mm = 0; mm != v31; ++mm)
        objc_msgSend(a3, "addCauseCodeRACHFailDurations:", -[AWDBasebandPowerToolKPIs causeCodeRACHFailDurationsAtIndex:](self, "causeCodeRACHFailDurationsAtIndex:", mm));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeStruckInDCHARMUtilitysCount](self, "causeCodeStruckInDCHARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeStruckInDCHARMUtilitys");
    v33 = -[AWDBasebandPowerToolKPIs causeCodeStruckInDCHARMUtilitysCount](self, "causeCodeStruckInDCHARMUtilitysCount");
    if (v33)
    {
      v34 = v33;
      for (nn = 0; nn != v34; ++nn)
        objc_msgSend(a3, "addCauseCodeStruckInDCHARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeStruckInDCHARMUtilityAtIndex:](self, "causeCodeStruckInDCHARMUtilityAtIndex:", nn));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeStruckInDCHDurationsCount](self, "causeCodeStruckInDCHDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeStruckInDCHDurations");
    v36 = -[AWDBasebandPowerToolKPIs causeCodeStruckInDCHDurationsCount](self, "causeCodeStruckInDCHDurationsCount");
    if (v36)
    {
      v37 = v36;
      for (i1 = 0; i1 != v37; ++i1)
        objc_msgSend(a3, "addCauseCodeStruckInDCHDurations:", -[AWDBasebandPowerToolKPIs causeCodeStruckInDCHDurationsAtIndex:](self, "causeCodeStruckInDCHDurationsAtIndex:", i1));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageARMUtilitysCount](self, "causeCodeMarginalCoverageARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeMarginalCoverageARMUtilitys");
    v39 = -[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageARMUtilitysCount](self, "causeCodeMarginalCoverageARMUtilitysCount");
    if (v39)
    {
      v40 = v39;
      for (i2 = 0; i2 != v40; ++i2)
        objc_msgSend(a3, "addCauseCodeMarginalCoverageARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageARMUtilityAtIndex:](self, "causeCodeMarginalCoverageARMUtilityAtIndex:", i2));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageDurationsCount](self, "causeCodeMarginalCoverageDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeMarginalCoverageDurations");
    v42 = -[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageDurationsCount](self, "causeCodeMarginalCoverageDurationsCount");
    if (v42)
    {
      v43 = v42;
      for (i3 = 0; i3 != v43; ++i3)
        objc_msgSend(a3, "addCauseCodeMarginalCoverageDurations:", -[AWDBasebandPowerToolKPIs causeCodeMarginalCoverageDurationsAtIndex:](self, "causeCodeMarginalCoverageDurationsAtIndex:", i3));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeUnknownARMUtilitysCount](self, "causeCodeUnknownARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeUnknownARMUtilitys");
    v45 = -[AWDBasebandPowerToolKPIs causeCodeUnknownARMUtilitysCount](self, "causeCodeUnknownARMUtilitysCount");
    if (v45)
    {
      v46 = v45;
      for (i4 = 0; i4 != v46; ++i4)
        objc_msgSend(a3, "addCauseCodeUnknownARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeUnknownARMUtilityAtIndex:](self, "causeCodeUnknownARMUtilityAtIndex:", i4));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeUnknownDurationsCount](self, "causeCodeUnknownDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeUnknownDurations");
    v48 = -[AWDBasebandPowerToolKPIs causeCodeUnknownDurationsCount](self, "causeCodeUnknownDurationsCount");
    if (v48)
    {
      v49 = v48;
      for (i5 = 0; i5 != v49; ++i5)
        objc_msgSend(a3, "addCauseCodeUnknownDurations:", -[AWDBasebandPowerToolKPIs causeCodeUnknownDurationsAtIndex:](self, "causeCodeUnknownDurationsAtIndex:", i5));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeCumulativeARMUtilitysCount](self, "causeCodeCumulativeARMUtilitysCount"))
  {
    objc_msgSend(a3, "clearCauseCodeCumulativeARMUtilitys");
    v51 = -[AWDBasebandPowerToolKPIs causeCodeCumulativeARMUtilitysCount](self, "causeCodeCumulativeARMUtilitysCount");
    if (v51)
    {
      v52 = v51;
      for (i6 = 0; i6 != v52; ++i6)
        objc_msgSend(a3, "addCauseCodeCumulativeARMUtility:", -[AWDBasebandPowerToolKPIs causeCodeCumulativeARMUtilityAtIndex:](self, "causeCodeCumulativeARMUtilityAtIndex:", i6));
    }
  }
  if (-[AWDBasebandPowerToolKPIs causeCodeCumulativeDurationsCount](self, "causeCodeCumulativeDurationsCount"))
  {
    objc_msgSend(a3, "clearCauseCodeCumulativeDurations");
    v54 = -[AWDBasebandPowerToolKPIs causeCodeCumulativeDurationsCount](self, "causeCodeCumulativeDurationsCount");
    if (v54)
    {
      v55 = v54;
      for (i7 = 0; i7 != v55; ++i7)
        objc_msgSend(a3, "addCauseCodeCumulativeDurations:", -[AWDBasebandPowerToolKPIs causeCodeCumulativeDurationsAtIndex:](self, "causeCodeCumulativeDurationsAtIndex:", i7));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v4 + 428) = self->_radarPriority;
    *(_BYTE *)(v4 + 432) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v4 + 416) = self->_timestamp;
  *(_BYTE *)(v4 + 432) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 424) = self->_armUtilityThresholdPoint;
    *(_BYTE *)(v4 + 432) |= 2u;
  }
LABEL_5:
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 52))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 432) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 4) == 0 || self->_radarPriority != *((_DWORD *)a3 + 107))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 432) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 432) & 2) == 0 || self->_armUtilityThresholdPoint != *((_DWORD *)a3 + 106))
      return 0;
  }
  else if ((*((_BYTE *)a3 + 432) & 2) != 0)
  {
    return 0;
  }
  if (PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    return PBRepeatedInt32IsEqual();
  }
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v2 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_radarPriority;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_armUtilityThresholdPoint;
LABEL_8:
  v5 = v3 ^ v2 ^ v4 ^ PBRepeatedInt32Hash();
  v6 = PBRepeatedInt32Hash();
  v7 = v5 ^ v6 ^ PBRepeatedInt32Hash();
  v8 = PBRepeatedInt32Hash();
  v9 = v8 ^ PBRepeatedInt32Hash();
  v10 = v7 ^ v9 ^ PBRepeatedInt32Hash();
  v11 = PBRepeatedInt32Hash();
  v12 = v11 ^ PBRepeatedInt32Hash();
  v13 = v12 ^ PBRepeatedInt32Hash();
  v14 = v10 ^ v13 ^ PBRepeatedInt32Hash();
  v15 = PBRepeatedInt32Hash();
  v16 = v15 ^ PBRepeatedInt32Hash();
  v17 = v16 ^ PBRepeatedInt32Hash();
  v18 = v17 ^ PBRepeatedInt32Hash();
  v19 = v14 ^ v18 ^ PBRepeatedInt32Hash();
  v20 = PBRepeatedInt32Hash();
  return v19 ^ v20 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;
  uint64_t v18;
  uint64_t v19;
  uint64_t n;
  uint64_t v21;
  uint64_t v22;
  uint64_t ii;
  uint64_t v24;
  uint64_t v25;
  uint64_t jj;
  uint64_t v27;
  uint64_t v28;
  uint64_t kk;
  uint64_t v30;
  uint64_t v31;
  uint64_t mm;
  uint64_t v33;
  uint64_t v34;
  uint64_t nn;
  uint64_t v36;
  uint64_t v37;
  uint64_t i1;
  uint64_t v39;
  uint64_t v40;
  uint64_t i2;
  uint64_t v42;
  uint64_t v43;
  uint64_t i3;
  uint64_t v45;
  uint64_t v46;
  uint64_t i4;
  uint64_t v48;
  uint64_t v49;
  uint64_t i5;
  uint64_t v51;
  uint64_t v52;
  uint64_t i6;
  uint64_t v54;
  uint64_t v55;
  uint64_t i7;

  v5 = *((_BYTE *)a3 + 432);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 52);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 432);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 432) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_radarPriority = *((_DWORD *)a3 + 107);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 432) & 2) != 0)
  {
LABEL_4:
    self->_armUtilityThresholdPoint = *((_DWORD *)a3 + 106);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v6 = objc_msgSend(a3, "armUtilityPDFsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDBasebandPowerToolKPIs addArmUtilityPDF:](self, "addArmUtilityPDF:", objc_msgSend(a3, "armUtilityPDFAtIndex:", i));
  }
  v9 = objc_msgSend(a3, "causeCodeOOSARMUtilitysCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[AWDBasebandPowerToolKPIs addCauseCodeOOSARMUtility:](self, "addCauseCodeOOSARMUtility:", objc_msgSend(a3, "causeCodeOOSARMUtilityAtIndex:", j));
  }
  v12 = objc_msgSend(a3, "causeCodeOOSDurationsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[AWDBasebandPowerToolKPIs addCauseCodeOOSDurations:](self, "addCauseCodeOOSDurations:", objc_msgSend(a3, "causeCodeOOSDurationsAtIndex:", k));
  }
  v15 = objc_msgSend(a3, "causeCodeTcXONotShuttingARMUtilitysCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[AWDBasebandPowerToolKPIs addCauseCodeTcXONotShuttingARMUtility:](self, "addCauseCodeTcXONotShuttingARMUtility:", objc_msgSend(a3, "causeCodeTcXONotShuttingARMUtilityAtIndex:", m));
  }
  v18 = objc_msgSend(a3, "causeCodeTcXONotShuttingDurationsCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[AWDBasebandPowerToolKPIs addCauseCodeTcXONotShuttingDurations:](self, "addCauseCodeTcXONotShuttingDurations:", objc_msgSend(a3, "causeCodeTcXONotShuttingDurationsAtIndex:", n));
  }
  v21 = objc_msgSend(a3, "causeCodeBackgroundActivityARMUtilitysCount");
  if (v21)
  {
    v22 = v21;
    for (ii = 0; ii != v22; ++ii)
      -[AWDBasebandPowerToolKPIs addCauseCodeBackgroundActivityARMUtility:](self, "addCauseCodeBackgroundActivityARMUtility:", objc_msgSend(a3, "causeCodeBackgroundActivityARMUtilityAtIndex:", ii));
  }
  v24 = objc_msgSend(a3, "causeCodeBackgroundActivityDurationsCount");
  if (v24)
  {
    v25 = v24;
    for (jj = 0; jj != v25; ++jj)
      -[AWDBasebandPowerToolKPIs addCauseCodeBackgroundActivityDurations:](self, "addCauseCodeBackgroundActivityDurations:", objc_msgSend(a3, "causeCodeBackgroundActivityDurationsAtIndex:", jj));
  }
  v27 = objc_msgSend(a3, "causeCodeRACHFailARMUtilitysCount");
  if (v27)
  {
    v28 = v27;
    for (kk = 0; kk != v28; ++kk)
      -[AWDBasebandPowerToolKPIs addCauseCodeRACHFailARMUtility:](self, "addCauseCodeRACHFailARMUtility:", objc_msgSend(a3, "causeCodeRACHFailARMUtilityAtIndex:", kk));
  }
  v30 = objc_msgSend(a3, "causeCodeRACHFailDurationsCount");
  if (v30)
  {
    v31 = v30;
    for (mm = 0; mm != v31; ++mm)
      -[AWDBasebandPowerToolKPIs addCauseCodeRACHFailDurations:](self, "addCauseCodeRACHFailDurations:", objc_msgSend(a3, "causeCodeRACHFailDurationsAtIndex:", mm));
  }
  v33 = objc_msgSend(a3, "causeCodeStruckInDCHARMUtilitysCount");
  if (v33)
  {
    v34 = v33;
    for (nn = 0; nn != v34; ++nn)
      -[AWDBasebandPowerToolKPIs addCauseCodeStruckInDCHARMUtility:](self, "addCauseCodeStruckInDCHARMUtility:", objc_msgSend(a3, "causeCodeStruckInDCHARMUtilityAtIndex:", nn));
  }
  v36 = objc_msgSend(a3, "causeCodeStruckInDCHDurationsCount");
  if (v36)
  {
    v37 = v36;
    for (i1 = 0; i1 != v37; ++i1)
      -[AWDBasebandPowerToolKPIs addCauseCodeStruckInDCHDurations:](self, "addCauseCodeStruckInDCHDurations:", objc_msgSend(a3, "causeCodeStruckInDCHDurationsAtIndex:", i1));
  }
  v39 = objc_msgSend(a3, "causeCodeMarginalCoverageARMUtilitysCount");
  if (v39)
  {
    v40 = v39;
    for (i2 = 0; i2 != v40; ++i2)
      -[AWDBasebandPowerToolKPIs addCauseCodeMarginalCoverageARMUtility:](self, "addCauseCodeMarginalCoverageARMUtility:", objc_msgSend(a3, "causeCodeMarginalCoverageARMUtilityAtIndex:", i2));
  }
  v42 = objc_msgSend(a3, "causeCodeMarginalCoverageDurationsCount");
  if (v42)
  {
    v43 = v42;
    for (i3 = 0; i3 != v43; ++i3)
      -[AWDBasebandPowerToolKPIs addCauseCodeMarginalCoverageDurations:](self, "addCauseCodeMarginalCoverageDurations:", objc_msgSend(a3, "causeCodeMarginalCoverageDurationsAtIndex:", i3));
  }
  v45 = objc_msgSend(a3, "causeCodeUnknownARMUtilitysCount");
  if (v45)
  {
    v46 = v45;
    for (i4 = 0; i4 != v46; ++i4)
      -[AWDBasebandPowerToolKPIs addCauseCodeUnknownARMUtility:](self, "addCauseCodeUnknownARMUtility:", objc_msgSend(a3, "causeCodeUnknownARMUtilityAtIndex:", i4));
  }
  v48 = objc_msgSend(a3, "causeCodeUnknownDurationsCount");
  if (v48)
  {
    v49 = v48;
    for (i5 = 0; i5 != v49; ++i5)
      -[AWDBasebandPowerToolKPIs addCauseCodeUnknownDurations:](self, "addCauseCodeUnknownDurations:", objc_msgSend(a3, "causeCodeUnknownDurationsAtIndex:", i5));
  }
  v51 = objc_msgSend(a3, "causeCodeCumulativeARMUtilitysCount");
  if (v51)
  {
    v52 = v51;
    for (i6 = 0; i6 != v52; ++i6)
      -[AWDBasebandPowerToolKPIs addCauseCodeCumulativeARMUtility:](self, "addCauseCodeCumulativeARMUtility:", objc_msgSend(a3, "causeCodeCumulativeARMUtilityAtIndex:", i6));
  }
  v54 = objc_msgSend(a3, "causeCodeCumulativeDurationsCount");
  if (v54)
  {
    v55 = v54;
    for (i7 = 0; i7 != v55; ++i7)
      -[AWDBasebandPowerToolKPIs addCauseCodeCumulativeDurations:](self, "addCauseCodeCumulativeDurations:", objc_msgSend(a3, "causeCodeCumulativeDurationsAtIndex:", i7));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)radarPriority
{
  return self->_radarPriority;
}

- (int)armUtilityThresholdPoint
{
  return self->_armUtilityThresholdPoint;
}

@end
