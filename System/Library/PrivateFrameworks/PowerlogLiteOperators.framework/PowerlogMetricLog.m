@implementation PowerlogMetricLog

- (void)clearKCellularPerClientProfileTriggerCounts
{
  -[NSMutableArray removeAllObjects](self->_kCellularPerClientProfileTriggerCounts, "removeAllObjects");
}

- (void)addKCellularPerClientProfileTriggerCount:(id)a3
{
  id v4;
  NSMutableArray *kCellularPerClientProfileTriggerCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  v8 = v4;
  if (!kCellularPerClientProfileTriggerCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularPerClientProfileTriggerCounts;
    self->_kCellularPerClientProfileTriggerCounts = v6;

    v4 = v8;
    kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  }
  -[NSMutableArray addObject:](kCellularPerClientProfileTriggerCounts, "addObject:", v4);

}

- (unint64_t)kCellularPerClientProfileTriggerCountsCount
{
  return -[NSMutableArray count](self->_kCellularPerClientProfileTriggerCounts, "count");
}

- (id)kCellularPerClientProfileTriggerCountAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularPerClientProfileTriggerCounts, "objectAtIndex:", a3);
}

+ (Class)kCellularPerClientProfileTriggerCountType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackCpuStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularProtocolStackCpuStats, "removeAllObjects");
}

- (void)addKCellularProtocolStackCpuStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularProtocolStackCpuStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  v8 = v4;
  if (!kCellularProtocolStackCpuStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularProtocolStackCpuStats;
    self->_kCellularProtocolStackCpuStats = v6;

    v4 = v8;
    kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  }
  -[NSMutableArray addObject:](kCellularProtocolStackCpuStats, "addObject:", v4);

}

- (unint64_t)kCellularProtocolStackCpuStatsCount
{
  return -[NSMutableArray count](self->_kCellularProtocolStackCpuStats, "count");
}

- (id)kCellularProtocolStackCpuStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularProtocolStackCpuStats, "objectAtIndex:", a3);
}

+ (Class)kCellularProtocolStackCpuStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPeripheralStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularPeripheralStats, "removeAllObjects");
}

- (void)addKCellularPeripheralStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularPeripheralStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularPeripheralStats = self->_kCellularPeripheralStats;
  v8 = v4;
  if (!kCellularPeripheralStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularPeripheralStats;
    self->_kCellularPeripheralStats = v6;

    v4 = v8;
    kCellularPeripheralStats = self->_kCellularPeripheralStats;
  }
  -[NSMutableArray addObject:](kCellularPeripheralStats, "addObject:", v4);

}

- (unint64_t)kCellularPeripheralStatsCount
{
  return -[NSMutableArray count](self->_kCellularPeripheralStats, "count");
}

- (id)kCellularPeripheralStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularPeripheralStats, "objectAtIndex:", a3);
}

+ (Class)kCellularPeripheralStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDvfsStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularDvfsStats, "removeAllObjects");
}

- (void)addKCellularDvfsStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularDvfsStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularDvfsStats = self->_kCellularDvfsStats;
  v8 = v4;
  if (!kCellularDvfsStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularDvfsStats;
    self->_kCellularDvfsStats = v6;

    v4 = v8;
    kCellularDvfsStats = self->_kCellularDvfsStats;
  }
  -[NSMutableArray addObject:](kCellularDvfsStats, "addObject:", v4);

}

- (unint64_t)kCellularDvfsStatsCount
{
  return -[NSMutableArray count](self->_kCellularDvfsStats, "count");
}

- (id)kCellularDvfsStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularDvfsStats, "objectAtIndex:", a3);
}

+ (Class)kCellularDvfsStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteWcdmaGsmHwStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteWcdmaGsmHwStats, "removeAllObjects");
}

- (void)addKCellularLteWcdmaGsmHwStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteWcdmaGsmHwStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  v8 = v4;
  if (!kCellularLteWcdmaGsmHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteWcdmaGsmHwStats;
    self->_kCellularLteWcdmaGsmHwStats = v6;

    v4 = v8;
    kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  }
  -[NSMutableArray addObject:](kCellularLteWcdmaGsmHwStats, "addObject:", v4);

}

- (unint64_t)kCellularLteWcdmaGsmHwStatsCount
{
  return -[NSMutableArray count](self->_kCellularLteWcdmaGsmHwStats, "count");
}

- (id)kCellularLteWcdmaGsmHwStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteWcdmaGsmHwStats, "objectAtIndex:", a3);
}

+ (Class)kCellularLteWcdmaGsmHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTdsGsmHwStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteTdsGsmHwStats, "removeAllObjects");
}

- (void)addKCellularLteTdsGsmHwStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteTdsGsmHwStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  v8 = v4;
  if (!kCellularLteTdsGsmHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteTdsGsmHwStats;
    self->_kCellularLteTdsGsmHwStats = v6;

    v4 = v8;
    kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  }
  -[NSMutableArray addObject:](kCellularLteTdsGsmHwStats, "addObject:", v4);

}

- (unint64_t)kCellularLteTdsGsmHwStatsCount
{
  return -[NSMutableArray count](self->_kCellularLteTdsGsmHwStats, "count");
}

- (id)kCellularLteTdsGsmHwStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteTdsGsmHwStats, "objectAtIndex:", a3);
}

+ (Class)kCellularLteTdsGsmHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPmuAverageCurrents
{
  -[NSMutableArray removeAllObjects](self->_kCellularPmuAverageCurrents, "removeAllObjects");
}

- (void)addKCellularPmuAverageCurrent:(id)a3
{
  id v4;
  NSMutableArray *kCellularPmuAverageCurrents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  v8 = v4;
  if (!kCellularPmuAverageCurrents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularPmuAverageCurrents;
    self->_kCellularPmuAverageCurrents = v6;

    v4 = v8;
    kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  }
  -[NSMutableArray addObject:](kCellularPmuAverageCurrents, "addObject:", v4);

}

- (unint64_t)kCellularPmuAverageCurrentsCount
{
  return -[NSMutableArray count](self->_kCellularPmuAverageCurrents, "count");
}

- (id)kCellularPmuAverageCurrentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularPmuAverageCurrents, "objectAtIndex:", a3);
}

+ (Class)kCellularPmuAverageCurrentType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularFwCoreStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularFwCoreStats, "removeAllObjects");
}

- (void)addKCellularFwCoreStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularFwCoreStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularFwCoreStats = self->_kCellularFwCoreStats;
  v8 = v4;
  if (!kCellularFwCoreStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularFwCoreStats;
    self->_kCellularFwCoreStats = v6;

    v4 = v8;
    kCellularFwCoreStats = self->_kCellularFwCoreStats;
  }
  -[NSMutableArray addObject:](kCellularFwCoreStats, "addObject:", v4);

}

- (unint64_t)kCellularFwCoreStatsCount
{
  return -[NSMutableArray count](self->_kCellularFwCoreStats, "count");
}

- (id)kCellularFwCoreStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularFwCoreStats, "objectAtIndex:", a3);
}

+ (Class)kCellularFwCoreStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteWcdmaTdsHwStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteWcdmaTdsHwStats, "removeAllObjects");
}

- (void)addKCellularLteWcdmaTdsHwStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteWcdmaTdsHwStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  v8 = v4;
  if (!kCellularLteWcdmaTdsHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteWcdmaTdsHwStats;
    self->_kCellularLteWcdmaTdsHwStats = v6;

    v4 = v8;
    kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  }
  -[NSMutableArray addObject:](kCellularLteWcdmaTdsHwStats, "addObject:", v4);

}

- (unint64_t)kCellularLteWcdmaTdsHwStatsCount
{
  return -[NSMutableArray count](self->_kCellularLteWcdmaTdsHwStats, "count");
}

- (id)kCellularLteWcdmaTdsHwStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteWcdmaTdsHwStats, "objectAtIndex:", a3);
}

+ (Class)kCellularLteWcdmaTdsHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPmicHwStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularPmicHwStats, "removeAllObjects");
}

- (void)addKCellularPmicHwStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularPmicHwStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularPmicHwStats = self->_kCellularPmicHwStats;
  v8 = v4;
  if (!kCellularPmicHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularPmicHwStats;
    self->_kCellularPmicHwStats = v6;

    v4 = v8;
    kCellularPmicHwStats = self->_kCellularPmicHwStats;
  }
  -[NSMutableArray addObject:](kCellularPmicHwStats, "addObject:", v4);

}

- (unint64_t)kCellularPmicHwStatsCount
{
  return -[NSMutableArray count](self->_kCellularPmicHwStats, "count");
}

- (id)kCellularPmicHwStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularPmicHwStats, "objectAtIndex:", a3);
}

+ (Class)kCellularPmicHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmServingCellRssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularGsmServingCellRssiHists, "removeAllObjects");
}

- (void)addKCellularGsmServingCellRssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularGsmServingCellRssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  v8 = v4;
  if (!kCellularGsmServingCellRssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularGsmServingCellRssiHists;
    self->_kCellularGsmServingCellRssiHists = v6;

    v4 = v8;
    kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  }
  -[NSMutableArray addObject:](kCellularGsmServingCellRssiHists, "addObject:", v4);

}

- (unint64_t)kCellularGsmServingCellRssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularGsmServingCellRssiHists, "count");
}

- (id)kCellularGsmServingCellRssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularGsmServingCellRssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularGsmServingCellRssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmServingCellSnrHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularGsmServingCellSnrHists, "removeAllObjects");
}

- (void)addKCellularGsmServingCellSnrHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularGsmServingCellSnrHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  v8 = v4;
  if (!kCellularGsmServingCellSnrHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularGsmServingCellSnrHists;
    self->_kCellularGsmServingCellSnrHists = v6;

    v4 = v8;
    kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  }
  -[NSMutableArray addObject:](kCellularGsmServingCellSnrHists, "addObject:", v4);

}

- (unint64_t)kCellularGsmServingCellSnrHistsCount
{
  return -[NSMutableArray count](self->_kCellularGsmServingCellSnrHists, "count");
}

- (id)kCellularGsmServingCellSnrHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularGsmServingCellSnrHists, "objectAtIndex:", a3);
}

+ (Class)kCellularGsmServingCellSnrHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularGsmTxPowerHists, "removeAllObjects");
}

- (void)addKCellularGsmTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularGsmTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  v8 = v4;
  if (!kCellularGsmTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularGsmTxPowerHists;
    self->_kCellularGsmTxPowerHists = v6;

    v4 = v8;
    kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularGsmTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularGsmTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularGsmTxPowerHists, "count");
}

- (id)kCellularGsmTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularGsmTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularGsmTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmConnectedModeHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularGsmConnectedModeHists, "removeAllObjects");
}

- (void)addKCellularGsmConnectedModeHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularGsmConnectedModeHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  v8 = v4;
  if (!kCellularGsmConnectedModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularGsmConnectedModeHists;
    self->_kCellularGsmConnectedModeHists = v6;

    v4 = v8;
    kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  }
  -[NSMutableArray addObject:](kCellularGsmConnectedModeHists, "addObject:", v4);

}

- (unint64_t)kCellularGsmConnectedModeHistsCount
{
  return -[NSMutableArray count](self->_kCellularGsmConnectedModeHists, "count");
}

- (id)kCellularGsmConnectedModeHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularGsmConnectedModeHists, "objectAtIndex:", a3);
}

+ (Class)kCellularGsmConnectedModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmL1States
{
  -[NSMutableArray removeAllObjects](self->_kCellularGsmL1States, "removeAllObjects");
}

- (void)addKCellularGsmL1State:(id)a3
{
  id v4;
  NSMutableArray *kCellularGsmL1States;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularGsmL1States = self->_kCellularGsmL1States;
  v8 = v4;
  if (!kCellularGsmL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularGsmL1States;
    self->_kCellularGsmL1States = v6;

    v4 = v8;
    kCellularGsmL1States = self->_kCellularGsmL1States;
  }
  -[NSMutableArray addObject:](kCellularGsmL1States, "addObject:", v4);

}

- (unint64_t)kCellularGsmL1StatesCount
{
  return -[NSMutableArray count](self->_kCellularGsmL1States, "count");
}

- (id)kCellularGsmL1StateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularGsmL1States, "objectAtIndex:", a3);
}

+ (Class)kCellularGsmL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaCpcStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaCpcStats, "removeAllObjects");
}

- (void)addKCellularWcdmaCpcStat:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaCpcStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  v8 = v4;
  if (!kCellularWcdmaCpcStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaCpcStats;
    self->_kCellularWcdmaCpcStats = v6;

    v4 = v8;
    kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  }
  -[NSMutableArray addObject:](kCellularWcdmaCpcStats, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaCpcStatsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaCpcStats, "count");
}

- (id)kCellularWcdmaCpcStatAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaCpcStats, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaCpcStatType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRxDiversityHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRxDiversityHists, "removeAllObjects");
}

- (void)addKCellularWcdmaRxDiversityHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRxDiversityHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  v8 = v4;
  if (!kCellularWcdmaRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRxDiversityHists;
    self->_kCellularWcdmaRxDiversityHists = v6;

    v4 = v8;
    kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRxDiversityHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRxDiversityHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRxDiversityHists, "count");
}

- (id)kCellularWcdmaRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRxDiversityHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx0RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaServingCellRx0RssiHists, "removeAllObjects");
}

- (void)addKCellularWcdmaServingCellRx0RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaServingCellRx0RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  v8 = v4;
  if (!kCellularWcdmaServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaServingCellRx0RssiHists;
    self->_kCellularWcdmaServingCellRx0RssiHists = v6;

    v4 = v8;
    kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaServingCellRx0RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaServingCellRx0RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0RssiHists, "count");
}

- (id)kCellularWcdmaServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaServingCellRx0RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx1RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaServingCellRx1RssiHists, "removeAllObjects");
}

- (void)addKCellularWcdmaServingCellRx1RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaServingCellRx1RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  v8 = v4;
  if (!kCellularWcdmaServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaServingCellRx1RssiHists;
    self->_kCellularWcdmaServingCellRx1RssiHists = v6;

    v4 = v8;
    kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaServingCellRx1RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaServingCellRx1RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1RssiHists, "count");
}

- (id)kCellularWcdmaServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaServingCellRx1RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx0EcNoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaServingCellRx0EcNoHists, "removeAllObjects");
}

- (void)addKCellularWcdmaServingCellRx0EcNoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaServingCellRx0EcNoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  v8 = v4;
  if (!kCellularWcdmaServingCellRx0EcNoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaServingCellRx0EcNoHists;
    self->_kCellularWcdmaServingCellRx0EcNoHists = v6;

    v4 = v8;
    kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaServingCellRx0EcNoHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaServingCellRx0EcNoHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0EcNoHists, "count");
}

- (id)kCellularWcdmaServingCellRx0EcNoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaServingCellRx0EcNoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaServingCellRx0EcNoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx1EcNoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaServingCellRx1EcNoHists, "removeAllObjects");
}

- (void)addKCellularWcdmaServingCellRx1EcNoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaServingCellRx1EcNoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  v8 = v4;
  if (!kCellularWcdmaServingCellRx1EcNoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaServingCellRx1EcNoHists;
    self->_kCellularWcdmaServingCellRx1EcNoHists = v6;

    v4 = v8;
    kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaServingCellRx1EcNoHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaServingCellRx1EcNoHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1EcNoHists, "count");
}

- (id)kCellularWcdmaServingCellRx1EcNoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaServingCellRx1EcNoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaServingCellRx1EcNoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaTxPowerHists, "removeAllObjects");
}

- (void)addKCellularWcdmaTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  v8 = v4;
  if (!kCellularWcdmaTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaTxPowerHists;
    self->_kCellularWcdmaTxPowerHists = v6;

    v4 = v8;
    kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaTxPowerHists, "count");
}

- (id)kCellularWcdmaTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaReceiverStatusOnC0Hists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaReceiverStatusOnC0Hists, "removeAllObjects");
}

- (void)addKCellularWcdmaReceiverStatusOnC0Hist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaReceiverStatusOnC0Hists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  v8 = v4;
  if (!kCellularWcdmaReceiverStatusOnC0Hists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
    self->_kCellularWcdmaReceiverStatusOnC0Hists = v6;

    v4 = v8;
    kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaReceiverStatusOnC0Hists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaReceiverStatusOnC0HistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC0Hists, "count");
}

- (id)kCellularWcdmaReceiverStatusOnC0HistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaReceiverStatusOnC0Hists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaReceiverStatusOnC0HistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaReceiverStatusOnC1Hists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaReceiverStatusOnC1Hists, "removeAllObjects");
}

- (void)addKCellularWcdmaReceiverStatusOnC1Hist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaReceiverStatusOnC1Hists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  v8 = v4;
  if (!kCellularWcdmaReceiverStatusOnC1Hists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
    self->_kCellularWcdmaReceiverStatusOnC1Hists = v6;

    v4 = v8;
    kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaReceiverStatusOnC1Hists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaReceiverStatusOnC1HistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC1Hists, "count");
}

- (id)kCellularWcdmaReceiverStatusOnC1HistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaReceiverStatusOnC1Hists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaReceiverStatusOnC1HistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaCarrierStatusHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaCarrierStatusHists, "removeAllObjects");
}

- (void)addKCellularWcdmaCarrierStatusHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaCarrierStatusHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  v8 = v4;
  if (!kCellularWcdmaCarrierStatusHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaCarrierStatusHists;
    self->_kCellularWcdmaCarrierStatusHists = v6;

    v4 = v8;
    kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaCarrierStatusHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaCarrierStatusHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaCarrierStatusHists, "count");
}

- (id)kCellularWcdmaCarrierStatusHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaCarrierStatusHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaCarrierStatusHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabModeHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRabModeHists, "removeAllObjects");
}

- (void)addKCellularWcdmaRabModeHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRabModeHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  v8 = v4;
  if (!kCellularWcdmaRabModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRabModeHists;
    self->_kCellularWcdmaRabModeHists = v6;

    v4 = v8;
    kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRabModeHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRabModeHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRabModeHists, "count");
}

- (id)kCellularWcdmaRabModeHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRabModeHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRabModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabTypeHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRabTypeHists, "removeAllObjects");
}

- (void)addKCellularWcdmaRabTypeHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRabTypeHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  v8 = v4;
  if (!kCellularWcdmaRabTypeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRabTypeHists;
    self->_kCellularWcdmaRabTypeHists = v6;

    v4 = v8;
    kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRabTypeHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRabTypeHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRabTypeHists, "count");
}

- (id)kCellularWcdmaRabTypeHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRabTypeHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRabTypeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRrcConnectionStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRrcConnectionStates, "removeAllObjects");
}

- (void)addKCellularWcdmaRrcConnectionState:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRrcConnectionStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  v8 = v4;
  if (!kCellularWcdmaRrcConnectionStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRrcConnectionStates;
    self->_kCellularWcdmaRrcConnectionStates = v6;

    v4 = v8;
    kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRrcConnectionStates, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRrcConnectionStatesCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRrcConnectionStates, "count");
}

- (id)kCellularWcdmaRrcConnectionStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRrcConnectionStates, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRrcConnectionStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRrcConfigurations
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRrcConfigurations, "removeAllObjects");
}

- (void)addKCellularWcdmaRrcConfiguration:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRrcConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  v8 = v4;
  if (!kCellularWcdmaRrcConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRrcConfigurations;
    self->_kCellularWcdmaRrcConfigurations = v6;

    v4 = v8;
    kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRrcConfigurations, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRrcConfigurationsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRrcConfigurations, "count");
}

- (id)kCellularWcdmaRrcConfigurationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRrcConfigurations, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRrcConfigurationType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabStatus
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaRabStatus, "removeAllObjects");
}

- (void)addKCellularWcdmaRabStatus:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaRabStatus;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  v8 = v4;
  if (!kCellularWcdmaRabStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaRabStatus;
    self->_kCellularWcdmaRabStatus = v6;

    v4 = v8;
    kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  }
  -[NSMutableArray addObject:](kCellularWcdmaRabStatus, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaRabStatusCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaRabStatus, "count");
}

- (id)kCellularWcdmaRabStatusAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaRabStatus, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaRabStatusType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaL1States
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaL1States, "removeAllObjects");
}

- (void)addKCellularWcdmaL1State:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaL1States;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  v8 = v4;
  if (!kCellularWcdmaL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaL1States;
    self->_kCellularWcdmaL1States = v6;

    v4 = v8;
    kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  }
  -[NSMutableArray addObject:](kCellularWcdmaL1States, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaL1StatesCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaL1States, "count");
}

- (id)kCellularWcdmaL1StateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaL1States, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaDataInactivityBeforeIdles
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaDataInactivityBeforeIdles, "removeAllObjects");
}

- (void)addKCellularWcdmaDataInactivityBeforeIdle:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaDataInactivityBeforeIdles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  v8 = v4;
  if (!kCellularWcdmaDataInactivityBeforeIdles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaDataInactivityBeforeIdles;
    self->_kCellularWcdmaDataInactivityBeforeIdles = v6;

    v4 = v8;
    kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  }
  -[NSMutableArray addObject:](kCellularWcdmaDataInactivityBeforeIdles, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaDataInactivityBeforeIdlesCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaDataInactivityBeforeIdles, "count");
}

- (id)kCellularWcdmaDataInactivityBeforeIdleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaDataInactivityBeforeIdles, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaDataInactivityBeforeIdleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaIdleToConnectedUserDatas
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaIdleToConnectedUserDatas, "removeAllObjects");
}

- (void)addKCellularWcdmaIdleToConnectedUserData:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaIdleToConnectedUserDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  v8 = v4;
  if (!kCellularWcdmaIdleToConnectedUserDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaIdleToConnectedUserDatas;
    self->_kCellularWcdmaIdleToConnectedUserDatas = v6;

    v4 = v8;
    kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  }
  -[NSMutableArray addObject:](kCellularWcdmaIdleToConnectedUserDatas, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaIdleToConnectedUserDatasCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaIdleToConnectedUserDatas, "count");
}

- (id)kCellularWcdmaIdleToConnectedUserDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaIdleToConnectedUserDatas, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaIdleToConnectedUserDataType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaVadHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularWcdmaVadHists, "removeAllObjects");
}

- (void)addKCellularWcdmaVadHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularWcdmaVadHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  v8 = v4;
  if (!kCellularWcdmaVadHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularWcdmaVadHists;
    self->_kCellularWcdmaVadHists = v6;

    v4 = v8;
    kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  }
  -[NSMutableArray addObject:](kCellularWcdmaVadHists, "addObject:", v4);

}

- (unint64_t)kCellularWcdmaVadHistsCount
{
  return -[NSMutableArray count](self->_kCellularWcdmaVadHists, "count");
}

- (id)kCellularWcdmaVadHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularWcdmaVadHists, "objectAtIndex:", a3);
}

+ (Class)kCellularWcdmaVadHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRxDiversityHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsRxDiversityHists, "removeAllObjects");
}

- (void)addKCellularTdsRxDiversityHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsRxDiversityHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  v8 = v4;
  if (!kCellularTdsRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsRxDiversityHists;
    self->_kCellularTdsRxDiversityHists = v6;

    v4 = v8;
    kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  }
  -[NSMutableArray addObject:](kCellularTdsRxDiversityHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsRxDiversityHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsRxDiversityHists, "count");
}

- (id)kCellularTdsRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsRxDiversityHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx0RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsServingCellRx0RssiHists, "removeAllObjects");
}

- (void)addKCellularTdsServingCellRx0RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsServingCellRx0RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  v8 = v4;
  if (!kCellularTdsServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsServingCellRx0RssiHists;
    self->_kCellularTdsServingCellRx0RssiHists = v6;

    v4 = v8;
    kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  }
  -[NSMutableArray addObject:](kCellularTdsServingCellRx0RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsServingCellRx0RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsServingCellRx0RssiHists, "count");
}

- (id)kCellularTdsServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsServingCellRx0RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx1RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsServingCellRx1RssiHists, "removeAllObjects");
}

- (void)addKCellularTdsServingCellRx1RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsServingCellRx1RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  v8 = v4;
  if (!kCellularTdsServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsServingCellRx1RssiHists;
    self->_kCellularTdsServingCellRx1RssiHists = v6;

    v4 = v8;
    kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  }
  -[NSMutableArray addObject:](kCellularTdsServingCellRx1RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsServingCellRx1RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsServingCellRx1RssiHists, "count");
}

- (id)kCellularTdsServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsServingCellRx1RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx0RscpHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsServingCellRx0RscpHists, "removeAllObjects");
}

- (void)addKCellularTdsServingCellRx0RscpHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsServingCellRx0RscpHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  v8 = v4;
  if (!kCellularTdsServingCellRx0RscpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsServingCellRx0RscpHists;
    self->_kCellularTdsServingCellRx0RscpHists = v6;

    v4 = v8;
    kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  }
  -[NSMutableArray addObject:](kCellularTdsServingCellRx0RscpHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsServingCellRx0RscpHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsServingCellRx0RscpHists, "count");
}

- (id)kCellularTdsServingCellRx0RscpHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsServingCellRx0RscpHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsServingCellRx0RscpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx1RscpHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsServingCellRx1RscpHists, "removeAllObjects");
}

- (void)addKCellularTdsServingCellRx1RscpHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsServingCellRx1RscpHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  v8 = v4;
  if (!kCellularTdsServingCellRx1RscpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsServingCellRx1RscpHists;
    self->_kCellularTdsServingCellRx1RscpHists = v6;

    v4 = v8;
    kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  }
  -[NSMutableArray addObject:](kCellularTdsServingCellRx1RscpHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsServingCellRx1RscpHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsServingCellRx1RscpHists, "count");
}

- (id)kCellularTdsServingCellRx1RscpHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsServingCellRx1RscpHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsServingCellRx1RscpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsTxPowerHists, "removeAllObjects");
}

- (void)addKCellularTdsTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  v8 = v4;
  if (!kCellularTdsTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsTxPowerHists;
    self->_kCellularTdsTxPowerHists = v6;

    v4 = v8;
    kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularTdsTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsTxPowerHists, "count");
}

- (id)kCellularTdsTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRabModeHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsRabModeHists, "removeAllObjects");
}

- (void)addKCellularTdsRabModeHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsRabModeHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  v8 = v4;
  if (!kCellularTdsRabModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsRabModeHists;
    self->_kCellularTdsRabModeHists = v6;

    v4 = v8;
    kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  }
  -[NSMutableArray addObject:](kCellularTdsRabModeHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsRabModeHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsRabModeHists, "count");
}

- (id)kCellularTdsRabModeHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsRabModeHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsRabModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRabTypeHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsRabTypeHists, "removeAllObjects");
}

- (void)addKCellularTdsRabTypeHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsRabTypeHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  v8 = v4;
  if (!kCellularTdsRabTypeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsRabTypeHists;
    self->_kCellularTdsRabTypeHists = v6;

    v4 = v8;
    kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  }
  -[NSMutableArray addObject:](kCellularTdsRabTypeHists, "addObject:", v4);

}

- (unint64_t)kCellularTdsRabTypeHistsCount
{
  return -[NSMutableArray count](self->_kCellularTdsRabTypeHists, "count");
}

- (id)kCellularTdsRabTypeHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsRabTypeHists, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsRabTypeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRrcStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsRrcStates, "removeAllObjects");
}

- (void)addKCellularTdsRrcState:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsRrcStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  v8 = v4;
  if (!kCellularTdsRrcStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsRrcStates;
    self->_kCellularTdsRrcStates = v6;

    v4 = v8;
    kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  }
  -[NSMutableArray addObject:](kCellularTdsRrcStates, "addObject:", v4);

}

- (unint64_t)kCellularTdsRrcStatesCount
{
  return -[NSMutableArray count](self->_kCellularTdsRrcStates, "count");
}

- (id)kCellularTdsRrcStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsRrcStates, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsRrcStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsL1States
{
  -[NSMutableArray removeAllObjects](self->_kCellularTdsL1States, "removeAllObjects");
}

- (void)addKCellularTdsL1State:(id)a3
{
  id v4;
  NSMutableArray *kCellularTdsL1States;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularTdsL1States = self->_kCellularTdsL1States;
  v8 = v4;
  if (!kCellularTdsL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularTdsL1States;
    self->_kCellularTdsL1States = v6;

    v4 = v8;
    kCellularTdsL1States = self->_kCellularTdsL1States;
  }
  -[NSMutableArray addObject:](kCellularTdsL1States, "addObject:", v4);

}

- (unint64_t)kCellularTdsL1StatesCount
{
  return -[NSMutableArray count](self->_kCellularTdsL1States, "count");
}

- (id)kCellularTdsL1StateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularTdsL1States, "objectAtIndex:", a3);
}

+ (Class)kCellularTdsL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteFwDuplexModes
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteFwDuplexModes, "removeAllObjects");
}

- (void)addKCellularLteFwDuplexMode:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteFwDuplexModes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  v8 = v4;
  if (!kCellularLteFwDuplexModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteFwDuplexModes;
    self->_kCellularLteFwDuplexModes = v6;

    v4 = v8;
    kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  }
  -[NSMutableArray addObject:](kCellularLteFwDuplexModes, "addObject:", v4);

}

- (unint64_t)kCellularLteFwDuplexModesCount
{
  return -[NSMutableArray count](self->_kCellularLteFwDuplexModes, "count");
}

- (id)kCellularLteFwDuplexModeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteFwDuplexModes, "objectAtIndex:", a3);
}

+ (Class)kCellularLteFwDuplexModeType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteServingCellRsrpHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteServingCellRsrpHists, "removeAllObjects");
}

- (void)addKCellularLteServingCellRsrpHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteServingCellRsrpHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  v8 = v4;
  if (!kCellularLteServingCellRsrpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteServingCellRsrpHists;
    self->_kCellularLteServingCellRsrpHists = v6;

    v4 = v8;
    kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  }
  -[NSMutableArray addObject:](kCellularLteServingCellRsrpHists, "addObject:", v4);

}

- (unint64_t)kCellularLteServingCellRsrpHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteServingCellRsrpHists, "count");
}

- (id)kCellularLteServingCellRsrpHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteServingCellRsrpHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteServingCellRsrpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteServingCellSinrHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteServingCellSinrHists, "removeAllObjects");
}

- (void)addKCellularLteServingCellSinrHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteServingCellSinrHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  v8 = v4;
  if (!kCellularLteServingCellSinrHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteServingCellSinrHists;
    self->_kCellularLteServingCellSinrHists = v6;

    v4 = v8;
    kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  }
  -[NSMutableArray addObject:](kCellularLteServingCellSinrHists, "addObject:", v4);

}

- (unint64_t)kCellularLteServingCellSinrHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteServingCellSinrHists, "count");
}

- (id)kCellularLteServingCellSinrHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteServingCellSinrHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteServingCellSinrHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteSleepStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteSleepStateHists, "removeAllObjects");
}

- (void)addKCellularLteSleepStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteSleepStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  v8 = v4;
  if (!kCellularLteSleepStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteSleepStateHists;
    self->_kCellularLteSleepStateHists = v6;

    v4 = v8;
    kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  }
  -[NSMutableArray addObject:](kCellularLteSleepStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLteSleepStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteSleepStateHists, "count");
}

- (id)kCellularLteSleepStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteSleepStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteSleepStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteTxPowerHists, "removeAllObjects");
}

- (void)addKCellularLteTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  v8 = v4;
  if (!kCellularLteTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteTxPowerHists;
    self->_kCellularLteTxPowerHists = v6;

    v4 = v8;
    kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularLteTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularLteTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteTxPowerHists, "count");
}

- (id)kCellularLteTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDlSccStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteDlSccStateHists, "removeAllObjects");
}

- (void)addKCellularLteDlSccStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteDlSccStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  v8 = v4;
  if (!kCellularLteDlSccStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteDlSccStateHists;
    self->_kCellularLteDlSccStateHists = v6;

    v4 = v8;
    kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  }
  -[NSMutableArray addObject:](kCellularLteDlSccStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLteDlSccStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteDlSccStateHists, "count");
}

- (id)kCellularLteDlSccStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteDlSccStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteDlSccStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteUlSccStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteUlSccStateHists, "removeAllObjects");
}

- (void)addKCellularLteUlSccStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteUlSccStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  v8 = v4;
  if (!kCellularLteUlSccStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteUlSccStateHists;
    self->_kCellularLteUlSccStateHists = v6;

    v4 = v8;
    kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  }
  -[NSMutableArray addObject:](kCellularLteUlSccStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLteUlSccStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteUlSccStateHists, "count");
}

- (id)kCellularLteUlSccStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteUlSccStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteUlSccStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteAdvancedRxStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteAdvancedRxStateHists, "removeAllObjects");
}

- (void)addKCellularLteAdvancedRxStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteAdvancedRxStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  v8 = v4;
  if (!kCellularLteAdvancedRxStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteAdvancedRxStateHists;
    self->_kCellularLteAdvancedRxStateHists = v6;

    v4 = v8;
    kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  }
  -[NSMutableArray addObject:](kCellularLteAdvancedRxStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLteAdvancedRxStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteAdvancedRxStateHists, "count");
}

- (id)kCellularLteAdvancedRxStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteAdvancedRxStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteAdvancedRxStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteComponentCarrierInfos
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteComponentCarrierInfos, "removeAllObjects");
}

- (void)addKCellularLteComponentCarrierInfo:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteComponentCarrierInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  v8 = v4;
  if (!kCellularLteComponentCarrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteComponentCarrierInfos;
    self->_kCellularLteComponentCarrierInfos = v6;

    v4 = v8;
    kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  }
  -[NSMutableArray addObject:](kCellularLteComponentCarrierInfos, "addObject:", v4);

}

- (unint64_t)kCellularLteComponentCarrierInfosCount
{
  return -[NSMutableArray count](self->_kCellularLteComponentCarrierInfos, "count");
}

- (id)kCellularLteComponentCarrierInfoAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteComponentCarrierInfos, "objectAtIndex:", a3);
}

+ (Class)kCellularLteComponentCarrierInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRxTxStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteRxTxStateHists, "removeAllObjects");
}

- (void)addKCellularLteRxTxStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteRxTxStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  v8 = v4;
  if (!kCellularLteRxTxStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteRxTxStateHists;
    self->_kCellularLteRxTxStateHists = v6;

    v4 = v8;
    kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  }
  -[NSMutableArray addObject:](kCellularLteRxTxStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLteRxTxStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteRxTxStateHists, "count");
}

- (id)kCellularLteRxTxStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteRxTxStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteRxTxStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTotalDlTbsHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteTotalDlTbsHists, "removeAllObjects");
}

- (void)addKCellularLteTotalDlTbsHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteTotalDlTbsHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  v8 = v4;
  if (!kCellularLteTotalDlTbsHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteTotalDlTbsHists;
    self->_kCellularLteTotalDlTbsHists = v6;

    v4 = v8;
    kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  }
  -[NSMutableArray addObject:](kCellularLteTotalDlTbsHists, "addObject:", v4);

}

- (unint64_t)kCellularLteTotalDlTbsHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteTotalDlTbsHists, "count");
}

- (id)kCellularLteTotalDlTbsHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteTotalDlTbsHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteTotalDlTbsHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDataInactivityBeforeIdles
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteDataInactivityBeforeIdles, "removeAllObjects");
}

- (void)addKCellularLteDataInactivityBeforeIdle:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteDataInactivityBeforeIdles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  v8 = v4;
  if (!kCellularLteDataInactivityBeforeIdles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteDataInactivityBeforeIdles;
    self->_kCellularLteDataInactivityBeforeIdles = v6;

    v4 = v8;
    kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  }
  -[NSMutableArray addObject:](kCellularLteDataInactivityBeforeIdles, "addObject:", v4);

}

- (unint64_t)kCellularLteDataInactivityBeforeIdlesCount
{
  return -[NSMutableArray count](self->_kCellularLteDataInactivityBeforeIdles, "count");
}

- (id)kCellularLteDataInactivityBeforeIdleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteDataInactivityBeforeIdles, "objectAtIndex:", a3);
}

+ (Class)kCellularLteDataInactivityBeforeIdleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteIdleToConnectedUserDatas
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteIdleToConnectedUserDatas, "removeAllObjects");
}

- (void)addKCellularLteIdleToConnectedUserData:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteIdleToConnectedUserDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  v8 = v4;
  if (!kCellularLteIdleToConnectedUserDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteIdleToConnectedUserDatas;
    self->_kCellularLteIdleToConnectedUserDatas = v6;

    v4 = v8;
    kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  }
  -[NSMutableArray addObject:](kCellularLteIdleToConnectedUserDatas, "addObject:", v4);

}

- (unint64_t)kCellularLteIdleToConnectedUserDatasCount
{
  return -[NSMutableArray count](self->_kCellularLteIdleToConnectedUserDatas, "count");
}

- (id)kCellularLteIdleToConnectedUserDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteIdleToConnectedUserDatas, "objectAtIndex:", a3);
}

+ (Class)kCellularLteIdleToConnectedUserDataType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDlSccStateHistV3s
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteDlSccStateHistV3s, "removeAllObjects");
}

- (void)addKCellularLteDlSccStateHistV3:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteDlSccStateHistV3s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  v8 = v4;
  if (!kCellularLteDlSccStateHistV3s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteDlSccStateHistV3s;
    self->_kCellularLteDlSccStateHistV3s = v6;

    v4 = v8;
    kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  }
  -[NSMutableArray addObject:](kCellularLteDlSccStateHistV3s, "addObject:", v4);

}

- (unint64_t)kCellularLteDlSccStateHistV3sCount
{
  return -[NSMutableArray count](self->_kCellularLteDlSccStateHistV3s, "count");
}

- (id)kCellularLteDlSccStateHistV3AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteDlSccStateHistV3s, "objectAtIndex:", a3);
}

+ (Class)kCellularLteDlSccStateHistV3Type
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRxDiversityHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteRxDiversityHists, "removeAllObjects");
}

- (void)addKCellularLteRxDiversityHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteRxDiversityHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  v8 = v4;
  if (!kCellularLteRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteRxDiversityHists;
    self->_kCellularLteRxDiversityHists = v6;

    v4 = v8;
    kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  }
  -[NSMutableArray addObject:](kCellularLteRxDiversityHists, "addObject:", v4);

}

- (unint64_t)kCellularLteRxDiversityHistsCount
{
  return -[NSMutableArray count](self->_kCellularLteRxDiversityHists, "count");
}

- (id)kCellularLteRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteRxDiversityHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLteRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePdcchStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularLtePdcchStateHists, "removeAllObjects");
}

- (void)addKCellularLtePdcchStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularLtePdcchStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  v8 = v4;
  if (!kCellularLtePdcchStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLtePdcchStateHists;
    self->_kCellularLtePdcchStateHists = v6;

    v4 = v8;
    kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  }
  -[NSMutableArray addObject:](kCellularLtePdcchStateHists, "addObject:", v4);

}

- (unint64_t)kCellularLtePdcchStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularLtePdcchStateHists, "count");
}

- (id)kCellularLtePdcchStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLtePdcchStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularLtePdcchStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRrcStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteRrcStates, "removeAllObjects");
}

- (void)addKCellularLteRrcState:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteRrcStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteRrcStates = self->_kCellularLteRrcStates;
  v8 = v4;
  if (!kCellularLteRrcStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteRrcStates;
    self->_kCellularLteRrcStates = v6;

    v4 = v8;
    kCellularLteRrcStates = self->_kCellularLteRrcStates;
  }
  -[NSMutableArray addObject:](kCellularLteRrcStates, "addObject:", v4);

}

- (unint64_t)kCellularLteRrcStatesCount
{
  return -[NSMutableArray count](self->_kCellularLteRrcStates, "count");
}

- (id)kCellularLteRrcStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteRrcStates, "objectAtIndex:", a3);
}

+ (Class)kCellularLteRrcStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePagingCycles
{
  -[NSMutableArray removeAllObjects](self->_kCellularLtePagingCycles, "removeAllObjects");
}

- (void)addKCellularLtePagingCycle:(id)a3
{
  id v4;
  NSMutableArray *kCellularLtePagingCycles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  v8 = v4;
  if (!kCellularLtePagingCycles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLtePagingCycles;
    self->_kCellularLtePagingCycles = v6;

    v4 = v8;
    kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  }
  -[NSMutableArray addObject:](kCellularLtePagingCycles, "addObject:", v4);

}

- (unint64_t)kCellularLtePagingCyclesCount
{
  return -[NSMutableArray count](self->_kCellularLtePagingCycles, "count");
}

- (id)kCellularLtePagingCycleAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLtePagingCycles, "objectAtIndex:", a3);
}

+ (Class)kCellularLtePagingCycleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteCdrxConfigs
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteCdrxConfigs, "removeAllObjects");
}

- (void)addKCellularLteCdrxConfig:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteCdrxConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  v8 = v4;
  if (!kCellularLteCdrxConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteCdrxConfigs;
    self->_kCellularLteCdrxConfigs = v6;

    v4 = v8;
    kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  }
  -[NSMutableArray addObject:](kCellularLteCdrxConfigs, "addObject:", v4);

}

- (unint64_t)kCellularLteCdrxConfigsCount
{
  return -[NSMutableArray count](self->_kCellularLteCdrxConfigs, "count");
}

- (id)kCellularLteCdrxConfigAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteCdrxConfigs, "objectAtIndex:", a3);
}

+ (Class)kCellularLteCdrxConfigType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRadioLinkFailures
{
  -[NSMutableArray removeAllObjects](self->_kCellularLteRadioLinkFailures, "removeAllObjects");
}

- (void)addKCellularLteRadioLinkFailure:(id)a3
{
  id v4;
  NSMutableArray *kCellularLteRadioLinkFailures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  v8 = v4;
  if (!kCellularLteRadioLinkFailures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLteRadioLinkFailures;
    self->_kCellularLteRadioLinkFailures = v6;

    v4 = v8;
    kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  }
  -[NSMutableArray addObject:](kCellularLteRadioLinkFailures, "addObject:", v4);

}

- (unint64_t)kCellularLteRadioLinkFailuresCount
{
  return -[NSMutableArray count](self->_kCellularLteRadioLinkFailures, "count");
}

- (id)kCellularLteRadioLinkFailureAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLteRadioLinkFailures, "objectAtIndex:", a3);
}

+ (Class)kCellularLteRadioLinkFailureType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePdcchStateStats
{
  -[NSMutableArray removeAllObjects](self->_kCellularLtePdcchStateStats, "removeAllObjects");
}

- (void)addKCellularLtePdcchStateStats:(id)a3
{
  id v4;
  NSMutableArray *kCellularLtePdcchStateStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  v8 = v4;
  if (!kCellularLtePdcchStateStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLtePdcchStateStats;
    self->_kCellularLtePdcchStateStats = v6;

    v4 = v8;
    kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  }
  -[NSMutableArray addObject:](kCellularLtePdcchStateStats, "addObject:", v4);

}

- (unint64_t)kCellularLtePdcchStateStatsCount
{
  return -[NSMutableArray count](self->_kCellularLtePdcchStateStats, "count");
}

- (id)kCellularLtePdcchStateStatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLtePdcchStateStats, "objectAtIndex:", a3);
}

+ (Class)kCellularLtePdcchStateStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLqmStateChanges
{
  -[NSMutableArray removeAllObjects](self->_kCellularLqmStateChanges, "removeAllObjects");
}

- (void)addKCellularLqmStateChange:(id)a3
{
  id v4;
  NSMutableArray *kCellularLqmStateChanges;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  v8 = v4;
  if (!kCellularLqmStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularLqmStateChanges;
    self->_kCellularLqmStateChanges = v6;

    v4 = v8;
    kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  }
  -[NSMutableArray addObject:](kCellularLqmStateChanges, "addObject:", v4);

}

- (unint64_t)kCellularLqmStateChangesCount
{
  return -[NSMutableArray count](self->_kCellularLqmStateChanges, "count");
}

- (id)kCellularLqmStateChangeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularLqmStateChanges, "objectAtIndex:", a3);
}

+ (Class)kCellularLqmStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularServiceLosts
{
  -[NSMutableArray removeAllObjects](self->_kCellularServiceLosts, "removeAllObjects");
}

- (void)addKCellularServiceLost:(id)a3
{
  id v4;
  NSMutableArray *kCellularServiceLosts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularServiceLosts = self->_kCellularServiceLosts;
  v8 = v4;
  if (!kCellularServiceLosts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularServiceLosts;
    self->_kCellularServiceLosts = v6;

    v4 = v8;
    kCellularServiceLosts = self->_kCellularServiceLosts;
  }
  -[NSMutableArray addObject:](kCellularServiceLosts, "addObject:", v4);

}

- (unint64_t)kCellularServiceLostsCount
{
  return -[NSMutableArray count](self->_kCellularServiceLosts, "count");
}

- (id)kCellularServiceLostAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularServiceLosts, "objectAtIndex:", a3);
}

+ (Class)kCellularServiceLostType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularProtocolStackStateHists, "removeAllObjects");
}

- (void)addKCellularProtocolStackStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularProtocolStackStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  v8 = v4;
  if (!kCellularProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularProtocolStackStateHists;
    self->_kCellularProtocolStackStateHists = v6;

    v4 = v8;
    kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  }
  -[NSMutableArray addObject:](kCellularProtocolStackStateHists, "addObject:", v4);

}

- (unint64_t)kCellularProtocolStackStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularProtocolStackStateHists, "count");
}

- (id)kCellularProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularProtocolStackStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCellPlmnSearchCounts
{
  -[NSMutableArray removeAllObjects](self->_kCellularCellPlmnSearchCounts, "removeAllObjects");
}

- (void)addKCellularCellPlmnSearchCount:(id)a3
{
  id v4;
  NSMutableArray *kCellularCellPlmnSearchCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  v8 = v4;
  if (!kCellularCellPlmnSearchCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCellPlmnSearchCounts;
    self->_kCellularCellPlmnSearchCounts = v6;

    v4 = v8;
    kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  }
  -[NSMutableArray addObject:](kCellularCellPlmnSearchCounts, "addObject:", v4);

}

- (unint64_t)kCellularCellPlmnSearchCountsCount
{
  return -[NSMutableArray count](self->_kCellularCellPlmnSearchCounts, "count");
}

- (id)kCellularCellPlmnSearchCountAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCellPlmnSearchCounts, "objectAtIndex:", a3);
}

+ (Class)kCellularCellPlmnSearchCountType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCellPlmnSearchHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCellPlmnSearchHists, "removeAllObjects");
}

- (void)addKCellularCellPlmnSearchHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCellPlmnSearchHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  v8 = v4;
  if (!kCellularCellPlmnSearchHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCellPlmnSearchHists;
    self->_kCellularCellPlmnSearchHists = v6;

    v4 = v8;
    kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  }
  -[NSMutableArray addObject:](kCellularCellPlmnSearchHists, "addObject:", v4);

}

- (unint64_t)kCellularCellPlmnSearchHistsCount
{
  return -[NSMutableArray count](self->_kCellularCellPlmnSearchHists, "count");
}

- (id)kCellularCellPlmnSearchHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCellPlmnSearchHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCellPlmnSearchHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackPowerStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularProtocolStackPowerStates, "removeAllObjects");
}

- (void)addKCellularProtocolStackPowerState:(id)a3
{
  id v4;
  NSMutableArray *kCellularProtocolStackPowerStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  v8 = v4;
  if (!kCellularProtocolStackPowerStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularProtocolStackPowerStates;
    self->_kCellularProtocolStackPowerStates = v6;

    v4 = v8;
    kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  }
  -[NSMutableArray addObject:](kCellularProtocolStackPowerStates, "addObject:", v4);

}

- (unint64_t)kCellularProtocolStackPowerStatesCount
{
  return -[NSMutableArray count](self->_kCellularProtocolStackPowerStates, "count");
}

- (id)kCellularProtocolStackPowerStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularProtocolStackPowerStates, "objectAtIndex:", a3);
}

+ (Class)kCellularProtocolStackPowerStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDownlinkIpPacketFilterStatus
{
  -[NSMutableArray removeAllObjects](self->_kCellularDownlinkIpPacketFilterStatus, "removeAllObjects");
}

- (void)addKCellularDownlinkIpPacketFilterStatus:(id)a3
{
  id v4;
  NSMutableArray *kCellularDownlinkIpPacketFilterStatus;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  v8 = v4;
  if (!kCellularDownlinkIpPacketFilterStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularDownlinkIpPacketFilterStatus;
    self->_kCellularDownlinkIpPacketFilterStatus = v6;

    v4 = v8;
    kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  }
  -[NSMutableArray addObject:](kCellularDownlinkIpPacketFilterStatus, "addObject:", v4);

}

- (unint64_t)kCellularDownlinkIpPacketFilterStatusCount
{
  return -[NSMutableArray count](self->_kCellularDownlinkIpPacketFilterStatus, "count");
}

- (id)kCellularDownlinkIpPacketFilterStatusAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularDownlinkIpPacketFilterStatus, "objectAtIndex:", a3);
}

+ (Class)kCellularDownlinkIpPacketFilterStatusType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDownlinkIpPacketDiscardeds
{
  -[NSMutableArray removeAllObjects](self->_kCellularDownlinkIpPacketDiscardeds, "removeAllObjects");
}

- (void)addKCellularDownlinkIpPacketDiscarded:(id)a3
{
  id v4;
  NSMutableArray *kCellularDownlinkIpPacketDiscardeds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  v8 = v4;
  if (!kCellularDownlinkIpPacketDiscardeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularDownlinkIpPacketDiscardeds;
    self->_kCellularDownlinkIpPacketDiscardeds = v6;

    v4 = v8;
    kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  }
  -[NSMutableArray addObject:](kCellularDownlinkIpPacketDiscardeds, "addObject:", v4);

}

- (unint64_t)kCellularDownlinkIpPacketDiscardedsCount
{
  return -[NSMutableArray count](self->_kCellularDownlinkIpPacketDiscardeds, "count");
}

- (id)kCellularDownlinkIpPacketDiscardedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularDownlinkIpPacketDiscardeds, "objectAtIndex:", a3);
}

+ (Class)kCellularDownlinkIpPacketDiscardedType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularServingCellRfBandHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularServingCellRfBandHists, "removeAllObjects");
}

- (void)addKCellularServingCellRfBandHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularServingCellRfBandHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  v8 = v4;
  if (!kCellularServingCellRfBandHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularServingCellRfBandHists;
    self->_kCellularServingCellRfBandHists = v6;

    v4 = v8;
    kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  }
  -[NSMutableArray addObject:](kCellularServingCellRfBandHists, "addObject:", v4);

}

- (unint64_t)kCellularServingCellRfBandHistsCount
{
  return -[NSMutableArray count](self->_kCellularServingCellRfBandHists, "count");
}

- (id)kCellularServingCellRfBandHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularServingCellRfBandHists, "objectAtIndex:", a3);
}

+ (Class)kCellularServingCellRfBandHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStateHist2s
{
  -[NSMutableArray removeAllObjects](self->_kCellularProtocolStackStateHist2s, "removeAllObjects");
}

- (void)addKCellularProtocolStackStateHist2:(id)a3
{
  id v4;
  NSMutableArray *kCellularProtocolStackStateHist2s;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  v8 = v4;
  if (!kCellularProtocolStackStateHist2s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularProtocolStackStateHist2s;
    self->_kCellularProtocolStackStateHist2s = v6;

    v4 = v8;
    kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  }
  -[NSMutableArray addObject:](kCellularProtocolStackStateHist2s, "addObject:", v4);

}

- (unint64_t)kCellularProtocolStackStateHist2sCount
{
  return -[NSMutableArray count](self->_kCellularProtocolStackStateHist2s, "count");
}

- (id)kCellularProtocolStackStateHist2AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularProtocolStackStateHist2s, "objectAtIndex:", a3);
}

+ (Class)kCellularProtocolStackStateHist2Type
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularProtocolStackStates, "removeAllObjects");
}

- (void)addKCellularProtocolStackState:(id)a3
{
  id v4;
  NSMutableArray *kCellularProtocolStackStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  v8 = v4;
  if (!kCellularProtocolStackStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularProtocolStackStates;
    self->_kCellularProtocolStackStates = v6;

    v4 = v8;
    kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  }
  -[NSMutableArray addObject:](kCellularProtocolStackStates, "addObject:", v4);

}

- (unint64_t)kCellularProtocolStackStatesCount
{
  return -[NSMutableArray count](self->_kCellularProtocolStackStates, "count");
}

- (id)kCellularProtocolStackStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularProtocolStackStates, "objectAtIndex:", a3);
}

+ (Class)kCellularProtocolStackStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XRxDiversityHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XRxDiversityHists, "removeAllObjects");
}

- (void)addKCellularCdma1XRxDiversityHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XRxDiversityHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  v8 = v4;
  if (!kCellularCdma1XRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XRxDiversityHists;
    self->_kCellularCdma1XRxDiversityHists = v6;

    v4 = v8;
    kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XRxDiversityHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XRxDiversityHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XRxDiversityHists, "count");
}

- (id)kCellularCdma1XRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XRxDiversityHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx0RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XServingCellRx0RssiHists, "removeAllObjects");
}

- (void)addKCellularCdma1XServingCellRx0RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XServingCellRx0RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  v8 = v4;
  if (!kCellularCdma1XServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XServingCellRx0RssiHists;
    self->_kCellularCdma1XServingCellRx0RssiHists = v6;

    v4 = v8;
    kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XServingCellRx0RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XServingCellRx0RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0RssiHists, "count");
}

- (id)kCellularCdma1XServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XServingCellRx0RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx1RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XServingCellRx1RssiHists, "removeAllObjects");
}

- (void)addKCellularCdma1XServingCellRx1RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XServingCellRx1RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  v8 = v4;
  if (!kCellularCdma1XServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XServingCellRx1RssiHists;
    self->_kCellularCdma1XServingCellRx1RssiHists = v6;

    v4 = v8;
    kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XServingCellRx1RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XServingCellRx1RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1RssiHists, "count");
}

- (id)kCellularCdma1XServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XServingCellRx1RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx0EcIoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XServingCellRx0EcIoHists, "removeAllObjects");
}

- (void)addKCellularCdma1XServingCellRx0EcIoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XServingCellRx0EcIoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  v8 = v4;
  if (!kCellularCdma1XServingCellRx0EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XServingCellRx0EcIoHists;
    self->_kCellularCdma1XServingCellRx0EcIoHists = v6;

    v4 = v8;
    kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XServingCellRx0EcIoHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XServingCellRx0EcIoHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0EcIoHists, "count");
}

- (id)kCellularCdma1XServingCellRx0EcIoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XServingCellRx0EcIoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XServingCellRx0EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx1EcIoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XServingCellRx1EcIoHists, "removeAllObjects");
}

- (void)addKCellularCdma1XServingCellRx1EcIoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XServingCellRx1EcIoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  v8 = v4;
  if (!kCellularCdma1XServingCellRx1EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XServingCellRx1EcIoHists;
    self->_kCellularCdma1XServingCellRx1EcIoHists = v6;

    v4 = v8;
    kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XServingCellRx1EcIoHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XServingCellRx1EcIoHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1EcIoHists, "count");
}

- (id)kCellularCdma1XServingCellRx1EcIoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XServingCellRx1EcIoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XServingCellRx1EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XTxPowerHists, "removeAllObjects");
}

- (void)addKCellularCdma1XTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  v8 = v4;
  if (!kCellularCdma1XTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XTxPowerHists;
    self->_kCellularCdma1XTxPowerHists = v6;

    v4 = v8;
    kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XTxPowerHists, "count");
}

- (id)kCellularCdma1XTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XProtocolStackStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XProtocolStackStateHists, "removeAllObjects");
}

- (void)addKCellularCdma1XProtocolStackStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XProtocolStackStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  v8 = v4;
  if (!kCellularCdma1XProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XProtocolStackStateHists;
    self->_kCellularCdma1XProtocolStackStateHists = v6;

    v4 = v8;
    kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XProtocolStackStateHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XProtocolStackStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XProtocolStackStateHists, "count");
}

- (id)kCellularCdma1XProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XProtocolStackStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XConnectionHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XConnectionHists, "removeAllObjects");
}

- (void)addKCellularCdma1XConnectionHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XConnectionHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  v8 = v4;
  if (!kCellularCdma1XConnectionHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XConnectionHists;
    self->_kCellularCdma1XConnectionHists = v6;

    v4 = v8;
    kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  }
  -[NSMutableArray addObject:](kCellularCdma1XConnectionHists, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XConnectionHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XConnectionHists, "count");
}

- (id)kCellularCdma1XConnectionHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XConnectionHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XConnectionHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XRrStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdma1XRrStates, "removeAllObjects");
}

- (void)addKCellularCdma1XRrState:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdma1XRrStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  v8 = v4;
  if (!kCellularCdma1XRrStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdma1XRrStates;
    self->_kCellularCdma1XRrStates = v6;

    v4 = v8;
    kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  }
  -[NSMutableArray addObject:](kCellularCdma1XRrStates, "addObject:", v4);

}

- (unint64_t)kCellularCdma1XRrStatesCount
{
  return -[NSMutableArray count](self->_kCellularCdma1XRrStates, "count");
}

- (id)kCellularCdma1XRrStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdma1XRrStates, "objectAtIndex:", a3);
}

+ (Class)kCellularCdma1XRrStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoRxDiversityHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoRxDiversityHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoRxDiversityHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoRxDiversityHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists;
  v8 = v4;
  if (!kCellularCdmaEvdoRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoRxDiversityHists;
    self->_kCellularCdmaEvdoRxDiversityHists = v6;

    v4 = v8;
    kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoRxDiversityHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoRxDiversityHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoRxDiversityHists, "count");
}

- (id)kCellularCdmaEvdoRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoRxDiversityHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx0RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoServingCellRx0RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoServingCellRx0RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
    self->_kCellularCdmaEvdoServingCellRx0RssiHists = v6;

    v4 = v8;
    kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoServingCellRx0RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoServingCellRx0RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "count");
}

- (id)kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx1RssiHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoServingCellRx1RssiHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoServingCellRx1RssiHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
    self->_kCellularCdmaEvdoServingCellRx1RssiHists = v6;

    v4 = v8;
    kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoServingCellRx1RssiHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoServingCellRx1RssiHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "count");
}

- (id)kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx0EcIoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoServingCellRx0EcIoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoServingCellRx0EcIoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx0EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
    self->_kCellularCdmaEvdoServingCellRx0EcIoHists = v6;

    v4 = v8;
    kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoServingCellRx0EcIoHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoServingCellRx0EcIoHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "count");
}

- (id)kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoServingCellRx0EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx1EcIoHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoServingCellRx1EcIoHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoServingCellRx1EcIoHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx1EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
    self->_kCellularCdmaEvdoServingCellRx1EcIoHists = v6;

    v4 = v8;
    kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoServingCellRx1EcIoHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoServingCellRx1EcIoHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "count");
}

- (id)kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoServingCellRx1EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoTxPowerHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoTxPowerHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoTxPowerHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoTxPowerHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists;
  v8 = v4;
  if (!kCellularCdmaEvdoTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoTxPowerHists;
    self->_kCellularCdmaEvdoTxPowerHists = v6;

    v4 = v8;
    kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoTxPowerHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoTxPowerHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoTxPowerHists, "count");
}

- (id)kCellularCdmaEvdoTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoTxPowerHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoProtocolStackStateHists
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoProtocolStackStateHists, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoProtocolStackStateHist:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoProtocolStackStateHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists;
  v8 = v4;
  if (!kCellularCdmaEvdoProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoProtocolStackStateHists;
    self->_kCellularCdmaEvdoProtocolStackStateHists = v6;

    v4 = v8;
    kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoProtocolStackStateHists, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoProtocolStackStateHistsCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoProtocolStackStateHists, "count");
}

- (id)kCellularCdmaEvdoProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoProtocolStackStateHists, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoRrStates
{
  -[NSMutableArray removeAllObjects](self->_kCellularCdmaEvdoRrStates, "removeAllObjects");
}

- (void)addKCellularCdmaEvdoRrState:(id)a3
{
  id v4;
  NSMutableArray *kCellularCdmaEvdoRrStates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
  v8 = v4;
  if (!kCellularCdmaEvdoRrStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_kCellularCdmaEvdoRrStates;
    self->_kCellularCdmaEvdoRrStates = v6;

    v4 = v8;
    kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
  }
  -[NSMutableArray addObject:](kCellularCdmaEvdoRrStates, "addObject:", v4);

}

- (unint64_t)kCellularCdmaEvdoRrStatesCount
{
  return -[NSMutableArray count](self->_kCellularCdmaEvdoRrStates, "count");
}

- (id)kCellularCdmaEvdoRrStateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_kCellularCdmaEvdoRrStates, "objectAtIndex:", a3);
}

+ (Class)kCellularCdmaEvdoRrStateType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PowerlogMetricLog;
  -[PowerlogMetricLog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerlogMetricLog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  NSMutableArray *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  NSMutableArray *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  NSMutableArray *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  NSMutableArray *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  NSMutableArray *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  NSMutableArray *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  NSMutableArray *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  NSMutableArray *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  NSMutableArray *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  NSMutableArray *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  NSMutableArray *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  NSMutableArray *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  NSMutableArray *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  NSMutableArray *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  NSMutableArray *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  NSMutableArray *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  void *v200;
  NSMutableArray *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  void *v207;
  NSMutableArray *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  NSMutableArray *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  void *v221;
  NSMutableArray *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  void *v228;
  NSMutableArray *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  void *v235;
  NSMutableArray *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  NSMutableArray *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  void *v249;
  NSMutableArray *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  void *v256;
  NSMutableArray *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  void *v263;
  NSMutableArray *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  void *v270;
  NSMutableArray *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  void *v277;
  NSMutableArray *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  void *v284;
  NSMutableArray *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  void *v291;
  NSMutableArray *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  void *v298;
  NSMutableArray *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  void *v305;
  NSMutableArray *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  void *v312;
  NSMutableArray *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  void *v319;
  NSMutableArray *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  void *v326;
  NSMutableArray *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  void *v333;
  NSMutableArray *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  void *v340;
  NSMutableArray *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  void *v347;
  NSMutableArray *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  void *v354;
  NSMutableArray *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  void *v361;
  NSMutableArray *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  void *v367;
  void *v368;
  NSMutableArray *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  void *v375;
  NSMutableArray *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  void *v382;
  NSMutableArray *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  void *v389;
  NSMutableArray *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  void *v396;
  NSMutableArray *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  void *v402;
  void *v403;
  NSMutableArray *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  void *v409;
  void *v410;
  NSMutableArray *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  void *v417;
  NSMutableArray *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  void *v423;
  void *v424;
  NSMutableArray *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  void *v431;
  NSMutableArray *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  void *v437;
  void *v438;
  NSMutableArray *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  void *v445;
  NSMutableArray *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  void *v452;
  NSMutableArray *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  void *v459;
  NSMutableArray *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  void *v466;
  NSMutableArray *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  void *v473;
  NSMutableArray *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  void *v479;
  void *v480;
  NSMutableArray *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  void *v487;
  NSMutableArray *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  void *v494;
  NSMutableArray *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  void *v500;
  void *v501;
  NSMutableArray *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  void *v508;
  NSMutableArray *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  void *v515;
  NSMutableArray *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  void *v522;
  NSMutableArray *v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  void *v528;
  void *v529;
  NSMutableArray *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  void *v535;
  void *v536;
  NSMutableArray *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  void *v542;
  void *v543;
  NSMutableArray *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  void *v549;
  void *v550;
  NSMutableArray *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  void *v556;
  void *v557;
  NSMutableArray *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  void *v563;
  void *v564;
  NSMutableArray *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  void *v570;
  void *v571;
  NSMutableArray *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  void *v577;
  void *v578;
  NSMutableArray *v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  void *v584;
  void *v585;
  NSMutableArray *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  void *v591;
  void *v592;
  NSMutableArray *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  void *v598;
  void *v599;
  NSMutableArray *v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  void *v605;
  void *v606;
  NSMutableArray *v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  void *v612;
  void *v613;
  NSMutableArray *v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  void *v619;
  void *v620;
  NSMutableArray *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  void *v626;
  void *v627;
  NSMutableArray *v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  void *v633;
  void *v634;
  NSMutableArray *v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  void *v641;
  NSMutableArray *v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  void *v647;
  void *v648;
  NSMutableArray *v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  id v655;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  __int128 v807;
  __int128 v808;
  __int128 v809;
  __int128 v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  __int128 v815;
  __int128 v816;
  __int128 v817;
  __int128 v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  __int128 v831;
  __int128 v832;
  __int128 v833;
  __int128 v834;
  __int128 v835;
  __int128 v836;
  __int128 v837;
  __int128 v838;
  __int128 v839;
  __int128 v840;
  __int128 v841;
  __int128 v842;
  __int128 v843;
  __int128 v844;
  __int128 v845;
  __int128 v846;
  __int128 v847;
  __int128 v848;
  __int128 v849;
  __int128 v850;
  __int128 v851;
  __int128 v852;
  __int128 v853;
  __int128 v854;
  __int128 v855;
  __int128 v856;
  __int128 v857;
  __int128 v858;
  __int128 v859;
  __int128 v860;
  __int128 v861;
  __int128 v862;
  __int128 v863;
  __int128 v864;
  __int128 v865;
  __int128 v866;
  __int128 v867;
  __int128 v868;
  __int128 v869;
  __int128 v870;
  __int128 v871;
  __int128 v872;
  __int128 v873;
  __int128 v874;
  __int128 v875;
  __int128 v876;
  __int128 v877;
  __int128 v878;
  __int128 v879;
  __int128 v880;
  __int128 v881;
  __int128 v882;
  __int128 v883;
  __int128 v884;
  __int128 v885;
  __int128 v886;
  __int128 v887;
  __int128 v888;
  __int128 v889;
  __int128 v890;
  __int128 v891;
  __int128 v892;
  __int128 v893;
  __int128 v894;
  __int128 v895;
  __int128 v896;
  __int128 v897;
  __int128 v898;
  __int128 v899;
  __int128 v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  __int128 v912;
  __int128 v913;
  __int128 v914;
  __int128 v915;
  __int128 v916;
  __int128 v917;
  __int128 v918;
  __int128 v919;
  __int128 v920;
  __int128 v921;
  __int128 v922;
  __int128 v923;
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  __int128 v928;
  __int128 v929;
  __int128 v930;
  __int128 v931;
  __int128 v932;
  __int128 v933;
  __int128 v934;
  __int128 v935;
  __int128 v936;
  __int128 v937;
  __int128 v938;
  __int128 v939;
  __int128 v940;
  __int128 v941;
  __int128 v942;
  __int128 v943;
  __int128 v944;
  __int128 v945;
  __int128 v946;
  __int128 v947;
  __int128 v948;
  __int128 v949;
  __int128 v950;
  __int128 v951;
  __int128 v952;
  __int128 v953;
  __int128 v954;
  __int128 v955;
  __int128 v956;
  __int128 v957;
  __int128 v958;
  __int128 v959;
  __int128 v960;
  __int128 v961;
  __int128 v962;
  __int128 v963;
  __int128 v964;
  __int128 v965;
  __int128 v966;
  __int128 v967;
  __int128 v968;
  __int128 v969;
  __int128 v970;
  __int128 v971;
  __int128 v972;
  __int128 v973;
  __int128 v974;
  __int128 v975;
  __int128 v976;
  __int128 v977;
  __int128 v978;
  __int128 v979;
  __int128 v980;
  __int128 v981;
  __int128 v982;
  __int128 v983;
  __int128 v984;
  __int128 v985;
  __int128 v986;
  __int128 v987;
  __int128 v988;
  __int128 v989;
  __int128 v990;
  __int128 v991;
  __int128 v992;
  __int128 v993;
  __int128 v994;
  __int128 v995;
  __int128 v996;
  __int128 v997;
  __int128 v998;
  __int128 v999;
  __int128 v1000;
  __int128 v1001;
  __int128 v1002;
  __int128 v1003;
  __int128 v1004;
  __int128 v1005;
  __int128 v1006;
  __int128 v1007;
  __int128 v1008;
  __int128 v1009;
  __int128 v1010;
  __int128 v1011;
  __int128 v1012;
  __int128 v1013;
  __int128 v1014;
  __int128 v1015;
  __int128 v1016;
  __int128 v1017;
  __int128 v1018;
  __int128 v1019;
  __int128 v1020;
  __int128 v1021;
  __int128 v1022;
  __int128 v1023;
  __int128 v1024;
  __int128 v1025;
  __int128 v1026;
  __int128 v1027;
  __int128 v1028;
  _BYTE v1029[128];
  _BYTE v1030[128];
  _BYTE v1031[128];
  _BYTE v1032[128];
  _BYTE v1033[128];
  _BYTE v1034[128];
  _BYTE v1035[128];
  _BYTE v1036[128];
  _BYTE v1037[128];
  _BYTE v1038[128];
  _BYTE v1039[128];
  _BYTE v1040[128];
  _BYTE v1041[128];
  _BYTE v1042[128];
  _BYTE v1043[128];
  _BYTE v1044[128];
  _BYTE v1045[128];
  _BYTE v1046[128];
  _BYTE v1047[128];
  _BYTE v1048[128];
  _BYTE v1049[128];
  _BYTE v1050[128];
  _BYTE v1051[128];
  _BYTE v1052[128];
  _BYTE v1053[128];
  _BYTE v1054[128];
  _BYTE v1055[128];
  _BYTE v1056[128];
  _BYTE v1057[128];
  _BYTE v1058[128];
  _BYTE v1059[128];
  _BYTE v1060[128];
  _BYTE v1061[128];
  _BYTE v1062[128];
  _BYTE v1063[128];
  _BYTE v1064[128];
  _BYTE v1065[128];
  _BYTE v1066[128];
  _BYTE v1067[128];
  _BYTE v1068[128];
  _BYTE v1069[128];
  _BYTE v1070[128];
  _BYTE v1071[128];
  _BYTE v1072[128];
  _BYTE v1073[128];
  _BYTE v1074[128];
  _BYTE v1075[128];
  _BYTE v1076[128];
  _BYTE v1077[128];
  _BYTE v1078[128];
  _BYTE v1079[128];
  _BYTE v1080[128];
  _BYTE v1081[128];
  _BYTE v1082[128];
  _BYTE v1083[128];
  _BYTE v1084[128];
  _BYTE v1085[128];
  _BYTE v1086[128];
  _BYTE v1087[128];
  _BYTE v1088[128];
  _BYTE v1089[128];
  _BYTE v1090[128];
  _BYTE v1091[128];
  _BYTE v1092[128];
  _BYTE v1093[128];
  _BYTE v1094[128];
  _BYTE v1095[128];
  _BYTE v1096[128];
  _BYTE v1097[128];
  _BYTE v1098[128];
  _BYTE v1099[128];
  _BYTE v1100[128];
  _BYTE v1101[128];
  _BYTE v1102[128];
  _BYTE v1103[128];
  _BYTE v1104[128];
  _BYTE v1105[128];
  _BYTE v1106[128];
  _BYTE v1107[128];
  _BYTE v1108[128];
  _BYTE v1109[128];
  _BYTE v1110[128];
  _BYTE v1111[128];
  _BYTE v1112[128];
  _BYTE v1113[128];
  _BYTE v1114[128];
  _BYTE v1115[128];
  _BYTE v1116[128];
  _BYTE v1117[128];
  _BYTE v1118[128];
  _BYTE v1119[128];
  _BYTE v1120[128];
  _BYTE v1121[128];
  uint64_t v1122;

  v1122 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_kCellularPerClientProfileTriggerCounts, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPerClientProfileTriggerCounts, "count"));
    v1025 = 0u;
    v1026 = 0u;
    v1027 = 0u;
    v1028 = 0u;
    v5 = self->_kCellularPerClientProfileTriggerCounts;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v1025, v1121, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v1026;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v1026 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v1025 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v1025, v1121, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("kCellularPerClientProfileTriggerCount"));
  }
  if (-[NSMutableArray count](self->_kCellularProtocolStackCpuStats, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackCpuStats, "count"));
    v1021 = 0u;
    v1022 = 0u;
    v1023 = 0u;
    v1024 = 0u;
    v12 = self->_kCellularProtocolStackCpuStats;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v1021, v1120, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v1022;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v1022 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v1021 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v1021, v1120, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("kCellularProtocolStackCpuStats"));
  }
  if (-[NSMutableArray count](self->_kCellularPeripheralStats, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPeripheralStats, "count"));
    v1017 = 0u;
    v1018 = 0u;
    v1019 = 0u;
    v1020 = 0u;
    v19 = self->_kCellularPeripheralStats;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v1017, v1119, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v1018;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v1018 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v1017 + 1) + 8 * v23), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v1017, v1119, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("kCellularPeripheralStats"));
  }
  if (-[NSMutableArray count](self->_kCellularDvfsStats, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDvfsStats, "count"));
    v1013 = 0u;
    v1014 = 0u;
    v1015 = 0u;
    v1016 = 0u;
    v26 = self->_kCellularDvfsStats;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v1013, v1118, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v1014;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v1014 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v1013 + 1) + 8 * v30), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v1013, v1118, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("kCellularDvfsStats"));
  }
  if (-[NSMutableArray count](self->_kCellularLteWcdmaGsmHwStats, "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteWcdmaGsmHwStats, "count"));
    v1009 = 0u;
    v1010 = 0u;
    v1011 = 0u;
    v1012 = 0u;
    v33 = self->_kCellularLteWcdmaGsmHwStats;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v1009, v1117, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v1010;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v1010 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v1009 + 1) + 8 * v37), "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

          ++v37;
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v1009, v1117, 16);
      }
      while (v35);
    }

    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("kCellularLteWcdmaGsmHwStats"));
  }
  if (-[NSMutableArray count](self->_kCellularLteTdsGsmHwStats, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTdsGsmHwStats, "count"));
    v1005 = 0u;
    v1006 = 0u;
    v1007 = 0u;
    v1008 = 0u;
    v40 = self->_kCellularLteTdsGsmHwStats;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v1005, v1116, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v1006;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v1006 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v1005 + 1) + 8 * v44), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

          ++v44;
        }
        while (v42 != v44);
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v1005, v1116, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("kCellularLteTdsGsmHwStats"));
  }
  if (-[NSMutableArray count](self->_kCellularPmuAverageCurrents, "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPmuAverageCurrents, "count"));
    v1001 = 0u;
    v1002 = 0u;
    v1003 = 0u;
    v1004 = 0u;
    v47 = self->_kCellularPmuAverageCurrents;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v1001, v1115, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v1002;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v1002 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v1001 + 1) + 8 * v51), "dictionaryRepresentation");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v52);

          ++v51;
        }
        while (v49 != v51);
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v1001, v1115, 16);
      }
      while (v49);
    }

    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("kCellularPmuAverageCurrent"));
  }
  if (-[NSMutableArray count](self->_kCellularFwCoreStats, "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularFwCoreStats, "count"));
    v997 = 0u;
    v998 = 0u;
    v999 = 0u;
    v1000 = 0u;
    v54 = self->_kCellularFwCoreStats;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v997, v1114, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v998;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v998 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v997 + 1) + 8 * v58), "dictionaryRepresentation");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v59);

          ++v58;
        }
        while (v56 != v58);
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v997, v1114, 16);
      }
      while (v56);
    }

    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("kCellularFwCoreStats"));
  }
  if (-[NSMutableArray count](self->_kCellularLteWcdmaTdsHwStats, "count"))
  {
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteWcdmaTdsHwStats, "count"));
    v993 = 0u;
    v994 = 0u;
    v995 = 0u;
    v996 = 0u;
    v61 = self->_kCellularLteWcdmaTdsHwStats;
    v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v993, v1113, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v994;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v994 != v64)
            objc_enumerationMutation(v61);
          objc_msgSend(*(id *)(*((_QWORD *)&v993 + 1) + 8 * v65), "dictionaryRepresentation");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v66);

          ++v65;
        }
        while (v63 != v65);
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v993, v1113, 16);
      }
      while (v63);
    }

    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("kCellularLteWcdmaTdsHwStats"));
  }
  if (-[NSMutableArray count](self->_kCellularPmicHwStats, "count"))
  {
    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPmicHwStats, "count"));
    v989 = 0u;
    v990 = 0u;
    v991 = 0u;
    v992 = 0u;
    v68 = self->_kCellularPmicHwStats;
    v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v989, v1112, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v990;
      do
      {
        v72 = 0;
        do
        {
          if (*(_QWORD *)v990 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(*(id *)(*((_QWORD *)&v989 + 1) + 8 * v72), "dictionaryRepresentation");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v73);

          ++v72;
        }
        while (v70 != v72);
        v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v989, v1112, 16);
      }
      while (v70);
    }

    objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("kCellularPmicHwStats"));
  }
  if (-[NSMutableArray count](self->_kCellularGsmServingCellRssiHists, "count"))
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmServingCellRssiHists, "count"));
    v985 = 0u;
    v986 = 0u;
    v987 = 0u;
    v988 = 0u;
    v75 = self->_kCellularGsmServingCellRssiHists;
    v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v985, v1111, 16);
    if (v76)
    {
      v77 = v76;
      v78 = *(_QWORD *)v986;
      do
      {
        v79 = 0;
        do
        {
          if (*(_QWORD *)v986 != v78)
            objc_enumerationMutation(v75);
          objc_msgSend(*(id *)(*((_QWORD *)&v985 + 1) + 8 * v79), "dictionaryRepresentation");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "addObject:", v80);

          ++v79;
        }
        while (v77 != v79);
        v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v985, v1111, 16);
      }
      while (v77);
    }

    objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("kCellularGsmServingCellRssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularGsmServingCellSnrHists, "count"))
  {
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmServingCellSnrHists, "count"));
    v981 = 0u;
    v982 = 0u;
    v983 = 0u;
    v984 = 0u;
    v82 = self->_kCellularGsmServingCellSnrHists;
    v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v981, v1110, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v982;
      do
      {
        v86 = 0;
        do
        {
          if (*(_QWORD *)v982 != v85)
            objc_enumerationMutation(v82);
          objc_msgSend(*(id *)(*((_QWORD *)&v981 + 1) + 8 * v86), "dictionaryRepresentation");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v87);

          ++v86;
        }
        while (v84 != v86);
        v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v981, v1110, 16);
      }
      while (v84);
    }

    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("kCellularGsmServingCellSnrHist"));
  }
  if (-[NSMutableArray count](self->_kCellularGsmTxPowerHists, "count"))
  {
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmTxPowerHists, "count"));
    v977 = 0u;
    v978 = 0u;
    v979 = 0u;
    v980 = 0u;
    v89 = self->_kCellularGsmTxPowerHists;
    v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v977, v1109, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v978;
      do
      {
        v93 = 0;
        do
        {
          if (*(_QWORD *)v978 != v92)
            objc_enumerationMutation(v89);
          objc_msgSend(*(id *)(*((_QWORD *)&v977 + 1) + 8 * v93), "dictionaryRepresentation");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "addObject:", v94);

          ++v93;
        }
        while (v91 != v93);
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v977, v1109, 16);
      }
      while (v91);
    }

    objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("kCellularGsmTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularGsmConnectedModeHists, "count"))
  {
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmConnectedModeHists, "count"));
    v973 = 0u;
    v974 = 0u;
    v975 = 0u;
    v976 = 0u;
    v96 = self->_kCellularGsmConnectedModeHists;
    v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v973, v1108, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v974;
      do
      {
        v100 = 0;
        do
        {
          if (*(_QWORD *)v974 != v99)
            objc_enumerationMutation(v96);
          objc_msgSend(*(id *)(*((_QWORD *)&v973 + 1) + 8 * v100), "dictionaryRepresentation");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "addObject:", v101);

          ++v100;
        }
        while (v98 != v100);
        v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v973, v1108, 16);
      }
      while (v98);
    }

    objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("kCellularGsmConnectedModeHist"));
  }
  if (-[NSMutableArray count](self->_kCellularGsmL1States, "count"))
  {
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmL1States, "count"));
    v969 = 0u;
    v970 = 0u;
    v971 = 0u;
    v972 = 0u;
    v103 = self->_kCellularGsmL1States;
    v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v969, v1107, 16);
    if (v104)
    {
      v105 = v104;
      v106 = *(_QWORD *)v970;
      do
      {
        v107 = 0;
        do
        {
          if (*(_QWORD *)v970 != v106)
            objc_enumerationMutation(v103);
          objc_msgSend(*(id *)(*((_QWORD *)&v969 + 1) + 8 * v107), "dictionaryRepresentation");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "addObject:", v108);

          ++v107;
        }
        while (v105 != v107);
        v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v969, v1107, 16);
      }
      while (v105);
    }

    objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("kCellularGsmL1State"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaCpcStats, "count"))
  {
    v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaCpcStats, "count"));
    v965 = 0u;
    v966 = 0u;
    v967 = 0u;
    v968 = 0u;
    v110 = self->_kCellularWcdmaCpcStats;
    v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v965, v1106, 16);
    if (v111)
    {
      v112 = v111;
      v113 = *(_QWORD *)v966;
      do
      {
        v114 = 0;
        do
        {
          if (*(_QWORD *)v966 != v113)
            objc_enumerationMutation(v110);
          objc_msgSend(*(id *)(*((_QWORD *)&v965 + 1) + 8 * v114), "dictionaryRepresentation");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "addObject:", v115);

          ++v114;
        }
        while (v112 != v114);
        v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v965, v1106, 16);
      }
      while (v112);
    }

    objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("kCellularWcdmaCpcStat"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRxDiversityHists, "count"))
  {
    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRxDiversityHists, "count"));
    v961 = 0u;
    v962 = 0u;
    v963 = 0u;
    v964 = 0u;
    v117 = self->_kCellularWcdmaRxDiversityHists;
    v118 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v117, "countByEnumeratingWithState:objects:count:", &v961, v1105, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v962;
      do
      {
        v121 = 0;
        do
        {
          if (*(_QWORD *)v962 != v120)
            objc_enumerationMutation(v117);
          objc_msgSend(*(id *)(*((_QWORD *)&v961 + 1) + 8 * v121), "dictionaryRepresentation");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "addObject:", v122);

          ++v121;
        }
        while (v119 != v121);
        v119 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v117, "countByEnumeratingWithState:objects:count:", &v961, v1105, 16);
      }
      while (v119);
    }

    objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("kCellularWcdmaRxDiversityHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaServingCellRx0RssiHists, "count"))
  {
    v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0RssiHists, "count"));
    v957 = 0u;
    v958 = 0u;
    v959 = 0u;
    v960 = 0u;
    v124 = self->_kCellularWcdmaServingCellRx0RssiHists;
    v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v957, v1104, 16);
    if (v125)
    {
      v126 = v125;
      v127 = *(_QWORD *)v958;
      do
      {
        v128 = 0;
        do
        {
          if (*(_QWORD *)v958 != v127)
            objc_enumerationMutation(v124);
          objc_msgSend(*(id *)(*((_QWORD *)&v957 + 1) + 8 * v128), "dictionaryRepresentation");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObject:", v129);

          ++v128;
        }
        while (v126 != v128);
        v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v957, v1104, 16);
      }
      while (v126);
    }

    objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("kCellularWcdmaServingCellRx0RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaServingCellRx1RssiHists, "count"))
  {
    v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1RssiHists, "count"));
    v953 = 0u;
    v954 = 0u;
    v955 = 0u;
    v956 = 0u;
    v131 = self->_kCellularWcdmaServingCellRx1RssiHists;
    v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v131, "countByEnumeratingWithState:objects:count:", &v953, v1103, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v954;
      do
      {
        v135 = 0;
        do
        {
          if (*(_QWORD *)v954 != v134)
            objc_enumerationMutation(v131);
          objc_msgSend(*(id *)(*((_QWORD *)&v953 + 1) + 8 * v135), "dictionaryRepresentation");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "addObject:", v136);

          ++v135;
        }
        while (v133 != v135);
        v133 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v131, "countByEnumeratingWithState:objects:count:", &v953, v1103, 16);
      }
      while (v133);
    }

    objc_msgSend(v3, "setObject:forKey:", v130, CFSTR("kCellularWcdmaServingCellRx1RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaServingCellRx0EcNoHists, "count"))
  {
    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0EcNoHists, "count"));
    v949 = 0u;
    v950 = 0u;
    v951 = 0u;
    v952 = 0u;
    v138 = self->_kCellularWcdmaServingCellRx0EcNoHists;
    v139 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v949, v1102, 16);
    if (v139)
    {
      v140 = v139;
      v141 = *(_QWORD *)v950;
      do
      {
        v142 = 0;
        do
        {
          if (*(_QWORD *)v950 != v141)
            objc_enumerationMutation(v138);
          objc_msgSend(*(id *)(*((_QWORD *)&v949 + 1) + 8 * v142), "dictionaryRepresentation");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "addObject:", v143);

          ++v142;
        }
        while (v140 != v142);
        v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v949, v1102, 16);
      }
      while (v140);
    }

    objc_msgSend(v3, "setObject:forKey:", v137, CFSTR("kCellularWcdmaServingCellRx0EcNoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaServingCellRx1EcNoHists, "count"))
  {
    v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1EcNoHists, "count"));
    v945 = 0u;
    v946 = 0u;
    v947 = 0u;
    v948 = 0u;
    v145 = self->_kCellularWcdmaServingCellRx1EcNoHists;
    v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v945, v1101, 16);
    if (v146)
    {
      v147 = v146;
      v148 = *(_QWORD *)v946;
      do
      {
        v149 = 0;
        do
        {
          if (*(_QWORD *)v946 != v148)
            objc_enumerationMutation(v145);
          objc_msgSend(*(id *)(*((_QWORD *)&v945 + 1) + 8 * v149), "dictionaryRepresentation");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "addObject:", v150);

          ++v149;
        }
        while (v147 != v149);
        v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v945, v1101, 16);
      }
      while (v147);
    }

    objc_msgSend(v3, "setObject:forKey:", v144, CFSTR("kCellularWcdmaServingCellRx1EcNoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaTxPowerHists, "count"))
  {
    v151 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaTxPowerHists, "count"));
    v941 = 0u;
    v942 = 0u;
    v943 = 0u;
    v944 = 0u;
    v152 = self->_kCellularWcdmaTxPowerHists;
    v153 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v152, "countByEnumeratingWithState:objects:count:", &v941, v1100, 16);
    if (v153)
    {
      v154 = v153;
      v155 = *(_QWORD *)v942;
      do
      {
        v156 = 0;
        do
        {
          if (*(_QWORD *)v942 != v155)
            objc_enumerationMutation(v152);
          objc_msgSend(*(id *)(*((_QWORD *)&v941 + 1) + 8 * v156), "dictionaryRepresentation");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "addObject:", v157);

          ++v156;
        }
        while (v154 != v156);
        v154 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v152, "countByEnumeratingWithState:objects:count:", &v941, v1100, 16);
      }
      while (v154);
    }

    objc_msgSend(v3, "setObject:forKey:", v151, CFSTR("kCellularWcdmaTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC0Hists, "count"))
  {
    v158 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC0Hists, "count"));
    v937 = 0u;
    v938 = 0u;
    v939 = 0u;
    v940 = 0u;
    v159 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
    v160 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v159, "countByEnumeratingWithState:objects:count:", &v937, v1099, 16);
    if (v160)
    {
      v161 = v160;
      v162 = *(_QWORD *)v938;
      do
      {
        v163 = 0;
        do
        {
          if (*(_QWORD *)v938 != v162)
            objc_enumerationMutation(v159);
          objc_msgSend(*(id *)(*((_QWORD *)&v937 + 1) + 8 * v163), "dictionaryRepresentation");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "addObject:", v164);

          ++v163;
        }
        while (v161 != v163);
        v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v159, "countByEnumeratingWithState:objects:count:", &v937, v1099, 16);
      }
      while (v161);
    }

    objc_msgSend(v3, "setObject:forKey:", v158, CFSTR("kCellularWcdmaReceiverStatusOnC0Hist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC1Hists, "count"))
  {
    v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC1Hists, "count"));
    v933 = 0u;
    v934 = 0u;
    v935 = 0u;
    v936 = 0u;
    v166 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
    v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v933, v1098, 16);
    if (v167)
    {
      v168 = v167;
      v169 = *(_QWORD *)v934;
      do
      {
        v170 = 0;
        do
        {
          if (*(_QWORD *)v934 != v169)
            objc_enumerationMutation(v166);
          objc_msgSend(*(id *)(*((_QWORD *)&v933 + 1) + 8 * v170), "dictionaryRepresentation");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "addObject:", v171);

          ++v170;
        }
        while (v168 != v170);
        v168 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v933, v1098, 16);
      }
      while (v168);
    }

    objc_msgSend(v3, "setObject:forKey:", v165, CFSTR("kCellularWcdmaReceiverStatusOnC1Hist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaCarrierStatusHists, "count"))
  {
    v172 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaCarrierStatusHists, "count"));
    v929 = 0u;
    v930 = 0u;
    v931 = 0u;
    v932 = 0u;
    v173 = self->_kCellularWcdmaCarrierStatusHists;
    v174 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v173, "countByEnumeratingWithState:objects:count:", &v929, v1097, 16);
    if (v174)
    {
      v175 = v174;
      v176 = *(_QWORD *)v930;
      do
      {
        v177 = 0;
        do
        {
          if (*(_QWORD *)v930 != v176)
            objc_enumerationMutation(v173);
          objc_msgSend(*(id *)(*((_QWORD *)&v929 + 1) + 8 * v177), "dictionaryRepresentation");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "addObject:", v178);

          ++v177;
        }
        while (v175 != v177);
        v175 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v173, "countByEnumeratingWithState:objects:count:", &v929, v1097, 16);
      }
      while (v175);
    }

    objc_msgSend(v3, "setObject:forKey:", v172, CFSTR("kCellularWcdmaCarrierStatusHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRabModeHists, "count"))
  {
    v179 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabModeHists, "count"));
    v925 = 0u;
    v926 = 0u;
    v927 = 0u;
    v928 = 0u;
    v180 = self->_kCellularWcdmaRabModeHists;
    v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v925, v1096, 16);
    if (v181)
    {
      v182 = v181;
      v183 = *(_QWORD *)v926;
      do
      {
        v184 = 0;
        do
        {
          if (*(_QWORD *)v926 != v183)
            objc_enumerationMutation(v180);
          objc_msgSend(*(id *)(*((_QWORD *)&v925 + 1) + 8 * v184), "dictionaryRepresentation");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "addObject:", v185);

          ++v184;
        }
        while (v182 != v184);
        v182 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v925, v1096, 16);
      }
      while (v182);
    }

    objc_msgSend(v3, "setObject:forKey:", v179, CFSTR("kCellularWcdmaRabModeHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRabTypeHists, "count"))
  {
    v186 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabTypeHists, "count"));
    v921 = 0u;
    v922 = 0u;
    v923 = 0u;
    v924 = 0u;
    v187 = self->_kCellularWcdmaRabTypeHists;
    v188 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v187, "countByEnumeratingWithState:objects:count:", &v921, v1095, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v922;
      do
      {
        v191 = 0;
        do
        {
          if (*(_QWORD *)v922 != v190)
            objc_enumerationMutation(v187);
          objc_msgSend(*(id *)(*((_QWORD *)&v921 + 1) + 8 * v191), "dictionaryRepresentation");
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "addObject:", v192);

          ++v191;
        }
        while (v189 != v191);
        v189 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v187, "countByEnumeratingWithState:objects:count:", &v921, v1095, 16);
      }
      while (v189);
    }

    objc_msgSend(v3, "setObject:forKey:", v186, CFSTR("kCellularWcdmaRabTypeHist"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRrcConnectionStates, "count"))
  {
    v193 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRrcConnectionStates, "count"));
    v917 = 0u;
    v918 = 0u;
    v919 = 0u;
    v920 = 0u;
    v194 = self->_kCellularWcdmaRrcConnectionStates;
    v195 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v194, "countByEnumeratingWithState:objects:count:", &v917, v1094, 16);
    if (v195)
    {
      v196 = v195;
      v197 = *(_QWORD *)v918;
      do
      {
        v198 = 0;
        do
        {
          if (*(_QWORD *)v918 != v197)
            objc_enumerationMutation(v194);
          objc_msgSend(*(id *)(*((_QWORD *)&v917 + 1) + 8 * v198), "dictionaryRepresentation");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v193, "addObject:", v199);

          ++v198;
        }
        while (v196 != v198);
        v196 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v194, "countByEnumeratingWithState:objects:count:", &v917, v1094, 16);
      }
      while (v196);
    }

    objc_msgSend(v3, "setObject:forKey:", v193, CFSTR("kCellularWcdmaRrcConnectionState"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRrcConfigurations, "count"))
  {
    v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRrcConfigurations, "count"));
    v913 = 0u;
    v914 = 0u;
    v915 = 0u;
    v916 = 0u;
    v201 = self->_kCellularWcdmaRrcConfigurations;
    v202 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v201, "countByEnumeratingWithState:objects:count:", &v913, v1093, 16);
    if (v202)
    {
      v203 = v202;
      v204 = *(_QWORD *)v914;
      do
      {
        v205 = 0;
        do
        {
          if (*(_QWORD *)v914 != v204)
            objc_enumerationMutation(v201);
          objc_msgSend(*(id *)(*((_QWORD *)&v913 + 1) + 8 * v205), "dictionaryRepresentation");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "addObject:", v206);

          ++v205;
        }
        while (v203 != v205);
        v203 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v201, "countByEnumeratingWithState:objects:count:", &v913, v1093, 16);
      }
      while (v203);
    }

    objc_msgSend(v3, "setObject:forKey:", v200, CFSTR("kCellularWcdmaRrcConfiguration"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaRabStatus, "count"))
  {
    v207 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabStatus, "count"));
    v909 = 0u;
    v910 = 0u;
    v911 = 0u;
    v912 = 0u;
    v208 = self->_kCellularWcdmaRabStatus;
    v209 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v208, "countByEnumeratingWithState:objects:count:", &v909, v1092, 16);
    if (v209)
    {
      v210 = v209;
      v211 = *(_QWORD *)v910;
      do
      {
        v212 = 0;
        do
        {
          if (*(_QWORD *)v910 != v211)
            objc_enumerationMutation(v208);
          objc_msgSend(*(id *)(*((_QWORD *)&v909 + 1) + 8 * v212), "dictionaryRepresentation");
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "addObject:", v213);

          ++v212;
        }
        while (v210 != v212);
        v210 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v208, "countByEnumeratingWithState:objects:count:", &v909, v1092, 16);
      }
      while (v210);
    }

    objc_msgSend(v3, "setObject:forKey:", v207, CFSTR("kCellularWcdmaRabStatus"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaL1States, "count"))
  {
    v214 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaL1States, "count"));
    v905 = 0u;
    v906 = 0u;
    v907 = 0u;
    v908 = 0u;
    v215 = self->_kCellularWcdmaL1States;
    v216 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v905, v1091, 16);
    if (v216)
    {
      v217 = v216;
      v218 = *(_QWORD *)v906;
      do
      {
        v219 = 0;
        do
        {
          if (*(_QWORD *)v906 != v218)
            objc_enumerationMutation(v215);
          objc_msgSend(*(id *)(*((_QWORD *)&v905 + 1) + 8 * v219), "dictionaryRepresentation");
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "addObject:", v220);

          ++v219;
        }
        while (v217 != v219);
        v217 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v905, v1091, 16);
      }
      while (v217);
    }

    objc_msgSend(v3, "setObject:forKey:", v214, CFSTR("kCellularWcdmaL1State"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaDataInactivityBeforeIdles, "count"))
  {
    v221 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaDataInactivityBeforeIdles, "count"));
    v901 = 0u;
    v902 = 0u;
    v903 = 0u;
    v904 = 0u;
    v222 = self->_kCellularWcdmaDataInactivityBeforeIdles;
    v223 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v222, "countByEnumeratingWithState:objects:count:", &v901, v1090, 16);
    if (v223)
    {
      v224 = v223;
      v225 = *(_QWORD *)v902;
      do
      {
        v226 = 0;
        do
        {
          if (*(_QWORD *)v902 != v225)
            objc_enumerationMutation(v222);
          objc_msgSend(*(id *)(*((_QWORD *)&v901 + 1) + 8 * v226), "dictionaryRepresentation");
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "addObject:", v227);

          ++v226;
        }
        while (v224 != v226);
        v224 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v222, "countByEnumeratingWithState:objects:count:", &v901, v1090, 16);
      }
      while (v224);
    }

    objc_msgSend(v3, "setObject:forKey:", v221, CFSTR("kCellularWcdmaDataInactivityBeforeIdle"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaIdleToConnectedUserDatas, "count"))
  {
    v228 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaIdleToConnectedUserDatas, "count"));
    v897 = 0u;
    v898 = 0u;
    v899 = 0u;
    v900 = 0u;
    v229 = self->_kCellularWcdmaIdleToConnectedUserDatas;
    v230 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v229, "countByEnumeratingWithState:objects:count:", &v897, v1089, 16);
    if (v230)
    {
      v231 = v230;
      v232 = *(_QWORD *)v898;
      do
      {
        v233 = 0;
        do
        {
          if (*(_QWORD *)v898 != v232)
            objc_enumerationMutation(v229);
          objc_msgSend(*(id *)(*((_QWORD *)&v897 + 1) + 8 * v233), "dictionaryRepresentation");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v228, "addObject:", v234);

          ++v233;
        }
        while (v231 != v233);
        v231 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v229, "countByEnumeratingWithState:objects:count:", &v897, v1089, 16);
      }
      while (v231);
    }

    objc_msgSend(v3, "setObject:forKey:", v228, CFSTR("kCellularWcdmaIdleToConnectedUserData"));
  }
  if (-[NSMutableArray count](self->_kCellularWcdmaVadHists, "count"))
  {
    v235 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaVadHists, "count"));
    v893 = 0u;
    v894 = 0u;
    v895 = 0u;
    v896 = 0u;
    v236 = self->_kCellularWcdmaVadHists;
    v237 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v893, v1088, 16);
    if (v237)
    {
      v238 = v237;
      v239 = *(_QWORD *)v894;
      do
      {
        v240 = 0;
        do
        {
          if (*(_QWORD *)v894 != v239)
            objc_enumerationMutation(v236);
          objc_msgSend(*(id *)(*((_QWORD *)&v893 + 1) + 8 * v240), "dictionaryRepresentation");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v235, "addObject:", v241);

          ++v240;
        }
        while (v238 != v240);
        v238 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v236, "countByEnumeratingWithState:objects:count:", &v893, v1088, 16);
      }
      while (v238);
    }

    objc_msgSend(v3, "setObject:forKey:", v235, CFSTR("kCellularWcdmaVadHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsRxDiversityHists, "count"))
  {
    v242 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRxDiversityHists, "count"));
    v889 = 0u;
    v890 = 0u;
    v891 = 0u;
    v892 = 0u;
    v243 = self->_kCellularTdsRxDiversityHists;
    v244 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v243, "countByEnumeratingWithState:objects:count:", &v889, v1087, 16);
    if (v244)
    {
      v245 = v244;
      v246 = *(_QWORD *)v890;
      do
      {
        v247 = 0;
        do
        {
          if (*(_QWORD *)v890 != v246)
            objc_enumerationMutation(v243);
          objc_msgSend(*(id *)(*((_QWORD *)&v889 + 1) + 8 * v247), "dictionaryRepresentation");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "addObject:", v248);

          ++v247;
        }
        while (v245 != v247);
        v245 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v243, "countByEnumeratingWithState:objects:count:", &v889, v1087, 16);
      }
      while (v245);
    }

    objc_msgSend(v3, "setObject:forKey:", v242, CFSTR("kCellularTdsRxDiversityHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsServingCellRx0RssiHists, "count"))
  {
    v249 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx0RssiHists, "count"));
    v885 = 0u;
    v886 = 0u;
    v887 = 0u;
    v888 = 0u;
    v250 = self->_kCellularTdsServingCellRx0RssiHists;
    v251 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v885, v1086, 16);
    if (v251)
    {
      v252 = v251;
      v253 = *(_QWORD *)v886;
      do
      {
        v254 = 0;
        do
        {
          if (*(_QWORD *)v886 != v253)
            objc_enumerationMutation(v250);
          objc_msgSend(*(id *)(*((_QWORD *)&v885 + 1) + 8 * v254), "dictionaryRepresentation");
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "addObject:", v255);

          ++v254;
        }
        while (v252 != v254);
        v252 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v885, v1086, 16);
      }
      while (v252);
    }

    objc_msgSend(v3, "setObject:forKey:", v249, CFSTR("kCellularTdsServingCellRx0RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsServingCellRx1RssiHists, "count"))
  {
    v256 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx1RssiHists, "count"));
    v881 = 0u;
    v882 = 0u;
    v883 = 0u;
    v884 = 0u;
    v257 = self->_kCellularTdsServingCellRx1RssiHists;
    v258 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v257, "countByEnumeratingWithState:objects:count:", &v881, v1085, 16);
    if (v258)
    {
      v259 = v258;
      v260 = *(_QWORD *)v882;
      do
      {
        v261 = 0;
        do
        {
          if (*(_QWORD *)v882 != v260)
            objc_enumerationMutation(v257);
          objc_msgSend(*(id *)(*((_QWORD *)&v881 + 1) + 8 * v261), "dictionaryRepresentation");
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v256, "addObject:", v262);

          ++v261;
        }
        while (v259 != v261);
        v259 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v257, "countByEnumeratingWithState:objects:count:", &v881, v1085, 16);
      }
      while (v259);
    }

    objc_msgSend(v3, "setObject:forKey:", v256, CFSTR("kCellularTdsServingCellRx1RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsServingCellRx0RscpHists, "count"))
  {
    v263 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx0RscpHists, "count"));
    v877 = 0u;
    v878 = 0u;
    v879 = 0u;
    v880 = 0u;
    v264 = self->_kCellularTdsServingCellRx0RscpHists;
    v265 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v877, v1084, 16);
    if (v265)
    {
      v266 = v265;
      v267 = *(_QWORD *)v878;
      do
      {
        v268 = 0;
        do
        {
          if (*(_QWORD *)v878 != v267)
            objc_enumerationMutation(v264);
          objc_msgSend(*(id *)(*((_QWORD *)&v877 + 1) + 8 * v268), "dictionaryRepresentation");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v263, "addObject:", v269);

          ++v268;
        }
        while (v266 != v268);
        v266 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v877, v1084, 16);
      }
      while (v266);
    }

    objc_msgSend(v3, "setObject:forKey:", v263, CFSTR("kCellularTdsServingCellRx0RscpHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsServingCellRx1RscpHists, "count"))
  {
    v270 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx1RscpHists, "count"));
    v873 = 0u;
    v874 = 0u;
    v875 = 0u;
    v876 = 0u;
    v271 = self->_kCellularTdsServingCellRx1RscpHists;
    v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v873, v1083, 16);
    if (v272)
    {
      v273 = v272;
      v274 = *(_QWORD *)v874;
      do
      {
        v275 = 0;
        do
        {
          if (*(_QWORD *)v874 != v274)
            objc_enumerationMutation(v271);
          objc_msgSend(*(id *)(*((_QWORD *)&v873 + 1) + 8 * v275), "dictionaryRepresentation");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v270, "addObject:", v276);

          ++v275;
        }
        while (v273 != v275);
        v273 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v873, v1083, 16);
      }
      while (v273);
    }

    objc_msgSend(v3, "setObject:forKey:", v270, CFSTR("kCellularTdsServingCellRx1RscpHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsTxPowerHists, "count"))
  {
    v277 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsTxPowerHists, "count"));
    v869 = 0u;
    v870 = 0u;
    v871 = 0u;
    v872 = 0u;
    v278 = self->_kCellularTdsTxPowerHists;
    v279 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v278, "countByEnumeratingWithState:objects:count:", &v869, v1082, 16);
    if (v279)
    {
      v280 = v279;
      v281 = *(_QWORD *)v870;
      do
      {
        v282 = 0;
        do
        {
          if (*(_QWORD *)v870 != v281)
            objc_enumerationMutation(v278);
          objc_msgSend(*(id *)(*((_QWORD *)&v869 + 1) + 8 * v282), "dictionaryRepresentation");
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "addObject:", v283);

          ++v282;
        }
        while (v280 != v282);
        v280 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v278, "countByEnumeratingWithState:objects:count:", &v869, v1082, 16);
      }
      while (v280);
    }

    objc_msgSend(v3, "setObject:forKey:", v277, CFSTR("kCellularTdsTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsRabModeHists, "count"))
  {
    v284 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRabModeHists, "count"));
    v865 = 0u;
    v866 = 0u;
    v867 = 0u;
    v868 = 0u;
    v285 = self->_kCellularTdsRabModeHists;
    v286 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v865, v1081, 16);
    if (v286)
    {
      v287 = v286;
      v288 = *(_QWORD *)v866;
      do
      {
        v289 = 0;
        do
        {
          if (*(_QWORD *)v866 != v288)
            objc_enumerationMutation(v285);
          objc_msgSend(*(id *)(*((_QWORD *)&v865 + 1) + 8 * v289), "dictionaryRepresentation");
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v284, "addObject:", v290);

          ++v289;
        }
        while (v287 != v289);
        v287 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v865, v1081, 16);
      }
      while (v287);
    }

    objc_msgSend(v3, "setObject:forKey:", v284, CFSTR("kCellularTdsRabModeHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsRabTypeHists, "count"))
  {
    v291 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRabTypeHists, "count"));
    v861 = 0u;
    v862 = 0u;
    v863 = 0u;
    v864 = 0u;
    v292 = self->_kCellularTdsRabTypeHists;
    v293 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v292, "countByEnumeratingWithState:objects:count:", &v861, v1080, 16);
    if (v293)
    {
      v294 = v293;
      v295 = *(_QWORD *)v862;
      do
      {
        v296 = 0;
        do
        {
          if (*(_QWORD *)v862 != v295)
            objc_enumerationMutation(v292);
          objc_msgSend(*(id *)(*((_QWORD *)&v861 + 1) + 8 * v296), "dictionaryRepresentation");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v291, "addObject:", v297);

          ++v296;
        }
        while (v294 != v296);
        v294 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v292, "countByEnumeratingWithState:objects:count:", &v861, v1080, 16);
      }
      while (v294);
    }

    objc_msgSend(v3, "setObject:forKey:", v291, CFSTR("kCellularTdsRabTypeHist"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsRrcStates, "count"))
  {
    v298 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRrcStates, "count"));
    v857 = 0u;
    v858 = 0u;
    v859 = 0u;
    v860 = 0u;
    v299 = self->_kCellularTdsRrcStates;
    v300 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v299, "countByEnumeratingWithState:objects:count:", &v857, v1079, 16);
    if (v300)
    {
      v301 = v300;
      v302 = *(_QWORD *)v858;
      do
      {
        v303 = 0;
        do
        {
          if (*(_QWORD *)v858 != v302)
            objc_enumerationMutation(v299);
          objc_msgSend(*(id *)(*((_QWORD *)&v857 + 1) + 8 * v303), "dictionaryRepresentation");
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v298, "addObject:", v304);

          ++v303;
        }
        while (v301 != v303);
        v301 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v299, "countByEnumeratingWithState:objects:count:", &v857, v1079, 16);
      }
      while (v301);
    }

    objc_msgSend(v3, "setObject:forKey:", v298, CFSTR("kCellularTdsRrcState"));
  }
  if (-[NSMutableArray count](self->_kCellularTdsL1States, "count"))
  {
    v305 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsL1States, "count"));
    v853 = 0u;
    v854 = 0u;
    v855 = 0u;
    v856 = 0u;
    v306 = self->_kCellularTdsL1States;
    v307 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v306, "countByEnumeratingWithState:objects:count:", &v853, v1078, 16);
    if (v307)
    {
      v308 = v307;
      v309 = *(_QWORD *)v854;
      do
      {
        v310 = 0;
        do
        {
          if (*(_QWORD *)v854 != v309)
            objc_enumerationMutation(v306);
          objc_msgSend(*(id *)(*((_QWORD *)&v853 + 1) + 8 * v310), "dictionaryRepresentation");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "addObject:", v311);

          ++v310;
        }
        while (v308 != v310);
        v308 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v306, "countByEnumeratingWithState:objects:count:", &v853, v1078, 16);
      }
      while (v308);
    }

    objc_msgSend(v3, "setObject:forKey:", v305, CFSTR("kCellularTdsL1State"));
  }
  if (-[NSMutableArray count](self->_kCellularLteFwDuplexModes, "count"))
  {
    v312 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteFwDuplexModes, "count"));
    v849 = 0u;
    v850 = 0u;
    v851 = 0u;
    v852 = 0u;
    v313 = self->_kCellularLteFwDuplexModes;
    v314 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v313, "countByEnumeratingWithState:objects:count:", &v849, v1077, 16);
    if (v314)
    {
      v315 = v314;
      v316 = *(_QWORD *)v850;
      do
      {
        v317 = 0;
        do
        {
          if (*(_QWORD *)v850 != v316)
            objc_enumerationMutation(v313);
          objc_msgSend(*(id *)(*((_QWORD *)&v849 + 1) + 8 * v317), "dictionaryRepresentation");
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v312, "addObject:", v318);

          ++v317;
        }
        while (v315 != v317);
        v315 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v313, "countByEnumeratingWithState:objects:count:", &v849, v1077, 16);
      }
      while (v315);
    }

    objc_msgSend(v3, "setObject:forKey:", v312, CFSTR("kCellularLteFwDuplexMode"));
  }
  if (-[NSMutableArray count](self->_kCellularLteServingCellRsrpHists, "count"))
  {
    v319 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteServingCellRsrpHists, "count"));
    v845 = 0u;
    v846 = 0u;
    v847 = 0u;
    v848 = 0u;
    v320 = self->_kCellularLteServingCellRsrpHists;
    v321 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v845, v1076, 16);
    if (v321)
    {
      v322 = v321;
      v323 = *(_QWORD *)v846;
      do
      {
        v324 = 0;
        do
        {
          if (*(_QWORD *)v846 != v323)
            objc_enumerationMutation(v320);
          objc_msgSend(*(id *)(*((_QWORD *)&v845 + 1) + 8 * v324), "dictionaryRepresentation");
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "addObject:", v325);

          ++v324;
        }
        while (v322 != v324);
        v322 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v845, v1076, 16);
      }
      while (v322);
    }

    objc_msgSend(v3, "setObject:forKey:", v319, CFSTR("kCellularLteServingCellRsrpHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteServingCellSinrHists, "count"))
  {
    v326 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteServingCellSinrHists, "count"));
    v841 = 0u;
    v842 = 0u;
    v843 = 0u;
    v844 = 0u;
    v327 = self->_kCellularLteServingCellSinrHists;
    v328 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v327, "countByEnumeratingWithState:objects:count:", &v841, v1075, 16);
    if (v328)
    {
      v329 = v328;
      v330 = *(_QWORD *)v842;
      do
      {
        v331 = 0;
        do
        {
          if (*(_QWORD *)v842 != v330)
            objc_enumerationMutation(v327);
          objc_msgSend(*(id *)(*((_QWORD *)&v841 + 1) + 8 * v331), "dictionaryRepresentation");
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v326, "addObject:", v332);

          ++v331;
        }
        while (v329 != v331);
        v329 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v327, "countByEnumeratingWithState:objects:count:", &v841, v1075, 16);
      }
      while (v329);
    }

    objc_msgSend(v3, "setObject:forKey:", v326, CFSTR("kCellularLteServingCellSinrHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteSleepStateHists, "count"))
  {
    v333 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteSleepStateHists, "count"));
    v837 = 0u;
    v838 = 0u;
    v839 = 0u;
    v840 = 0u;
    v334 = self->_kCellularLteSleepStateHists;
    v335 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v334, "countByEnumeratingWithState:objects:count:", &v837, v1074, 16);
    if (v335)
    {
      v336 = v335;
      v337 = *(_QWORD *)v838;
      do
      {
        v338 = 0;
        do
        {
          if (*(_QWORD *)v838 != v337)
            objc_enumerationMutation(v334);
          objc_msgSend(*(id *)(*((_QWORD *)&v837 + 1) + 8 * v338), "dictionaryRepresentation");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v333, "addObject:", v339);

          ++v338;
        }
        while (v336 != v338);
        v336 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v334, "countByEnumeratingWithState:objects:count:", &v837, v1074, 16);
      }
      while (v336);
    }

    objc_msgSend(v3, "setObject:forKey:", v333, CFSTR("kCellularLteSleepStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteTxPowerHists, "count"))
  {
    v340 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTxPowerHists, "count"));
    v833 = 0u;
    v834 = 0u;
    v835 = 0u;
    v836 = 0u;
    v341 = self->_kCellularLteTxPowerHists;
    v342 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v341, "countByEnumeratingWithState:objects:count:", &v833, v1073, 16);
    if (v342)
    {
      v343 = v342;
      v344 = *(_QWORD *)v834;
      do
      {
        v345 = 0;
        do
        {
          if (*(_QWORD *)v834 != v344)
            objc_enumerationMutation(v341);
          objc_msgSend(*(id *)(*((_QWORD *)&v833 + 1) + 8 * v345), "dictionaryRepresentation");
          v346 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v340, "addObject:", v346);

          ++v345;
        }
        while (v343 != v345);
        v343 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v341, "countByEnumeratingWithState:objects:count:", &v833, v1073, 16);
      }
      while (v343);
    }

    objc_msgSend(v3, "setObject:forKey:", v340, CFSTR("kCellularLteTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteDlSccStateHists, "count"))
  {
    v347 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDlSccStateHists, "count"));
    v829 = 0u;
    v830 = 0u;
    v831 = 0u;
    v832 = 0u;
    v348 = self->_kCellularLteDlSccStateHists;
    v349 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v348, "countByEnumeratingWithState:objects:count:", &v829, v1072, 16);
    if (v349)
    {
      v350 = v349;
      v351 = *(_QWORD *)v830;
      do
      {
        v352 = 0;
        do
        {
          if (*(_QWORD *)v830 != v351)
            objc_enumerationMutation(v348);
          objc_msgSend(*(id *)(*((_QWORD *)&v829 + 1) + 8 * v352), "dictionaryRepresentation");
          v353 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v347, "addObject:", v353);

          ++v352;
        }
        while (v350 != v352);
        v350 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v348, "countByEnumeratingWithState:objects:count:", &v829, v1072, 16);
      }
      while (v350);
    }

    objc_msgSend(v3, "setObject:forKey:", v347, CFSTR("kCellularLteDlSccStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteUlSccStateHists, "count"))
  {
    v354 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteUlSccStateHists, "count"));
    v825 = 0u;
    v826 = 0u;
    v827 = 0u;
    v828 = 0u;
    v355 = self->_kCellularLteUlSccStateHists;
    v356 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v825, v1071, 16);
    if (v356)
    {
      v357 = v356;
      v358 = *(_QWORD *)v826;
      do
      {
        v359 = 0;
        do
        {
          if (*(_QWORD *)v826 != v358)
            objc_enumerationMutation(v355);
          objc_msgSend(*(id *)(*((_QWORD *)&v825 + 1) + 8 * v359), "dictionaryRepresentation");
          v360 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v354, "addObject:", v360);

          ++v359;
        }
        while (v357 != v359);
        v357 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v825, v1071, 16);
      }
      while (v357);
    }

    objc_msgSend(v3, "setObject:forKey:", v354, CFSTR("kCellularLteUlSccStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteAdvancedRxStateHists, "count"))
  {
    v361 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteAdvancedRxStateHists, "count"));
    v821 = 0u;
    v822 = 0u;
    v823 = 0u;
    v824 = 0u;
    v362 = self->_kCellularLteAdvancedRxStateHists;
    v363 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v362, "countByEnumeratingWithState:objects:count:", &v821, v1070, 16);
    if (v363)
    {
      v364 = v363;
      v365 = *(_QWORD *)v822;
      do
      {
        v366 = 0;
        do
        {
          if (*(_QWORD *)v822 != v365)
            objc_enumerationMutation(v362);
          objc_msgSend(*(id *)(*((_QWORD *)&v821 + 1) + 8 * v366), "dictionaryRepresentation");
          v367 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v361, "addObject:", v367);

          ++v366;
        }
        while (v364 != v366);
        v364 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v362, "countByEnumeratingWithState:objects:count:", &v821, v1070, 16);
      }
      while (v364);
    }

    objc_msgSend(v3, "setObject:forKey:", v361, CFSTR("kCellularLteAdvancedRxStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteComponentCarrierInfos, "count"))
  {
    v368 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteComponentCarrierInfos, "count"));
    v817 = 0u;
    v818 = 0u;
    v819 = 0u;
    v820 = 0u;
    v369 = self->_kCellularLteComponentCarrierInfos;
    v370 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v369, "countByEnumeratingWithState:objects:count:", &v817, v1069, 16);
    if (v370)
    {
      v371 = v370;
      v372 = *(_QWORD *)v818;
      do
      {
        v373 = 0;
        do
        {
          if (*(_QWORD *)v818 != v372)
            objc_enumerationMutation(v369);
          objc_msgSend(*(id *)(*((_QWORD *)&v817 + 1) + 8 * v373), "dictionaryRepresentation");
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v368, "addObject:", v374);

          ++v373;
        }
        while (v371 != v373);
        v371 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v369, "countByEnumeratingWithState:objects:count:", &v817, v1069, 16);
      }
      while (v371);
    }

    objc_msgSend(v3, "setObject:forKey:", v368, CFSTR("kCellularLteComponentCarrierInfo"));
  }
  if (-[NSMutableArray count](self->_kCellularLteRxTxStateHists, "count"))
  {
    v375 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRxTxStateHists, "count"));
    v813 = 0u;
    v814 = 0u;
    v815 = 0u;
    v816 = 0u;
    v376 = self->_kCellularLteRxTxStateHists;
    v377 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v376, "countByEnumeratingWithState:objects:count:", &v813, v1068, 16);
    if (v377)
    {
      v378 = v377;
      v379 = *(_QWORD *)v814;
      do
      {
        v380 = 0;
        do
        {
          if (*(_QWORD *)v814 != v379)
            objc_enumerationMutation(v376);
          objc_msgSend(*(id *)(*((_QWORD *)&v813 + 1) + 8 * v380), "dictionaryRepresentation");
          v381 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v375, "addObject:", v381);

          ++v380;
        }
        while (v378 != v380);
        v378 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v376, "countByEnumeratingWithState:objects:count:", &v813, v1068, 16);
      }
      while (v378);
    }

    objc_msgSend(v3, "setObject:forKey:", v375, CFSTR("kCellularLteRxTxStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteTotalDlTbsHists, "count"))
  {
    v382 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTotalDlTbsHists, "count"));
    v809 = 0u;
    v810 = 0u;
    v811 = 0u;
    v812 = 0u;
    v383 = self->_kCellularLteTotalDlTbsHists;
    v384 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v383, "countByEnumeratingWithState:objects:count:", &v809, v1067, 16);
    if (v384)
    {
      v385 = v384;
      v386 = *(_QWORD *)v810;
      do
      {
        v387 = 0;
        do
        {
          if (*(_QWORD *)v810 != v386)
            objc_enumerationMutation(v383);
          objc_msgSend(*(id *)(*((_QWORD *)&v809 + 1) + 8 * v387), "dictionaryRepresentation");
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v382, "addObject:", v388);

          ++v387;
        }
        while (v385 != v387);
        v385 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v383, "countByEnumeratingWithState:objects:count:", &v809, v1067, 16);
      }
      while (v385);
    }

    objc_msgSend(v3, "setObject:forKey:", v382, CFSTR("kCellularLteTotalDlTbsHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteDataInactivityBeforeIdles, "count"))
  {
    v389 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDataInactivityBeforeIdles, "count"));
    v805 = 0u;
    v806 = 0u;
    v807 = 0u;
    v808 = 0u;
    v390 = self->_kCellularLteDataInactivityBeforeIdles;
    v391 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v805, v1066, 16);
    if (v391)
    {
      v392 = v391;
      v393 = *(_QWORD *)v806;
      do
      {
        v394 = 0;
        do
        {
          if (*(_QWORD *)v806 != v393)
            objc_enumerationMutation(v390);
          objc_msgSend(*(id *)(*((_QWORD *)&v805 + 1) + 8 * v394), "dictionaryRepresentation");
          v395 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v389, "addObject:", v395);

          ++v394;
        }
        while (v392 != v394);
        v392 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v805, v1066, 16);
      }
      while (v392);
    }

    objc_msgSend(v3, "setObject:forKey:", v389, CFSTR("kCellularLteDataInactivityBeforeIdle"));
  }
  if (-[NSMutableArray count](self->_kCellularLteIdleToConnectedUserDatas, "count"))
  {
    v396 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteIdleToConnectedUserDatas, "count"));
    v801 = 0u;
    v802 = 0u;
    v803 = 0u;
    v804 = 0u;
    v397 = self->_kCellularLteIdleToConnectedUserDatas;
    v398 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v397, "countByEnumeratingWithState:objects:count:", &v801, v1065, 16);
    if (v398)
    {
      v399 = v398;
      v400 = *(_QWORD *)v802;
      do
      {
        v401 = 0;
        do
        {
          if (*(_QWORD *)v802 != v400)
            objc_enumerationMutation(v397);
          objc_msgSend(*(id *)(*((_QWORD *)&v801 + 1) + 8 * v401), "dictionaryRepresentation");
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v396, "addObject:", v402);

          ++v401;
        }
        while (v399 != v401);
        v399 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v397, "countByEnumeratingWithState:objects:count:", &v801, v1065, 16);
      }
      while (v399);
    }

    objc_msgSend(v3, "setObject:forKey:", v396, CFSTR("kCellularLteIdleToConnectedUserData"));
  }
  if (-[NSMutableArray count](self->_kCellularLteDlSccStateHistV3s, "count"))
  {
    v403 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDlSccStateHistV3s, "count"));
    v797 = 0u;
    v798 = 0u;
    v799 = 0u;
    v800 = 0u;
    v404 = self->_kCellularLteDlSccStateHistV3s;
    v405 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v404, "countByEnumeratingWithState:objects:count:", &v797, v1064, 16);
    if (v405)
    {
      v406 = v405;
      v407 = *(_QWORD *)v798;
      do
      {
        v408 = 0;
        do
        {
          if (*(_QWORD *)v798 != v407)
            objc_enumerationMutation(v404);
          objc_msgSend(*(id *)(*((_QWORD *)&v797 + 1) + 8 * v408), "dictionaryRepresentation");
          v409 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v403, "addObject:", v409);

          ++v408;
        }
        while (v406 != v408);
        v406 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v404, "countByEnumeratingWithState:objects:count:", &v797, v1064, 16);
      }
      while (v406);
    }

    objc_msgSend(v3, "setObject:forKey:", v403, CFSTR("kCellularLteDlSccStateHistV3"));
  }
  if (-[NSMutableArray count](self->_kCellularLteRxDiversityHists, "count"))
  {
    v410 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRxDiversityHists, "count"));
    v793 = 0u;
    v794 = 0u;
    v795 = 0u;
    v796 = 0u;
    v411 = self->_kCellularLteRxDiversityHists;
    v412 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v411, "countByEnumeratingWithState:objects:count:", &v793, v1063, 16);
    if (v412)
    {
      v413 = v412;
      v414 = *(_QWORD *)v794;
      do
      {
        v415 = 0;
        do
        {
          if (*(_QWORD *)v794 != v414)
            objc_enumerationMutation(v411);
          objc_msgSend(*(id *)(*((_QWORD *)&v793 + 1) + 8 * v415), "dictionaryRepresentation");
          v416 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v410, "addObject:", v416);

          ++v415;
        }
        while (v413 != v415);
        v413 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v411, "countByEnumeratingWithState:objects:count:", &v793, v1063, 16);
      }
      while (v413);
    }

    objc_msgSend(v3, "setObject:forKey:", v410, CFSTR("kCellularLteRxDiversityHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLtePdcchStateHists, "count"))
  {
    v417 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePdcchStateHists, "count"));
    v789 = 0u;
    v790 = 0u;
    v791 = 0u;
    v792 = 0u;
    v418 = self->_kCellularLtePdcchStateHists;
    v419 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v418, "countByEnumeratingWithState:objects:count:", &v789, v1062, 16);
    if (v419)
    {
      v420 = v419;
      v421 = *(_QWORD *)v790;
      do
      {
        v422 = 0;
        do
        {
          if (*(_QWORD *)v790 != v421)
            objc_enumerationMutation(v418);
          objc_msgSend(*(id *)(*((_QWORD *)&v789 + 1) + 8 * v422), "dictionaryRepresentation");
          v423 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v417, "addObject:", v423);

          ++v422;
        }
        while (v420 != v422);
        v420 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v418, "countByEnumeratingWithState:objects:count:", &v789, v1062, 16);
      }
      while (v420);
    }

    objc_msgSend(v3, "setObject:forKey:", v417, CFSTR("kCellularLtePdcchStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularLteRrcStates, "count"))
  {
    v424 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRrcStates, "count"));
    v785 = 0u;
    v786 = 0u;
    v787 = 0u;
    v788 = 0u;
    v425 = self->_kCellularLteRrcStates;
    v426 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v425, "countByEnumeratingWithState:objects:count:", &v785, v1061, 16);
    if (v426)
    {
      v427 = v426;
      v428 = *(_QWORD *)v786;
      do
      {
        v429 = 0;
        do
        {
          if (*(_QWORD *)v786 != v428)
            objc_enumerationMutation(v425);
          objc_msgSend(*(id *)(*((_QWORD *)&v785 + 1) + 8 * v429), "dictionaryRepresentation");
          v430 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v424, "addObject:", v430);

          ++v429;
        }
        while (v427 != v429);
        v427 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v425, "countByEnumeratingWithState:objects:count:", &v785, v1061, 16);
      }
      while (v427);
    }

    objc_msgSend(v3, "setObject:forKey:", v424, CFSTR("kCellularLteRrcState"));
  }
  if (-[NSMutableArray count](self->_kCellularLtePagingCycles, "count"))
  {
    v431 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePagingCycles, "count"));
    v781 = 0u;
    v782 = 0u;
    v783 = 0u;
    v784 = 0u;
    v432 = self->_kCellularLtePagingCycles;
    v433 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v432, "countByEnumeratingWithState:objects:count:", &v781, v1060, 16);
    if (v433)
    {
      v434 = v433;
      v435 = *(_QWORD *)v782;
      do
      {
        v436 = 0;
        do
        {
          if (*(_QWORD *)v782 != v435)
            objc_enumerationMutation(v432);
          objc_msgSend(*(id *)(*((_QWORD *)&v781 + 1) + 8 * v436), "dictionaryRepresentation");
          v437 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v431, "addObject:", v437);

          ++v436;
        }
        while (v434 != v436);
        v434 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v432, "countByEnumeratingWithState:objects:count:", &v781, v1060, 16);
      }
      while (v434);
    }

    objc_msgSend(v3, "setObject:forKey:", v431, CFSTR("kCellularLtePagingCycle"));
  }
  if (-[NSMutableArray count](self->_kCellularLteCdrxConfigs, "count"))
  {
    v438 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteCdrxConfigs, "count"));
    v777 = 0u;
    v778 = 0u;
    v779 = 0u;
    v780 = 0u;
    v439 = self->_kCellularLteCdrxConfigs;
    v440 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v439, "countByEnumeratingWithState:objects:count:", &v777, v1059, 16);
    if (v440)
    {
      v441 = v440;
      v442 = *(_QWORD *)v778;
      do
      {
        v443 = 0;
        do
        {
          if (*(_QWORD *)v778 != v442)
            objc_enumerationMutation(v439);
          objc_msgSend(*(id *)(*((_QWORD *)&v777 + 1) + 8 * v443), "dictionaryRepresentation");
          v444 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v438, "addObject:", v444);

          ++v443;
        }
        while (v441 != v443);
        v441 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v439, "countByEnumeratingWithState:objects:count:", &v777, v1059, 16);
      }
      while (v441);
    }

    objc_msgSend(v3, "setObject:forKey:", v438, CFSTR("kCellularLteCdrxConfig"));
  }
  if (-[NSMutableArray count](self->_kCellularLteRadioLinkFailures, "count"))
  {
    v445 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRadioLinkFailures, "count"));
    v773 = 0u;
    v774 = 0u;
    v775 = 0u;
    v776 = 0u;
    v446 = self->_kCellularLteRadioLinkFailures;
    v447 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v446, "countByEnumeratingWithState:objects:count:", &v773, v1058, 16);
    if (v447)
    {
      v448 = v447;
      v449 = *(_QWORD *)v774;
      do
      {
        v450 = 0;
        do
        {
          if (*(_QWORD *)v774 != v449)
            objc_enumerationMutation(v446);
          objc_msgSend(*(id *)(*((_QWORD *)&v773 + 1) + 8 * v450), "dictionaryRepresentation");
          v451 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v445, "addObject:", v451);

          ++v450;
        }
        while (v448 != v450);
        v448 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v446, "countByEnumeratingWithState:objects:count:", &v773, v1058, 16);
      }
      while (v448);
    }

    objc_msgSend(v3, "setObject:forKey:", v445, CFSTR("kCellularLteRadioLinkFailure"));
  }
  if (-[NSMutableArray count](self->_kCellularLtePdcchStateStats, "count"))
  {
    v452 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePdcchStateStats, "count"));
    v769 = 0u;
    v770 = 0u;
    v771 = 0u;
    v772 = 0u;
    v453 = self->_kCellularLtePdcchStateStats;
    v454 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v453, "countByEnumeratingWithState:objects:count:", &v769, v1057, 16);
    if (v454)
    {
      v455 = v454;
      v456 = *(_QWORD *)v770;
      do
      {
        v457 = 0;
        do
        {
          if (*(_QWORD *)v770 != v456)
            objc_enumerationMutation(v453);
          objc_msgSend(*(id *)(*((_QWORD *)&v769 + 1) + 8 * v457), "dictionaryRepresentation");
          v458 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v452, "addObject:", v458);

          ++v457;
        }
        while (v455 != v457);
        v455 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v453, "countByEnumeratingWithState:objects:count:", &v769, v1057, 16);
      }
      while (v455);
    }

    objc_msgSend(v3, "setObject:forKey:", v452, CFSTR("kCellularLtePdcchStateStats"));
  }
  if (-[NSMutableArray count](self->_kCellularLqmStateChanges, "count"))
  {
    v459 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLqmStateChanges, "count"));
    v765 = 0u;
    v766 = 0u;
    v767 = 0u;
    v768 = 0u;
    v460 = self->_kCellularLqmStateChanges;
    v461 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v460, "countByEnumeratingWithState:objects:count:", &v765, v1056, 16);
    if (v461)
    {
      v462 = v461;
      v463 = *(_QWORD *)v766;
      do
      {
        v464 = 0;
        do
        {
          if (*(_QWORD *)v766 != v463)
            objc_enumerationMutation(v460);
          objc_msgSend(*(id *)(*((_QWORD *)&v765 + 1) + 8 * v464), "dictionaryRepresentation");
          v465 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v459, "addObject:", v465);

          ++v464;
        }
        while (v462 != v464);
        v462 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v460, "countByEnumeratingWithState:objects:count:", &v765, v1056, 16);
      }
      while (v462);
    }

    objc_msgSend(v3, "setObject:forKey:", v459, CFSTR("kCellularLqmStateChange"));
  }
  if (-[NSMutableArray count](self->_kCellularServiceLosts, "count"))
  {
    v466 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularServiceLosts, "count"));
    v761 = 0u;
    v762 = 0u;
    v763 = 0u;
    v764 = 0u;
    v467 = self->_kCellularServiceLosts;
    v468 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v467, "countByEnumeratingWithState:objects:count:", &v761, v1055, 16);
    if (v468)
    {
      v469 = v468;
      v470 = *(_QWORD *)v762;
      do
      {
        v471 = 0;
        do
        {
          if (*(_QWORD *)v762 != v470)
            objc_enumerationMutation(v467);
          objc_msgSend(*(id *)(*((_QWORD *)&v761 + 1) + 8 * v471), "dictionaryRepresentation");
          v472 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v466, "addObject:", v472);

          ++v471;
        }
        while (v469 != v471);
        v469 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v467, "countByEnumeratingWithState:objects:count:", &v761, v1055, 16);
      }
      while (v469);
    }

    objc_msgSend(v3, "setObject:forKey:", v466, CFSTR("kCellularServiceLost"));
  }
  if (-[NSMutableArray count](self->_kCellularProtocolStackStateHists, "count"))
  {
    v473 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStateHists, "count"));
    v757 = 0u;
    v758 = 0u;
    v759 = 0u;
    v760 = 0u;
    v474 = self->_kCellularProtocolStackStateHists;
    v475 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v474, "countByEnumeratingWithState:objects:count:", &v757, v1054, 16);
    if (v475)
    {
      v476 = v475;
      v477 = *(_QWORD *)v758;
      do
      {
        v478 = 0;
        do
        {
          if (*(_QWORD *)v758 != v477)
            objc_enumerationMutation(v474);
          objc_msgSend(*(id *)(*((_QWORD *)&v757 + 1) + 8 * v478), "dictionaryRepresentation");
          v479 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v473, "addObject:", v479);

          ++v478;
        }
        while (v476 != v478);
        v476 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v474, "countByEnumeratingWithState:objects:count:", &v757, v1054, 16);
      }
      while (v476);
    }

    objc_msgSend(v3, "setObject:forKey:", v473, CFSTR("kCellularProtocolStackStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCellPlmnSearchCounts, "count"))
  {
    v480 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCellPlmnSearchCounts, "count"));
    v753 = 0u;
    v754 = 0u;
    v755 = 0u;
    v756 = 0u;
    v481 = self->_kCellularCellPlmnSearchCounts;
    v482 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v481, "countByEnumeratingWithState:objects:count:", &v753, v1053, 16);
    if (v482)
    {
      v483 = v482;
      v484 = *(_QWORD *)v754;
      do
      {
        v485 = 0;
        do
        {
          if (*(_QWORD *)v754 != v484)
            objc_enumerationMutation(v481);
          objc_msgSend(*(id *)(*((_QWORD *)&v753 + 1) + 8 * v485), "dictionaryRepresentation");
          v486 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v480, "addObject:", v486);

          ++v485;
        }
        while (v483 != v485);
        v483 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v481, "countByEnumeratingWithState:objects:count:", &v753, v1053, 16);
      }
      while (v483);
    }

    objc_msgSend(v3, "setObject:forKey:", v480, CFSTR("kCellularCellPlmnSearchCount"));
  }
  if (-[NSMutableArray count](self->_kCellularCellPlmnSearchHists, "count"))
  {
    v487 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCellPlmnSearchHists, "count"));
    v749 = 0u;
    v750 = 0u;
    v751 = 0u;
    v752 = 0u;
    v488 = self->_kCellularCellPlmnSearchHists;
    v489 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v488, "countByEnumeratingWithState:objects:count:", &v749, v1052, 16);
    if (v489)
    {
      v490 = v489;
      v491 = *(_QWORD *)v750;
      do
      {
        v492 = 0;
        do
        {
          if (*(_QWORD *)v750 != v491)
            objc_enumerationMutation(v488);
          objc_msgSend(*(id *)(*((_QWORD *)&v749 + 1) + 8 * v492), "dictionaryRepresentation");
          v493 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v487, "addObject:", v493);

          ++v492;
        }
        while (v490 != v492);
        v490 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v488, "countByEnumeratingWithState:objects:count:", &v749, v1052, 16);
      }
      while (v490);
    }

    objc_msgSend(v3, "setObject:forKey:", v487, CFSTR("kCellularCellPlmnSearchHist"));
  }
  if (-[NSMutableArray count](self->_kCellularProtocolStackPowerStates, "count"))
  {
    v494 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackPowerStates, "count"));
    v745 = 0u;
    v746 = 0u;
    v747 = 0u;
    v748 = 0u;
    v495 = self->_kCellularProtocolStackPowerStates;
    v496 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v495, "countByEnumeratingWithState:objects:count:", &v745, v1051, 16);
    if (v496)
    {
      v497 = v496;
      v498 = *(_QWORD *)v746;
      do
      {
        v499 = 0;
        do
        {
          if (*(_QWORD *)v746 != v498)
            objc_enumerationMutation(v495);
          objc_msgSend(*(id *)(*((_QWORD *)&v745 + 1) + 8 * v499), "dictionaryRepresentation");
          v500 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v494, "addObject:", v500);

          ++v499;
        }
        while (v497 != v499);
        v497 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v495, "countByEnumeratingWithState:objects:count:", &v745, v1051, 16);
      }
      while (v497);
    }

    objc_msgSend(v3, "setObject:forKey:", v494, CFSTR("kCellularProtocolStackPowerState"));
  }
  if (-[NSMutableArray count](self->_kCellularDownlinkIpPacketFilterStatus, "count"))
  {
    v501 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDownlinkIpPacketFilterStatus, "count"));
    v741 = 0u;
    v742 = 0u;
    v743 = 0u;
    v744 = 0u;
    v502 = self->_kCellularDownlinkIpPacketFilterStatus;
    v503 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v502, "countByEnumeratingWithState:objects:count:", &v741, v1050, 16);
    if (v503)
    {
      v504 = v503;
      v505 = *(_QWORD *)v742;
      do
      {
        v506 = 0;
        do
        {
          if (*(_QWORD *)v742 != v505)
            objc_enumerationMutation(v502);
          objc_msgSend(*(id *)(*((_QWORD *)&v741 + 1) + 8 * v506), "dictionaryRepresentation");
          v507 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v501, "addObject:", v507);

          ++v506;
        }
        while (v504 != v506);
        v504 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v502, "countByEnumeratingWithState:objects:count:", &v741, v1050, 16);
      }
      while (v504);
    }

    objc_msgSend(v3, "setObject:forKey:", v501, CFSTR("kCellularDownlinkIpPacketFilterStatus"));
  }
  if (-[NSMutableArray count](self->_kCellularDownlinkIpPacketDiscardeds, "count"))
  {
    v508 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDownlinkIpPacketDiscardeds, "count"));
    v737 = 0u;
    v738 = 0u;
    v739 = 0u;
    v740 = 0u;
    v509 = self->_kCellularDownlinkIpPacketDiscardeds;
    v510 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v509, "countByEnumeratingWithState:objects:count:", &v737, v1049, 16);
    if (v510)
    {
      v511 = v510;
      v512 = *(_QWORD *)v738;
      do
      {
        v513 = 0;
        do
        {
          if (*(_QWORD *)v738 != v512)
            objc_enumerationMutation(v509);
          objc_msgSend(*(id *)(*((_QWORD *)&v737 + 1) + 8 * v513), "dictionaryRepresentation");
          v514 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v508, "addObject:", v514);

          ++v513;
        }
        while (v511 != v513);
        v511 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v509, "countByEnumeratingWithState:objects:count:", &v737, v1049, 16);
      }
      while (v511);
    }

    objc_msgSend(v3, "setObject:forKey:", v508, CFSTR("kCellularDownlinkIpPacketDiscarded"));
  }
  if (-[NSMutableArray count](self->_kCellularServingCellRfBandHists, "count"))
  {
    v515 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularServingCellRfBandHists, "count"));
    v733 = 0u;
    v734 = 0u;
    v735 = 0u;
    v736 = 0u;
    v516 = self->_kCellularServingCellRfBandHists;
    v517 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v516, "countByEnumeratingWithState:objects:count:", &v733, v1048, 16);
    if (v517)
    {
      v518 = v517;
      v519 = *(_QWORD *)v734;
      do
      {
        v520 = 0;
        do
        {
          if (*(_QWORD *)v734 != v519)
            objc_enumerationMutation(v516);
          objc_msgSend(*(id *)(*((_QWORD *)&v733 + 1) + 8 * v520), "dictionaryRepresentation");
          v521 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v515, "addObject:", v521);

          ++v520;
        }
        while (v518 != v520);
        v518 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v516, "countByEnumeratingWithState:objects:count:", &v733, v1048, 16);
      }
      while (v518);
    }

    objc_msgSend(v3, "setObject:forKey:", v515, CFSTR("kCellularServingCellRfBandHist"));
  }
  if (-[NSMutableArray count](self->_kCellularProtocolStackStateHist2s, "count"))
  {
    v522 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStateHist2s, "count"));
    v729 = 0u;
    v730 = 0u;
    v731 = 0u;
    v732 = 0u;
    v523 = self->_kCellularProtocolStackStateHist2s;
    v524 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v523, "countByEnumeratingWithState:objects:count:", &v729, v1047, 16);
    if (v524)
    {
      v525 = v524;
      v526 = *(_QWORD *)v730;
      do
      {
        v527 = 0;
        do
        {
          if (*(_QWORD *)v730 != v526)
            objc_enumerationMutation(v523);
          objc_msgSend(*(id *)(*((_QWORD *)&v729 + 1) + 8 * v527), "dictionaryRepresentation");
          v528 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v522, "addObject:", v528);

          ++v527;
        }
        while (v525 != v527);
        v525 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v523, "countByEnumeratingWithState:objects:count:", &v729, v1047, 16);
      }
      while (v525);
    }

    objc_msgSend(v3, "setObject:forKey:", v522, CFSTR("kCellularProtocolStackStateHist2"));
  }
  if (-[NSMutableArray count](self->_kCellularProtocolStackStates, "count"))
  {
    v529 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStates, "count"));
    v725 = 0u;
    v726 = 0u;
    v727 = 0u;
    v728 = 0u;
    v530 = self->_kCellularProtocolStackStates;
    v531 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v530, "countByEnumeratingWithState:objects:count:", &v725, v1046, 16);
    if (v531)
    {
      v532 = v531;
      v533 = *(_QWORD *)v726;
      do
      {
        v534 = 0;
        do
        {
          if (*(_QWORD *)v726 != v533)
            objc_enumerationMutation(v530);
          objc_msgSend(*(id *)(*((_QWORD *)&v725 + 1) + 8 * v534), "dictionaryRepresentation");
          v535 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v529, "addObject:", v535);

          ++v534;
        }
        while (v532 != v534);
        v532 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v530, "countByEnumeratingWithState:objects:count:", &v725, v1046, 16);
      }
      while (v532);
    }

    objc_msgSend(v3, "setObject:forKey:", v529, CFSTR("kCellularProtocolStackState"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XRxDiversityHists, "count"))
  {
    v536 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XRxDiversityHists, "count"));
    v721 = 0u;
    v722 = 0u;
    v723 = 0u;
    v724 = 0u;
    v537 = self->_kCellularCdma1XRxDiversityHists;
    v538 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v537, "countByEnumeratingWithState:objects:count:", &v721, v1045, 16);
    if (v538)
    {
      v539 = v538;
      v540 = *(_QWORD *)v722;
      do
      {
        v541 = 0;
        do
        {
          if (*(_QWORD *)v722 != v540)
            objc_enumerationMutation(v537);
          objc_msgSend(*(id *)(*((_QWORD *)&v721 + 1) + 8 * v541), "dictionaryRepresentation");
          v542 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v536, "addObject:", v542);

          ++v541;
        }
        while (v539 != v541);
        v539 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v537, "countByEnumeratingWithState:objects:count:", &v721, v1045, 16);
      }
      while (v539);
    }

    objc_msgSend(v3, "setObject:forKey:", v536, CFSTR("kCellularCdma1XRxDiversityHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XServingCellRx0RssiHists, "count"))
  {
    v543 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0RssiHists, "count"));
    v717 = 0u;
    v718 = 0u;
    v719 = 0u;
    v720 = 0u;
    v544 = self->_kCellularCdma1XServingCellRx0RssiHists;
    v545 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v544, "countByEnumeratingWithState:objects:count:", &v717, v1044, 16);
    if (v545)
    {
      v546 = v545;
      v547 = *(_QWORD *)v718;
      do
      {
        v548 = 0;
        do
        {
          if (*(_QWORD *)v718 != v547)
            objc_enumerationMutation(v544);
          objc_msgSend(*(id *)(*((_QWORD *)&v717 + 1) + 8 * v548), "dictionaryRepresentation");
          v549 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v543, "addObject:", v549);

          ++v548;
        }
        while (v546 != v548);
        v546 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v544, "countByEnumeratingWithState:objects:count:", &v717, v1044, 16);
      }
      while (v546);
    }

    objc_msgSend(v3, "setObject:forKey:", v543, CFSTR("kCellularCdma1XServingCellRx0RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XServingCellRx1RssiHists, "count"))
  {
    v550 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1RssiHists, "count"));
    v713 = 0u;
    v714 = 0u;
    v715 = 0u;
    v716 = 0u;
    v551 = self->_kCellularCdma1XServingCellRx1RssiHists;
    v552 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v551, "countByEnumeratingWithState:objects:count:", &v713, v1043, 16);
    if (v552)
    {
      v553 = v552;
      v554 = *(_QWORD *)v714;
      do
      {
        v555 = 0;
        do
        {
          if (*(_QWORD *)v714 != v554)
            objc_enumerationMutation(v551);
          objc_msgSend(*(id *)(*((_QWORD *)&v713 + 1) + 8 * v555), "dictionaryRepresentation");
          v556 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v550, "addObject:", v556);

          ++v555;
        }
        while (v553 != v555);
        v553 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v551, "countByEnumeratingWithState:objects:count:", &v713, v1043, 16);
      }
      while (v553);
    }

    objc_msgSend(v3, "setObject:forKey:", v550, CFSTR("kCellularCdma1XServingCellRx1RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XServingCellRx0EcIoHists, "count"))
  {
    v557 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0EcIoHists, "count"));
    v709 = 0u;
    v710 = 0u;
    v711 = 0u;
    v712 = 0u;
    v558 = self->_kCellularCdma1XServingCellRx0EcIoHists;
    v559 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v558, "countByEnumeratingWithState:objects:count:", &v709, v1042, 16);
    if (v559)
    {
      v560 = v559;
      v561 = *(_QWORD *)v710;
      do
      {
        v562 = 0;
        do
        {
          if (*(_QWORD *)v710 != v561)
            objc_enumerationMutation(v558);
          objc_msgSend(*(id *)(*((_QWORD *)&v709 + 1) + 8 * v562), "dictionaryRepresentation");
          v563 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v557, "addObject:", v563);

          ++v562;
        }
        while (v560 != v562);
        v560 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v558, "countByEnumeratingWithState:objects:count:", &v709, v1042, 16);
      }
      while (v560);
    }

    objc_msgSend(v3, "setObject:forKey:", v557, CFSTR("kCellularCdma1XServingCellRx0EcIoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XServingCellRx1EcIoHists, "count"))
  {
    v564 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1EcIoHists, "count"));
    v705 = 0u;
    v706 = 0u;
    v707 = 0u;
    v708 = 0u;
    v565 = self->_kCellularCdma1XServingCellRx1EcIoHists;
    v566 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v565, "countByEnumeratingWithState:objects:count:", &v705, v1041, 16);
    if (v566)
    {
      v567 = v566;
      v568 = *(_QWORD *)v706;
      do
      {
        v569 = 0;
        do
        {
          if (*(_QWORD *)v706 != v568)
            objc_enumerationMutation(v565);
          objc_msgSend(*(id *)(*((_QWORD *)&v705 + 1) + 8 * v569), "dictionaryRepresentation");
          v570 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v564, "addObject:", v570);

          ++v569;
        }
        while (v567 != v569);
        v567 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v565, "countByEnumeratingWithState:objects:count:", &v705, v1041, 16);
      }
      while (v567);
    }

    objc_msgSend(v3, "setObject:forKey:", v564, CFSTR("kCellularCdma1XServingCellRx1EcIoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XTxPowerHists, "count"))
  {
    v571 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XTxPowerHists, "count"));
    v701 = 0u;
    v702 = 0u;
    v703 = 0u;
    v704 = 0u;
    v572 = self->_kCellularCdma1XTxPowerHists;
    v573 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v572, "countByEnumeratingWithState:objects:count:", &v701, v1040, 16);
    if (v573)
    {
      v574 = v573;
      v575 = *(_QWORD *)v702;
      do
      {
        v576 = 0;
        do
        {
          if (*(_QWORD *)v702 != v575)
            objc_enumerationMutation(v572);
          objc_msgSend(*(id *)(*((_QWORD *)&v701 + 1) + 8 * v576), "dictionaryRepresentation");
          v577 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v571, "addObject:", v577);

          ++v576;
        }
        while (v574 != v576);
        v574 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v572, "countByEnumeratingWithState:objects:count:", &v701, v1040, 16);
      }
      while (v574);
    }

    objc_msgSend(v3, "setObject:forKey:", v571, CFSTR("kCellularCdma1XTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XProtocolStackStateHists, "count"))
  {
    v578 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XProtocolStackStateHists, "count"));
    v697 = 0u;
    v698 = 0u;
    v699 = 0u;
    v700 = 0u;
    v579 = self->_kCellularCdma1XProtocolStackStateHists;
    v580 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v579, "countByEnumeratingWithState:objects:count:", &v697, v1039, 16);
    if (v580)
    {
      v581 = v580;
      v582 = *(_QWORD *)v698;
      do
      {
        v583 = 0;
        do
        {
          if (*(_QWORD *)v698 != v582)
            objc_enumerationMutation(v579);
          objc_msgSend(*(id *)(*((_QWORD *)&v697 + 1) + 8 * v583), "dictionaryRepresentation");
          v584 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v578, "addObject:", v584);

          ++v583;
        }
        while (v581 != v583);
        v581 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v579, "countByEnumeratingWithState:objects:count:", &v697, v1039, 16);
      }
      while (v581);
    }

    objc_msgSend(v3, "setObject:forKey:", v578, CFSTR("kCellularCdma1XProtocolStackStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XConnectionHists, "count"))
  {
    v585 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XConnectionHists, "count"));
    v693 = 0u;
    v694 = 0u;
    v695 = 0u;
    v696 = 0u;
    v586 = self->_kCellularCdma1XConnectionHists;
    v587 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v586, "countByEnumeratingWithState:objects:count:", &v693, v1038, 16);
    if (v587)
    {
      v588 = v587;
      v589 = *(_QWORD *)v694;
      do
      {
        v590 = 0;
        do
        {
          if (*(_QWORD *)v694 != v589)
            objc_enumerationMutation(v586);
          objc_msgSend(*(id *)(*((_QWORD *)&v693 + 1) + 8 * v590), "dictionaryRepresentation");
          v591 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v585, "addObject:", v591);

          ++v590;
        }
        while (v588 != v590);
        v588 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v586, "countByEnumeratingWithState:objects:count:", &v693, v1038, 16);
      }
      while (v588);
    }

    objc_msgSend(v3, "setObject:forKey:", v585, CFSTR("kCellularCdma1XConnectionHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdma1XRrStates, "count"))
  {
    v592 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XRrStates, "count"));
    v689 = 0u;
    v690 = 0u;
    v691 = 0u;
    v692 = 0u;
    v593 = self->_kCellularCdma1XRrStates;
    v594 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v593, "countByEnumeratingWithState:objects:count:", &v689, v1037, 16);
    if (v594)
    {
      v595 = v594;
      v596 = *(_QWORD *)v690;
      do
      {
        v597 = 0;
        do
        {
          if (*(_QWORD *)v690 != v596)
            objc_enumerationMutation(v593);
          objc_msgSend(*(id *)(*((_QWORD *)&v689 + 1) + 8 * v597), "dictionaryRepresentation");
          v598 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v592, "addObject:", v598);

          ++v597;
        }
        while (v595 != v597);
        v595 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v593, "countByEnumeratingWithState:objects:count:", &v689, v1037, 16);
      }
      while (v595);
    }

    objc_msgSend(v3, "setObject:forKey:", v592, CFSTR("kCellularCdma1XRrState"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoRxDiversityHists, "count"))
  {
    v599 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoRxDiversityHists, "count"));
    v685 = 0u;
    v686 = 0u;
    v687 = 0u;
    v688 = 0u;
    v600 = self->_kCellularCdmaEvdoRxDiversityHists;
    v601 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v600, "countByEnumeratingWithState:objects:count:", &v685, v1036, 16);
    if (v601)
    {
      v602 = v601;
      v603 = *(_QWORD *)v686;
      do
      {
        v604 = 0;
        do
        {
          if (*(_QWORD *)v686 != v603)
            objc_enumerationMutation(v600);
          objc_msgSend(*(id *)(*((_QWORD *)&v685 + 1) + 8 * v604), "dictionaryRepresentation");
          v605 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v599, "addObject:", v605);

          ++v604;
        }
        while (v602 != v604);
        v602 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v600, "countByEnumeratingWithState:objects:count:", &v685, v1036, 16);
      }
      while (v602);
    }

    objc_msgSend(v3, "setObject:forKey:", v599, CFSTR("kCellularCdmaEvdoRxDiversityHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "count"))
  {
    v606 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "count"));
    v681 = 0u;
    v682 = 0u;
    v683 = 0u;
    v684 = 0u;
    v607 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
    v608 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v607, "countByEnumeratingWithState:objects:count:", &v681, v1035, 16);
    if (v608)
    {
      v609 = v608;
      v610 = *(_QWORD *)v682;
      do
      {
        v611 = 0;
        do
        {
          if (*(_QWORD *)v682 != v610)
            objc_enumerationMutation(v607);
          objc_msgSend(*(id *)(*((_QWORD *)&v681 + 1) + 8 * v611), "dictionaryRepresentation");
          v612 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v606, "addObject:", v612);

          ++v611;
        }
        while (v609 != v611);
        v609 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v607, "countByEnumeratingWithState:objects:count:", &v681, v1035, 16);
      }
      while (v609);
    }

    objc_msgSend(v3, "setObject:forKey:", v606, CFSTR("kCellularCdmaEvdoServingCellRx0RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "count"))
  {
    v613 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "count"));
    v677 = 0u;
    v678 = 0u;
    v679 = 0u;
    v680 = 0u;
    v614 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
    v615 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v614, "countByEnumeratingWithState:objects:count:", &v677, v1034, 16);
    if (v615)
    {
      v616 = v615;
      v617 = *(_QWORD *)v678;
      do
      {
        v618 = 0;
        do
        {
          if (*(_QWORD *)v678 != v617)
            objc_enumerationMutation(v614);
          objc_msgSend(*(id *)(*((_QWORD *)&v677 + 1) + 8 * v618), "dictionaryRepresentation");
          v619 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v613, "addObject:", v619);

          ++v618;
        }
        while (v616 != v618);
        v616 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v614, "countByEnumeratingWithState:objects:count:", &v677, v1034, 16);
      }
      while (v616);
    }

    objc_msgSend(v3, "setObject:forKey:", v613, CFSTR("kCellularCdmaEvdoServingCellRx1RssiHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "count"))
  {
    v620 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "count"));
    v673 = 0u;
    v674 = 0u;
    v675 = 0u;
    v676 = 0u;
    v621 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
    v622 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v621, "countByEnumeratingWithState:objects:count:", &v673, v1033, 16);
    if (v622)
    {
      v623 = v622;
      v624 = *(_QWORD *)v674;
      do
      {
        v625 = 0;
        do
        {
          if (*(_QWORD *)v674 != v624)
            objc_enumerationMutation(v621);
          objc_msgSend(*(id *)(*((_QWORD *)&v673 + 1) + 8 * v625), "dictionaryRepresentation");
          v626 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v620, "addObject:", v626);

          ++v625;
        }
        while (v623 != v625);
        v623 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v621, "countByEnumeratingWithState:objects:count:", &v673, v1033, 16);
      }
      while (v623);
    }

    objc_msgSend(v3, "setObject:forKey:", v620, CFSTR("kCellularCdmaEvdoServingCellRx0EcIoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "count"))
  {
    v627 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "count"));
    v669 = 0u;
    v670 = 0u;
    v671 = 0u;
    v672 = 0u;
    v628 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
    v629 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v628, "countByEnumeratingWithState:objects:count:", &v669, v1032, 16);
    if (v629)
    {
      v630 = v629;
      v631 = *(_QWORD *)v670;
      do
      {
        v632 = 0;
        do
        {
          if (*(_QWORD *)v670 != v631)
            objc_enumerationMutation(v628);
          objc_msgSend(*(id *)(*((_QWORD *)&v669 + 1) + 8 * v632), "dictionaryRepresentation");
          v633 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v627, "addObject:", v633);

          ++v632;
        }
        while (v630 != v632);
        v630 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v628, "countByEnumeratingWithState:objects:count:", &v669, v1032, 16);
      }
      while (v630);
    }

    objc_msgSend(v3, "setObject:forKey:", v627, CFSTR("kCellularCdmaEvdoServingCellRx1EcIoHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoTxPowerHists, "count"))
  {
    v634 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoTxPowerHists, "count"));
    v665 = 0u;
    v666 = 0u;
    v667 = 0u;
    v668 = 0u;
    v635 = self->_kCellularCdmaEvdoTxPowerHists;
    v636 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v635, "countByEnumeratingWithState:objects:count:", &v665, v1031, 16);
    if (v636)
    {
      v637 = v636;
      v638 = *(_QWORD *)v666;
      do
      {
        v639 = 0;
        do
        {
          if (*(_QWORD *)v666 != v638)
            objc_enumerationMutation(v635);
          objc_msgSend(*(id *)(*((_QWORD *)&v665 + 1) + 8 * v639), "dictionaryRepresentation");
          v640 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v634, "addObject:", v640);

          ++v639;
        }
        while (v637 != v639);
        v637 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v635, "countByEnumeratingWithState:objects:count:", &v665, v1031, 16);
      }
      while (v637);
    }

    objc_msgSend(v3, "setObject:forKey:", v634, CFSTR("kCellularCdmaEvdoTxPowerHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoProtocolStackStateHists, "count"))
  {
    v641 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoProtocolStackStateHists, "count"));
    v661 = 0u;
    v662 = 0u;
    v663 = 0u;
    v664 = 0u;
    v642 = self->_kCellularCdmaEvdoProtocolStackStateHists;
    v643 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v642, "countByEnumeratingWithState:objects:count:", &v661, v1030, 16);
    if (v643)
    {
      v644 = v643;
      v645 = *(_QWORD *)v662;
      do
      {
        v646 = 0;
        do
        {
          if (*(_QWORD *)v662 != v645)
            objc_enumerationMutation(v642);
          objc_msgSend(*(id *)(*((_QWORD *)&v661 + 1) + 8 * v646), "dictionaryRepresentation");
          v647 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v641, "addObject:", v647);

          ++v646;
        }
        while (v644 != v646);
        v644 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v642, "countByEnumeratingWithState:objects:count:", &v661, v1030, 16);
      }
      while (v644);
    }

    objc_msgSend(v3, "setObject:forKey:", v641, CFSTR("kCellularCdmaEvdoProtocolStackStateHist"));
  }
  if (-[NSMutableArray count](self->_kCellularCdmaEvdoRrStates, "count"))
  {
    v648 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoRrStates, "count"));
    v657 = 0u;
    v658 = 0u;
    v659 = 0u;
    v660 = 0u;
    v649 = self->_kCellularCdmaEvdoRrStates;
    v650 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v649, "countByEnumeratingWithState:objects:count:", &v657, v1029, 16);
    if (v650)
    {
      v651 = v650;
      v652 = *(_QWORD *)v658;
      do
      {
        v653 = 0;
        do
        {
          if (*(_QWORD *)v658 != v652)
            objc_enumerationMutation(v649);
          objc_msgSend(*(id *)(*((_QWORD *)&v657 + 1) + 8 * v653), "dictionaryRepresentation", (_QWORD)v657);
          v654 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v648, "addObject:", v654);

          ++v653;
        }
        while (v651 != v653);
        v651 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v649, "countByEnumeratingWithState:objects:count:", &v657, v1029, 16);
      }
      while (v651);
    }

    objc_msgSend(v3, "setObject:forKey:", v648, CFSTR("kCellularCdmaEvdoRrState"));
  }
  v655 = v3;

  return v655;
}

- (BOOL)readFrom:(id)a3
{
  return PowerlogMetricLogReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSMutableArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSMutableArray *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSMutableArray *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSMutableArray *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSMutableArray *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSMutableArray *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSMutableArray *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSMutableArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSMutableArray *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSMutableArray *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSMutableArray *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSMutableArray *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSMutableArray *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSMutableArray *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSMutableArray *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  NSMutableArray *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSMutableArray *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSMutableArray *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  NSMutableArray *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSMutableArray *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  NSMutableArray *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSMutableArray *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  NSMutableArray *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  NSMutableArray *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSMutableArray *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  NSMutableArray *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  NSMutableArray *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  NSMutableArray *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSMutableArray *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  NSMutableArray *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  NSMutableArray *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  NSMutableArray *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  NSMutableArray *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  NSMutableArray *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  NSMutableArray *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  NSMutableArray *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  NSMutableArray *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  NSMutableArray *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  NSMutableArray *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  NSMutableArray *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  NSMutableArray *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  NSMutableArray *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  NSMutableArray *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  NSMutableArray *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  NSMutableArray *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  NSMutableArray *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  NSMutableArray *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  NSMutableArray *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  NSMutableArray *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  NSMutableArray *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  NSMutableArray *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  NSMutableArray *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  NSMutableArray *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  NSMutableArray *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  NSMutableArray *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  NSMutableArray *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  NSMutableArray *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  NSMutableArray *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  NSMutableArray *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  NSMutableArray *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  NSMutableArray *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  NSMutableArray *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  NSMutableArray *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  NSMutableArray *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  NSMutableArray *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  NSMutableArray *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  NSMutableArray *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  NSMutableArray *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  NSMutableArray *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  NSMutableArray *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  NSMutableArray *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  NSMutableArray *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  NSMutableArray *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  __int128 v807;
  __int128 v808;
  __int128 v809;
  __int128 v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  __int128 v815;
  __int128 v816;
  __int128 v817;
  __int128 v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  __int128 v831;
  __int128 v832;
  __int128 v833;
  __int128 v834;
  __int128 v835;
  __int128 v836;
  __int128 v837;
  __int128 v838;
  __int128 v839;
  __int128 v840;
  __int128 v841;
  _BYTE v842[128];
  _BYTE v843[128];
  _BYTE v844[128];
  _BYTE v845[128];
  _BYTE v846[128];
  _BYTE v847[128];
  _BYTE v848[128];
  _BYTE v849[128];
  _BYTE v850[128];
  _BYTE v851[128];
  _BYTE v852[128];
  _BYTE v853[128];
  _BYTE v854[128];
  _BYTE v855[128];
  _BYTE v856[128];
  _BYTE v857[128];
  _BYTE v858[128];
  _BYTE v859[128];
  _BYTE v860[128];
  _BYTE v861[128];
  _BYTE v862[128];
  _BYTE v863[128];
  _BYTE v864[128];
  _BYTE v865[128];
  _BYTE v866[128];
  _BYTE v867[128];
  _BYTE v868[128];
  _BYTE v869[128];
  _BYTE v870[128];
  _BYTE v871[128];
  _BYTE v872[128];
  _BYTE v873[128];
  _BYTE v874[128];
  _BYTE v875[128];
  _BYTE v876[128];
  _BYTE v877[128];
  _BYTE v878[128];
  _BYTE v879[128];
  _BYTE v880[128];
  _BYTE v881[128];
  _BYTE v882[128];
  _BYTE v883[128];
  _BYTE v884[128];
  _BYTE v885[128];
  _BYTE v886[128];
  _BYTE v887[128];
  _BYTE v888[128];
  _BYTE v889[128];
  _BYTE v890[128];
  _BYTE v891[128];
  _BYTE v892[128];
  _BYTE v893[128];
  _BYTE v894[128];
  _BYTE v895[128];
  _BYTE v896[128];
  _BYTE v897[128];
  _BYTE v898[128];
  _BYTE v899[128];
  _BYTE v900[128];
  _BYTE v901[128];
  _BYTE v902[128];
  _BYTE v903[128];
  _BYTE v904[128];
  _BYTE v905[128];
  _BYTE v906[128];
  _BYTE v907[128];
  _BYTE v908[128];
  _BYTE v909[128];
  _BYTE v910[128];
  _BYTE v911[128];
  _BYTE v912[128];
  _BYTE v913[128];
  _BYTE v914[128];
  _BYTE v915[128];
  _BYTE v916[128];
  _BYTE v917[128];
  _BYTE v918[128];
  _BYTE v919[128];
  _BYTE v920[128];
  _BYTE v921[128];
  _BYTE v922[128];
  _BYTE v923[128];
  _BYTE v924[128];
  _BYTE v925[128];
  _BYTE v926[128];
  _BYTE v927[128];
  _BYTE v928[128];
  _BYTE v929[128];
  _BYTE v930[128];
  _BYTE v931[128];
  _BYTE v932[128];
  _BYTE v933[128];
  _BYTE v934[128];
  uint64_t v935;

  v935 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v838 = 0u;
  v839 = 0u;
  v840 = 0u;
  v841 = 0u;
  v5 = self->_kCellularPerClientProfileTriggerCounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v838, v934, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v839;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v839 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v838, v934, 16);
    }
    while (v7);
  }

  v837 = 0u;
  v836 = 0u;
  v835 = 0u;
  v834 = 0u;
  v10 = self->_kCellularProtocolStackCpuStats;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v834, v933, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v835;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v835 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v834, v933, 16);
    }
    while (v12);
  }

  v833 = 0u;
  v832 = 0u;
  v831 = 0u;
  v830 = 0u;
  v15 = self->_kCellularPeripheralStats;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v830, v932, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v831;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v831 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v830, v932, 16);
    }
    while (v17);
  }

  v829 = 0u;
  v828 = 0u;
  v827 = 0u;
  v826 = 0u;
  v20 = self->_kCellularDvfsStats;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v826, v931, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v827;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v827 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v826, v931, 16);
    }
    while (v22);
  }

  v825 = 0u;
  v824 = 0u;
  v823 = 0u;
  v822 = 0u;
  v25 = self->_kCellularLteWcdmaGsmHwStats;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v822, v930, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v823;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v823 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v822, v930, 16);
    }
    while (v27);
  }

  v821 = 0u;
  v820 = 0u;
  v819 = 0u;
  v818 = 0u;
  v30 = self->_kCellularLteTdsGsmHwStats;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v818, v929, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v819;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v819 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v818, v929, 16);
    }
    while (v32);
  }

  v817 = 0u;
  v816 = 0u;
  v815 = 0u;
  v814 = 0u;
  v35 = self->_kCellularPmuAverageCurrents;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v814, v928, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v815;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v815 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v814, v928, 16);
    }
    while (v37);
  }

  v813 = 0u;
  v812 = 0u;
  v811 = 0u;
  v810 = 0u;
  v40 = self->_kCellularFwCoreStats;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v810, v927, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v811;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v811 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v810, v927, 16);
    }
    while (v42);
  }

  v809 = 0u;
  v808 = 0u;
  v807 = 0u;
  v806 = 0u;
  v45 = self->_kCellularLteWcdmaTdsHwStats;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v806, v926, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v807;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v807 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v806, v926, 16);
    }
    while (v47);
  }

  v805 = 0u;
  v804 = 0u;
  v803 = 0u;
  v802 = 0u;
  v50 = self->_kCellularPmicHwStats;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v802, v925, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v803;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v803 != v53)
          objc_enumerationMutation(v50);
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v802, v925, 16);
    }
    while (v52);
  }

  v801 = 0u;
  v800 = 0u;
  v799 = 0u;
  v798 = 0u;
  v55 = self->_kCellularTdsRrcStates;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v798, v924, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v799;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v799 != v58)
          objc_enumerationMutation(v55);
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v798, v924, 16);
    }
    while (v57);
  }

  v797 = 0u;
  v796 = 0u;
  v795 = 0u;
  v794 = 0u;
  v60 = self->_kCellularLteRrcStates;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v794, v923, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v795;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v795 != v63)
          objc_enumerationMutation(v60);
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v794, v923, 16);
    }
    while (v62);
  }

  v793 = 0u;
  v792 = 0u;
  v791 = 0u;
  v790 = 0u;
  v65 = self->_kCellularLtePagingCycles;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v790, v922, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v791;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v791 != v68)
          objc_enumerationMutation(v65);
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v790, v922, 16);
    }
    while (v67);
  }

  v789 = 0u;
  v788 = 0u;
  v787 = 0u;
  v786 = 0u;
  v70 = self->_kCellularLteCdrxConfigs;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v786, v921, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v787;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v787 != v73)
          objc_enumerationMutation(v70);
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v786, v921, 16);
    }
    while (v72);
  }

  v785 = 0u;
  v784 = 0u;
  v783 = 0u;
  v782 = 0u;
  v75 = self->_kCellularLteRadioLinkFailures;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v782, v920, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v783;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v783 != v78)
          objc_enumerationMutation(v75);
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v782, v920, 16);
    }
    while (v77);
  }

  v781 = 0u;
  v780 = 0u;
  v779 = 0u;
  v778 = 0u;
  v80 = self->_kCellularLtePdcchStateStats;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v778, v919, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v779;
    do
    {
      v84 = 0;
      do
      {
        if (*(_QWORD *)v779 != v83)
          objc_enumerationMutation(v80);
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v778, v919, 16);
    }
    while (v82);
  }

  v777 = 0u;
  v776 = 0u;
  v775 = 0u;
  v774 = 0u;
  v85 = self->_kCellularLqmStateChanges;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v774, v918, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v775;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v775 != v88)
          objc_enumerationMutation(v85);
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v774, v918, 16);
    }
    while (v87);
  }

  v773 = 0u;
  v772 = 0u;
  v771 = 0u;
  v770 = 0u;
  v90 = self->_kCellularServiceLosts;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v770, v917, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v771;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v771 != v93)
          objc_enumerationMutation(v90);
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v770, v917, 16);
    }
    while (v92);
  }

  v769 = 0u;
  v768 = 0u;
  v767 = 0u;
  v766 = 0u;
  v95 = self->_kCellularGsmServingCellRssiHists;
  v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v766, v916, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v767;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v767 != v98)
          objc_enumerationMutation(v95);
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v766, v916, 16);
    }
    while (v97);
  }

  v765 = 0u;
  v764 = 0u;
  v763 = 0u;
  v762 = 0u;
  v100 = self->_kCellularGsmServingCellSnrHists;
  v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v762, v915, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v763;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v763 != v103)
          objc_enumerationMutation(v100);
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v762, v915, 16);
    }
    while (v102);
  }

  v761 = 0u;
  v760 = 0u;
  v759 = 0u;
  v758 = 0u;
  v105 = self->_kCellularGsmTxPowerHists;
  v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v758, v914, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v759;
    do
    {
      v109 = 0;
      do
      {
        if (*(_QWORD *)v759 != v108)
          objc_enumerationMutation(v105);
        PBDataWriterWriteSubmessage();
        ++v109;
      }
      while (v107 != v109);
      v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v758, v914, 16);
    }
    while (v107);
  }

  v757 = 0u;
  v756 = 0u;
  v755 = 0u;
  v754 = 0u;
  v110 = self->_kCellularGsmConnectedModeHists;
  v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v754, v913, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v755;
    do
    {
      v114 = 0;
      do
      {
        if (*(_QWORD *)v755 != v113)
          objc_enumerationMutation(v110);
        PBDataWriterWriteSubmessage();
        ++v114;
      }
      while (v112 != v114);
      v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v754, v913, 16);
    }
    while (v112);
  }

  v753 = 0u;
  v752 = 0u;
  v751 = 0u;
  v750 = 0u;
  v115 = self->_kCellularGsmL1States;
  v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v750, v912, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v751;
    do
    {
      v119 = 0;
      do
      {
        if (*(_QWORD *)v751 != v118)
          objc_enumerationMutation(v115);
        PBDataWriterWriteSubmessage();
        ++v119;
      }
      while (v117 != v119);
      v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v750, v912, 16);
    }
    while (v117);
  }

  v749 = 0u;
  v748 = 0u;
  v747 = 0u;
  v746 = 0u;
  v120 = self->_kCellularWcdmaCpcStats;
  v121 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v746, v911, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v747;
    do
    {
      v124 = 0;
      do
      {
        if (*(_QWORD *)v747 != v123)
          objc_enumerationMutation(v120);
        PBDataWriterWriteSubmessage();
        ++v124;
      }
      while (v122 != v124);
      v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v746, v911, 16);
    }
    while (v122);
  }

  v745 = 0u;
  v744 = 0u;
  v743 = 0u;
  v742 = 0u;
  v125 = self->_kCellularWcdmaRxDiversityHists;
  v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v742, v910, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v743;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v743 != v128)
          objc_enumerationMutation(v125);
        PBDataWriterWriteSubmessage();
        ++v129;
      }
      while (v127 != v129);
      v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v742, v910, 16);
    }
    while (v127);
  }

  v741 = 0u;
  v740 = 0u;
  v739 = 0u;
  v738 = 0u;
  v130 = self->_kCellularWcdmaServingCellRx0RssiHists;
  v131 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v738, v909, 16);
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v739;
    do
    {
      v134 = 0;
      do
      {
        if (*(_QWORD *)v739 != v133)
          objc_enumerationMutation(v130);
        PBDataWriterWriteSubmessage();
        ++v134;
      }
      while (v132 != v134);
      v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v738, v909, 16);
    }
    while (v132);
  }

  v737 = 0u;
  v736 = 0u;
  v735 = 0u;
  v734 = 0u;
  v135 = self->_kCellularWcdmaServingCellRx1RssiHists;
  v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v734, v908, 16);
  if (v136)
  {
    v137 = v136;
    v138 = *(_QWORD *)v735;
    do
    {
      v139 = 0;
      do
      {
        if (*(_QWORD *)v735 != v138)
          objc_enumerationMutation(v135);
        PBDataWriterWriteSubmessage();
        ++v139;
      }
      while (v137 != v139);
      v137 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v734, v908, 16);
    }
    while (v137);
  }

  v733 = 0u;
  v732 = 0u;
  v731 = 0u;
  v730 = 0u;
  v140 = self->_kCellularWcdmaServingCellRx0EcNoHists;
  v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v730, v907, 16);
  if (v141)
  {
    v142 = v141;
    v143 = *(_QWORD *)v731;
    do
    {
      v144 = 0;
      do
      {
        if (*(_QWORD *)v731 != v143)
          objc_enumerationMutation(v140);
        PBDataWriterWriteSubmessage();
        ++v144;
      }
      while (v142 != v144);
      v142 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v730, v907, 16);
    }
    while (v142);
  }

  v729 = 0u;
  v728 = 0u;
  v727 = 0u;
  v726 = 0u;
  v145 = self->_kCellularWcdmaServingCellRx1EcNoHists;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v726, v906, 16);
  if (v146)
  {
    v147 = v146;
    v148 = *(_QWORD *)v727;
    do
    {
      v149 = 0;
      do
      {
        if (*(_QWORD *)v727 != v148)
          objc_enumerationMutation(v145);
        PBDataWriterWriteSubmessage();
        ++v149;
      }
      while (v147 != v149);
      v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v726, v906, 16);
    }
    while (v147);
  }

  v725 = 0u;
  v724 = 0u;
  v723 = 0u;
  v722 = 0u;
  v150 = self->_kCellularWcdmaTxPowerHists;
  v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v722, v905, 16);
  if (v151)
  {
    v152 = v151;
    v153 = *(_QWORD *)v723;
    do
    {
      v154 = 0;
      do
      {
        if (*(_QWORD *)v723 != v153)
          objc_enumerationMutation(v150);
        PBDataWriterWriteSubmessage();
        ++v154;
      }
      while (v152 != v154);
      v152 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v722, v905, 16);
    }
    while (v152);
  }

  v721 = 0u;
  v720 = 0u;
  v719 = 0u;
  v718 = 0u;
  v155 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v718, v904, 16);
  if (v156)
  {
    v157 = v156;
    v158 = *(_QWORD *)v719;
    do
    {
      v159 = 0;
      do
      {
        if (*(_QWORD *)v719 != v158)
          objc_enumerationMutation(v155);
        PBDataWriterWriteSubmessage();
        ++v159;
      }
      while (v157 != v159);
      v157 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v718, v904, 16);
    }
    while (v157);
  }

  v717 = 0u;
  v716 = 0u;
  v715 = 0u;
  v714 = 0u;
  v160 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v714, v903, 16);
  if (v161)
  {
    v162 = v161;
    v163 = *(_QWORD *)v715;
    do
    {
      v164 = 0;
      do
      {
        if (*(_QWORD *)v715 != v163)
          objc_enumerationMutation(v160);
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      v162 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v714, v903, 16);
    }
    while (v162);
  }

  v713 = 0u;
  v712 = 0u;
  v711 = 0u;
  v710 = 0u;
  v165 = self->_kCellularWcdmaCarrierStatusHists;
  v166 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v710, v902, 16);
  if (v166)
  {
    v167 = v166;
    v168 = *(_QWORD *)v711;
    do
    {
      v169 = 0;
      do
      {
        if (*(_QWORD *)v711 != v168)
          objc_enumerationMutation(v165);
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v710, v902, 16);
    }
    while (v167);
  }

  v709 = 0u;
  v708 = 0u;
  v707 = 0u;
  v706 = 0u;
  v170 = self->_kCellularWcdmaRabModeHists;
  v171 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v706, v901, 16);
  if (v171)
  {
    v172 = v171;
    v173 = *(_QWORD *)v707;
    do
    {
      v174 = 0;
      do
      {
        if (*(_QWORD *)v707 != v173)
          objc_enumerationMutation(v170);
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      v172 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v706, v901, 16);
    }
    while (v172);
  }

  v705 = 0u;
  v704 = 0u;
  v703 = 0u;
  v702 = 0u;
  v175 = self->_kCellularWcdmaRabTypeHists;
  v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v702, v900, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v703;
    do
    {
      v179 = 0;
      do
      {
        if (*(_QWORD *)v703 != v178)
          objc_enumerationMutation(v175);
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      v177 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v702, v900, 16);
    }
    while (v177);
  }

  v701 = 0u;
  v700 = 0u;
  v699 = 0u;
  v698 = 0u;
  v180 = self->_kCellularWcdmaRrcConnectionStates;
  v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v698, v899, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v699;
    do
    {
      v184 = 0;
      do
      {
        if (*(_QWORD *)v699 != v183)
          objc_enumerationMutation(v180);
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      v182 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v698, v899, 16);
    }
    while (v182);
  }

  v697 = 0u;
  v696 = 0u;
  v695 = 0u;
  v694 = 0u;
  v185 = self->_kCellularWcdmaRrcConfigurations;
  v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v694, v898, 16);
  if (v186)
  {
    v187 = v186;
    v188 = *(_QWORD *)v695;
    do
    {
      v189 = 0;
      do
      {
        if (*(_QWORD *)v695 != v188)
          objc_enumerationMutation(v185);
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      v187 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v694, v898, 16);
    }
    while (v187);
  }

  v693 = 0u;
  v692 = 0u;
  v691 = 0u;
  v690 = 0u;
  v190 = self->_kCellularWcdmaRabStatus;
  v191 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v690, v897, 16);
  if (v191)
  {
    v192 = v191;
    v193 = *(_QWORD *)v691;
    do
    {
      v194 = 0;
      do
      {
        if (*(_QWORD *)v691 != v193)
          objc_enumerationMutation(v190);
        PBDataWriterWriteSubmessage();
        ++v194;
      }
      while (v192 != v194);
      v192 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v690, v897, 16);
    }
    while (v192);
  }

  v689 = 0u;
  v688 = 0u;
  v687 = 0u;
  v686 = 0u;
  v195 = self->_kCellularWcdmaL1States;
  v196 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v195, "countByEnumeratingWithState:objects:count:", &v686, v896, 16);
  if (v196)
  {
    v197 = v196;
    v198 = *(_QWORD *)v687;
    do
    {
      v199 = 0;
      do
      {
        if (*(_QWORD *)v687 != v198)
          objc_enumerationMutation(v195);
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      v197 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v195, "countByEnumeratingWithState:objects:count:", &v686, v896, 16);
    }
    while (v197);
  }

  v685 = 0u;
  v684 = 0u;
  v683 = 0u;
  v682 = 0u;
  v200 = self->_kCellularWcdmaDataInactivityBeforeIdles;
  v201 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v682, v895, 16);
  if (v201)
  {
    v202 = v201;
    v203 = *(_QWORD *)v683;
    do
    {
      v204 = 0;
      do
      {
        if (*(_QWORD *)v683 != v203)
          objc_enumerationMutation(v200);
        PBDataWriterWriteSubmessage();
        ++v204;
      }
      while (v202 != v204);
      v202 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v682, v895, 16);
    }
    while (v202);
  }

  v681 = 0u;
  v680 = 0u;
  v679 = 0u;
  v678 = 0u;
  v205 = self->_kCellularWcdmaIdleToConnectedUserDatas;
  v206 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v678, v894, 16);
  if (v206)
  {
    v207 = v206;
    v208 = *(_QWORD *)v679;
    do
    {
      v209 = 0;
      do
      {
        if (*(_QWORD *)v679 != v208)
          objc_enumerationMutation(v205);
        PBDataWriterWriteSubmessage();
        ++v209;
      }
      while (v207 != v209);
      v207 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v678, v894, 16);
    }
    while (v207);
  }

  v677 = 0u;
  v676 = 0u;
  v675 = 0u;
  v674 = 0u;
  v210 = self->_kCellularWcdmaVadHists;
  v211 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v674, v893, 16);
  if (v211)
  {
    v212 = v211;
    v213 = *(_QWORD *)v675;
    do
    {
      v214 = 0;
      do
      {
        if (*(_QWORD *)v675 != v213)
          objc_enumerationMutation(v210);
        PBDataWriterWriteSubmessage();
        ++v214;
      }
      while (v212 != v214);
      v212 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v674, v893, 16);
    }
    while (v212);
  }

  v673 = 0u;
  v672 = 0u;
  v671 = 0u;
  v670 = 0u;
  v215 = self->_kCellularTdsRxDiversityHists;
  v216 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v670, v892, 16);
  if (v216)
  {
    v217 = v216;
    v218 = *(_QWORD *)v671;
    do
    {
      v219 = 0;
      do
      {
        if (*(_QWORD *)v671 != v218)
          objc_enumerationMutation(v215);
        PBDataWriterWriteSubmessage();
        ++v219;
      }
      while (v217 != v219);
      v217 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v670, v892, 16);
    }
    while (v217);
  }

  v669 = 0u;
  v668 = 0u;
  v667 = 0u;
  v666 = 0u;
  v220 = self->_kCellularTdsServingCellRx0RssiHists;
  v221 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v220, "countByEnumeratingWithState:objects:count:", &v666, v891, 16);
  if (v221)
  {
    v222 = v221;
    v223 = *(_QWORD *)v667;
    do
    {
      v224 = 0;
      do
      {
        if (*(_QWORD *)v667 != v223)
          objc_enumerationMutation(v220);
        PBDataWriterWriteSubmessage();
        ++v224;
      }
      while (v222 != v224);
      v222 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v220, "countByEnumeratingWithState:objects:count:", &v666, v891, 16);
    }
    while (v222);
  }

  v665 = 0u;
  v664 = 0u;
  v663 = 0u;
  v662 = 0u;
  v225 = self->_kCellularTdsServingCellRx1RssiHists;
  v226 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v662, v890, 16);
  if (v226)
  {
    v227 = v226;
    v228 = *(_QWORD *)v663;
    do
    {
      v229 = 0;
      do
      {
        if (*(_QWORD *)v663 != v228)
          objc_enumerationMutation(v225);
        PBDataWriterWriteSubmessage();
        ++v229;
      }
      while (v227 != v229);
      v227 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v662, v890, 16);
    }
    while (v227);
  }

  v661 = 0u;
  v660 = 0u;
  v659 = 0u;
  v658 = 0u;
  v230 = self->_kCellularTdsServingCellRx0RscpHists;
  v231 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v230, "countByEnumeratingWithState:objects:count:", &v658, v889, 16);
  if (v231)
  {
    v232 = v231;
    v233 = *(_QWORD *)v659;
    do
    {
      v234 = 0;
      do
      {
        if (*(_QWORD *)v659 != v233)
          objc_enumerationMutation(v230);
        PBDataWriterWriteSubmessage();
        ++v234;
      }
      while (v232 != v234);
      v232 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v230, "countByEnumeratingWithState:objects:count:", &v658, v889, 16);
    }
    while (v232);
  }

  v657 = 0u;
  v656 = 0u;
  v655 = 0u;
  v654 = 0u;
  v235 = self->_kCellularTdsServingCellRx1RscpHists;
  v236 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v654, v888, 16);
  if (v236)
  {
    v237 = v236;
    v238 = *(_QWORD *)v655;
    do
    {
      v239 = 0;
      do
      {
        if (*(_QWORD *)v655 != v238)
          objc_enumerationMutation(v235);
        PBDataWriterWriteSubmessage();
        ++v239;
      }
      while (v237 != v239);
      v237 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v654, v888, 16);
    }
    while (v237);
  }

  v653 = 0u;
  v652 = 0u;
  v651 = 0u;
  v650 = 0u;
  v240 = self->_kCellularTdsTxPowerHists;
  v241 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v650, v887, 16);
  if (v241)
  {
    v242 = v241;
    v243 = *(_QWORD *)v651;
    do
    {
      v244 = 0;
      do
      {
        if (*(_QWORD *)v651 != v243)
          objc_enumerationMutation(v240);
        PBDataWriterWriteSubmessage();
        ++v244;
      }
      while (v242 != v244);
      v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v650, v887, 16);
    }
    while (v242);
  }

  v649 = 0u;
  v648 = 0u;
  v647 = 0u;
  v646 = 0u;
  v245 = self->_kCellularTdsRabModeHists;
  v246 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v245, "countByEnumeratingWithState:objects:count:", &v646, v886, 16);
  if (v246)
  {
    v247 = v246;
    v248 = *(_QWORD *)v647;
    do
    {
      v249 = 0;
      do
      {
        if (*(_QWORD *)v647 != v248)
          objc_enumerationMutation(v245);
        PBDataWriterWriteSubmessage();
        ++v249;
      }
      while (v247 != v249);
      v247 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v245, "countByEnumeratingWithState:objects:count:", &v646, v886, 16);
    }
    while (v247);
  }

  v645 = 0u;
  v644 = 0u;
  v643 = 0u;
  v642 = 0u;
  v250 = self->_kCellularTdsRabTypeHists;
  v251 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v642, v885, 16);
  if (v251)
  {
    v252 = v251;
    v253 = *(_QWORD *)v643;
    do
    {
      v254 = 0;
      do
      {
        if (*(_QWORD *)v643 != v253)
          objc_enumerationMutation(v250);
        PBDataWriterWriteSubmessage();
        ++v254;
      }
      while (v252 != v254);
      v252 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v642, v885, 16);
    }
    while (v252);
  }

  v641 = 0u;
  v640 = 0u;
  v639 = 0u;
  v638 = 0u;
  v255 = self->_kCellularTdsL1States;
  v256 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v255, "countByEnumeratingWithState:objects:count:", &v638, v884, 16);
  if (v256)
  {
    v257 = v256;
    v258 = *(_QWORD *)v639;
    do
    {
      v259 = 0;
      do
      {
        if (*(_QWORD *)v639 != v258)
          objc_enumerationMutation(v255);
        PBDataWriterWriteSubmessage();
        ++v259;
      }
      while (v257 != v259);
      v257 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v255, "countByEnumeratingWithState:objects:count:", &v638, v884, 16);
    }
    while (v257);
  }

  v637 = 0u;
  v636 = 0u;
  v635 = 0u;
  v634 = 0u;
  v260 = self->_kCellularLteFwDuplexModes;
  v261 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v634, v883, 16);
  if (v261)
  {
    v262 = v261;
    v263 = *(_QWORD *)v635;
    do
    {
      v264 = 0;
      do
      {
        if (*(_QWORD *)v635 != v263)
          objc_enumerationMutation(v260);
        PBDataWriterWriteSubmessage();
        ++v264;
      }
      while (v262 != v264);
      v262 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v634, v883, 16);
    }
    while (v262);
  }

  v633 = 0u;
  v632 = 0u;
  v631 = 0u;
  v630 = 0u;
  v265 = self->_kCellularLteServingCellRsrpHists;
  v266 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v630, v882, 16);
  if (v266)
  {
    v267 = v266;
    v268 = *(_QWORD *)v631;
    do
    {
      v269 = 0;
      do
      {
        if (*(_QWORD *)v631 != v268)
          objc_enumerationMutation(v265);
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      v267 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v630, v882, 16);
    }
    while (v267);
  }

  v629 = 0u;
  v628 = 0u;
  v627 = 0u;
  v626 = 0u;
  v270 = self->_kCellularLteServingCellSinrHists;
  v271 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v626, v881, 16);
  if (v271)
  {
    v272 = v271;
    v273 = *(_QWORD *)v627;
    do
    {
      v274 = 0;
      do
      {
        if (*(_QWORD *)v627 != v273)
          objc_enumerationMutation(v270);
        PBDataWriterWriteSubmessage();
        ++v274;
      }
      while (v272 != v274);
      v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v626, v881, 16);
    }
    while (v272);
  }

  v625 = 0u;
  v624 = 0u;
  v623 = 0u;
  v622 = 0u;
  v275 = self->_kCellularLteSleepStateHists;
  v276 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v622, v880, 16);
  if (v276)
  {
    v277 = v276;
    v278 = *(_QWORD *)v623;
    do
    {
      v279 = 0;
      do
      {
        if (*(_QWORD *)v623 != v278)
          objc_enumerationMutation(v275);
        PBDataWriterWriteSubmessage();
        ++v279;
      }
      while (v277 != v279);
      v277 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v622, v880, 16);
    }
    while (v277);
  }

  v621 = 0u;
  v620 = 0u;
  v619 = 0u;
  v618 = 0u;
  v280 = self->_kCellularLteTxPowerHists;
  v281 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v280, "countByEnumeratingWithState:objects:count:", &v618, v879, 16);
  if (v281)
  {
    v282 = v281;
    v283 = *(_QWORD *)v619;
    do
    {
      v284 = 0;
      do
      {
        if (*(_QWORD *)v619 != v283)
          objc_enumerationMutation(v280);
        PBDataWriterWriteSubmessage();
        ++v284;
      }
      while (v282 != v284);
      v282 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v280, "countByEnumeratingWithState:objects:count:", &v618, v879, 16);
    }
    while (v282);
  }

  v617 = 0u;
  v616 = 0u;
  v615 = 0u;
  v614 = 0u;
  v285 = self->_kCellularLteDlSccStateHists;
  v286 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v614, v878, 16);
  if (v286)
  {
    v287 = v286;
    v288 = *(_QWORD *)v615;
    do
    {
      v289 = 0;
      do
      {
        if (*(_QWORD *)v615 != v288)
          objc_enumerationMutation(v285);
        PBDataWriterWriteSubmessage();
        ++v289;
      }
      while (v287 != v289);
      v287 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v614, v878, 16);
    }
    while (v287);
  }

  v613 = 0u;
  v612 = 0u;
  v611 = 0u;
  v610 = 0u;
  v290 = self->_kCellularLteUlSccStateHists;
  v291 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v290, "countByEnumeratingWithState:objects:count:", &v610, v877, 16);
  if (v291)
  {
    v292 = v291;
    v293 = *(_QWORD *)v611;
    do
    {
      v294 = 0;
      do
      {
        if (*(_QWORD *)v611 != v293)
          objc_enumerationMutation(v290);
        PBDataWriterWriteSubmessage();
        ++v294;
      }
      while (v292 != v294);
      v292 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v290, "countByEnumeratingWithState:objects:count:", &v610, v877, 16);
    }
    while (v292);
  }

  v609 = 0u;
  v608 = 0u;
  v607 = 0u;
  v606 = 0u;
  v295 = self->_kCellularLteAdvancedRxStateHists;
  v296 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v606, v876, 16);
  if (v296)
  {
    v297 = v296;
    v298 = *(_QWORD *)v607;
    do
    {
      v299 = 0;
      do
      {
        if (*(_QWORD *)v607 != v298)
          objc_enumerationMutation(v295);
        PBDataWriterWriteSubmessage();
        ++v299;
      }
      while (v297 != v299);
      v297 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v606, v876, 16);
    }
    while (v297);
  }

  v605 = 0u;
  v604 = 0u;
  v603 = 0u;
  v602 = 0u;
  v300 = self->_kCellularLteComponentCarrierInfos;
  v301 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v602, v875, 16);
  if (v301)
  {
    v302 = v301;
    v303 = *(_QWORD *)v603;
    do
    {
      v304 = 0;
      do
      {
        if (*(_QWORD *)v603 != v303)
          objc_enumerationMutation(v300);
        PBDataWriterWriteSubmessage();
        ++v304;
      }
      while (v302 != v304);
      v302 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v602, v875, 16);
    }
    while (v302);
  }

  v601 = 0u;
  v600 = 0u;
  v599 = 0u;
  v598 = 0u;
  v305 = self->_kCellularLteRxTxStateHists;
  v306 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v305, "countByEnumeratingWithState:objects:count:", &v598, v874, 16);
  if (v306)
  {
    v307 = v306;
    v308 = *(_QWORD *)v599;
    do
    {
      v309 = 0;
      do
      {
        if (*(_QWORD *)v599 != v308)
          objc_enumerationMutation(v305);
        PBDataWriterWriteSubmessage();
        ++v309;
      }
      while (v307 != v309);
      v307 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v305, "countByEnumeratingWithState:objects:count:", &v598, v874, 16);
    }
    while (v307);
  }

  v597 = 0u;
  v596 = 0u;
  v595 = 0u;
  v594 = 0u;
  v310 = self->_kCellularLteTotalDlTbsHists;
  v311 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v594, v873, 16);
  if (v311)
  {
    v312 = v311;
    v313 = *(_QWORD *)v595;
    do
    {
      v314 = 0;
      do
      {
        if (*(_QWORD *)v595 != v313)
          objc_enumerationMutation(v310);
        PBDataWriterWriteSubmessage();
        ++v314;
      }
      while (v312 != v314);
      v312 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v594, v873, 16);
    }
    while (v312);
  }

  v593 = 0u;
  v592 = 0u;
  v591 = 0u;
  v590 = 0u;
  v315 = self->_kCellularLteDataInactivityBeforeIdles;
  v316 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v315, "countByEnumeratingWithState:objects:count:", &v590, v872, 16);
  if (v316)
  {
    v317 = v316;
    v318 = *(_QWORD *)v591;
    do
    {
      v319 = 0;
      do
      {
        if (*(_QWORD *)v591 != v318)
          objc_enumerationMutation(v315);
        PBDataWriterWriteSubmessage();
        ++v319;
      }
      while (v317 != v319);
      v317 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v315, "countByEnumeratingWithState:objects:count:", &v590, v872, 16);
    }
    while (v317);
  }

  v589 = 0u;
  v588 = 0u;
  v587 = 0u;
  v586 = 0u;
  v320 = self->_kCellularLteIdleToConnectedUserDatas;
  v321 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v586, v871, 16);
  if (v321)
  {
    v322 = v321;
    v323 = *(_QWORD *)v587;
    do
    {
      v324 = 0;
      do
      {
        if (*(_QWORD *)v587 != v323)
          objc_enumerationMutation(v320);
        PBDataWriterWriteSubmessage();
        ++v324;
      }
      while (v322 != v324);
      v322 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v586, v871, 16);
    }
    while (v322);
  }

  v585 = 0u;
  v584 = 0u;
  v583 = 0u;
  v582 = 0u;
  v325 = self->_kCellularLteDlSccStateHistV3s;
  v326 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v582, v870, 16);
  if (v326)
  {
    v327 = v326;
    v328 = *(_QWORD *)v583;
    do
    {
      v329 = 0;
      do
      {
        if (*(_QWORD *)v583 != v328)
          objc_enumerationMutation(v325);
        PBDataWriterWriteSubmessage();
        ++v329;
      }
      while (v327 != v329);
      v327 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v582, v870, 16);
    }
    while (v327);
  }

  v581 = 0u;
  v580 = 0u;
  v579 = 0u;
  v578 = 0u;
  v330 = self->_kCellularLteRxDiversityHists;
  v331 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v578, v869, 16);
  if (v331)
  {
    v332 = v331;
    v333 = *(_QWORD *)v579;
    do
    {
      v334 = 0;
      do
      {
        if (*(_QWORD *)v579 != v333)
          objc_enumerationMutation(v330);
        PBDataWriterWriteSubmessage();
        ++v334;
      }
      while (v332 != v334);
      v332 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v578, v869, 16);
    }
    while (v332);
  }

  v577 = 0u;
  v576 = 0u;
  v575 = 0u;
  v574 = 0u;
  v335 = self->_kCellularLtePdcchStateHists;
  v336 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v335, "countByEnumeratingWithState:objects:count:", &v574, v868, 16);
  if (v336)
  {
    v337 = v336;
    v338 = *(_QWORD *)v575;
    do
    {
      v339 = 0;
      do
      {
        if (*(_QWORD *)v575 != v338)
          objc_enumerationMutation(v335);
        PBDataWriterWriteSubmessage();
        ++v339;
      }
      while (v337 != v339);
      v337 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v335, "countByEnumeratingWithState:objects:count:", &v574, v868, 16);
    }
    while (v337);
  }

  v573 = 0u;
  v572 = 0u;
  v571 = 0u;
  v570 = 0u;
  v340 = self->_kCellularProtocolStackStateHists;
  v341 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v340, "countByEnumeratingWithState:objects:count:", &v570, v867, 16);
  if (v341)
  {
    v342 = v341;
    v343 = *(_QWORD *)v571;
    do
    {
      v344 = 0;
      do
      {
        if (*(_QWORD *)v571 != v343)
          objc_enumerationMutation(v340);
        PBDataWriterWriteSubmessage();
        ++v344;
      }
      while (v342 != v344);
      v342 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v340, "countByEnumeratingWithState:objects:count:", &v570, v867, 16);
    }
    while (v342);
  }

  v569 = 0u;
  v568 = 0u;
  v567 = 0u;
  v566 = 0u;
  v345 = self->_kCellularCellPlmnSearchCounts;
  v346 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v566, v866, 16);
  if (v346)
  {
    v347 = v346;
    v348 = *(_QWORD *)v567;
    do
    {
      v349 = 0;
      do
      {
        if (*(_QWORD *)v567 != v348)
          objc_enumerationMutation(v345);
        PBDataWriterWriteSubmessage();
        ++v349;
      }
      while (v347 != v349);
      v347 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v566, v866, 16);
    }
    while (v347);
  }

  v565 = 0u;
  v564 = 0u;
  v563 = 0u;
  v562 = 0u;
  v350 = self->_kCellularCellPlmnSearchHists;
  v351 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v350, "countByEnumeratingWithState:objects:count:", &v562, v865, 16);
  if (v351)
  {
    v352 = v351;
    v353 = *(_QWORD *)v563;
    do
    {
      v354 = 0;
      do
      {
        if (*(_QWORD *)v563 != v353)
          objc_enumerationMutation(v350);
        PBDataWriterWriteSubmessage();
        ++v354;
      }
      while (v352 != v354);
      v352 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v350, "countByEnumeratingWithState:objects:count:", &v562, v865, 16);
    }
    while (v352);
  }

  v561 = 0u;
  v560 = 0u;
  v559 = 0u;
  v558 = 0u;
  v355 = self->_kCellularProtocolStackPowerStates;
  v356 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v558, v864, 16);
  if (v356)
  {
    v357 = v356;
    v358 = *(_QWORD *)v559;
    do
    {
      v359 = 0;
      do
      {
        if (*(_QWORD *)v559 != v358)
          objc_enumerationMutation(v355);
        PBDataWriterWriteSubmessage();
        ++v359;
      }
      while (v357 != v359);
      v357 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v558, v864, 16);
    }
    while (v357);
  }

  v557 = 0u;
  v556 = 0u;
  v555 = 0u;
  v554 = 0u;
  v360 = self->_kCellularDownlinkIpPacketFilterStatus;
  v361 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v554, v863, 16);
  if (v361)
  {
    v362 = v361;
    v363 = *(_QWORD *)v555;
    do
    {
      v364 = 0;
      do
      {
        if (*(_QWORD *)v555 != v363)
          objc_enumerationMutation(v360);
        PBDataWriterWriteSubmessage();
        ++v364;
      }
      while (v362 != v364);
      v362 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v554, v863, 16);
    }
    while (v362);
  }

  v553 = 0u;
  v552 = 0u;
  v551 = 0u;
  v550 = 0u;
  v365 = self->_kCellularDownlinkIpPacketDiscardeds;
  v366 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v365, "countByEnumeratingWithState:objects:count:", &v550, v862, 16);
  if (v366)
  {
    v367 = v366;
    v368 = *(_QWORD *)v551;
    do
    {
      v369 = 0;
      do
      {
        if (*(_QWORD *)v551 != v368)
          objc_enumerationMutation(v365);
        PBDataWriterWriteSubmessage();
        ++v369;
      }
      while (v367 != v369);
      v367 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v365, "countByEnumeratingWithState:objects:count:", &v550, v862, 16);
    }
    while (v367);
  }

  v549 = 0u;
  v548 = 0u;
  v547 = 0u;
  v546 = 0u;
  v370 = self->_kCellularServingCellRfBandHists;
  v371 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v370, "countByEnumeratingWithState:objects:count:", &v546, v861, 16);
  if (v371)
  {
    v372 = v371;
    v373 = *(_QWORD *)v547;
    do
    {
      v374 = 0;
      do
      {
        if (*(_QWORD *)v547 != v373)
          objc_enumerationMutation(v370);
        PBDataWriterWriteSubmessage();
        ++v374;
      }
      while (v372 != v374);
      v372 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v370, "countByEnumeratingWithState:objects:count:", &v546, v861, 16);
    }
    while (v372);
  }

  v545 = 0u;
  v544 = 0u;
  v543 = 0u;
  v542 = 0u;
  v375 = self->_kCellularProtocolStackStateHist2s;
  v376 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v375, "countByEnumeratingWithState:objects:count:", &v542, v860, 16);
  if (v376)
  {
    v377 = v376;
    v378 = *(_QWORD *)v543;
    do
    {
      v379 = 0;
      do
      {
        if (*(_QWORD *)v543 != v378)
          objc_enumerationMutation(v375);
        PBDataWriterWriteSubmessage();
        ++v379;
      }
      while (v377 != v379);
      v377 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v375, "countByEnumeratingWithState:objects:count:", &v542, v860, 16);
    }
    while (v377);
  }

  v541 = 0u;
  v540 = 0u;
  v539 = 0u;
  v538 = 0u;
  v380 = self->_kCellularProtocolStackStates;
  v381 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v380, "countByEnumeratingWithState:objects:count:", &v538, v859, 16);
  if (v381)
  {
    v382 = v381;
    v383 = *(_QWORD *)v539;
    do
    {
      v384 = 0;
      do
      {
        if (*(_QWORD *)v539 != v383)
          objc_enumerationMutation(v380);
        PBDataWriterWriteSubmessage();
        ++v384;
      }
      while (v382 != v384);
      v382 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v380, "countByEnumeratingWithState:objects:count:", &v538, v859, 16);
    }
    while (v382);
  }

  v537 = 0u;
  v536 = 0u;
  v535 = 0u;
  v534 = 0u;
  v385 = self->_kCellularCdma1XRxDiversityHists;
  v386 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v385, "countByEnumeratingWithState:objects:count:", &v534, v858, 16);
  if (v386)
  {
    v387 = v386;
    v388 = *(_QWORD *)v535;
    do
    {
      v389 = 0;
      do
      {
        if (*(_QWORD *)v535 != v388)
          objc_enumerationMutation(v385);
        PBDataWriterWriteSubmessage();
        ++v389;
      }
      while (v387 != v389);
      v387 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v385, "countByEnumeratingWithState:objects:count:", &v534, v858, 16);
    }
    while (v387);
  }

  v532 = 0u;
  v533 = 0u;
  v530 = 0u;
  v531 = 0u;
  v390 = self->_kCellularCdma1XServingCellRx0RssiHists;
  v391 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v530, v857, 16);
  if (v391)
  {
    v392 = v391;
    v393 = *(_QWORD *)v531;
    do
    {
      v394 = 0;
      do
      {
        if (*(_QWORD *)v531 != v393)
          objc_enumerationMutation(v390);
        PBDataWriterWriteSubmessage();
        ++v394;
      }
      while (v392 != v394);
      v392 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v530, v857, 16);
    }
    while (v392);
  }

  v528 = 0u;
  v529 = 0u;
  v526 = 0u;
  v527 = 0u;
  v395 = self->_kCellularCdma1XServingCellRx1RssiHists;
  v396 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v395, "countByEnumeratingWithState:objects:count:", &v526, v856, 16);
  if (v396)
  {
    v397 = v396;
    v398 = *(_QWORD *)v527;
    do
    {
      v399 = 0;
      do
      {
        if (*(_QWORD *)v527 != v398)
          objc_enumerationMutation(v395);
        PBDataWriterWriteSubmessage();
        ++v399;
      }
      while (v397 != v399);
      v397 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v395, "countByEnumeratingWithState:objects:count:", &v526, v856, 16);
    }
    while (v397);
  }

  v524 = 0u;
  v525 = 0u;
  v522 = 0u;
  v523 = 0u;
  v400 = self->_kCellularCdma1XServingCellRx0EcIoHists;
  v401 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v400, "countByEnumeratingWithState:objects:count:", &v522, v855, 16);
  if (v401)
  {
    v402 = v401;
    v403 = *(_QWORD *)v523;
    do
    {
      v404 = 0;
      do
      {
        if (*(_QWORD *)v523 != v403)
          objc_enumerationMutation(v400);
        PBDataWriterWriteSubmessage();
        ++v404;
      }
      while (v402 != v404);
      v402 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v400, "countByEnumeratingWithState:objects:count:", &v522, v855, 16);
    }
    while (v402);
  }

  v520 = 0u;
  v521 = 0u;
  v518 = 0u;
  v519 = 0u;
  v405 = self->_kCellularCdma1XServingCellRx1EcIoHists;
  v406 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v405, "countByEnumeratingWithState:objects:count:", &v518, v854, 16);
  if (v406)
  {
    v407 = v406;
    v408 = *(_QWORD *)v519;
    do
    {
      v409 = 0;
      do
      {
        if (*(_QWORD *)v519 != v408)
          objc_enumerationMutation(v405);
        PBDataWriterWriteSubmessage();
        ++v409;
      }
      while (v407 != v409);
      v407 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v405, "countByEnumeratingWithState:objects:count:", &v518, v854, 16);
    }
    while (v407);
  }

  v516 = 0u;
  v517 = 0u;
  v514 = 0u;
  v515 = 0u;
  v410 = self->_kCellularCdma1XTxPowerHists;
  v411 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v410, "countByEnumeratingWithState:objects:count:", &v514, v853, 16);
  if (v411)
  {
    v412 = v411;
    v413 = *(_QWORD *)v515;
    do
    {
      v414 = 0;
      do
      {
        if (*(_QWORD *)v515 != v413)
          objc_enumerationMutation(v410);
        PBDataWriterWriteSubmessage();
        ++v414;
      }
      while (v412 != v414);
      v412 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v410, "countByEnumeratingWithState:objects:count:", &v514, v853, 16);
    }
    while (v412);
  }

  v512 = 0u;
  v513 = 0u;
  v510 = 0u;
  v511 = 0u;
  v415 = self->_kCellularCdma1XProtocolStackStateHists;
  v416 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v415, "countByEnumeratingWithState:objects:count:", &v510, v852, 16);
  if (v416)
  {
    v417 = v416;
    v418 = *(_QWORD *)v511;
    do
    {
      v419 = 0;
      do
      {
        if (*(_QWORD *)v511 != v418)
          objc_enumerationMutation(v415);
        PBDataWriterWriteSubmessage();
        ++v419;
      }
      while (v417 != v419);
      v417 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v415, "countByEnumeratingWithState:objects:count:", &v510, v852, 16);
    }
    while (v417);
  }

  v508 = 0u;
  v509 = 0u;
  v506 = 0u;
  v507 = 0u;
  v420 = self->_kCellularCdma1XConnectionHists;
  v421 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v420, "countByEnumeratingWithState:objects:count:", &v506, v851, 16);
  if (v421)
  {
    v422 = v421;
    v423 = *(_QWORD *)v507;
    do
    {
      v424 = 0;
      do
      {
        if (*(_QWORD *)v507 != v423)
          objc_enumerationMutation(v420);
        PBDataWriterWriteSubmessage();
        ++v424;
      }
      while (v422 != v424);
      v422 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v420, "countByEnumeratingWithState:objects:count:", &v506, v851, 16);
    }
    while (v422);
  }

  v504 = 0u;
  v505 = 0u;
  v502 = 0u;
  v503 = 0u;
  v425 = self->_kCellularCdma1XRrStates;
  v426 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v425, "countByEnumeratingWithState:objects:count:", &v502, v850, 16);
  if (v426)
  {
    v427 = v426;
    v428 = *(_QWORD *)v503;
    do
    {
      v429 = 0;
      do
      {
        if (*(_QWORD *)v503 != v428)
          objc_enumerationMutation(v425);
        PBDataWriterWriteSubmessage();
        ++v429;
      }
      while (v427 != v429);
      v427 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v425, "countByEnumeratingWithState:objects:count:", &v502, v850, 16);
    }
    while (v427);
  }

  v500 = 0u;
  v501 = 0u;
  v498 = 0u;
  v499 = 0u;
  v430 = self->_kCellularCdmaEvdoRxDiversityHists;
  v431 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v430, "countByEnumeratingWithState:objects:count:", &v498, v849, 16);
  if (v431)
  {
    v432 = v431;
    v433 = *(_QWORD *)v499;
    do
    {
      v434 = 0;
      do
      {
        if (*(_QWORD *)v499 != v433)
          objc_enumerationMutation(v430);
        PBDataWriterWriteSubmessage();
        ++v434;
      }
      while (v432 != v434);
      v432 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v430, "countByEnumeratingWithState:objects:count:", &v498, v849, 16);
    }
    while (v432);
  }

  v496 = 0u;
  v497 = 0u;
  v494 = 0u;
  v495 = 0u;
  v435 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  v436 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v435, "countByEnumeratingWithState:objects:count:", &v494, v848, 16);
  if (v436)
  {
    v437 = v436;
    v438 = *(_QWORD *)v495;
    do
    {
      v439 = 0;
      do
      {
        if (*(_QWORD *)v495 != v438)
          objc_enumerationMutation(v435);
        PBDataWriterWriteSubmessage();
        ++v439;
      }
      while (v437 != v439);
      v437 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v435, "countByEnumeratingWithState:objects:count:", &v494, v848, 16);
    }
    while (v437);
  }

  v492 = 0u;
  v493 = 0u;
  v490 = 0u;
  v491 = 0u;
  v440 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  v441 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v440, "countByEnumeratingWithState:objects:count:", &v490, v847, 16);
  if (v441)
  {
    v442 = v441;
    v443 = *(_QWORD *)v491;
    do
    {
      v444 = 0;
      do
      {
        if (*(_QWORD *)v491 != v443)
          objc_enumerationMutation(v440);
        PBDataWriterWriteSubmessage();
        ++v444;
      }
      while (v442 != v444);
      v442 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v440, "countByEnumeratingWithState:objects:count:", &v490, v847, 16);
    }
    while (v442);
  }

  v488 = 0u;
  v489 = 0u;
  v486 = 0u;
  v487 = 0u;
  v445 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  v446 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v445, "countByEnumeratingWithState:objects:count:", &v486, v846, 16);
  if (v446)
  {
    v447 = v446;
    v448 = *(_QWORD *)v487;
    do
    {
      v449 = 0;
      do
      {
        if (*(_QWORD *)v487 != v448)
          objc_enumerationMutation(v445);
        PBDataWriterWriteSubmessage();
        ++v449;
      }
      while (v447 != v449);
      v447 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v445, "countByEnumeratingWithState:objects:count:", &v486, v846, 16);
    }
    while (v447);
  }

  v484 = 0u;
  v485 = 0u;
  v482 = 0u;
  v483 = 0u;
  v450 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  v451 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v482, v845, 16);
  if (v451)
  {
    v452 = v451;
    v453 = *(_QWORD *)v483;
    do
    {
      v454 = 0;
      do
      {
        if (*(_QWORD *)v483 != v453)
          objc_enumerationMutation(v450);
        PBDataWriterWriteSubmessage();
        ++v454;
      }
      while (v452 != v454);
      v452 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v482, v845, 16);
    }
    while (v452);
  }

  v480 = 0u;
  v481 = 0u;
  v478 = 0u;
  v479 = 0u;
  v455 = self->_kCellularCdmaEvdoTxPowerHists;
  v456 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v455, "countByEnumeratingWithState:objects:count:", &v478, v844, 16);
  if (v456)
  {
    v457 = v456;
    v458 = *(_QWORD *)v479;
    do
    {
      v459 = 0;
      do
      {
        if (*(_QWORD *)v479 != v458)
          objc_enumerationMutation(v455);
        PBDataWriterWriteSubmessage();
        ++v459;
      }
      while (v457 != v459);
      v457 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v455, "countByEnumeratingWithState:objects:count:", &v478, v844, 16);
    }
    while (v457);
  }

  v476 = 0u;
  v477 = 0u;
  v474 = 0u;
  v475 = 0u;
  v460 = self->_kCellularCdmaEvdoProtocolStackStateHists;
  v461 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v460, "countByEnumeratingWithState:objects:count:", &v474, v843, 16);
  if (v461)
  {
    v462 = v461;
    v463 = *(_QWORD *)v475;
    do
    {
      v464 = 0;
      do
      {
        if (*(_QWORD *)v475 != v463)
          objc_enumerationMutation(v460);
        PBDataWriterWriteSubmessage();
        ++v464;
      }
      while (v462 != v464);
      v462 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v460, "countByEnumeratingWithState:objects:count:", &v474, v843, 16);
    }
    while (v462);
  }

  v472 = 0u;
  v473 = 0u;
  v470 = 0u;
  v471 = 0u;
  v465 = self->_kCellularCdmaEvdoRrStates;
  v466 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v465, "countByEnumeratingWithState:objects:count:", &v470, v842, 16);
  if (v466)
  {
    v467 = v466;
    v468 = *(_QWORD *)v471;
    do
    {
      v469 = 0;
      do
      {
        if (*(_QWORD *)v471 != v468)
          objc_enumerationMutation(v465);
        PBDataWriterWriteSubmessage();
        ++v469;
      }
      while (v467 != v469);
      v467 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v465, "countByEnumeratingWithState:objects:count:", &v470, v842, 16);
    }
    while (v467);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t kk;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t mm;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t nn;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t i1;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t i2;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t i3;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t i4;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t i5;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t i6;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t i7;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t i8;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t i9;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t i10;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t i11;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t i12;
  void *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t i13;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t i14;
  void *v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t i15;
  void *v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t i16;
  void *v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t i17;
  void *v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t i18;
  void *v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t i19;
  void *v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t i20;
  void *v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t i21;
  void *v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t i22;
  void *v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t i23;
  void *v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t i24;
  void *v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t i25;
  void *v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t i26;
  void *v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t i27;
  void *v151;
  unint64_t v152;
  unint64_t v153;
  uint64_t i28;
  void *v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t i29;
  void *v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t i30;
  void *v163;
  unint64_t v164;
  unint64_t v165;
  uint64_t i31;
  void *v167;
  unint64_t v168;
  unint64_t v169;
  uint64_t i32;
  void *v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t i33;
  void *v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t i34;
  void *v179;
  unint64_t v180;
  unint64_t v181;
  uint64_t i35;
  void *v183;
  unint64_t v184;
  unint64_t v185;
  uint64_t i36;
  void *v187;
  unint64_t v188;
  unint64_t v189;
  uint64_t i37;
  void *v191;
  unint64_t v192;
  unint64_t v193;
  uint64_t i38;
  void *v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t i39;
  void *v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t i40;
  void *v203;
  unint64_t v204;
  unint64_t v205;
  uint64_t i41;
  void *v207;
  unint64_t v208;
  unint64_t v209;
  uint64_t i42;
  void *v211;
  unint64_t v212;
  unint64_t v213;
  uint64_t i43;
  void *v215;
  unint64_t v216;
  unint64_t v217;
  uint64_t i44;
  void *v219;
  unint64_t v220;
  unint64_t v221;
  uint64_t i45;
  void *v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t i46;
  void *v227;
  unint64_t v228;
  unint64_t v229;
  uint64_t i47;
  void *v231;
  unint64_t v232;
  unint64_t v233;
  uint64_t i48;
  void *v235;
  unint64_t v236;
  unint64_t v237;
  uint64_t i49;
  void *v239;
  unint64_t v240;
  unint64_t v241;
  uint64_t i50;
  void *v243;
  unint64_t v244;
  unint64_t v245;
  uint64_t i51;
  void *v247;
  unint64_t v248;
  unint64_t v249;
  uint64_t i52;
  void *v251;
  unint64_t v252;
  unint64_t v253;
  uint64_t i53;
  void *v255;
  unint64_t v256;
  unint64_t v257;
  uint64_t i54;
  void *v259;
  unint64_t v260;
  unint64_t v261;
  uint64_t i55;
  void *v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t i56;
  void *v267;
  unint64_t v268;
  unint64_t v269;
  uint64_t i57;
  void *v271;
  unint64_t v272;
  unint64_t v273;
  uint64_t i58;
  void *v275;
  unint64_t v276;
  unint64_t v277;
  uint64_t i59;
  void *v279;
  unint64_t v280;
  unint64_t v281;
  uint64_t i60;
  void *v283;
  unint64_t v284;
  unint64_t v285;
  uint64_t i61;
  void *v287;
  unint64_t v288;
  unint64_t v289;
  uint64_t i62;
  void *v291;
  unint64_t v292;
  unint64_t v293;
  uint64_t i63;
  void *v295;
  unint64_t v296;
  unint64_t v297;
  uint64_t i64;
  void *v299;
  unint64_t v300;
  unint64_t v301;
  uint64_t i65;
  void *v303;
  unint64_t v304;
  unint64_t v305;
  uint64_t i66;
  void *v307;
  unint64_t v308;
  unint64_t v309;
  uint64_t i67;
  void *v311;
  unint64_t v312;
  unint64_t v313;
  uint64_t i68;
  void *v315;
  unint64_t v316;
  unint64_t v317;
  uint64_t i69;
  void *v319;
  unint64_t v320;
  unint64_t v321;
  uint64_t i70;
  void *v323;
  unint64_t v324;
  unint64_t v325;
  uint64_t i71;
  void *v327;
  unint64_t v328;
  unint64_t v329;
  uint64_t i72;
  void *v331;
  unint64_t v332;
  unint64_t v333;
  uint64_t i73;
  void *v335;
  unint64_t v336;
  unint64_t v337;
  uint64_t i74;
  void *v339;
  unint64_t v340;
  unint64_t v341;
  uint64_t i75;
  void *v343;
  unint64_t v344;
  unint64_t v345;
  uint64_t i76;
  void *v347;
  unint64_t v348;
  unint64_t v349;
  uint64_t i77;
  void *v351;
  unint64_t v352;
  unint64_t v353;
  uint64_t i78;
  void *v355;
  unint64_t v356;
  unint64_t v357;
  uint64_t i79;
  void *v359;
  unint64_t v360;
  unint64_t v361;
  uint64_t i80;
  void *v363;
  unint64_t v364;
  unint64_t v365;
  uint64_t i81;
  void *v367;
  unint64_t v368;
  unint64_t v369;
  uint64_t i82;
  void *v371;
  unint64_t v372;
  unint64_t v373;
  uint64_t i83;
  void *v375;
  id v376;

  v376 = a3;
  if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](self, "kCellularPerClientProfileTriggerCountsCount"))
  {
    objc_msgSend(v376, "clearKCellularPerClientProfileTriggerCounts");
    v4 = -[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](self, "kCellularPerClientProfileTriggerCountsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[PowerlogMetricLog kCellularPerClientProfileTriggerCountAtIndex:](self, "kCellularPerClientProfileTriggerCountAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularPerClientProfileTriggerCount:", v7);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularProtocolStackCpuStatsCount](self, "kCellularProtocolStackCpuStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularProtocolStackCpuStats");
    v8 = -[PowerlogMetricLog kCellularProtocolStackCpuStatsCount](self, "kCellularProtocolStackCpuStatsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[PowerlogMetricLog kCellularProtocolStackCpuStatsAtIndex:](self, "kCellularProtocolStackCpuStatsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularProtocolStackCpuStats:", v11);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularPeripheralStatsCount](self, "kCellularPeripheralStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularPeripheralStats");
    v12 = -[PowerlogMetricLog kCellularPeripheralStatsCount](self, "kCellularPeripheralStatsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[PowerlogMetricLog kCellularPeripheralStatsAtIndex:](self, "kCellularPeripheralStatsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularPeripheralStats:", v15);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularDvfsStatsCount](self, "kCellularDvfsStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularDvfsStats");
    v16 = -[PowerlogMetricLog kCellularDvfsStatsCount](self, "kCellularDvfsStatsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[PowerlogMetricLog kCellularDvfsStatsAtIndex:](self, "kCellularDvfsStatsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularDvfsStats:", v19);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteWcdmaGsmHwStatsCount](self, "kCellularLteWcdmaGsmHwStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteWcdmaGsmHwStats");
    v20 = -[PowerlogMetricLog kCellularLteWcdmaGsmHwStatsCount](self, "kCellularLteWcdmaGsmHwStatsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[PowerlogMetricLog kCellularLteWcdmaGsmHwStatsAtIndex:](self, "kCellularLteWcdmaGsmHwStatsAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteWcdmaGsmHwStats:", v23);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteTdsGsmHwStatsCount](self, "kCellularLteTdsGsmHwStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteTdsGsmHwStats");
    v24 = -[PowerlogMetricLog kCellularLteTdsGsmHwStatsCount](self, "kCellularLteTdsGsmHwStatsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[PowerlogMetricLog kCellularLteTdsGsmHwStatsAtIndex:](self, "kCellularLteTdsGsmHwStatsAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteTdsGsmHwStats:", v27);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularPmuAverageCurrentsCount](self, "kCellularPmuAverageCurrentsCount"))
  {
    objc_msgSend(v376, "clearKCellularPmuAverageCurrents");
    v28 = -[PowerlogMetricLog kCellularPmuAverageCurrentsCount](self, "kCellularPmuAverageCurrentsCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        -[PowerlogMetricLog kCellularPmuAverageCurrentAtIndex:](self, "kCellularPmuAverageCurrentAtIndex:", jj);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularPmuAverageCurrent:", v31);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularFwCoreStatsCount](self, "kCellularFwCoreStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularFwCoreStats");
    v32 = -[PowerlogMetricLog kCellularFwCoreStatsCount](self, "kCellularFwCoreStatsCount");
    if (v32)
    {
      v33 = v32;
      for (kk = 0; kk != v33; ++kk)
      {
        -[PowerlogMetricLog kCellularFwCoreStatsAtIndex:](self, "kCellularFwCoreStatsAtIndex:", kk);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularFwCoreStats:", v35);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteWcdmaTdsHwStatsCount](self, "kCellularLteWcdmaTdsHwStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteWcdmaTdsHwStats");
    v36 = -[PowerlogMetricLog kCellularLteWcdmaTdsHwStatsCount](self, "kCellularLteWcdmaTdsHwStatsCount");
    if (v36)
    {
      v37 = v36;
      for (mm = 0; mm != v37; ++mm)
      {
        -[PowerlogMetricLog kCellularLteWcdmaTdsHwStatsAtIndex:](self, "kCellularLteWcdmaTdsHwStatsAtIndex:", mm);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteWcdmaTdsHwStats:", v39);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularPmicHwStatsCount](self, "kCellularPmicHwStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularPmicHwStats");
    v40 = -[PowerlogMetricLog kCellularPmicHwStatsCount](self, "kCellularPmicHwStatsCount");
    if (v40)
    {
      v41 = v40;
      for (nn = 0; nn != v41; ++nn)
      {
        -[PowerlogMetricLog kCellularPmicHwStatsAtIndex:](self, "kCellularPmicHwStatsAtIndex:", nn);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularPmicHwStats:", v43);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsRrcStatesCount](self, "kCellularTdsRrcStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsRrcStates");
    v44 = -[PowerlogMetricLog kCellularTdsRrcStatesCount](self, "kCellularTdsRrcStatesCount");
    if (v44)
    {
      v45 = v44;
      for (i1 = 0; i1 != v45; ++i1)
      {
        -[PowerlogMetricLog kCellularTdsRrcStateAtIndex:](self, "kCellularTdsRrcStateAtIndex:", i1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsRrcState:", v47);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteRrcStatesCount](self, "kCellularLteRrcStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularLteRrcStates");
    v48 = -[PowerlogMetricLog kCellularLteRrcStatesCount](self, "kCellularLteRrcStatesCount");
    if (v48)
    {
      v49 = v48;
      for (i2 = 0; i2 != v49; ++i2)
      {
        -[PowerlogMetricLog kCellularLteRrcStateAtIndex:](self, "kCellularLteRrcStateAtIndex:", i2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteRrcState:", v51);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLtePagingCyclesCount](self, "kCellularLtePagingCyclesCount"))
  {
    objc_msgSend(v376, "clearKCellularLtePagingCycles");
    v52 = -[PowerlogMetricLog kCellularLtePagingCyclesCount](self, "kCellularLtePagingCyclesCount");
    if (v52)
    {
      v53 = v52;
      for (i3 = 0; i3 != v53; ++i3)
      {
        -[PowerlogMetricLog kCellularLtePagingCycleAtIndex:](self, "kCellularLtePagingCycleAtIndex:", i3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLtePagingCycle:", v55);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteCdrxConfigsCount](self, "kCellularLteCdrxConfigsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteCdrxConfigs");
    v56 = -[PowerlogMetricLog kCellularLteCdrxConfigsCount](self, "kCellularLteCdrxConfigsCount");
    if (v56)
    {
      v57 = v56;
      for (i4 = 0; i4 != v57; ++i4)
      {
        -[PowerlogMetricLog kCellularLteCdrxConfigAtIndex:](self, "kCellularLteCdrxConfigAtIndex:", i4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteCdrxConfig:", v59);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteRadioLinkFailuresCount](self, "kCellularLteRadioLinkFailuresCount"))
  {
    objc_msgSend(v376, "clearKCellularLteRadioLinkFailures");
    v60 = -[PowerlogMetricLog kCellularLteRadioLinkFailuresCount](self, "kCellularLteRadioLinkFailuresCount");
    if (v60)
    {
      v61 = v60;
      for (i5 = 0; i5 != v61; ++i5)
      {
        -[PowerlogMetricLog kCellularLteRadioLinkFailureAtIndex:](self, "kCellularLteRadioLinkFailureAtIndex:", i5);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteRadioLinkFailure:", v63);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLtePdcchStateStatsCount](self, "kCellularLtePdcchStateStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularLtePdcchStateStats");
    v64 = -[PowerlogMetricLog kCellularLtePdcchStateStatsCount](self, "kCellularLtePdcchStateStatsCount");
    if (v64)
    {
      v65 = v64;
      for (i6 = 0; i6 != v65; ++i6)
      {
        -[PowerlogMetricLog kCellularLtePdcchStateStatsAtIndex:](self, "kCellularLtePdcchStateStatsAtIndex:", i6);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLtePdcchStateStats:", v67);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLqmStateChangesCount](self, "kCellularLqmStateChangesCount"))
  {
    objc_msgSend(v376, "clearKCellularLqmStateChanges");
    v68 = -[PowerlogMetricLog kCellularLqmStateChangesCount](self, "kCellularLqmStateChangesCount");
    if (v68)
    {
      v69 = v68;
      for (i7 = 0; i7 != v69; ++i7)
      {
        -[PowerlogMetricLog kCellularLqmStateChangeAtIndex:](self, "kCellularLqmStateChangeAtIndex:", i7);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLqmStateChange:", v71);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularServiceLostsCount](self, "kCellularServiceLostsCount"))
  {
    objc_msgSend(v376, "clearKCellularServiceLosts");
    v72 = -[PowerlogMetricLog kCellularServiceLostsCount](self, "kCellularServiceLostsCount");
    if (v72)
    {
      v73 = v72;
      for (i8 = 0; i8 != v73; ++i8)
      {
        -[PowerlogMetricLog kCellularServiceLostAtIndex:](self, "kCellularServiceLostAtIndex:", i8);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularServiceLost:", v75);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularGsmServingCellRssiHistsCount](self, "kCellularGsmServingCellRssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularGsmServingCellRssiHists");
    v76 = -[PowerlogMetricLog kCellularGsmServingCellRssiHistsCount](self, "kCellularGsmServingCellRssiHistsCount");
    if (v76)
    {
      v77 = v76;
      for (i9 = 0; i9 != v77; ++i9)
      {
        -[PowerlogMetricLog kCellularGsmServingCellRssiHistAtIndex:](self, "kCellularGsmServingCellRssiHistAtIndex:", i9);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularGsmServingCellRssiHist:", v79);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularGsmServingCellSnrHistsCount](self, "kCellularGsmServingCellSnrHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularGsmServingCellSnrHists");
    v80 = -[PowerlogMetricLog kCellularGsmServingCellSnrHistsCount](self, "kCellularGsmServingCellSnrHistsCount");
    if (v80)
    {
      v81 = v80;
      for (i10 = 0; i10 != v81; ++i10)
      {
        -[PowerlogMetricLog kCellularGsmServingCellSnrHistAtIndex:](self, "kCellularGsmServingCellSnrHistAtIndex:", i10);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularGsmServingCellSnrHist:", v83);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularGsmTxPowerHistsCount](self, "kCellularGsmTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularGsmTxPowerHists");
    v84 = -[PowerlogMetricLog kCellularGsmTxPowerHistsCount](self, "kCellularGsmTxPowerHistsCount");
    if (v84)
    {
      v85 = v84;
      for (i11 = 0; i11 != v85; ++i11)
      {
        -[PowerlogMetricLog kCellularGsmTxPowerHistAtIndex:](self, "kCellularGsmTxPowerHistAtIndex:", i11);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularGsmTxPowerHist:", v87);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularGsmConnectedModeHistsCount](self, "kCellularGsmConnectedModeHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularGsmConnectedModeHists");
    v88 = -[PowerlogMetricLog kCellularGsmConnectedModeHistsCount](self, "kCellularGsmConnectedModeHistsCount");
    if (v88)
    {
      v89 = v88;
      for (i12 = 0; i12 != v89; ++i12)
      {
        -[PowerlogMetricLog kCellularGsmConnectedModeHistAtIndex:](self, "kCellularGsmConnectedModeHistAtIndex:", i12);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularGsmConnectedModeHist:", v91);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularGsmL1StatesCount](self, "kCellularGsmL1StatesCount"))
  {
    objc_msgSend(v376, "clearKCellularGsmL1States");
    v92 = -[PowerlogMetricLog kCellularGsmL1StatesCount](self, "kCellularGsmL1StatesCount");
    if (v92)
    {
      v93 = v92;
      for (i13 = 0; i13 != v93; ++i13)
      {
        -[PowerlogMetricLog kCellularGsmL1StateAtIndex:](self, "kCellularGsmL1StateAtIndex:", i13);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularGsmL1State:", v95);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaCpcStatsCount](self, "kCellularWcdmaCpcStatsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaCpcStats");
    v96 = -[PowerlogMetricLog kCellularWcdmaCpcStatsCount](self, "kCellularWcdmaCpcStatsCount");
    if (v96)
    {
      v97 = v96;
      for (i14 = 0; i14 != v97; ++i14)
      {
        -[PowerlogMetricLog kCellularWcdmaCpcStatAtIndex:](self, "kCellularWcdmaCpcStatAtIndex:", i14);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaCpcStat:", v99);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRxDiversityHistsCount](self, "kCellularWcdmaRxDiversityHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRxDiversityHists");
    v100 = -[PowerlogMetricLog kCellularWcdmaRxDiversityHistsCount](self, "kCellularWcdmaRxDiversityHistsCount");
    if (v100)
    {
      v101 = v100;
      for (i15 = 0; i15 != v101; ++i15)
      {
        -[PowerlogMetricLog kCellularWcdmaRxDiversityHistAtIndex:](self, "kCellularWcdmaRxDiversityHistAtIndex:", i15);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRxDiversityHist:", v103);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaServingCellRx0RssiHistsCount](self, "kCellularWcdmaServingCellRx0RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaServingCellRx0RssiHists");
    v104 = -[PowerlogMetricLog kCellularWcdmaServingCellRx0RssiHistsCount](self, "kCellularWcdmaServingCellRx0RssiHistsCount");
    if (v104)
    {
      v105 = v104;
      for (i16 = 0; i16 != v105; ++i16)
      {
        -[PowerlogMetricLog kCellularWcdmaServingCellRx0RssiHistAtIndex:](self, "kCellularWcdmaServingCellRx0RssiHistAtIndex:", i16);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaServingCellRx0RssiHist:", v107);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaServingCellRx1RssiHistsCount](self, "kCellularWcdmaServingCellRx1RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaServingCellRx1RssiHists");
    v108 = -[PowerlogMetricLog kCellularWcdmaServingCellRx1RssiHistsCount](self, "kCellularWcdmaServingCellRx1RssiHistsCount");
    if (v108)
    {
      v109 = v108;
      for (i17 = 0; i17 != v109; ++i17)
      {
        -[PowerlogMetricLog kCellularWcdmaServingCellRx1RssiHistAtIndex:](self, "kCellularWcdmaServingCellRx1RssiHistAtIndex:", i17);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaServingCellRx1RssiHist:", v111);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaServingCellRx0EcNoHistsCount](self, "kCellularWcdmaServingCellRx0EcNoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaServingCellRx0EcNoHists");
    v112 = -[PowerlogMetricLog kCellularWcdmaServingCellRx0EcNoHistsCount](self, "kCellularWcdmaServingCellRx0EcNoHistsCount");
    if (v112)
    {
      v113 = v112;
      for (i18 = 0; i18 != v113; ++i18)
      {
        -[PowerlogMetricLog kCellularWcdmaServingCellRx0EcNoHistAtIndex:](self, "kCellularWcdmaServingCellRx0EcNoHistAtIndex:", i18);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaServingCellRx0EcNoHist:", v115);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaServingCellRx1EcNoHistsCount](self, "kCellularWcdmaServingCellRx1EcNoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaServingCellRx1EcNoHists");
    v116 = -[PowerlogMetricLog kCellularWcdmaServingCellRx1EcNoHistsCount](self, "kCellularWcdmaServingCellRx1EcNoHistsCount");
    if (v116)
    {
      v117 = v116;
      for (i19 = 0; i19 != v117; ++i19)
      {
        -[PowerlogMetricLog kCellularWcdmaServingCellRx1EcNoHistAtIndex:](self, "kCellularWcdmaServingCellRx1EcNoHistAtIndex:", i19);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaServingCellRx1EcNoHist:", v119);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaTxPowerHistsCount](self, "kCellularWcdmaTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaTxPowerHists");
    v120 = -[PowerlogMetricLog kCellularWcdmaTxPowerHistsCount](self, "kCellularWcdmaTxPowerHistsCount");
    if (v120)
    {
      v121 = v120;
      for (i20 = 0; i20 != v121; ++i20)
      {
        -[PowerlogMetricLog kCellularWcdmaTxPowerHistAtIndex:](self, "kCellularWcdmaTxPowerHistAtIndex:", i20);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaTxPowerHist:", v123);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC0HistsCount](self, "kCellularWcdmaReceiverStatusOnC0HistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaReceiverStatusOnC0Hists");
    v124 = -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC0HistsCount](self, "kCellularWcdmaReceiverStatusOnC0HistsCount");
    if (v124)
    {
      v125 = v124;
      for (i21 = 0; i21 != v125; ++i21)
      {
        -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC0HistAtIndex:](self, "kCellularWcdmaReceiverStatusOnC0HistAtIndex:", i21);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaReceiverStatusOnC0Hist:", v127);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC1HistsCount](self, "kCellularWcdmaReceiverStatusOnC1HistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaReceiverStatusOnC1Hists");
    v128 = -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC1HistsCount](self, "kCellularWcdmaReceiverStatusOnC1HistsCount");
    if (v128)
    {
      v129 = v128;
      for (i22 = 0; i22 != v129; ++i22)
      {
        -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC1HistAtIndex:](self, "kCellularWcdmaReceiverStatusOnC1HistAtIndex:", i22);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaReceiverStatusOnC1Hist:", v131);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaCarrierStatusHistsCount](self, "kCellularWcdmaCarrierStatusHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaCarrierStatusHists");
    v132 = -[PowerlogMetricLog kCellularWcdmaCarrierStatusHistsCount](self, "kCellularWcdmaCarrierStatusHistsCount");
    if (v132)
    {
      v133 = v132;
      for (i23 = 0; i23 != v133; ++i23)
      {
        -[PowerlogMetricLog kCellularWcdmaCarrierStatusHistAtIndex:](self, "kCellularWcdmaCarrierStatusHistAtIndex:", i23);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaCarrierStatusHist:", v135);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRabModeHistsCount](self, "kCellularWcdmaRabModeHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRabModeHists");
    v136 = -[PowerlogMetricLog kCellularWcdmaRabModeHistsCount](self, "kCellularWcdmaRabModeHistsCount");
    if (v136)
    {
      v137 = v136;
      for (i24 = 0; i24 != v137; ++i24)
      {
        -[PowerlogMetricLog kCellularWcdmaRabModeHistAtIndex:](self, "kCellularWcdmaRabModeHistAtIndex:", i24);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRabModeHist:", v139);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRabTypeHistsCount](self, "kCellularWcdmaRabTypeHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRabTypeHists");
    v140 = -[PowerlogMetricLog kCellularWcdmaRabTypeHistsCount](self, "kCellularWcdmaRabTypeHistsCount");
    if (v140)
    {
      v141 = v140;
      for (i25 = 0; i25 != v141; ++i25)
      {
        -[PowerlogMetricLog kCellularWcdmaRabTypeHistAtIndex:](self, "kCellularWcdmaRabTypeHistAtIndex:", i25);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRabTypeHist:", v143);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRrcConnectionStatesCount](self, "kCellularWcdmaRrcConnectionStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRrcConnectionStates");
    v144 = -[PowerlogMetricLog kCellularWcdmaRrcConnectionStatesCount](self, "kCellularWcdmaRrcConnectionStatesCount");
    if (v144)
    {
      v145 = v144;
      for (i26 = 0; i26 != v145; ++i26)
      {
        -[PowerlogMetricLog kCellularWcdmaRrcConnectionStateAtIndex:](self, "kCellularWcdmaRrcConnectionStateAtIndex:", i26);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRrcConnectionState:", v147);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRrcConfigurationsCount](self, "kCellularWcdmaRrcConfigurationsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRrcConfigurations");
    v148 = -[PowerlogMetricLog kCellularWcdmaRrcConfigurationsCount](self, "kCellularWcdmaRrcConfigurationsCount");
    if (v148)
    {
      v149 = v148;
      for (i27 = 0; i27 != v149; ++i27)
      {
        -[PowerlogMetricLog kCellularWcdmaRrcConfigurationAtIndex:](self, "kCellularWcdmaRrcConfigurationAtIndex:", i27);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRrcConfiguration:", v151);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaRabStatusCount](self, "kCellularWcdmaRabStatusCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaRabStatus");
    v152 = -[PowerlogMetricLog kCellularWcdmaRabStatusCount](self, "kCellularWcdmaRabStatusCount");
    if (v152)
    {
      v153 = v152;
      for (i28 = 0; i28 != v153; ++i28)
      {
        -[PowerlogMetricLog kCellularWcdmaRabStatusAtIndex:](self, "kCellularWcdmaRabStatusAtIndex:", i28);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaRabStatus:", v155);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaL1StatesCount](self, "kCellularWcdmaL1StatesCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaL1States");
    v156 = -[PowerlogMetricLog kCellularWcdmaL1StatesCount](self, "kCellularWcdmaL1StatesCount");
    if (v156)
    {
      v157 = v156;
      for (i29 = 0; i29 != v157; ++i29)
      {
        -[PowerlogMetricLog kCellularWcdmaL1StateAtIndex:](self, "kCellularWcdmaL1StateAtIndex:", i29);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaL1State:", v159);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaDataInactivityBeforeIdlesCount](self, "kCellularWcdmaDataInactivityBeforeIdlesCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaDataInactivityBeforeIdles");
    v160 = -[PowerlogMetricLog kCellularWcdmaDataInactivityBeforeIdlesCount](self, "kCellularWcdmaDataInactivityBeforeIdlesCount");
    if (v160)
    {
      v161 = v160;
      for (i30 = 0; i30 != v161; ++i30)
      {
        -[PowerlogMetricLog kCellularWcdmaDataInactivityBeforeIdleAtIndex:](self, "kCellularWcdmaDataInactivityBeforeIdleAtIndex:", i30);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaDataInactivityBeforeIdle:", v163);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaIdleToConnectedUserDatasCount](self, "kCellularWcdmaIdleToConnectedUserDatasCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaIdleToConnectedUserDatas");
    v164 = -[PowerlogMetricLog kCellularWcdmaIdleToConnectedUserDatasCount](self, "kCellularWcdmaIdleToConnectedUserDatasCount");
    if (v164)
    {
      v165 = v164;
      for (i31 = 0; i31 != v165; ++i31)
      {
        -[PowerlogMetricLog kCellularWcdmaIdleToConnectedUserDataAtIndex:](self, "kCellularWcdmaIdleToConnectedUserDataAtIndex:", i31);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaIdleToConnectedUserData:", v167);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularWcdmaVadHistsCount](self, "kCellularWcdmaVadHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularWcdmaVadHists");
    v168 = -[PowerlogMetricLog kCellularWcdmaVadHistsCount](self, "kCellularWcdmaVadHistsCount");
    if (v168)
    {
      v169 = v168;
      for (i32 = 0; i32 != v169; ++i32)
      {
        -[PowerlogMetricLog kCellularWcdmaVadHistAtIndex:](self, "kCellularWcdmaVadHistAtIndex:", i32);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularWcdmaVadHist:", v171);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsRxDiversityHistsCount](self, "kCellularTdsRxDiversityHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsRxDiversityHists");
    v172 = -[PowerlogMetricLog kCellularTdsRxDiversityHistsCount](self, "kCellularTdsRxDiversityHistsCount");
    if (v172)
    {
      v173 = v172;
      for (i33 = 0; i33 != v173; ++i33)
      {
        -[PowerlogMetricLog kCellularTdsRxDiversityHistAtIndex:](self, "kCellularTdsRxDiversityHistAtIndex:", i33);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsRxDiversityHist:", v175);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsServingCellRx0RssiHistsCount](self, "kCellularTdsServingCellRx0RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsServingCellRx0RssiHists");
    v176 = -[PowerlogMetricLog kCellularTdsServingCellRx0RssiHistsCount](self, "kCellularTdsServingCellRx0RssiHistsCount");
    if (v176)
    {
      v177 = v176;
      for (i34 = 0; i34 != v177; ++i34)
      {
        -[PowerlogMetricLog kCellularTdsServingCellRx0RssiHistAtIndex:](self, "kCellularTdsServingCellRx0RssiHistAtIndex:", i34);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsServingCellRx0RssiHist:", v179);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsServingCellRx1RssiHistsCount](self, "kCellularTdsServingCellRx1RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsServingCellRx1RssiHists");
    v180 = -[PowerlogMetricLog kCellularTdsServingCellRx1RssiHistsCount](self, "kCellularTdsServingCellRx1RssiHistsCount");
    if (v180)
    {
      v181 = v180;
      for (i35 = 0; i35 != v181; ++i35)
      {
        -[PowerlogMetricLog kCellularTdsServingCellRx1RssiHistAtIndex:](self, "kCellularTdsServingCellRx1RssiHistAtIndex:", i35);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsServingCellRx1RssiHist:", v183);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsServingCellRx0RscpHistsCount](self, "kCellularTdsServingCellRx0RscpHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsServingCellRx0RscpHists");
    v184 = -[PowerlogMetricLog kCellularTdsServingCellRx0RscpHistsCount](self, "kCellularTdsServingCellRx0RscpHistsCount");
    if (v184)
    {
      v185 = v184;
      for (i36 = 0; i36 != v185; ++i36)
      {
        -[PowerlogMetricLog kCellularTdsServingCellRx0RscpHistAtIndex:](self, "kCellularTdsServingCellRx0RscpHistAtIndex:", i36);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsServingCellRx0RscpHist:", v187);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsServingCellRx1RscpHistsCount](self, "kCellularTdsServingCellRx1RscpHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsServingCellRx1RscpHists");
    v188 = -[PowerlogMetricLog kCellularTdsServingCellRx1RscpHistsCount](self, "kCellularTdsServingCellRx1RscpHistsCount");
    if (v188)
    {
      v189 = v188;
      for (i37 = 0; i37 != v189; ++i37)
      {
        -[PowerlogMetricLog kCellularTdsServingCellRx1RscpHistAtIndex:](self, "kCellularTdsServingCellRx1RscpHistAtIndex:", i37);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsServingCellRx1RscpHist:", v191);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsTxPowerHistsCount](self, "kCellularTdsTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsTxPowerHists");
    v192 = -[PowerlogMetricLog kCellularTdsTxPowerHistsCount](self, "kCellularTdsTxPowerHistsCount");
    if (v192)
    {
      v193 = v192;
      for (i38 = 0; i38 != v193; ++i38)
      {
        -[PowerlogMetricLog kCellularTdsTxPowerHistAtIndex:](self, "kCellularTdsTxPowerHistAtIndex:", i38);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsTxPowerHist:", v195);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsRabModeHistsCount](self, "kCellularTdsRabModeHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsRabModeHists");
    v196 = -[PowerlogMetricLog kCellularTdsRabModeHistsCount](self, "kCellularTdsRabModeHistsCount");
    if (v196)
    {
      v197 = v196;
      for (i39 = 0; i39 != v197; ++i39)
      {
        -[PowerlogMetricLog kCellularTdsRabModeHistAtIndex:](self, "kCellularTdsRabModeHistAtIndex:", i39);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsRabModeHist:", v199);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsRabTypeHistsCount](self, "kCellularTdsRabTypeHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsRabTypeHists");
    v200 = -[PowerlogMetricLog kCellularTdsRabTypeHistsCount](self, "kCellularTdsRabTypeHistsCount");
    if (v200)
    {
      v201 = v200;
      for (i40 = 0; i40 != v201; ++i40)
      {
        -[PowerlogMetricLog kCellularTdsRabTypeHistAtIndex:](self, "kCellularTdsRabTypeHistAtIndex:", i40);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsRabTypeHist:", v203);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularTdsL1StatesCount](self, "kCellularTdsL1StatesCount"))
  {
    objc_msgSend(v376, "clearKCellularTdsL1States");
    v204 = -[PowerlogMetricLog kCellularTdsL1StatesCount](self, "kCellularTdsL1StatesCount");
    if (v204)
    {
      v205 = v204;
      for (i41 = 0; i41 != v205; ++i41)
      {
        -[PowerlogMetricLog kCellularTdsL1StateAtIndex:](self, "kCellularTdsL1StateAtIndex:", i41);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularTdsL1State:", v207);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteFwDuplexModesCount](self, "kCellularLteFwDuplexModesCount"))
  {
    objc_msgSend(v376, "clearKCellularLteFwDuplexModes");
    v208 = -[PowerlogMetricLog kCellularLteFwDuplexModesCount](self, "kCellularLteFwDuplexModesCount");
    if (v208)
    {
      v209 = v208;
      for (i42 = 0; i42 != v209; ++i42)
      {
        -[PowerlogMetricLog kCellularLteFwDuplexModeAtIndex:](self, "kCellularLteFwDuplexModeAtIndex:", i42);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteFwDuplexMode:", v211);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteServingCellRsrpHistsCount](self, "kCellularLteServingCellRsrpHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteServingCellRsrpHists");
    v212 = -[PowerlogMetricLog kCellularLteServingCellRsrpHistsCount](self, "kCellularLteServingCellRsrpHistsCount");
    if (v212)
    {
      v213 = v212;
      for (i43 = 0; i43 != v213; ++i43)
      {
        -[PowerlogMetricLog kCellularLteServingCellRsrpHistAtIndex:](self, "kCellularLteServingCellRsrpHistAtIndex:", i43);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteServingCellRsrpHist:", v215);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteServingCellSinrHistsCount](self, "kCellularLteServingCellSinrHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteServingCellSinrHists");
    v216 = -[PowerlogMetricLog kCellularLteServingCellSinrHistsCount](self, "kCellularLteServingCellSinrHistsCount");
    if (v216)
    {
      v217 = v216;
      for (i44 = 0; i44 != v217; ++i44)
      {
        -[PowerlogMetricLog kCellularLteServingCellSinrHistAtIndex:](self, "kCellularLteServingCellSinrHistAtIndex:", i44);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteServingCellSinrHist:", v219);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteSleepStateHistsCount](self, "kCellularLteSleepStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteSleepStateHists");
    v220 = -[PowerlogMetricLog kCellularLteSleepStateHistsCount](self, "kCellularLteSleepStateHistsCount");
    if (v220)
    {
      v221 = v220;
      for (i45 = 0; i45 != v221; ++i45)
      {
        -[PowerlogMetricLog kCellularLteSleepStateHistAtIndex:](self, "kCellularLteSleepStateHistAtIndex:", i45);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteSleepStateHist:", v223);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteTxPowerHistsCount](self, "kCellularLteTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteTxPowerHists");
    v224 = -[PowerlogMetricLog kCellularLteTxPowerHistsCount](self, "kCellularLteTxPowerHistsCount");
    if (v224)
    {
      v225 = v224;
      for (i46 = 0; i46 != v225; ++i46)
      {
        -[PowerlogMetricLog kCellularLteTxPowerHistAtIndex:](self, "kCellularLteTxPowerHistAtIndex:", i46);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteTxPowerHist:", v227);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteDlSccStateHistsCount](self, "kCellularLteDlSccStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteDlSccStateHists");
    v228 = -[PowerlogMetricLog kCellularLteDlSccStateHistsCount](self, "kCellularLteDlSccStateHistsCount");
    if (v228)
    {
      v229 = v228;
      for (i47 = 0; i47 != v229; ++i47)
      {
        -[PowerlogMetricLog kCellularLteDlSccStateHistAtIndex:](self, "kCellularLteDlSccStateHistAtIndex:", i47);
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteDlSccStateHist:", v231);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteUlSccStateHistsCount](self, "kCellularLteUlSccStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteUlSccStateHists");
    v232 = -[PowerlogMetricLog kCellularLteUlSccStateHistsCount](self, "kCellularLteUlSccStateHistsCount");
    if (v232)
    {
      v233 = v232;
      for (i48 = 0; i48 != v233; ++i48)
      {
        -[PowerlogMetricLog kCellularLteUlSccStateHistAtIndex:](self, "kCellularLteUlSccStateHistAtIndex:", i48);
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteUlSccStateHist:", v235);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteAdvancedRxStateHistsCount](self, "kCellularLteAdvancedRxStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteAdvancedRxStateHists");
    v236 = -[PowerlogMetricLog kCellularLteAdvancedRxStateHistsCount](self, "kCellularLteAdvancedRxStateHistsCount");
    if (v236)
    {
      v237 = v236;
      for (i49 = 0; i49 != v237; ++i49)
      {
        -[PowerlogMetricLog kCellularLteAdvancedRxStateHistAtIndex:](self, "kCellularLteAdvancedRxStateHistAtIndex:", i49);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteAdvancedRxStateHist:", v239);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteComponentCarrierInfosCount](self, "kCellularLteComponentCarrierInfosCount"))
  {
    objc_msgSend(v376, "clearKCellularLteComponentCarrierInfos");
    v240 = -[PowerlogMetricLog kCellularLteComponentCarrierInfosCount](self, "kCellularLteComponentCarrierInfosCount");
    if (v240)
    {
      v241 = v240;
      for (i50 = 0; i50 != v241; ++i50)
      {
        -[PowerlogMetricLog kCellularLteComponentCarrierInfoAtIndex:](self, "kCellularLteComponentCarrierInfoAtIndex:", i50);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteComponentCarrierInfo:", v243);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteRxTxStateHistsCount](self, "kCellularLteRxTxStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteRxTxStateHists");
    v244 = -[PowerlogMetricLog kCellularLteRxTxStateHistsCount](self, "kCellularLteRxTxStateHistsCount");
    if (v244)
    {
      v245 = v244;
      for (i51 = 0; i51 != v245; ++i51)
      {
        -[PowerlogMetricLog kCellularLteRxTxStateHistAtIndex:](self, "kCellularLteRxTxStateHistAtIndex:", i51);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteRxTxStateHist:", v247);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteTotalDlTbsHistsCount](self, "kCellularLteTotalDlTbsHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteTotalDlTbsHists");
    v248 = -[PowerlogMetricLog kCellularLteTotalDlTbsHistsCount](self, "kCellularLteTotalDlTbsHistsCount");
    if (v248)
    {
      v249 = v248;
      for (i52 = 0; i52 != v249; ++i52)
      {
        -[PowerlogMetricLog kCellularLteTotalDlTbsHistAtIndex:](self, "kCellularLteTotalDlTbsHistAtIndex:", i52);
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteTotalDlTbsHist:", v251);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteDataInactivityBeforeIdlesCount](self, "kCellularLteDataInactivityBeforeIdlesCount"))
  {
    objc_msgSend(v376, "clearKCellularLteDataInactivityBeforeIdles");
    v252 = -[PowerlogMetricLog kCellularLteDataInactivityBeforeIdlesCount](self, "kCellularLteDataInactivityBeforeIdlesCount");
    if (v252)
    {
      v253 = v252;
      for (i53 = 0; i53 != v253; ++i53)
      {
        -[PowerlogMetricLog kCellularLteDataInactivityBeforeIdleAtIndex:](self, "kCellularLteDataInactivityBeforeIdleAtIndex:", i53);
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteDataInactivityBeforeIdle:", v255);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteIdleToConnectedUserDatasCount](self, "kCellularLteIdleToConnectedUserDatasCount"))
  {
    objc_msgSend(v376, "clearKCellularLteIdleToConnectedUserDatas");
    v256 = -[PowerlogMetricLog kCellularLteIdleToConnectedUserDatasCount](self, "kCellularLteIdleToConnectedUserDatasCount");
    if (v256)
    {
      v257 = v256;
      for (i54 = 0; i54 != v257; ++i54)
      {
        -[PowerlogMetricLog kCellularLteIdleToConnectedUserDataAtIndex:](self, "kCellularLteIdleToConnectedUserDataAtIndex:", i54);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteIdleToConnectedUserData:", v259);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteDlSccStateHistV3sCount](self, "kCellularLteDlSccStateHistV3sCount"))
  {
    objc_msgSend(v376, "clearKCellularLteDlSccStateHistV3s");
    v260 = -[PowerlogMetricLog kCellularLteDlSccStateHistV3sCount](self, "kCellularLteDlSccStateHistV3sCount");
    if (v260)
    {
      v261 = v260;
      for (i55 = 0; i55 != v261; ++i55)
      {
        -[PowerlogMetricLog kCellularLteDlSccStateHistV3AtIndex:](self, "kCellularLteDlSccStateHistV3AtIndex:", i55);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteDlSccStateHistV3:", v263);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLteRxDiversityHistsCount](self, "kCellularLteRxDiversityHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLteRxDiversityHists");
    v264 = -[PowerlogMetricLog kCellularLteRxDiversityHistsCount](self, "kCellularLteRxDiversityHistsCount");
    if (v264)
    {
      v265 = v264;
      for (i56 = 0; i56 != v265; ++i56)
      {
        -[PowerlogMetricLog kCellularLteRxDiversityHistAtIndex:](self, "kCellularLteRxDiversityHistAtIndex:", i56);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLteRxDiversityHist:", v267);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularLtePdcchStateHistsCount](self, "kCellularLtePdcchStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularLtePdcchStateHists");
    v268 = -[PowerlogMetricLog kCellularLtePdcchStateHistsCount](self, "kCellularLtePdcchStateHistsCount");
    if (v268)
    {
      v269 = v268;
      for (i57 = 0; i57 != v269; ++i57)
      {
        -[PowerlogMetricLog kCellularLtePdcchStateHistAtIndex:](self, "kCellularLtePdcchStateHistAtIndex:", i57);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularLtePdcchStateHist:", v271);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularProtocolStackStateHistsCount](self, "kCellularProtocolStackStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularProtocolStackStateHists");
    v272 = -[PowerlogMetricLog kCellularProtocolStackStateHistsCount](self, "kCellularProtocolStackStateHistsCount");
    if (v272)
    {
      v273 = v272;
      for (i58 = 0; i58 != v273; ++i58)
      {
        -[PowerlogMetricLog kCellularProtocolStackStateHistAtIndex:](self, "kCellularProtocolStackStateHistAtIndex:", i58);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularProtocolStackStateHist:", v275);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCellPlmnSearchCountsCount](self, "kCellularCellPlmnSearchCountsCount"))
  {
    objc_msgSend(v376, "clearKCellularCellPlmnSearchCounts");
    v276 = -[PowerlogMetricLog kCellularCellPlmnSearchCountsCount](self, "kCellularCellPlmnSearchCountsCount");
    if (v276)
    {
      v277 = v276;
      for (i59 = 0; i59 != v277; ++i59)
      {
        -[PowerlogMetricLog kCellularCellPlmnSearchCountAtIndex:](self, "kCellularCellPlmnSearchCountAtIndex:", i59);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCellPlmnSearchCount:", v279);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCellPlmnSearchHistsCount](self, "kCellularCellPlmnSearchHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCellPlmnSearchHists");
    v280 = -[PowerlogMetricLog kCellularCellPlmnSearchHistsCount](self, "kCellularCellPlmnSearchHistsCount");
    if (v280)
    {
      v281 = v280;
      for (i60 = 0; i60 != v281; ++i60)
      {
        -[PowerlogMetricLog kCellularCellPlmnSearchHistAtIndex:](self, "kCellularCellPlmnSearchHistAtIndex:", i60);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCellPlmnSearchHist:", v283);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularProtocolStackPowerStatesCount](self, "kCellularProtocolStackPowerStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularProtocolStackPowerStates");
    v284 = -[PowerlogMetricLog kCellularProtocolStackPowerStatesCount](self, "kCellularProtocolStackPowerStatesCount");
    if (v284)
    {
      v285 = v284;
      for (i61 = 0; i61 != v285; ++i61)
      {
        -[PowerlogMetricLog kCellularProtocolStackPowerStateAtIndex:](self, "kCellularProtocolStackPowerStateAtIndex:", i61);
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularProtocolStackPowerState:", v287);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularDownlinkIpPacketFilterStatusCount](self, "kCellularDownlinkIpPacketFilterStatusCount"))
  {
    objc_msgSend(v376, "clearKCellularDownlinkIpPacketFilterStatus");
    v288 = -[PowerlogMetricLog kCellularDownlinkIpPacketFilterStatusCount](self, "kCellularDownlinkIpPacketFilterStatusCount");
    if (v288)
    {
      v289 = v288;
      for (i62 = 0; i62 != v289; ++i62)
      {
        -[PowerlogMetricLog kCellularDownlinkIpPacketFilterStatusAtIndex:](self, "kCellularDownlinkIpPacketFilterStatusAtIndex:", i62);
        v291 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularDownlinkIpPacketFilterStatus:", v291);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularDownlinkIpPacketDiscardedsCount](self, "kCellularDownlinkIpPacketDiscardedsCount"))
  {
    objc_msgSend(v376, "clearKCellularDownlinkIpPacketDiscardeds");
    v292 = -[PowerlogMetricLog kCellularDownlinkIpPacketDiscardedsCount](self, "kCellularDownlinkIpPacketDiscardedsCount");
    if (v292)
    {
      v293 = v292;
      for (i63 = 0; i63 != v293; ++i63)
      {
        -[PowerlogMetricLog kCellularDownlinkIpPacketDiscardedAtIndex:](self, "kCellularDownlinkIpPacketDiscardedAtIndex:", i63);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularDownlinkIpPacketDiscarded:", v295);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularServingCellRfBandHistsCount](self, "kCellularServingCellRfBandHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularServingCellRfBandHists");
    v296 = -[PowerlogMetricLog kCellularServingCellRfBandHistsCount](self, "kCellularServingCellRfBandHistsCount");
    if (v296)
    {
      v297 = v296;
      for (i64 = 0; i64 != v297; ++i64)
      {
        -[PowerlogMetricLog kCellularServingCellRfBandHistAtIndex:](self, "kCellularServingCellRfBandHistAtIndex:", i64);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularServingCellRfBandHist:", v299);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularProtocolStackStateHist2sCount](self, "kCellularProtocolStackStateHist2sCount"))
  {
    objc_msgSend(v376, "clearKCellularProtocolStackStateHist2s");
    v300 = -[PowerlogMetricLog kCellularProtocolStackStateHist2sCount](self, "kCellularProtocolStackStateHist2sCount");
    if (v300)
    {
      v301 = v300;
      for (i65 = 0; i65 != v301; ++i65)
      {
        -[PowerlogMetricLog kCellularProtocolStackStateHist2AtIndex:](self, "kCellularProtocolStackStateHist2AtIndex:", i65);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularProtocolStackStateHist2:", v303);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularProtocolStackStatesCount](self, "kCellularProtocolStackStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularProtocolStackStates");
    v304 = -[PowerlogMetricLog kCellularProtocolStackStatesCount](self, "kCellularProtocolStackStatesCount");
    if (v304)
    {
      v305 = v304;
      for (i66 = 0; i66 != v305; ++i66)
      {
        -[PowerlogMetricLog kCellularProtocolStackStateAtIndex:](self, "kCellularProtocolStackStateAtIndex:", i66);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularProtocolStackState:", v307);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XRxDiversityHistsCount](self, "kCellularCdma1XRxDiversityHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XRxDiversityHists");
    v308 = -[PowerlogMetricLog kCellularCdma1XRxDiversityHistsCount](self, "kCellularCdma1XRxDiversityHistsCount");
    if (v308)
    {
      v309 = v308;
      for (i67 = 0; i67 != v309; ++i67)
      {
        -[PowerlogMetricLog kCellularCdma1XRxDiversityHistAtIndex:](self, "kCellularCdma1XRxDiversityHistAtIndex:", i67);
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XRxDiversityHist:", v311);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XServingCellRx0RssiHistsCount](self, "kCellularCdma1XServingCellRx0RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XServingCellRx0RssiHists");
    v312 = -[PowerlogMetricLog kCellularCdma1XServingCellRx0RssiHistsCount](self, "kCellularCdma1XServingCellRx0RssiHistsCount");
    if (v312)
    {
      v313 = v312;
      for (i68 = 0; i68 != v313; ++i68)
      {
        -[PowerlogMetricLog kCellularCdma1XServingCellRx0RssiHistAtIndex:](self, "kCellularCdma1XServingCellRx0RssiHistAtIndex:", i68);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XServingCellRx0RssiHist:", v315);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XServingCellRx1RssiHistsCount](self, "kCellularCdma1XServingCellRx1RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XServingCellRx1RssiHists");
    v316 = -[PowerlogMetricLog kCellularCdma1XServingCellRx1RssiHistsCount](self, "kCellularCdma1XServingCellRx1RssiHistsCount");
    if (v316)
    {
      v317 = v316;
      for (i69 = 0; i69 != v317; ++i69)
      {
        -[PowerlogMetricLog kCellularCdma1XServingCellRx1RssiHistAtIndex:](self, "kCellularCdma1XServingCellRx1RssiHistAtIndex:", i69);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XServingCellRx1RssiHist:", v319);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XServingCellRx0EcIoHistsCount](self, "kCellularCdma1XServingCellRx0EcIoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XServingCellRx0EcIoHists");
    v320 = -[PowerlogMetricLog kCellularCdma1XServingCellRx0EcIoHistsCount](self, "kCellularCdma1XServingCellRx0EcIoHistsCount");
    if (v320)
    {
      v321 = v320;
      for (i70 = 0; i70 != v321; ++i70)
      {
        -[PowerlogMetricLog kCellularCdma1XServingCellRx0EcIoHistAtIndex:](self, "kCellularCdma1XServingCellRx0EcIoHistAtIndex:", i70);
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XServingCellRx0EcIoHist:", v323);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XServingCellRx1EcIoHistsCount](self, "kCellularCdma1XServingCellRx1EcIoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XServingCellRx1EcIoHists");
    v324 = -[PowerlogMetricLog kCellularCdma1XServingCellRx1EcIoHistsCount](self, "kCellularCdma1XServingCellRx1EcIoHistsCount");
    if (v324)
    {
      v325 = v324;
      for (i71 = 0; i71 != v325; ++i71)
      {
        -[PowerlogMetricLog kCellularCdma1XServingCellRx1EcIoHistAtIndex:](self, "kCellularCdma1XServingCellRx1EcIoHistAtIndex:", i71);
        v327 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XServingCellRx1EcIoHist:", v327);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XTxPowerHistsCount](self, "kCellularCdma1XTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XTxPowerHists");
    v328 = -[PowerlogMetricLog kCellularCdma1XTxPowerHistsCount](self, "kCellularCdma1XTxPowerHistsCount");
    if (v328)
    {
      v329 = v328;
      for (i72 = 0; i72 != v329; ++i72)
      {
        -[PowerlogMetricLog kCellularCdma1XTxPowerHistAtIndex:](self, "kCellularCdma1XTxPowerHistAtIndex:", i72);
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XTxPowerHist:", v331);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XProtocolStackStateHistsCount](self, "kCellularCdma1XProtocolStackStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XProtocolStackStateHists");
    v332 = -[PowerlogMetricLog kCellularCdma1XProtocolStackStateHistsCount](self, "kCellularCdma1XProtocolStackStateHistsCount");
    if (v332)
    {
      v333 = v332;
      for (i73 = 0; i73 != v333; ++i73)
      {
        -[PowerlogMetricLog kCellularCdma1XProtocolStackStateHistAtIndex:](self, "kCellularCdma1XProtocolStackStateHistAtIndex:", i73);
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XProtocolStackStateHist:", v335);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XConnectionHistsCount](self, "kCellularCdma1XConnectionHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XConnectionHists");
    v336 = -[PowerlogMetricLog kCellularCdma1XConnectionHistsCount](self, "kCellularCdma1XConnectionHistsCount");
    if (v336)
    {
      v337 = v336;
      for (i74 = 0; i74 != v337; ++i74)
      {
        -[PowerlogMetricLog kCellularCdma1XConnectionHistAtIndex:](self, "kCellularCdma1XConnectionHistAtIndex:", i74);
        v339 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XConnectionHist:", v339);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdma1XRrStatesCount](self, "kCellularCdma1XRrStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularCdma1XRrStates");
    v340 = -[PowerlogMetricLog kCellularCdma1XRrStatesCount](self, "kCellularCdma1XRrStatesCount");
    if (v340)
    {
      v341 = v340;
      for (i75 = 0; i75 != v341; ++i75)
      {
        -[PowerlogMetricLog kCellularCdma1XRrStateAtIndex:](self, "kCellularCdma1XRrStateAtIndex:", i75);
        v343 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdma1XRrState:", v343);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoRxDiversityHistsCount](self, "kCellularCdmaEvdoRxDiversityHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoRxDiversityHists");
    v344 = -[PowerlogMetricLog kCellularCdmaEvdoRxDiversityHistsCount](self, "kCellularCdmaEvdoRxDiversityHistsCount");
    if (v344)
    {
      v345 = v344;
      for (i76 = 0; i76 != v345; ++i76)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoRxDiversityHistAtIndex:](self, "kCellularCdmaEvdoRxDiversityHistAtIndex:", i76);
        v347 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoRxDiversityHist:", v347);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0RssiHistsCount](self, "kCellularCdmaEvdoServingCellRx0RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoServingCellRx0RssiHists");
    v348 = -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0RssiHistsCount](self, "kCellularCdmaEvdoServingCellRx0RssiHistsCount");
    if (v348)
    {
      v349 = v348;
      for (i77 = 0; i77 != v349; ++i77)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:](self, "kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:", i77);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoServingCellRx0RssiHist:", v351);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1RssiHistsCount](self, "kCellularCdmaEvdoServingCellRx1RssiHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoServingCellRx1RssiHists");
    v352 = -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1RssiHistsCount](self, "kCellularCdmaEvdoServingCellRx1RssiHistsCount");
    if (v352)
    {
      v353 = v352;
      for (i78 = 0; i78 != v353; ++i78)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:](self, "kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:", i78);
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoServingCellRx1RssiHist:", v355);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0EcIoHistsCount](self, "kCellularCdmaEvdoServingCellRx0EcIoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoServingCellRx0EcIoHists");
    v356 = -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0EcIoHistsCount](self, "kCellularCdmaEvdoServingCellRx0EcIoHistsCount");
    if (v356)
    {
      v357 = v356;
      for (i79 = 0; i79 != v357; ++i79)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:](self, "kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:", i79);
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoServingCellRx0EcIoHist:", v359);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1EcIoHistsCount](self, "kCellularCdmaEvdoServingCellRx1EcIoHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoServingCellRx1EcIoHists");
    v360 = -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1EcIoHistsCount](self, "kCellularCdmaEvdoServingCellRx1EcIoHistsCount");
    if (v360)
    {
      v361 = v360;
      for (i80 = 0; i80 != v361; ++i80)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:](self, "kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:", i80);
        v363 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoServingCellRx1EcIoHist:", v363);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoTxPowerHistsCount](self, "kCellularCdmaEvdoTxPowerHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoTxPowerHists");
    v364 = -[PowerlogMetricLog kCellularCdmaEvdoTxPowerHistsCount](self, "kCellularCdmaEvdoTxPowerHistsCount");
    if (v364)
    {
      v365 = v364;
      for (i81 = 0; i81 != v365; ++i81)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoTxPowerHistAtIndex:](self, "kCellularCdmaEvdoTxPowerHistAtIndex:", i81);
        v367 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoTxPowerHist:", v367);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoProtocolStackStateHistsCount](self, "kCellularCdmaEvdoProtocolStackStateHistsCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoProtocolStackStateHists");
    v368 = -[PowerlogMetricLog kCellularCdmaEvdoProtocolStackStateHistsCount](self, "kCellularCdmaEvdoProtocolStackStateHistsCount");
    if (v368)
    {
      v369 = v368;
      for (i82 = 0; i82 != v369; ++i82)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoProtocolStackStateHistAtIndex:](self, "kCellularCdmaEvdoProtocolStackStateHistAtIndex:", i82);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoProtocolStackStateHist:", v371);

      }
    }
  }
  if (-[PowerlogMetricLog kCellularCdmaEvdoRrStatesCount](self, "kCellularCdmaEvdoRrStatesCount"))
  {
    objc_msgSend(v376, "clearKCellularCdmaEvdoRrStates");
    v372 = -[PowerlogMetricLog kCellularCdmaEvdoRrStatesCount](self, "kCellularCdmaEvdoRrStatesCount");
    if (v372)
    {
      v373 = v372;
      for (i83 = 0; i83 != v373; ++i83)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoRrStateAtIndex:](self, "kCellularCdmaEvdoRrStateAtIndex:", i83);
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v376, "addKCellularCdmaEvdoRrState:", v375);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  NSMutableArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  NSMutableArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSMutableArray *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  NSMutableArray *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  NSMutableArray *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  NSMutableArray *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  NSMutableArray *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  NSMutableArray *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSMutableArray *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  NSMutableArray *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  NSMutableArray *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  NSMutableArray *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  NSMutableArray *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  NSMutableArray *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  NSMutableArray *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  NSMutableArray *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  NSMutableArray *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  NSMutableArray *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  NSMutableArray *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  NSMutableArray *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  NSMutableArray *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  NSMutableArray *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  NSMutableArray *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  NSMutableArray *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  NSMutableArray *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  NSMutableArray *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  NSMutableArray *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  NSMutableArray *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  NSMutableArray *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  NSMutableArray *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  NSMutableArray *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  NSMutableArray *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  NSMutableArray *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  NSMutableArray *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  NSMutableArray *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  NSMutableArray *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  NSMutableArray *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  NSMutableArray *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  NSMutableArray *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  NSMutableArray *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  NSMutableArray *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  NSMutableArray *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  NSMutableArray *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  NSMutableArray *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  NSMutableArray *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  NSMutableArray *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  NSMutableArray *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  NSMutableArray *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  NSMutableArray *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  void *v377;
  NSMutableArray *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  NSMutableArray *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  NSMutableArray *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  NSMutableArray *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  NSMutableArray *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  NSMutableArray *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  NSMutableArray *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  void *v419;
  NSMutableArray *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  NSMutableArray *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  NSMutableArray *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  void *v437;
  NSMutableArray *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  void *v443;
  NSMutableArray *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  NSMutableArray *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  NSMutableArray *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  NSMutableArray *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  NSMutableArray *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  void *v473;
  NSMutableArray *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  void *v479;
  NSMutableArray *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  NSMutableArray *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  NSMutableArray *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  NSMutableArray *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  NSMutableArray *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  NSMutableArray *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  void *v515;
  NSMutableArray *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  NSMutableArray *v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  void *v527;
  NSMutableArray *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  void *v533;
  NSMutableArray *v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  void *v539;
  NSMutableArray *v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  NSMutableArray *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  void *v551;
  NSMutableArray *v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  void *v557;
  NSMutableArray *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  void *v563;
  id v564;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  __int128 v807;
  __int128 v808;
  __int128 v809;
  __int128 v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  __int128 v815;
  __int128 v816;
  __int128 v817;
  __int128 v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  __int128 v831;
  __int128 v832;
  __int128 v833;
  __int128 v834;
  __int128 v835;
  __int128 v836;
  __int128 v837;
  __int128 v838;
  __int128 v839;
  __int128 v840;
  __int128 v841;
  __int128 v842;
  __int128 v843;
  __int128 v844;
  __int128 v845;
  __int128 v846;
  __int128 v847;
  __int128 v848;
  __int128 v849;
  __int128 v850;
  __int128 v851;
  __int128 v852;
  __int128 v853;
  __int128 v854;
  __int128 v855;
  __int128 v856;
  __int128 v857;
  __int128 v858;
  __int128 v859;
  __int128 v860;
  __int128 v861;
  __int128 v862;
  __int128 v863;
  __int128 v864;
  __int128 v865;
  __int128 v866;
  __int128 v867;
  __int128 v868;
  __int128 v869;
  __int128 v870;
  __int128 v871;
  __int128 v872;
  __int128 v873;
  __int128 v874;
  __int128 v875;
  __int128 v876;
  __int128 v877;
  __int128 v878;
  __int128 v879;
  __int128 v880;
  __int128 v881;
  __int128 v882;
  __int128 v883;
  __int128 v884;
  __int128 v885;
  __int128 v886;
  __int128 v887;
  __int128 v888;
  __int128 v889;
  __int128 v890;
  __int128 v891;
  __int128 v892;
  __int128 v893;
  __int128 v894;
  __int128 v895;
  __int128 v896;
  __int128 v897;
  __int128 v898;
  __int128 v899;
  __int128 v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  __int128 v912;
  __int128 v913;
  __int128 v914;
  __int128 v915;
  __int128 v916;
  __int128 v917;
  __int128 v918;
  __int128 v919;
  __int128 v920;
  __int128 v921;
  __int128 v922;
  __int128 v923;
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  __int128 v928;
  __int128 v929;
  __int128 v930;
  __int128 v931;
  __int128 v932;
  __int128 v933;
  __int128 v934;
  __int128 v935;
  __int128 v936;
  __int128 v937;
  _BYTE v938[128];
  _BYTE v939[128];
  _BYTE v940[128];
  _BYTE v941[128];
  _BYTE v942[128];
  _BYTE v943[128];
  _BYTE v944[128];
  _BYTE v945[128];
  _BYTE v946[128];
  _BYTE v947[128];
  _BYTE v948[128];
  _BYTE v949[128];
  _BYTE v950[128];
  _BYTE v951[128];
  _BYTE v952[128];
  _BYTE v953[128];
  _BYTE v954[128];
  _BYTE v955[128];
  _BYTE v956[128];
  _BYTE v957[128];
  _BYTE v958[128];
  _BYTE v959[128];
  _BYTE v960[128];
  _BYTE v961[128];
  _BYTE v962[128];
  _BYTE v963[128];
  _BYTE v964[128];
  _BYTE v965[128];
  _BYTE v966[128];
  _BYTE v967[128];
  _BYTE v968[128];
  _BYTE v969[128];
  _BYTE v970[128];
  _BYTE v971[128];
  _BYTE v972[128];
  _BYTE v973[128];
  _BYTE v974[128];
  _BYTE v975[128];
  _BYTE v976[128];
  _BYTE v977[128];
  _BYTE v978[128];
  _BYTE v979[128];
  _BYTE v980[128];
  _BYTE v981[128];
  _BYTE v982[128];
  _BYTE v983[128];
  _BYTE v984[128];
  _BYTE v985[128];
  _BYTE v986[128];
  _BYTE v987[128];
  _BYTE v988[128];
  _BYTE v989[128];
  _BYTE v990[128];
  _BYTE v991[128];
  _BYTE v992[128];
  _BYTE v993[128];
  _BYTE v994[128];
  _BYTE v995[128];
  _BYTE v996[128];
  _BYTE v997[128];
  _BYTE v998[128];
  _BYTE v999[128];
  _BYTE v1000[128];
  _BYTE v1001[128];
  _BYTE v1002[128];
  _BYTE v1003[128];
  _BYTE v1004[128];
  _BYTE v1005[128];
  _BYTE v1006[128];
  _BYTE v1007[128];
  _BYTE v1008[128];
  _BYTE v1009[128];
  _BYTE v1010[128];
  _BYTE v1011[128];
  _BYTE v1012[128];
  _BYTE v1013[128];
  _BYTE v1014[128];
  _BYTE v1015[128];
  _BYTE v1016[128];
  _BYTE v1017[128];
  _BYTE v1018[128];
  _BYTE v1019[128];
  _BYTE v1020[128];
  _BYTE v1021[128];
  _BYTE v1022[128];
  _BYTE v1023[128];
  _BYTE v1024[128];
  _BYTE v1025[128];
  _BYTE v1026[128];
  _BYTE v1027[128];
  _BYTE v1028[128];
  _BYTE v1029[128];
  _BYTE v1030[128];
  uint64_t v1031;

  v1031 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v934 = 0u;
  v935 = 0u;
  v936 = 0u;
  v937 = 0u;
  v6 = self->_kCellularPerClientProfileTriggerCounts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v934, v1030, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v935;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v935 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v934 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularPerClientProfileTriggerCount:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v934, v1030, 16);
    }
    while (v8);
  }

  v933 = 0u;
  v932 = 0u;
  v931 = 0u;
  v930 = 0u;
  v12 = self->_kCellularProtocolStackCpuStats;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v930, v1029, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v931;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v931 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v930 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularProtocolStackCpuStats:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v930, v1029, 16);
    }
    while (v14);
  }

  v929 = 0u;
  v928 = 0u;
  v927 = 0u;
  v926 = 0u;
  v18 = self->_kCellularPeripheralStats;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v926, v1028, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v927;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v927 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v926 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularPeripheralStats:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v926, v1028, 16);
    }
    while (v20);
  }

  v925 = 0u;
  v924 = 0u;
  v923 = 0u;
  v922 = 0u;
  v24 = self->_kCellularDvfsStats;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v922, v1027, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v923;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v923 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v922 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularDvfsStats:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v922, v1027, 16);
    }
    while (v26);
  }

  v921 = 0u;
  v920 = 0u;
  v919 = 0u;
  v918 = 0u;
  v30 = self->_kCellularLteWcdmaGsmHwStats;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v918, v1026, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v919;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v919 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v918 + 1) + 8 * v34), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteWcdmaGsmHwStats:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v918, v1026, 16);
    }
    while (v32);
  }

  v917 = 0u;
  v916 = 0u;
  v915 = 0u;
  v914 = 0u;
  v36 = self->_kCellularLteTdsGsmHwStats;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v914, v1025, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v915;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v915 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v914 + 1) + 8 * v40), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteTdsGsmHwStats:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v914, v1025, 16);
    }
    while (v38);
  }

  v913 = 0u;
  v912 = 0u;
  v911 = 0u;
  v910 = 0u;
  v42 = self->_kCellularPmuAverageCurrents;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v910, v1024, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v911;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v911 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v910 + 1) + 8 * v46), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularPmuAverageCurrent:", v47);

        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v910, v1024, 16);
    }
    while (v44);
  }

  v909 = 0u;
  v908 = 0u;
  v907 = 0u;
  v906 = 0u;
  v48 = self->_kCellularFwCoreStats;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v906, v1023, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v907;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v907 != v51)
          objc_enumerationMutation(v48);
        v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v906 + 1) + 8 * v52), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularFwCoreStats:", v53);

        ++v52;
      }
      while (v50 != v52);
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v906, v1023, 16);
    }
    while (v50);
  }

  v905 = 0u;
  v904 = 0u;
  v903 = 0u;
  v902 = 0u;
  v54 = self->_kCellularLteWcdmaTdsHwStats;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v902, v1022, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v903;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v903 != v57)
          objc_enumerationMutation(v54);
        v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v902 + 1) + 8 * v58), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteWcdmaTdsHwStats:", v59);

        ++v58;
      }
      while (v56 != v58);
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v902, v1022, 16);
    }
    while (v56);
  }

  v901 = 0u;
  v900 = 0u;
  v899 = 0u;
  v898 = 0u;
  v60 = self->_kCellularPmicHwStats;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v898, v1021, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v899;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v899 != v63)
          objc_enumerationMutation(v60);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v898 + 1) + 8 * v64), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularPmicHwStats:", v65);

        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v898, v1021, 16);
    }
    while (v62);
  }

  v897 = 0u;
  v896 = 0u;
  v895 = 0u;
  v894 = 0u;
  v66 = self->_kCellularTdsRrcStates;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v894, v1020, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v895;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v895 != v69)
          objc_enumerationMutation(v66);
        v71 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v894 + 1) + 8 * v70), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsRrcState:", v71);

        ++v70;
      }
      while (v68 != v70);
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v894, v1020, 16);
    }
    while (v68);
  }

  v893 = 0u;
  v892 = 0u;
  v891 = 0u;
  v890 = 0u;
  v72 = self->_kCellularLteRrcStates;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v890, v1019, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v891;
    do
    {
      v76 = 0;
      do
      {
        if (*(_QWORD *)v891 != v75)
          objc_enumerationMutation(v72);
        v77 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v890 + 1) + 8 * v76), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteRrcState:", v77);

        ++v76;
      }
      while (v74 != v76);
      v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v890, v1019, 16);
    }
    while (v74);
  }

  v889 = 0u;
  v888 = 0u;
  v887 = 0u;
  v886 = 0u;
  v78 = self->_kCellularLtePagingCycles;
  v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v886, v1018, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v887;
    do
    {
      v82 = 0;
      do
      {
        if (*(_QWORD *)v887 != v81)
          objc_enumerationMutation(v78);
        v83 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v886 + 1) + 8 * v82), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLtePagingCycle:", v83);

        ++v82;
      }
      while (v80 != v82);
      v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v886, v1018, 16);
    }
    while (v80);
  }

  v885 = 0u;
  v884 = 0u;
  v883 = 0u;
  v882 = 0u;
  v84 = self->_kCellularLteCdrxConfigs;
  v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v882, v1017, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v883;
    do
    {
      v88 = 0;
      do
      {
        if (*(_QWORD *)v883 != v87)
          objc_enumerationMutation(v84);
        v89 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v882 + 1) + 8 * v88), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteCdrxConfig:", v89);

        ++v88;
      }
      while (v86 != v88);
      v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v882, v1017, 16);
    }
    while (v86);
  }

  v881 = 0u;
  v880 = 0u;
  v879 = 0u;
  v878 = 0u;
  v90 = self->_kCellularLteRadioLinkFailures;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v878, v1016, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v879;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v879 != v93)
          objc_enumerationMutation(v90);
        v95 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v878 + 1) + 8 * v94), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteRadioLinkFailure:", v95);

        ++v94;
      }
      while (v92 != v94);
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v878, v1016, 16);
    }
    while (v92);
  }

  v877 = 0u;
  v876 = 0u;
  v875 = 0u;
  v874 = 0u;
  v96 = self->_kCellularLtePdcchStateStats;
  v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v874, v1015, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v875;
    do
    {
      v100 = 0;
      do
      {
        if (*(_QWORD *)v875 != v99)
          objc_enumerationMutation(v96);
        v101 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v874 + 1) + 8 * v100), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLtePdcchStateStats:", v101);

        ++v100;
      }
      while (v98 != v100);
      v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v874, v1015, 16);
    }
    while (v98);
  }

  v873 = 0u;
  v872 = 0u;
  v871 = 0u;
  v870 = 0u;
  v102 = self->_kCellularLqmStateChanges;
  v103 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v102, "countByEnumeratingWithState:objects:count:", &v870, v1014, 16);
  if (v103)
  {
    v104 = v103;
    v105 = *(_QWORD *)v871;
    do
    {
      v106 = 0;
      do
      {
        if (*(_QWORD *)v871 != v105)
          objc_enumerationMutation(v102);
        v107 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v870 + 1) + 8 * v106), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLqmStateChange:", v107);

        ++v106;
      }
      while (v104 != v106);
      v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v102, "countByEnumeratingWithState:objects:count:", &v870, v1014, 16);
    }
    while (v104);
  }

  v869 = 0u;
  v868 = 0u;
  v867 = 0u;
  v866 = 0u;
  v108 = self->_kCellularServiceLosts;
  v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v866, v1013, 16);
  if (v109)
  {
    v110 = v109;
    v111 = *(_QWORD *)v867;
    do
    {
      v112 = 0;
      do
      {
        if (*(_QWORD *)v867 != v111)
          objc_enumerationMutation(v108);
        v113 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v866 + 1) + 8 * v112), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularServiceLost:", v113);

        ++v112;
      }
      while (v110 != v112);
      v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v866, v1013, 16);
    }
    while (v110);
  }

  v865 = 0u;
  v864 = 0u;
  v863 = 0u;
  v862 = 0u;
  v114 = self->_kCellularGsmServingCellRssiHists;
  v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v862, v1012, 16);
  if (v115)
  {
    v116 = v115;
    v117 = *(_QWORD *)v863;
    do
    {
      v118 = 0;
      do
      {
        if (*(_QWORD *)v863 != v117)
          objc_enumerationMutation(v114);
        v119 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v862 + 1) + 8 * v118), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularGsmServingCellRssiHist:", v119);

        ++v118;
      }
      while (v116 != v118);
      v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v862, v1012, 16);
    }
    while (v116);
  }

  v861 = 0u;
  v860 = 0u;
  v859 = 0u;
  v858 = 0u;
  v120 = self->_kCellularGsmServingCellSnrHists;
  v121 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v858, v1011, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v859;
    do
    {
      v124 = 0;
      do
      {
        if (*(_QWORD *)v859 != v123)
          objc_enumerationMutation(v120);
        v125 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v858 + 1) + 8 * v124), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularGsmServingCellSnrHist:", v125);

        ++v124;
      }
      while (v122 != v124);
      v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v858, v1011, 16);
    }
    while (v122);
  }

  v857 = 0u;
  v856 = 0u;
  v855 = 0u;
  v854 = 0u;
  v126 = self->_kCellularGsmTxPowerHists;
  v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v854, v1010, 16);
  if (v127)
  {
    v128 = v127;
    v129 = *(_QWORD *)v855;
    do
    {
      v130 = 0;
      do
      {
        if (*(_QWORD *)v855 != v129)
          objc_enumerationMutation(v126);
        v131 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v854 + 1) + 8 * v130), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularGsmTxPowerHist:", v131);

        ++v130;
      }
      while (v128 != v130);
      v128 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v854, v1010, 16);
    }
    while (v128);
  }

  v853 = 0u;
  v852 = 0u;
  v851 = 0u;
  v850 = 0u;
  v132 = self->_kCellularGsmConnectedModeHists;
  v133 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v850, v1009, 16);
  if (v133)
  {
    v134 = v133;
    v135 = *(_QWORD *)v851;
    do
    {
      v136 = 0;
      do
      {
        if (*(_QWORD *)v851 != v135)
          objc_enumerationMutation(v132);
        v137 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v850 + 1) + 8 * v136), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularGsmConnectedModeHist:", v137);

        ++v136;
      }
      while (v134 != v136);
      v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v132, "countByEnumeratingWithState:objects:count:", &v850, v1009, 16);
    }
    while (v134);
  }

  v849 = 0u;
  v848 = 0u;
  v847 = 0u;
  v846 = 0u;
  v138 = self->_kCellularGsmL1States;
  v139 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v846, v1008, 16);
  if (v139)
  {
    v140 = v139;
    v141 = *(_QWORD *)v847;
    do
    {
      v142 = 0;
      do
      {
        if (*(_QWORD *)v847 != v141)
          objc_enumerationMutation(v138);
        v143 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v846 + 1) + 8 * v142), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularGsmL1State:", v143);

        ++v142;
      }
      while (v140 != v142);
      v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v138, "countByEnumeratingWithState:objects:count:", &v846, v1008, 16);
    }
    while (v140);
  }

  v845 = 0u;
  v844 = 0u;
  v843 = 0u;
  v842 = 0u;
  v144 = self->_kCellularWcdmaCpcStats;
  v145 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v842, v1007, 16);
  if (v145)
  {
    v146 = v145;
    v147 = *(_QWORD *)v843;
    do
    {
      v148 = 0;
      do
      {
        if (*(_QWORD *)v843 != v147)
          objc_enumerationMutation(v144);
        v149 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v842 + 1) + 8 * v148), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaCpcStat:", v149);

        ++v148;
      }
      while (v146 != v148);
      v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v842, v1007, 16);
    }
    while (v146);
  }

  v841 = 0u;
  v840 = 0u;
  v839 = 0u;
  v838 = 0u;
  v150 = self->_kCellularWcdmaRxDiversityHists;
  v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v838, v1006, 16);
  if (v151)
  {
    v152 = v151;
    v153 = *(_QWORD *)v839;
    do
    {
      v154 = 0;
      do
      {
        if (*(_QWORD *)v839 != v153)
          objc_enumerationMutation(v150);
        v155 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v838 + 1) + 8 * v154), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRxDiversityHist:", v155);

        ++v154;
      }
      while (v152 != v154);
      v152 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v838, v1006, 16);
    }
    while (v152);
  }

  v837 = 0u;
  v836 = 0u;
  v835 = 0u;
  v834 = 0u;
  v156 = self->_kCellularWcdmaServingCellRx0RssiHists;
  v157 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v834, v1005, 16);
  if (v157)
  {
    v158 = v157;
    v159 = *(_QWORD *)v835;
    do
    {
      v160 = 0;
      do
      {
        if (*(_QWORD *)v835 != v159)
          objc_enumerationMutation(v156);
        v161 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v834 + 1) + 8 * v160), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaServingCellRx0RssiHist:", v161);

        ++v160;
      }
      while (v158 != v160);
      v158 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v834, v1005, 16);
    }
    while (v158);
  }

  v833 = 0u;
  v832 = 0u;
  v831 = 0u;
  v830 = 0u;
  v162 = self->_kCellularWcdmaServingCellRx1RssiHists;
  v163 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v830, v1004, 16);
  if (v163)
  {
    v164 = v163;
    v165 = *(_QWORD *)v831;
    do
    {
      v166 = 0;
      do
      {
        if (*(_QWORD *)v831 != v165)
          objc_enumerationMutation(v162);
        v167 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v830 + 1) + 8 * v166), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaServingCellRx1RssiHist:", v167);

        ++v166;
      }
      while (v164 != v166);
      v164 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v830, v1004, 16);
    }
    while (v164);
  }

  v829 = 0u;
  v828 = 0u;
  v827 = 0u;
  v826 = 0u;
  v168 = self->_kCellularWcdmaServingCellRx0EcNoHists;
  v169 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v168, "countByEnumeratingWithState:objects:count:", &v826, v1003, 16);
  if (v169)
  {
    v170 = v169;
    v171 = *(_QWORD *)v827;
    do
    {
      v172 = 0;
      do
      {
        if (*(_QWORD *)v827 != v171)
          objc_enumerationMutation(v168);
        v173 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v826 + 1) + 8 * v172), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaServingCellRx0EcNoHist:", v173);

        ++v172;
      }
      while (v170 != v172);
      v170 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v168, "countByEnumeratingWithState:objects:count:", &v826, v1003, 16);
    }
    while (v170);
  }

  v825 = 0u;
  v824 = 0u;
  v823 = 0u;
  v822 = 0u;
  v174 = self->_kCellularWcdmaServingCellRx1EcNoHists;
  v175 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v174, "countByEnumeratingWithState:objects:count:", &v822, v1002, 16);
  if (v175)
  {
    v176 = v175;
    v177 = *(_QWORD *)v823;
    do
    {
      v178 = 0;
      do
      {
        if (*(_QWORD *)v823 != v177)
          objc_enumerationMutation(v174);
        v179 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v822 + 1) + 8 * v178), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaServingCellRx1EcNoHist:", v179);

        ++v178;
      }
      while (v176 != v178);
      v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v174, "countByEnumeratingWithState:objects:count:", &v822, v1002, 16);
    }
    while (v176);
  }

  v821 = 0u;
  v820 = 0u;
  v819 = 0u;
  v818 = 0u;
  v180 = self->_kCellularWcdmaTxPowerHists;
  v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v818, v1001, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v819;
    do
    {
      v184 = 0;
      do
      {
        if (*(_QWORD *)v819 != v183)
          objc_enumerationMutation(v180);
        v185 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v818 + 1) + 8 * v184), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaTxPowerHist:", v185);

        ++v184;
      }
      while (v182 != v184);
      v182 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v818, v1001, 16);
    }
    while (v182);
  }

  v817 = 0u;
  v816 = 0u;
  v815 = 0u;
  v814 = 0u;
  v186 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  v187 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v814, v1000, 16);
  if (v187)
  {
    v188 = v187;
    v189 = *(_QWORD *)v815;
    do
    {
      v190 = 0;
      do
      {
        if (*(_QWORD *)v815 != v189)
          objc_enumerationMutation(v186);
        v191 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v814 + 1) + 8 * v190), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaReceiverStatusOnC0Hist:", v191);

        ++v190;
      }
      while (v188 != v190);
      v188 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v814, v1000, 16);
    }
    while (v188);
  }

  v813 = 0u;
  v812 = 0u;
  v811 = 0u;
  v810 = 0u;
  v192 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  v193 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v192, "countByEnumeratingWithState:objects:count:", &v810, v999, 16);
  if (v193)
  {
    v194 = v193;
    v195 = *(_QWORD *)v811;
    do
    {
      v196 = 0;
      do
      {
        if (*(_QWORD *)v811 != v195)
          objc_enumerationMutation(v192);
        v197 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v810 + 1) + 8 * v196), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaReceiverStatusOnC1Hist:", v197);

        ++v196;
      }
      while (v194 != v196);
      v194 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v192, "countByEnumeratingWithState:objects:count:", &v810, v999, 16);
    }
    while (v194);
  }

  v809 = 0u;
  v808 = 0u;
  v807 = 0u;
  v806 = 0u;
  v198 = self->_kCellularWcdmaCarrierStatusHists;
  v199 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v806, v998, 16);
  if (v199)
  {
    v200 = v199;
    v201 = *(_QWORD *)v807;
    do
    {
      v202 = 0;
      do
      {
        if (*(_QWORD *)v807 != v201)
          objc_enumerationMutation(v198);
        v203 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v806 + 1) + 8 * v202), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaCarrierStatusHist:", v203);

        ++v202;
      }
      while (v200 != v202);
      v200 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v806, v998, 16);
    }
    while (v200);
  }

  v805 = 0u;
  v804 = 0u;
  v803 = 0u;
  v802 = 0u;
  v204 = self->_kCellularWcdmaRabModeHists;
  v205 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v204, "countByEnumeratingWithState:objects:count:", &v802, v997, 16);
  if (v205)
  {
    v206 = v205;
    v207 = *(_QWORD *)v803;
    do
    {
      v208 = 0;
      do
      {
        if (*(_QWORD *)v803 != v207)
          objc_enumerationMutation(v204);
        v209 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v802 + 1) + 8 * v208), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRabModeHist:", v209);

        ++v208;
      }
      while (v206 != v208);
      v206 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v204, "countByEnumeratingWithState:objects:count:", &v802, v997, 16);
    }
    while (v206);
  }

  v801 = 0u;
  v800 = 0u;
  v799 = 0u;
  v798 = 0u;
  v210 = self->_kCellularWcdmaRabTypeHists;
  v211 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v798, v996, 16);
  if (v211)
  {
    v212 = v211;
    v213 = *(_QWORD *)v799;
    do
    {
      v214 = 0;
      do
      {
        if (*(_QWORD *)v799 != v213)
          objc_enumerationMutation(v210);
        v215 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v798 + 1) + 8 * v214), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRabTypeHist:", v215);

        ++v214;
      }
      while (v212 != v214);
      v212 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v798, v996, 16);
    }
    while (v212);
  }

  v797 = 0u;
  v796 = 0u;
  v795 = 0u;
  v794 = 0u;
  v216 = self->_kCellularWcdmaRrcConnectionStates;
  v217 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v216, "countByEnumeratingWithState:objects:count:", &v794, v995, 16);
  if (v217)
  {
    v218 = v217;
    v219 = *(_QWORD *)v795;
    do
    {
      v220 = 0;
      do
      {
        if (*(_QWORD *)v795 != v219)
          objc_enumerationMutation(v216);
        v221 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v794 + 1) + 8 * v220), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRrcConnectionState:", v221);

        ++v220;
      }
      while (v218 != v220);
      v218 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v216, "countByEnumeratingWithState:objects:count:", &v794, v995, 16);
    }
    while (v218);
  }

  v793 = 0u;
  v792 = 0u;
  v791 = 0u;
  v790 = 0u;
  v222 = self->_kCellularWcdmaRrcConfigurations;
  v223 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v222, "countByEnumeratingWithState:objects:count:", &v790, v994, 16);
  if (v223)
  {
    v224 = v223;
    v225 = *(_QWORD *)v791;
    do
    {
      v226 = 0;
      do
      {
        if (*(_QWORD *)v791 != v225)
          objc_enumerationMutation(v222);
        v227 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v790 + 1) + 8 * v226), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRrcConfiguration:", v227);

        ++v226;
      }
      while (v224 != v226);
      v224 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v222, "countByEnumeratingWithState:objects:count:", &v790, v994, 16);
    }
    while (v224);
  }

  v789 = 0u;
  v788 = 0u;
  v787 = 0u;
  v786 = 0u;
  v228 = self->_kCellularWcdmaRabStatus;
  v229 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v228, "countByEnumeratingWithState:objects:count:", &v786, v993, 16);
  if (v229)
  {
    v230 = v229;
    v231 = *(_QWORD *)v787;
    do
    {
      v232 = 0;
      do
      {
        if (*(_QWORD *)v787 != v231)
          objc_enumerationMutation(v228);
        v233 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v786 + 1) + 8 * v232), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaRabStatus:", v233);

        ++v232;
      }
      while (v230 != v232);
      v230 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v228, "countByEnumeratingWithState:objects:count:", &v786, v993, 16);
    }
    while (v230);
  }

  v785 = 0u;
  v784 = 0u;
  v783 = 0u;
  v782 = 0u;
  v234 = self->_kCellularWcdmaL1States;
  v235 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v234, "countByEnumeratingWithState:objects:count:", &v782, v992, 16);
  if (v235)
  {
    v236 = v235;
    v237 = *(_QWORD *)v783;
    do
    {
      v238 = 0;
      do
      {
        if (*(_QWORD *)v783 != v237)
          objc_enumerationMutation(v234);
        v239 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v782 + 1) + 8 * v238), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaL1State:", v239);

        ++v238;
      }
      while (v236 != v238);
      v236 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v234, "countByEnumeratingWithState:objects:count:", &v782, v992, 16);
    }
    while (v236);
  }

  v781 = 0u;
  v780 = 0u;
  v779 = 0u;
  v778 = 0u;
  v240 = self->_kCellularWcdmaDataInactivityBeforeIdles;
  v241 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v778, v991, 16);
  if (v241)
  {
    v242 = v241;
    v243 = *(_QWORD *)v779;
    do
    {
      v244 = 0;
      do
      {
        if (*(_QWORD *)v779 != v243)
          objc_enumerationMutation(v240);
        v245 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v778 + 1) + 8 * v244), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaDataInactivityBeforeIdle:", v245);

        ++v244;
      }
      while (v242 != v244);
      v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v778, v991, 16);
    }
    while (v242);
  }

  v777 = 0u;
  v776 = 0u;
  v775 = 0u;
  v774 = 0u;
  v246 = self->_kCellularWcdmaIdleToConnectedUserDatas;
  v247 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v246, "countByEnumeratingWithState:objects:count:", &v774, v990, 16);
  if (v247)
  {
    v248 = v247;
    v249 = *(_QWORD *)v775;
    do
    {
      v250 = 0;
      do
      {
        if (*(_QWORD *)v775 != v249)
          objc_enumerationMutation(v246);
        v251 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v774 + 1) + 8 * v250), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaIdleToConnectedUserData:", v251);

        ++v250;
      }
      while (v248 != v250);
      v248 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v246, "countByEnumeratingWithState:objects:count:", &v774, v990, 16);
    }
    while (v248);
  }

  v773 = 0u;
  v772 = 0u;
  v771 = 0u;
  v770 = 0u;
  v252 = self->_kCellularWcdmaVadHists;
  v253 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v770, v989, 16);
  if (v253)
  {
    v254 = v253;
    v255 = *(_QWORD *)v771;
    do
    {
      v256 = 0;
      do
      {
        if (*(_QWORD *)v771 != v255)
          objc_enumerationMutation(v252);
        v257 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v770 + 1) + 8 * v256), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularWcdmaVadHist:", v257);

        ++v256;
      }
      while (v254 != v256);
      v254 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v770, v989, 16);
    }
    while (v254);
  }

  v769 = 0u;
  v768 = 0u;
  v767 = 0u;
  v766 = 0u;
  v258 = self->_kCellularTdsRxDiversityHists;
  v259 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v258, "countByEnumeratingWithState:objects:count:", &v766, v988, 16);
  if (v259)
  {
    v260 = v259;
    v261 = *(_QWORD *)v767;
    do
    {
      v262 = 0;
      do
      {
        if (*(_QWORD *)v767 != v261)
          objc_enumerationMutation(v258);
        v263 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v766 + 1) + 8 * v262), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsRxDiversityHist:", v263);

        ++v262;
      }
      while (v260 != v262);
      v260 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v258, "countByEnumeratingWithState:objects:count:", &v766, v988, 16);
    }
    while (v260);
  }

  v765 = 0u;
  v764 = 0u;
  v763 = 0u;
  v762 = 0u;
  v264 = self->_kCellularTdsServingCellRx0RssiHists;
  v265 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v762, v987, 16);
  if (v265)
  {
    v266 = v265;
    v267 = *(_QWORD *)v763;
    do
    {
      v268 = 0;
      do
      {
        if (*(_QWORD *)v763 != v267)
          objc_enumerationMutation(v264);
        v269 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v762 + 1) + 8 * v268), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsServingCellRx0RssiHist:", v269);

        ++v268;
      }
      while (v266 != v268);
      v266 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v762, v987, 16);
    }
    while (v266);
  }

  v761 = 0u;
  v760 = 0u;
  v759 = 0u;
  v758 = 0u;
  v270 = self->_kCellularTdsServingCellRx1RssiHists;
  v271 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v758, v986, 16);
  if (v271)
  {
    v272 = v271;
    v273 = *(_QWORD *)v759;
    do
    {
      v274 = 0;
      do
      {
        if (*(_QWORD *)v759 != v273)
          objc_enumerationMutation(v270);
        v275 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v758 + 1) + 8 * v274), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsServingCellRx1RssiHist:", v275);

        ++v274;
      }
      while (v272 != v274);
      v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v758, v986, 16);
    }
    while (v272);
  }

  v757 = 0u;
  v756 = 0u;
  v755 = 0u;
  v754 = 0u;
  v276 = self->_kCellularTdsServingCellRx0RscpHists;
  v277 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v276, "countByEnumeratingWithState:objects:count:", &v754, v985, 16);
  if (v277)
  {
    v278 = v277;
    v279 = *(_QWORD *)v755;
    do
    {
      v280 = 0;
      do
      {
        if (*(_QWORD *)v755 != v279)
          objc_enumerationMutation(v276);
        v281 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v754 + 1) + 8 * v280), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsServingCellRx0RscpHist:", v281);

        ++v280;
      }
      while (v278 != v280);
      v278 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v276, "countByEnumeratingWithState:objects:count:", &v754, v985, 16);
    }
    while (v278);
  }

  v753 = 0u;
  v752 = 0u;
  v751 = 0u;
  v750 = 0u;
  v282 = self->_kCellularTdsServingCellRx1RscpHists;
  v283 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v282, "countByEnumeratingWithState:objects:count:", &v750, v984, 16);
  if (v283)
  {
    v284 = v283;
    v285 = *(_QWORD *)v751;
    do
    {
      v286 = 0;
      do
      {
        if (*(_QWORD *)v751 != v285)
          objc_enumerationMutation(v282);
        v287 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v750 + 1) + 8 * v286), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsServingCellRx1RscpHist:", v287);

        ++v286;
      }
      while (v284 != v286);
      v284 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v282, "countByEnumeratingWithState:objects:count:", &v750, v984, 16);
    }
    while (v284);
  }

  v749 = 0u;
  v748 = 0u;
  v747 = 0u;
  v746 = 0u;
  v288 = self->_kCellularTdsTxPowerHists;
  v289 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v288, "countByEnumeratingWithState:objects:count:", &v746, v983, 16);
  if (v289)
  {
    v290 = v289;
    v291 = *(_QWORD *)v747;
    do
    {
      v292 = 0;
      do
      {
        if (*(_QWORD *)v747 != v291)
          objc_enumerationMutation(v288);
        v293 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v746 + 1) + 8 * v292), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsTxPowerHist:", v293);

        ++v292;
      }
      while (v290 != v292);
      v290 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v288, "countByEnumeratingWithState:objects:count:", &v746, v983, 16);
    }
    while (v290);
  }

  v745 = 0u;
  v744 = 0u;
  v743 = 0u;
  v742 = 0u;
  v294 = self->_kCellularTdsRabModeHists;
  v295 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v294, "countByEnumeratingWithState:objects:count:", &v742, v982, 16);
  if (v295)
  {
    v296 = v295;
    v297 = *(_QWORD *)v743;
    do
    {
      v298 = 0;
      do
      {
        if (*(_QWORD *)v743 != v297)
          objc_enumerationMutation(v294);
        v299 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v742 + 1) + 8 * v298), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsRabModeHist:", v299);

        ++v298;
      }
      while (v296 != v298);
      v296 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v294, "countByEnumeratingWithState:objects:count:", &v742, v982, 16);
    }
    while (v296);
  }

  v741 = 0u;
  v740 = 0u;
  v739 = 0u;
  v738 = 0u;
  v300 = self->_kCellularTdsRabTypeHists;
  v301 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v738, v981, 16);
  if (v301)
  {
    v302 = v301;
    v303 = *(_QWORD *)v739;
    do
    {
      v304 = 0;
      do
      {
        if (*(_QWORD *)v739 != v303)
          objc_enumerationMutation(v300);
        v305 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v738 + 1) + 8 * v304), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsRabTypeHist:", v305);

        ++v304;
      }
      while (v302 != v304);
      v302 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v738, v981, 16);
    }
    while (v302);
  }

  v737 = 0u;
  v736 = 0u;
  v735 = 0u;
  v734 = 0u;
  v306 = self->_kCellularTdsL1States;
  v307 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v306, "countByEnumeratingWithState:objects:count:", &v734, v980, 16);
  if (v307)
  {
    v308 = v307;
    v309 = *(_QWORD *)v735;
    do
    {
      v310 = 0;
      do
      {
        if (*(_QWORD *)v735 != v309)
          objc_enumerationMutation(v306);
        v311 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v734 + 1) + 8 * v310), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularTdsL1State:", v311);

        ++v310;
      }
      while (v308 != v310);
      v308 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v306, "countByEnumeratingWithState:objects:count:", &v734, v980, 16);
    }
    while (v308);
  }

  v733 = 0u;
  v732 = 0u;
  v731 = 0u;
  v730 = 0u;
  v312 = self->_kCellularLteFwDuplexModes;
  v313 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v312, "countByEnumeratingWithState:objects:count:", &v730, v979, 16);
  if (v313)
  {
    v314 = v313;
    v315 = *(_QWORD *)v731;
    do
    {
      v316 = 0;
      do
      {
        if (*(_QWORD *)v731 != v315)
          objc_enumerationMutation(v312);
        v317 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v730 + 1) + 8 * v316), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteFwDuplexMode:", v317);

        ++v316;
      }
      while (v314 != v316);
      v314 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v312, "countByEnumeratingWithState:objects:count:", &v730, v979, 16);
    }
    while (v314);
  }

  v729 = 0u;
  v728 = 0u;
  v727 = 0u;
  v726 = 0u;
  v318 = self->_kCellularLteServingCellRsrpHists;
  v319 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v318, "countByEnumeratingWithState:objects:count:", &v726, v978, 16);
  if (v319)
  {
    v320 = v319;
    v321 = *(_QWORD *)v727;
    do
    {
      v322 = 0;
      do
      {
        if (*(_QWORD *)v727 != v321)
          objc_enumerationMutation(v318);
        v323 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v726 + 1) + 8 * v322), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteServingCellRsrpHist:", v323);

        ++v322;
      }
      while (v320 != v322);
      v320 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v318, "countByEnumeratingWithState:objects:count:", &v726, v978, 16);
    }
    while (v320);
  }

  v725 = 0u;
  v724 = 0u;
  v723 = 0u;
  v722 = 0u;
  v324 = self->_kCellularLteServingCellSinrHists;
  v325 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v324, "countByEnumeratingWithState:objects:count:", &v722, v977, 16);
  if (v325)
  {
    v326 = v325;
    v327 = *(_QWORD *)v723;
    do
    {
      v328 = 0;
      do
      {
        if (*(_QWORD *)v723 != v327)
          objc_enumerationMutation(v324);
        v329 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v722 + 1) + 8 * v328), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteServingCellSinrHist:", v329);

        ++v328;
      }
      while (v326 != v328);
      v326 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v324, "countByEnumeratingWithState:objects:count:", &v722, v977, 16);
    }
    while (v326);
  }

  v721 = 0u;
  v720 = 0u;
  v719 = 0u;
  v718 = 0u;
  v330 = self->_kCellularLteSleepStateHists;
  v331 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v718, v976, 16);
  if (v331)
  {
    v332 = v331;
    v333 = *(_QWORD *)v719;
    do
    {
      v334 = 0;
      do
      {
        if (*(_QWORD *)v719 != v333)
          objc_enumerationMutation(v330);
        v335 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v718 + 1) + 8 * v334), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteSleepStateHist:", v335);

        ++v334;
      }
      while (v332 != v334);
      v332 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v718, v976, 16);
    }
    while (v332);
  }

  v717 = 0u;
  v716 = 0u;
  v715 = 0u;
  v714 = 0u;
  v336 = self->_kCellularLteTxPowerHists;
  v337 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v336, "countByEnumeratingWithState:objects:count:", &v714, v975, 16);
  if (v337)
  {
    v338 = v337;
    v339 = *(_QWORD *)v715;
    do
    {
      v340 = 0;
      do
      {
        if (*(_QWORD *)v715 != v339)
          objc_enumerationMutation(v336);
        v341 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v714 + 1) + 8 * v340), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteTxPowerHist:", v341);

        ++v340;
      }
      while (v338 != v340);
      v338 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v336, "countByEnumeratingWithState:objects:count:", &v714, v975, 16);
    }
    while (v338);
  }

  v713 = 0u;
  v712 = 0u;
  v711 = 0u;
  v710 = 0u;
  v342 = self->_kCellularLteDlSccStateHists;
  v343 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v342, "countByEnumeratingWithState:objects:count:", &v710, v974, 16);
  if (v343)
  {
    v344 = v343;
    v345 = *(_QWORD *)v711;
    do
    {
      v346 = 0;
      do
      {
        if (*(_QWORD *)v711 != v345)
          objc_enumerationMutation(v342);
        v347 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v710 + 1) + 8 * v346), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteDlSccStateHist:", v347);

        ++v346;
      }
      while (v344 != v346);
      v344 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v342, "countByEnumeratingWithState:objects:count:", &v710, v974, 16);
    }
    while (v344);
  }

  v709 = 0u;
  v708 = 0u;
  v707 = 0u;
  v706 = 0u;
  v348 = self->_kCellularLteUlSccStateHists;
  v349 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v348, "countByEnumeratingWithState:objects:count:", &v706, v973, 16);
  if (v349)
  {
    v350 = v349;
    v351 = *(_QWORD *)v707;
    do
    {
      v352 = 0;
      do
      {
        if (*(_QWORD *)v707 != v351)
          objc_enumerationMutation(v348);
        v353 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v706 + 1) + 8 * v352), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteUlSccStateHist:", v353);

        ++v352;
      }
      while (v350 != v352);
      v350 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v348, "countByEnumeratingWithState:objects:count:", &v706, v973, 16);
    }
    while (v350);
  }

  v705 = 0u;
  v704 = 0u;
  v703 = 0u;
  v702 = 0u;
  v354 = self->_kCellularLteAdvancedRxStateHists;
  v355 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v354, "countByEnumeratingWithState:objects:count:", &v702, v972, 16);
  if (v355)
  {
    v356 = v355;
    v357 = *(_QWORD *)v703;
    do
    {
      v358 = 0;
      do
      {
        if (*(_QWORD *)v703 != v357)
          objc_enumerationMutation(v354);
        v359 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v702 + 1) + 8 * v358), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteAdvancedRxStateHist:", v359);

        ++v358;
      }
      while (v356 != v358);
      v356 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v354, "countByEnumeratingWithState:objects:count:", &v702, v972, 16);
    }
    while (v356);
  }

  v701 = 0u;
  v700 = 0u;
  v699 = 0u;
  v698 = 0u;
  v360 = self->_kCellularLteComponentCarrierInfos;
  v361 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v698, v971, 16);
  if (v361)
  {
    v362 = v361;
    v363 = *(_QWORD *)v699;
    do
    {
      v364 = 0;
      do
      {
        if (*(_QWORD *)v699 != v363)
          objc_enumerationMutation(v360);
        v365 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v698 + 1) + 8 * v364), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteComponentCarrierInfo:", v365);

        ++v364;
      }
      while (v362 != v364);
      v362 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v698, v971, 16);
    }
    while (v362);
  }

  v697 = 0u;
  v696 = 0u;
  v695 = 0u;
  v694 = 0u;
  v366 = self->_kCellularLteRxTxStateHists;
  v367 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v366, "countByEnumeratingWithState:objects:count:", &v694, v970, 16);
  if (v367)
  {
    v368 = v367;
    v369 = *(_QWORD *)v695;
    do
    {
      v370 = 0;
      do
      {
        if (*(_QWORD *)v695 != v369)
          objc_enumerationMutation(v366);
        v371 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v694 + 1) + 8 * v370), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteRxTxStateHist:", v371);

        ++v370;
      }
      while (v368 != v370);
      v368 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v366, "countByEnumeratingWithState:objects:count:", &v694, v970, 16);
    }
    while (v368);
  }

  v693 = 0u;
  v692 = 0u;
  v691 = 0u;
  v690 = 0u;
  v372 = self->_kCellularLteTotalDlTbsHists;
  v373 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v372, "countByEnumeratingWithState:objects:count:", &v690, v969, 16);
  if (v373)
  {
    v374 = v373;
    v375 = *(_QWORD *)v691;
    do
    {
      v376 = 0;
      do
      {
        if (*(_QWORD *)v691 != v375)
          objc_enumerationMutation(v372);
        v377 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v690 + 1) + 8 * v376), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteTotalDlTbsHist:", v377);

        ++v376;
      }
      while (v374 != v376);
      v374 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v372, "countByEnumeratingWithState:objects:count:", &v690, v969, 16);
    }
    while (v374);
  }

  v689 = 0u;
  v688 = 0u;
  v687 = 0u;
  v686 = 0u;
  v378 = self->_kCellularLteDataInactivityBeforeIdles;
  v379 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v378, "countByEnumeratingWithState:objects:count:", &v686, v968, 16);
  if (v379)
  {
    v380 = v379;
    v381 = *(_QWORD *)v687;
    do
    {
      v382 = 0;
      do
      {
        if (*(_QWORD *)v687 != v381)
          objc_enumerationMutation(v378);
        v383 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v686 + 1) + 8 * v382), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteDataInactivityBeforeIdle:", v383);

        ++v382;
      }
      while (v380 != v382);
      v380 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v378, "countByEnumeratingWithState:objects:count:", &v686, v968, 16);
    }
    while (v380);
  }

  v685 = 0u;
  v684 = 0u;
  v683 = 0u;
  v682 = 0u;
  v384 = self->_kCellularLteIdleToConnectedUserDatas;
  v385 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v384, "countByEnumeratingWithState:objects:count:", &v682, v967, 16);
  if (v385)
  {
    v386 = v385;
    v387 = *(_QWORD *)v683;
    do
    {
      v388 = 0;
      do
      {
        if (*(_QWORD *)v683 != v387)
          objc_enumerationMutation(v384);
        v389 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v682 + 1) + 8 * v388), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteIdleToConnectedUserData:", v389);

        ++v388;
      }
      while (v386 != v388);
      v386 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v384, "countByEnumeratingWithState:objects:count:", &v682, v967, 16);
    }
    while (v386);
  }

  v681 = 0u;
  v680 = 0u;
  v679 = 0u;
  v678 = 0u;
  v390 = self->_kCellularLteDlSccStateHistV3s;
  v391 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v678, v966, 16);
  if (v391)
  {
    v392 = v391;
    v393 = *(_QWORD *)v679;
    do
    {
      v394 = 0;
      do
      {
        if (*(_QWORD *)v679 != v393)
          objc_enumerationMutation(v390);
        v395 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v678 + 1) + 8 * v394), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteDlSccStateHistV3:", v395);

        ++v394;
      }
      while (v392 != v394);
      v392 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v390, "countByEnumeratingWithState:objects:count:", &v678, v966, 16);
    }
    while (v392);
  }

  v677 = 0u;
  v676 = 0u;
  v675 = 0u;
  v674 = 0u;
  v396 = self->_kCellularLteRxDiversityHists;
  v397 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v396, "countByEnumeratingWithState:objects:count:", &v674, v965, 16);
  if (v397)
  {
    v398 = v397;
    v399 = *(_QWORD *)v675;
    do
    {
      v400 = 0;
      do
      {
        if (*(_QWORD *)v675 != v399)
          objc_enumerationMutation(v396);
        v401 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v674 + 1) + 8 * v400), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLteRxDiversityHist:", v401);

        ++v400;
      }
      while (v398 != v400);
      v398 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v396, "countByEnumeratingWithState:objects:count:", &v674, v965, 16);
    }
    while (v398);
  }

  v673 = 0u;
  v672 = 0u;
  v671 = 0u;
  v670 = 0u;
  v402 = self->_kCellularLtePdcchStateHists;
  v403 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v402, "countByEnumeratingWithState:objects:count:", &v670, v964, 16);
  if (v403)
  {
    v404 = v403;
    v405 = *(_QWORD *)v671;
    do
    {
      v406 = 0;
      do
      {
        if (*(_QWORD *)v671 != v405)
          objc_enumerationMutation(v402);
        v407 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v670 + 1) + 8 * v406), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularLtePdcchStateHist:", v407);

        ++v406;
      }
      while (v404 != v406);
      v404 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v402, "countByEnumeratingWithState:objects:count:", &v670, v964, 16);
    }
    while (v404);
  }

  v669 = 0u;
  v668 = 0u;
  v667 = 0u;
  v666 = 0u;
  v408 = self->_kCellularProtocolStackStateHists;
  v409 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v408, "countByEnumeratingWithState:objects:count:", &v666, v963, 16);
  if (v409)
  {
    v410 = v409;
    v411 = *(_QWORD *)v667;
    do
    {
      v412 = 0;
      do
      {
        if (*(_QWORD *)v667 != v411)
          objc_enumerationMutation(v408);
        v413 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v666 + 1) + 8 * v412), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularProtocolStackStateHist:", v413);

        ++v412;
      }
      while (v410 != v412);
      v410 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v408, "countByEnumeratingWithState:objects:count:", &v666, v963, 16);
    }
    while (v410);
  }

  v665 = 0u;
  v664 = 0u;
  v663 = 0u;
  v662 = 0u;
  v414 = self->_kCellularCellPlmnSearchCounts;
  v415 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v414, "countByEnumeratingWithState:objects:count:", &v662, v962, 16);
  if (v415)
  {
    v416 = v415;
    v417 = *(_QWORD *)v663;
    do
    {
      v418 = 0;
      do
      {
        if (*(_QWORD *)v663 != v417)
          objc_enumerationMutation(v414);
        v419 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v662 + 1) + 8 * v418), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCellPlmnSearchCount:", v419);

        ++v418;
      }
      while (v416 != v418);
      v416 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v414, "countByEnumeratingWithState:objects:count:", &v662, v962, 16);
    }
    while (v416);
  }

  v661 = 0u;
  v660 = 0u;
  v659 = 0u;
  v658 = 0u;
  v420 = self->_kCellularCellPlmnSearchHists;
  v421 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v420, "countByEnumeratingWithState:objects:count:", &v658, v961, 16);
  if (v421)
  {
    v422 = v421;
    v423 = *(_QWORD *)v659;
    do
    {
      v424 = 0;
      do
      {
        if (*(_QWORD *)v659 != v423)
          objc_enumerationMutation(v420);
        v425 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v658 + 1) + 8 * v424), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCellPlmnSearchHist:", v425);

        ++v424;
      }
      while (v422 != v424);
      v422 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v420, "countByEnumeratingWithState:objects:count:", &v658, v961, 16);
    }
    while (v422);
  }

  v657 = 0u;
  v656 = 0u;
  v655 = 0u;
  v654 = 0u;
  v426 = self->_kCellularProtocolStackPowerStates;
  v427 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v426, "countByEnumeratingWithState:objects:count:", &v654, v960, 16);
  if (v427)
  {
    v428 = v427;
    v429 = *(_QWORD *)v655;
    do
    {
      v430 = 0;
      do
      {
        if (*(_QWORD *)v655 != v429)
          objc_enumerationMutation(v426);
        v431 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v654 + 1) + 8 * v430), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularProtocolStackPowerState:", v431);

        ++v430;
      }
      while (v428 != v430);
      v428 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v426, "countByEnumeratingWithState:objects:count:", &v654, v960, 16);
    }
    while (v428);
  }

  v653 = 0u;
  v652 = 0u;
  v651 = 0u;
  v650 = 0u;
  v432 = self->_kCellularDownlinkIpPacketFilterStatus;
  v433 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v432, "countByEnumeratingWithState:objects:count:", &v650, v959, 16);
  if (v433)
  {
    v434 = v433;
    v435 = *(_QWORD *)v651;
    do
    {
      v436 = 0;
      do
      {
        if (*(_QWORD *)v651 != v435)
          objc_enumerationMutation(v432);
        v437 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v650 + 1) + 8 * v436), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularDownlinkIpPacketFilterStatus:", v437);

        ++v436;
      }
      while (v434 != v436);
      v434 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v432, "countByEnumeratingWithState:objects:count:", &v650, v959, 16);
    }
    while (v434);
  }

  v649 = 0u;
  v648 = 0u;
  v647 = 0u;
  v646 = 0u;
  v438 = self->_kCellularDownlinkIpPacketDiscardeds;
  v439 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v438, "countByEnumeratingWithState:objects:count:", &v646, v958, 16);
  if (v439)
  {
    v440 = v439;
    v441 = *(_QWORD *)v647;
    do
    {
      v442 = 0;
      do
      {
        if (*(_QWORD *)v647 != v441)
          objc_enumerationMutation(v438);
        v443 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v646 + 1) + 8 * v442), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularDownlinkIpPacketDiscarded:", v443);

        ++v442;
      }
      while (v440 != v442);
      v440 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v438, "countByEnumeratingWithState:objects:count:", &v646, v958, 16);
    }
    while (v440);
  }

  v645 = 0u;
  v644 = 0u;
  v643 = 0u;
  v642 = 0u;
  v444 = self->_kCellularServingCellRfBandHists;
  v445 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v444, "countByEnumeratingWithState:objects:count:", &v642, v957, 16);
  if (v445)
  {
    v446 = v445;
    v447 = *(_QWORD *)v643;
    do
    {
      v448 = 0;
      do
      {
        if (*(_QWORD *)v643 != v447)
          objc_enumerationMutation(v444);
        v449 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v642 + 1) + 8 * v448), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularServingCellRfBandHist:", v449);

        ++v448;
      }
      while (v446 != v448);
      v446 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v444, "countByEnumeratingWithState:objects:count:", &v642, v957, 16);
    }
    while (v446);
  }

  v641 = 0u;
  v640 = 0u;
  v639 = 0u;
  v638 = 0u;
  v450 = self->_kCellularProtocolStackStateHist2s;
  v451 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v638, v956, 16);
  if (v451)
  {
    v452 = v451;
    v453 = *(_QWORD *)v639;
    do
    {
      v454 = 0;
      do
      {
        if (*(_QWORD *)v639 != v453)
          objc_enumerationMutation(v450);
        v455 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v638 + 1) + 8 * v454), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularProtocolStackStateHist2:", v455);

        ++v454;
      }
      while (v452 != v454);
      v452 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v638, v956, 16);
    }
    while (v452);
  }

  v637 = 0u;
  v636 = 0u;
  v635 = 0u;
  v634 = 0u;
  v456 = self->_kCellularProtocolStackStates;
  v457 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v456, "countByEnumeratingWithState:objects:count:", &v634, v955, 16);
  if (v457)
  {
    v458 = v457;
    v459 = *(_QWORD *)v635;
    do
    {
      v460 = 0;
      do
      {
        if (*(_QWORD *)v635 != v459)
          objc_enumerationMutation(v456);
        v461 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v634 + 1) + 8 * v460), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularProtocolStackState:", v461);

        ++v460;
      }
      while (v458 != v460);
      v458 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v456, "countByEnumeratingWithState:objects:count:", &v634, v955, 16);
    }
    while (v458);
  }

  v633 = 0u;
  v632 = 0u;
  v631 = 0u;
  v630 = 0u;
  v462 = self->_kCellularCdma1XRxDiversityHists;
  v463 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v462, "countByEnumeratingWithState:objects:count:", &v630, v954, 16);
  if (v463)
  {
    v464 = v463;
    v465 = *(_QWORD *)v631;
    do
    {
      v466 = 0;
      do
      {
        if (*(_QWORD *)v631 != v465)
          objc_enumerationMutation(v462);
        v467 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v630 + 1) + 8 * v466), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XRxDiversityHist:", v467);

        ++v466;
      }
      while (v464 != v466);
      v464 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v462, "countByEnumeratingWithState:objects:count:", &v630, v954, 16);
    }
    while (v464);
  }

  v628 = 0u;
  v629 = 0u;
  v626 = 0u;
  v627 = 0u;
  v468 = self->_kCellularCdma1XServingCellRx0RssiHists;
  v469 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v468, "countByEnumeratingWithState:objects:count:", &v626, v953, 16);
  if (v469)
  {
    v470 = v469;
    v471 = *(_QWORD *)v627;
    do
    {
      v472 = 0;
      do
      {
        if (*(_QWORD *)v627 != v471)
          objc_enumerationMutation(v468);
        v473 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v626 + 1) + 8 * v472), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XServingCellRx0RssiHist:", v473);

        ++v472;
      }
      while (v470 != v472);
      v470 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v468, "countByEnumeratingWithState:objects:count:", &v626, v953, 16);
    }
    while (v470);
  }

  v624 = 0u;
  v625 = 0u;
  v622 = 0u;
  v623 = 0u;
  v474 = self->_kCellularCdma1XServingCellRx1RssiHists;
  v475 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v474, "countByEnumeratingWithState:objects:count:", &v622, v952, 16);
  if (v475)
  {
    v476 = v475;
    v477 = *(_QWORD *)v623;
    do
    {
      v478 = 0;
      do
      {
        if (*(_QWORD *)v623 != v477)
          objc_enumerationMutation(v474);
        v479 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v622 + 1) + 8 * v478), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XServingCellRx1RssiHist:", v479);

        ++v478;
      }
      while (v476 != v478);
      v476 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v474, "countByEnumeratingWithState:objects:count:", &v622, v952, 16);
    }
    while (v476);
  }

  v620 = 0u;
  v621 = 0u;
  v618 = 0u;
  v619 = 0u;
  v480 = self->_kCellularCdma1XServingCellRx0EcIoHists;
  v481 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v480, "countByEnumeratingWithState:objects:count:", &v618, v951, 16);
  if (v481)
  {
    v482 = v481;
    v483 = *(_QWORD *)v619;
    do
    {
      v484 = 0;
      do
      {
        if (*(_QWORD *)v619 != v483)
          objc_enumerationMutation(v480);
        v485 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v618 + 1) + 8 * v484), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XServingCellRx0EcIoHist:", v485);

        ++v484;
      }
      while (v482 != v484);
      v482 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v480, "countByEnumeratingWithState:objects:count:", &v618, v951, 16);
    }
    while (v482);
  }

  v616 = 0u;
  v617 = 0u;
  v614 = 0u;
  v615 = 0u;
  v486 = self->_kCellularCdma1XServingCellRx1EcIoHists;
  v487 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v486, "countByEnumeratingWithState:objects:count:", &v614, v950, 16);
  if (v487)
  {
    v488 = v487;
    v489 = *(_QWORD *)v615;
    do
    {
      v490 = 0;
      do
      {
        if (*(_QWORD *)v615 != v489)
          objc_enumerationMutation(v486);
        v491 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v614 + 1) + 8 * v490), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XServingCellRx1EcIoHist:", v491);

        ++v490;
      }
      while (v488 != v490);
      v488 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v486, "countByEnumeratingWithState:objects:count:", &v614, v950, 16);
    }
    while (v488);
  }

  v612 = 0u;
  v613 = 0u;
  v610 = 0u;
  v611 = 0u;
  v492 = self->_kCellularCdma1XTxPowerHists;
  v493 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v492, "countByEnumeratingWithState:objects:count:", &v610, v949, 16);
  if (v493)
  {
    v494 = v493;
    v495 = *(_QWORD *)v611;
    do
    {
      v496 = 0;
      do
      {
        if (*(_QWORD *)v611 != v495)
          objc_enumerationMutation(v492);
        v497 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v610 + 1) + 8 * v496), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XTxPowerHist:", v497);

        ++v496;
      }
      while (v494 != v496);
      v494 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v492, "countByEnumeratingWithState:objects:count:", &v610, v949, 16);
    }
    while (v494);
  }

  v608 = 0u;
  v609 = 0u;
  v606 = 0u;
  v607 = 0u;
  v498 = self->_kCellularCdma1XProtocolStackStateHists;
  v499 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v498, "countByEnumeratingWithState:objects:count:", &v606, v948, 16);
  if (v499)
  {
    v500 = v499;
    v501 = *(_QWORD *)v607;
    do
    {
      v502 = 0;
      do
      {
        if (*(_QWORD *)v607 != v501)
          objc_enumerationMutation(v498);
        v503 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v606 + 1) + 8 * v502), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XProtocolStackStateHist:", v503);

        ++v502;
      }
      while (v500 != v502);
      v500 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v498, "countByEnumeratingWithState:objects:count:", &v606, v948, 16);
    }
    while (v500);
  }

  v604 = 0u;
  v605 = 0u;
  v602 = 0u;
  v603 = 0u;
  v504 = self->_kCellularCdma1XConnectionHists;
  v505 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v504, "countByEnumeratingWithState:objects:count:", &v602, v947, 16);
  if (v505)
  {
    v506 = v505;
    v507 = *(_QWORD *)v603;
    do
    {
      v508 = 0;
      do
      {
        if (*(_QWORD *)v603 != v507)
          objc_enumerationMutation(v504);
        v509 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v602 + 1) + 8 * v508), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XConnectionHist:", v509);

        ++v508;
      }
      while (v506 != v508);
      v506 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v504, "countByEnumeratingWithState:objects:count:", &v602, v947, 16);
    }
    while (v506);
  }

  v600 = 0u;
  v601 = 0u;
  v598 = 0u;
  v599 = 0u;
  v510 = self->_kCellularCdma1XRrStates;
  v511 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v510, "countByEnumeratingWithState:objects:count:", &v598, v946, 16);
  if (v511)
  {
    v512 = v511;
    v513 = *(_QWORD *)v599;
    do
    {
      v514 = 0;
      do
      {
        if (*(_QWORD *)v599 != v513)
          objc_enumerationMutation(v510);
        v515 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v598 + 1) + 8 * v514), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdma1XRrState:", v515);

        ++v514;
      }
      while (v512 != v514);
      v512 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v510, "countByEnumeratingWithState:objects:count:", &v598, v946, 16);
    }
    while (v512);
  }

  v596 = 0u;
  v597 = 0u;
  v594 = 0u;
  v595 = 0u;
  v516 = self->_kCellularCdmaEvdoRxDiversityHists;
  v517 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v516, "countByEnumeratingWithState:objects:count:", &v594, v945, 16);
  if (v517)
  {
    v518 = v517;
    v519 = *(_QWORD *)v595;
    do
    {
      v520 = 0;
      do
      {
        if (*(_QWORD *)v595 != v519)
          objc_enumerationMutation(v516);
        v521 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v594 + 1) + 8 * v520), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoRxDiversityHist:", v521);

        ++v520;
      }
      while (v518 != v520);
      v518 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v516, "countByEnumeratingWithState:objects:count:", &v594, v945, 16);
    }
    while (v518);
  }

  v592 = 0u;
  v593 = 0u;
  v590 = 0u;
  v591 = 0u;
  v522 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  v523 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v522, "countByEnumeratingWithState:objects:count:", &v590, v944, 16);
  if (v523)
  {
    v524 = v523;
    v525 = *(_QWORD *)v591;
    do
    {
      v526 = 0;
      do
      {
        if (*(_QWORD *)v591 != v525)
          objc_enumerationMutation(v522);
        v527 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v590 + 1) + 8 * v526), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoServingCellRx0RssiHist:", v527);

        ++v526;
      }
      while (v524 != v526);
      v524 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v522, "countByEnumeratingWithState:objects:count:", &v590, v944, 16);
    }
    while (v524);
  }

  v588 = 0u;
  v589 = 0u;
  v586 = 0u;
  v587 = 0u;
  v528 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  v529 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v528, "countByEnumeratingWithState:objects:count:", &v586, v943, 16);
  if (v529)
  {
    v530 = v529;
    v531 = *(_QWORD *)v587;
    do
    {
      v532 = 0;
      do
      {
        if (*(_QWORD *)v587 != v531)
          objc_enumerationMutation(v528);
        v533 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v586 + 1) + 8 * v532), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoServingCellRx1RssiHist:", v533);

        ++v532;
      }
      while (v530 != v532);
      v530 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v528, "countByEnumeratingWithState:objects:count:", &v586, v943, 16);
    }
    while (v530);
  }

  v584 = 0u;
  v585 = 0u;
  v582 = 0u;
  v583 = 0u;
  v534 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  v535 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v534, "countByEnumeratingWithState:objects:count:", &v582, v942, 16);
  if (v535)
  {
    v536 = v535;
    v537 = *(_QWORD *)v583;
    do
    {
      v538 = 0;
      do
      {
        if (*(_QWORD *)v583 != v537)
          objc_enumerationMutation(v534);
        v539 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v582 + 1) + 8 * v538), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoServingCellRx0EcIoHist:", v539);

        ++v538;
      }
      while (v536 != v538);
      v536 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v534, "countByEnumeratingWithState:objects:count:", &v582, v942, 16);
    }
    while (v536);
  }

  v580 = 0u;
  v581 = 0u;
  v578 = 0u;
  v579 = 0u;
  v540 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  v541 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v540, "countByEnumeratingWithState:objects:count:", &v578, v941, 16);
  if (v541)
  {
    v542 = v541;
    v543 = *(_QWORD *)v579;
    do
    {
      v544 = 0;
      do
      {
        if (*(_QWORD *)v579 != v543)
          objc_enumerationMutation(v540);
        v545 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v578 + 1) + 8 * v544), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoServingCellRx1EcIoHist:", v545);

        ++v544;
      }
      while (v542 != v544);
      v542 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v540, "countByEnumeratingWithState:objects:count:", &v578, v941, 16);
    }
    while (v542);
  }

  v576 = 0u;
  v577 = 0u;
  v574 = 0u;
  v575 = 0u;
  v546 = self->_kCellularCdmaEvdoTxPowerHists;
  v547 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v546, "countByEnumeratingWithState:objects:count:", &v574, v940, 16);
  if (v547)
  {
    v548 = v547;
    v549 = *(_QWORD *)v575;
    do
    {
      v550 = 0;
      do
      {
        if (*(_QWORD *)v575 != v549)
          objc_enumerationMutation(v546);
        v551 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v574 + 1) + 8 * v550), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoTxPowerHist:", v551);

        ++v550;
      }
      while (v548 != v550);
      v548 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v546, "countByEnumeratingWithState:objects:count:", &v574, v940, 16);
    }
    while (v548);
  }

  v572 = 0u;
  v573 = 0u;
  v570 = 0u;
  v571 = 0u;
  v552 = self->_kCellularCdmaEvdoProtocolStackStateHists;
  v553 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v552, "countByEnumeratingWithState:objects:count:", &v570, v939, 16);
  if (v553)
  {
    v554 = v553;
    v555 = *(_QWORD *)v571;
    do
    {
      v556 = 0;
      do
      {
        if (*(_QWORD *)v571 != v555)
          objc_enumerationMutation(v552);
        v557 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v570 + 1) + 8 * v556), "copyWithZone:", a3);
        objc_msgSend(v5, "addKCellularCdmaEvdoProtocolStackStateHist:", v557);

        ++v556;
      }
      while (v554 != v556);
      v554 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v552, "countByEnumeratingWithState:objects:count:", &v570, v939, 16);
    }
    while (v554);
  }

  v568 = 0u;
  v569 = 0u;
  v566 = 0u;
  v567 = 0u;
  v558 = self->_kCellularCdmaEvdoRrStates;
  v559 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v558, "countByEnumeratingWithState:objects:count:", &v566, v938, 16);
  if (v559)
  {
    v560 = v559;
    v561 = *(_QWORD *)v567;
    do
    {
      v562 = 0;
      do
      {
        if (*(_QWORD *)v567 != v561)
          objc_enumerationMutation(v558);
        v563 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v566 + 1) + 8 * v562), "copyWithZone:", a3, (_QWORD)v566);
        objc_msgSend(v5, "addKCellularCdmaEvdoRrState:", v563);

        ++v562;
      }
      while (v560 != v562);
      v560 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v558, "countByEnumeratingWithState:objects:count:", &v566, v938, 16);
    }
    while (v560);
  }

  v564 = v5;
  return v564;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *kCellularPerClientProfileTriggerCounts;
  NSMutableArray *kCellularProtocolStackCpuStats;
  NSMutableArray *kCellularPeripheralStats;
  NSMutableArray *kCellularDvfsStats;
  NSMutableArray *kCellularLteWcdmaGsmHwStats;
  NSMutableArray *kCellularLteTdsGsmHwStats;
  NSMutableArray *kCellularPmuAverageCurrents;
  NSMutableArray *kCellularFwCoreStats;
  NSMutableArray *kCellularLteWcdmaTdsHwStats;
  NSMutableArray *kCellularPmicHwStats;
  NSMutableArray *kCellularTdsRrcStates;
  NSMutableArray *kCellularLteRrcStates;
  NSMutableArray *kCellularLtePagingCycles;
  NSMutableArray *kCellularLteCdrxConfigs;
  NSMutableArray *kCellularLteRadioLinkFailures;
  NSMutableArray *kCellularLtePdcchStateStats;
  NSMutableArray *kCellularLqmStateChanges;
  NSMutableArray *kCellularServiceLosts;
  NSMutableArray *kCellularGsmServingCellRssiHists;
  NSMutableArray *kCellularGsmServingCellSnrHists;
  NSMutableArray *kCellularGsmTxPowerHists;
  NSMutableArray *kCellularGsmConnectedModeHists;
  NSMutableArray *kCellularGsmL1States;
  NSMutableArray *kCellularWcdmaCpcStats;
  NSMutableArray *kCellularWcdmaRxDiversityHists;
  NSMutableArray *kCellularWcdmaServingCellRx0RssiHists;
  NSMutableArray *kCellularWcdmaServingCellRx1RssiHists;
  NSMutableArray *kCellularWcdmaServingCellRx0EcNoHists;
  NSMutableArray *kCellularWcdmaServingCellRx1EcNoHists;
  NSMutableArray *kCellularWcdmaTxPowerHists;
  NSMutableArray *kCellularWcdmaReceiverStatusOnC0Hists;
  NSMutableArray *kCellularWcdmaReceiverStatusOnC1Hists;
  NSMutableArray *kCellularWcdmaCarrierStatusHists;
  NSMutableArray *kCellularWcdmaRabModeHists;
  NSMutableArray *kCellularWcdmaRabTypeHists;
  NSMutableArray *kCellularWcdmaRrcConnectionStates;
  NSMutableArray *kCellularWcdmaRrcConfigurations;
  NSMutableArray *kCellularWcdmaRabStatus;
  NSMutableArray *kCellularWcdmaL1States;
  NSMutableArray *kCellularWcdmaDataInactivityBeforeIdles;
  NSMutableArray *kCellularWcdmaIdleToConnectedUserDatas;
  NSMutableArray *kCellularWcdmaVadHists;
  NSMutableArray *kCellularTdsRxDiversityHists;
  NSMutableArray *kCellularTdsServingCellRx0RssiHists;
  NSMutableArray *kCellularTdsServingCellRx1RssiHists;
  NSMutableArray *kCellularTdsServingCellRx0RscpHists;
  NSMutableArray *kCellularTdsServingCellRx1RscpHists;
  NSMutableArray *kCellularTdsTxPowerHists;
  NSMutableArray *kCellularTdsRabModeHists;
  NSMutableArray *kCellularTdsRabTypeHists;
  NSMutableArray *kCellularTdsL1States;
  NSMutableArray *kCellularLteFwDuplexModes;
  NSMutableArray *kCellularLteServingCellRsrpHists;
  NSMutableArray *kCellularLteServingCellSinrHists;
  NSMutableArray *kCellularLteSleepStateHists;
  NSMutableArray *kCellularLteTxPowerHists;
  NSMutableArray *kCellularLteDlSccStateHists;
  NSMutableArray *kCellularLteUlSccStateHists;
  NSMutableArray *kCellularLteAdvancedRxStateHists;
  NSMutableArray *kCellularLteComponentCarrierInfos;
  NSMutableArray *kCellularLteRxTxStateHists;
  NSMutableArray *kCellularLteTotalDlTbsHists;
  NSMutableArray *kCellularLteDataInactivityBeforeIdles;
  NSMutableArray *kCellularLteIdleToConnectedUserDatas;
  NSMutableArray *kCellularLteDlSccStateHistV3s;
  NSMutableArray *kCellularLteRxDiversityHists;
  NSMutableArray *kCellularLtePdcchStateHists;
  NSMutableArray *kCellularProtocolStackStateHists;
  NSMutableArray *kCellularCellPlmnSearchCounts;
  NSMutableArray *kCellularCellPlmnSearchHists;
  NSMutableArray *kCellularProtocolStackPowerStates;
  NSMutableArray *kCellularDownlinkIpPacketFilterStatus;
  NSMutableArray *kCellularDownlinkIpPacketDiscardeds;
  NSMutableArray *kCellularServingCellRfBandHists;
  NSMutableArray *kCellularProtocolStackStateHist2s;
  NSMutableArray *kCellularProtocolStackStates;
  NSMutableArray *kCellularCdma1XRxDiversityHists;
  NSMutableArray *kCellularCdma1XServingCellRx0RssiHists;
  NSMutableArray *kCellularCdma1XServingCellRx1RssiHists;
  NSMutableArray *kCellularCdma1XServingCellRx0EcIoHists;
  NSMutableArray *kCellularCdma1XServingCellRx1EcIoHists;
  NSMutableArray *kCellularCdma1XTxPowerHists;
  NSMutableArray *kCellularCdma1XProtocolStackStateHists;
  NSMutableArray *kCellularCdma1XConnectionHists;
  NSMutableArray *kCellularCdma1XRrStates;
  NSMutableArray *kCellularCdmaEvdoRxDiversityHists;
  NSMutableArray *kCellularCdmaEvdoServingCellRx0RssiHists;
  NSMutableArray *kCellularCdmaEvdoServingCellRx1RssiHists;
  NSMutableArray *kCellularCdmaEvdoServingCellRx0EcIoHists;
  NSMutableArray *kCellularCdmaEvdoServingCellRx1EcIoHists;
  NSMutableArray *kCellularCdmaEvdoTxPowerHists;
  NSMutableArray *kCellularCdmaEvdoProtocolStackStateHists;
  NSMutableArray *kCellularCdmaEvdoRrStates;
  char v98;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_188;
  kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  if ((unint64_t)kCellularPerClientProfileTriggerCounts | v4[54])
  {
    if (!-[NSMutableArray isEqual:](kCellularPerClientProfileTriggerCounts, "isEqual:"))
      goto LABEL_188;
  }
  kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  if ((unint64_t)kCellularProtocolStackCpuStats | v4[58]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackCpuStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPeripheralStats = self->_kCellularPeripheralStats;
  if ((unint64_t)kCellularPeripheralStats | v4[55]
    && !-[NSMutableArray isEqual:](kCellularPeripheralStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDvfsStats = self->_kCellularDvfsStats;
  if ((unint64_t)kCellularDvfsStats | v4[22]
    && !-[NSMutableArray isEqual:](kCellularDvfsStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  if ((unint64_t)kCellularLteWcdmaGsmHwStats | v4[52]
    && !-[NSMutableArray isEqual:](kCellularLteWcdmaGsmHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  if ((unint64_t)kCellularLteTdsGsmHwStats | v4[48]
    && !-[NSMutableArray isEqual:](kCellularLteTdsGsmHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  if ((unint64_t)kCellularPmuAverageCurrents | v4[57]
    && !-[NSMutableArray isEqual:](kCellularPmuAverageCurrents, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularFwCoreStats = self->_kCellularFwCoreStats;
  if ((unint64_t)kCellularFwCoreStats | v4[23]
    && !-[NSMutableArray isEqual:](kCellularFwCoreStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  if ((unint64_t)kCellularLteWcdmaTdsHwStats | v4[53]
    && !-[NSMutableArray isEqual:](kCellularLteWcdmaTdsHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPmicHwStats = self->_kCellularPmicHwStats;
  if ((unint64_t)kCellularPmicHwStats | v4[56]
    && !-[NSMutableArray isEqual:](kCellularPmicHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  if ((unint64_t)kCellularTdsRrcStates | v4[68]
    && !-[NSMutableArray isEqual:](kCellularTdsRrcStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRrcStates = self->_kCellularLteRrcStates;
  if ((unint64_t)kCellularLteRrcStates | v4[42]
    && !-[NSMutableArray isEqual:](kCellularLteRrcStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  if ((unint64_t)kCellularLtePagingCycles | v4[38]
    && !-[NSMutableArray isEqual:](kCellularLtePagingCycles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  if ((unint64_t)kCellularLteCdrxConfigs | v4[31]
    && !-[NSMutableArray isEqual:](kCellularLteCdrxConfigs, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  if ((unint64_t)kCellularLteRadioLinkFailures | v4[41]
    && !-[NSMutableArray isEqual:](kCellularLteRadioLinkFailures, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  if ((unint64_t)kCellularLtePdcchStateStats | v4[40]
    && !-[NSMutableArray isEqual:](kCellularLtePdcchStateStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  if ((unint64_t)kCellularLqmStateChanges | v4[29]
    && !-[NSMutableArray isEqual:](kCellularLqmStateChanges, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularServiceLosts = self->_kCellularServiceLosts;
  if ((unint64_t)kCellularServiceLosts | v4[63]
    && !-[NSMutableArray isEqual:](kCellularServiceLosts, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  if ((unint64_t)kCellularGsmServingCellRssiHists | v4[26]
    && !-[NSMutableArray isEqual:](kCellularGsmServingCellRssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  if ((unint64_t)kCellularGsmServingCellSnrHists | v4[27]
    && !-[NSMutableArray isEqual:](kCellularGsmServingCellSnrHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  if ((unint64_t)kCellularGsmTxPowerHists | v4[28]
    && !-[NSMutableArray isEqual:](kCellularGsmTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  if ((unint64_t)kCellularGsmConnectedModeHists | v4[24]
    && !-[NSMutableArray isEqual:](kCellularGsmConnectedModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmL1States = self->_kCellularGsmL1States;
  if ((unint64_t)kCellularGsmL1States | v4[25]
    && !-[NSMutableArray isEqual:](kCellularGsmL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  if ((unint64_t)kCellularWcdmaCpcStats | v4[76]
    && !-[NSMutableArray isEqual:](kCellularWcdmaCpcStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  if ((unint64_t)kCellularWcdmaRxDiversityHists | v4[87]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  if ((unint64_t)kCellularWcdmaServingCellRx0RssiHists | v4[89]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  if ((unint64_t)kCellularWcdmaServingCellRx1RssiHists | v4[91]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  if ((unint64_t)kCellularWcdmaServingCellRx0EcNoHists | v4[88]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx0EcNoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  if ((unint64_t)kCellularWcdmaServingCellRx1EcNoHists | v4[90]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx1EcNoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  if ((unint64_t)kCellularWcdmaTxPowerHists | v4[92]
    && !-[NSMutableArray isEqual:](kCellularWcdmaTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  if ((unint64_t)kCellularWcdmaReceiverStatusOnC0Hists | v4[83]
    && !-[NSMutableArray isEqual:](kCellularWcdmaReceiverStatusOnC0Hists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  if ((unint64_t)kCellularWcdmaReceiverStatusOnC1Hists | v4[84]
    && !-[NSMutableArray isEqual:](kCellularWcdmaReceiverStatusOnC1Hists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  if ((unint64_t)kCellularWcdmaCarrierStatusHists | v4[75]
    && !-[NSMutableArray isEqual:](kCellularWcdmaCarrierStatusHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  if ((unint64_t)kCellularWcdmaRabModeHists | v4[80]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  if ((unint64_t)kCellularWcdmaRabTypeHists | v4[82]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabTypeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  if ((unint64_t)kCellularWcdmaRrcConnectionStates | v4[86]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRrcConnectionStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  if ((unint64_t)kCellularWcdmaRrcConfigurations | v4[85]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRrcConfigurations, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  if ((unint64_t)kCellularWcdmaRabStatus | v4[81]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabStatus, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  if ((unint64_t)kCellularWcdmaL1States | v4[79]
    && !-[NSMutableArray isEqual:](kCellularWcdmaL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  if ((unint64_t)kCellularWcdmaDataInactivityBeforeIdles | v4[77]
    && !-[NSMutableArray isEqual:](kCellularWcdmaDataInactivityBeforeIdles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  if ((unint64_t)kCellularWcdmaIdleToConnectedUserDatas | v4[78]
    && !-[NSMutableArray isEqual:](kCellularWcdmaIdleToConnectedUserDatas, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  if ((unint64_t)kCellularWcdmaVadHists | v4[93]
    && !-[NSMutableArray isEqual:](kCellularWcdmaVadHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  if ((unint64_t)kCellularTdsRxDiversityHists | v4[69]
    && !-[NSMutableArray isEqual:](kCellularTdsRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  if ((unint64_t)kCellularTdsServingCellRx0RssiHists | v4[71]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  if ((unint64_t)kCellularTdsServingCellRx1RssiHists | v4[73]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  if ((unint64_t)kCellularTdsServingCellRx0RscpHists | v4[70]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx0RscpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  if ((unint64_t)kCellularTdsServingCellRx1RscpHists | v4[72]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx1RscpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  if ((unint64_t)kCellularTdsTxPowerHists | v4[74]
    && !-[NSMutableArray isEqual:](kCellularTdsTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  if ((unint64_t)kCellularTdsRabModeHists | v4[66]
    && !-[NSMutableArray isEqual:](kCellularTdsRabModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  if ((unint64_t)kCellularTdsRabTypeHists | v4[67]
    && !-[NSMutableArray isEqual:](kCellularTdsRabTypeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsL1States = self->_kCellularTdsL1States;
  if ((unint64_t)kCellularTdsL1States | v4[65]
    && !-[NSMutableArray isEqual:](kCellularTdsL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  if ((unint64_t)kCellularLteFwDuplexModes | v4[36]
    && !-[NSMutableArray isEqual:](kCellularLteFwDuplexModes, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  if ((unint64_t)kCellularLteServingCellRsrpHists | v4[45]
    && !-[NSMutableArray isEqual:](kCellularLteServingCellRsrpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  if ((unint64_t)kCellularLteServingCellSinrHists | v4[46]
    && !-[NSMutableArray isEqual:](kCellularLteServingCellSinrHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  if ((unint64_t)kCellularLteSleepStateHists | v4[47]
    && !-[NSMutableArray isEqual:](kCellularLteSleepStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  if ((unint64_t)kCellularLteTxPowerHists | v4[50]
    && !-[NSMutableArray isEqual:](kCellularLteTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  if ((unint64_t)kCellularLteDlSccStateHists | v4[35]
    && !-[NSMutableArray isEqual:](kCellularLteDlSccStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  if ((unint64_t)kCellularLteUlSccStateHists | v4[51]
    && !-[NSMutableArray isEqual:](kCellularLteUlSccStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  if ((unint64_t)kCellularLteAdvancedRxStateHists | v4[30]
    && !-[NSMutableArray isEqual:](kCellularLteAdvancedRxStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  if ((unint64_t)kCellularLteComponentCarrierInfos | v4[32]
    && !-[NSMutableArray isEqual:](kCellularLteComponentCarrierInfos, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  if ((unint64_t)kCellularLteRxTxStateHists | v4[44]
    && !-[NSMutableArray isEqual:](kCellularLteRxTxStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  if ((unint64_t)kCellularLteTotalDlTbsHists | v4[49]
    && !-[NSMutableArray isEqual:](kCellularLteTotalDlTbsHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  if ((unint64_t)kCellularLteDataInactivityBeforeIdles | v4[33]
    && !-[NSMutableArray isEqual:](kCellularLteDataInactivityBeforeIdles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  if ((unint64_t)kCellularLteIdleToConnectedUserDatas | v4[37]
    && !-[NSMutableArray isEqual:](kCellularLteIdleToConnectedUserDatas, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  if ((unint64_t)kCellularLteDlSccStateHistV3s | v4[34]
    && !-[NSMutableArray isEqual:](kCellularLteDlSccStateHistV3s, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  if ((unint64_t)kCellularLteRxDiversityHists | v4[43]
    && !-[NSMutableArray isEqual:](kCellularLteRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  if ((unint64_t)kCellularLtePdcchStateHists | v4[39]
    && !-[NSMutableArray isEqual:](kCellularLtePdcchStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  if ((unint64_t)kCellularProtocolStackStateHists | v4[61]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  if ((unint64_t)kCellularCellPlmnSearchCounts | v4[18]
    && !-[NSMutableArray isEqual:](kCellularCellPlmnSearchCounts, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  if ((unint64_t)kCellularCellPlmnSearchHists | v4[19]
    && !-[NSMutableArray isEqual:](kCellularCellPlmnSearchHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  if ((unint64_t)kCellularProtocolStackPowerStates | v4[59]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackPowerStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  if ((unint64_t)kCellularDownlinkIpPacketFilterStatus | v4[21]
    && !-[NSMutableArray isEqual:](kCellularDownlinkIpPacketFilterStatus, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  if ((unint64_t)kCellularDownlinkIpPacketDiscardeds | v4[20]
    && !-[NSMutableArray isEqual:](kCellularDownlinkIpPacketDiscardeds, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  if ((unint64_t)kCellularServingCellRfBandHists | v4[64]
    && !-[NSMutableArray isEqual:](kCellularServingCellRfBandHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  if ((unint64_t)kCellularProtocolStackStateHist2s | v4[60]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStateHist2s, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  if ((unint64_t)kCellularProtocolStackStates | v4[62]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  if ((unint64_t)kCellularCdma1XRxDiversityHists | v4[4]
    && !-[NSMutableArray isEqual:](kCellularCdma1XRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  if ((unint64_t)kCellularCdma1XServingCellRx0RssiHists | v4[6]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  if ((unint64_t)kCellularCdma1XServingCellRx1RssiHists | v4[8]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  if ((unint64_t)kCellularCdma1XServingCellRx0EcIoHists | v4[5]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx0EcIoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  if ((unint64_t)kCellularCdma1XServingCellRx1EcIoHists | v4[7]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx1EcIoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  if ((unint64_t)kCellularCdma1XTxPowerHists | v4[9]
    && !-[NSMutableArray isEqual:](kCellularCdma1XTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  if ((unint64_t)kCellularCdma1XProtocolStackStateHists | v4[2]
    && !-[NSMutableArray isEqual:](kCellularCdma1XProtocolStackStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  if ((unint64_t)kCellularCdma1XConnectionHists | v4[1]
    && !-[NSMutableArray isEqual:](kCellularCdma1XConnectionHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  if ((unint64_t)kCellularCdma1XRrStates | v4[3]
    && !-[NSMutableArray isEqual:](kCellularCdma1XRrStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  if (((kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists,
         !((unint64_t)kCellularCdmaEvdoRxDiversityHists | v4[12]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoRxDiversityHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx0RssiHists | v4[14]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx0RssiHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx1RssiHists | v4[16]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx1RssiHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx0EcIoHists | v4[13]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx0EcIoHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx1EcIoHists | v4[15]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx1EcIoHists, "isEqual:"))
    && ((kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists,
         !((unint64_t)kCellularCdmaEvdoTxPowerHists | v4[17]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoTxPowerHists, "isEqual:"))
    && ((kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists,
         !((unint64_t)kCellularCdmaEvdoProtocolStackStateHists | v4[10]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoProtocolStackStateHists, "isEqual:")))
  {
    kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
    if ((unint64_t)kCellularCdmaEvdoRrStates | v4[11])
      v98 = -[NSMutableArray isEqual:](kCellularCdmaEvdoRrStates, "isEqual:");
    else
      v98 = 1;
  }
  else
  {
LABEL_188:
    v98 = 0;
  }

  return v98;
}

- (unint64_t)hash
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
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
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v3 = -[NSMutableArray hash](self->_kCellularPerClientProfileTriggerCounts, "hash");
  v4 = -[NSMutableArray hash](self->_kCellularProtocolStackCpuStats, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_kCellularPeripheralStats, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_kCellularDvfsStats, "hash");
  v7 = -[NSMutableArray hash](self->_kCellularLteWcdmaGsmHwStats, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_kCellularLteTdsGsmHwStats, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_kCellularPmuAverageCurrents, "hash");
  v10 = -[NSMutableArray hash](self->_kCellularFwCoreStats, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_kCellularLteWcdmaTdsHwStats, "hash");
  v12 = v11 ^ -[NSMutableArray hash](self->_kCellularPmicHwStats, "hash");
  v13 = v9 ^ v12 ^ -[NSMutableArray hash](self->_kCellularTdsRrcStates, "hash");
  v14 = -[NSMutableArray hash](self->_kCellularLteRrcStates, "hash");
  v15 = v14 ^ -[NSMutableArray hash](self->_kCellularLtePagingCycles, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_kCellularLteCdrxConfigs, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_kCellularLteRadioLinkFailures, "hash");
  v18 = v13 ^ v17 ^ -[NSMutableArray hash](self->_kCellularLtePdcchStateStats, "hash");
  v19 = -[NSMutableArray hash](self->_kCellularLqmStateChanges, "hash");
  v20 = v19 ^ -[NSMutableArray hash](self->_kCellularServiceLosts, "hash");
  v21 = v20 ^ -[NSMutableArray hash](self->_kCellularGsmServingCellRssiHists, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_kCellularGsmServingCellSnrHists, "hash");
  v23 = v22 ^ -[NSMutableArray hash](self->_kCellularGsmTxPowerHists, "hash");
  v24 = v18 ^ v23 ^ -[NSMutableArray hash](self->_kCellularGsmConnectedModeHists, "hash");
  v25 = -[NSMutableArray hash](self->_kCellularGsmL1States, "hash");
  v26 = v25 ^ -[NSMutableArray hash](self->_kCellularWcdmaCpcStats, "hash");
  v27 = v26 ^ -[NSMutableArray hash](self->_kCellularWcdmaRxDiversityHists, "hash");
  v28 = v27 ^ -[NSMutableArray hash](self->_kCellularWcdmaServingCellRx0RssiHists, "hash");
  v29 = v28 ^ -[NSMutableArray hash](self->_kCellularWcdmaServingCellRx1RssiHists, "hash");
  v30 = v29 ^ -[NSMutableArray hash](self->_kCellularWcdmaServingCellRx0EcNoHists, "hash");
  v31 = v24 ^ v30 ^ -[NSMutableArray hash](self->_kCellularWcdmaServingCellRx1EcNoHists, "hash");
  v32 = -[NSMutableArray hash](self->_kCellularWcdmaTxPowerHists, "hash");
  v33 = v32 ^ -[NSMutableArray hash](self->_kCellularWcdmaReceiverStatusOnC0Hists, "hash");
  v34 = v33 ^ -[NSMutableArray hash](self->_kCellularWcdmaReceiverStatusOnC1Hists, "hash");
  v35 = v34 ^ -[NSMutableArray hash](self->_kCellularWcdmaCarrierStatusHists, "hash");
  v36 = v35 ^ -[NSMutableArray hash](self->_kCellularWcdmaRabModeHists, "hash");
  v37 = v36 ^ -[NSMutableArray hash](self->_kCellularWcdmaRabTypeHists, "hash");
  v38 = v37 ^ -[NSMutableArray hash](self->_kCellularWcdmaRrcConnectionStates, "hash");
  v39 = v31 ^ v38 ^ -[NSMutableArray hash](self->_kCellularWcdmaRrcConfigurations, "hash");
  v40 = -[NSMutableArray hash](self->_kCellularWcdmaRabStatus, "hash");
  v41 = v40 ^ -[NSMutableArray hash](self->_kCellularWcdmaL1States, "hash");
  v42 = v41 ^ -[NSMutableArray hash](self->_kCellularWcdmaDataInactivityBeforeIdles, "hash");
  v43 = v42 ^ -[NSMutableArray hash](self->_kCellularWcdmaIdleToConnectedUserDatas, "hash");
  v44 = v43 ^ -[NSMutableArray hash](self->_kCellularWcdmaVadHists, "hash");
  v45 = v44 ^ -[NSMutableArray hash](self->_kCellularTdsRxDiversityHists, "hash");
  v46 = v45 ^ -[NSMutableArray hash](self->_kCellularTdsServingCellRx0RssiHists, "hash");
  v47 = v46 ^ -[NSMutableArray hash](self->_kCellularTdsServingCellRx1RssiHists, "hash");
  v48 = v39 ^ v47 ^ -[NSMutableArray hash](self->_kCellularTdsServingCellRx0RscpHists, "hash");
  v49 = -[NSMutableArray hash](self->_kCellularTdsServingCellRx1RscpHists, "hash");
  v50 = v49 ^ -[NSMutableArray hash](self->_kCellularTdsTxPowerHists, "hash");
  v51 = v50 ^ -[NSMutableArray hash](self->_kCellularTdsRabModeHists, "hash");
  v52 = v51 ^ -[NSMutableArray hash](self->_kCellularTdsRabTypeHists, "hash");
  v53 = v52 ^ -[NSMutableArray hash](self->_kCellularTdsL1States, "hash");
  v54 = v53 ^ -[NSMutableArray hash](self->_kCellularLteFwDuplexModes, "hash");
  v55 = v54 ^ -[NSMutableArray hash](self->_kCellularLteServingCellRsrpHists, "hash");
  v56 = v55 ^ -[NSMutableArray hash](self->_kCellularLteServingCellSinrHists, "hash");
  v57 = v56 ^ -[NSMutableArray hash](self->_kCellularLteSleepStateHists, "hash");
  v58 = v48 ^ v57 ^ -[NSMutableArray hash](self->_kCellularLteTxPowerHists, "hash");
  v59 = -[NSMutableArray hash](self->_kCellularLteDlSccStateHists, "hash");
  v60 = v59 ^ -[NSMutableArray hash](self->_kCellularLteUlSccStateHists, "hash");
  v61 = v60 ^ -[NSMutableArray hash](self->_kCellularLteAdvancedRxStateHists, "hash");
  v62 = v61 ^ -[NSMutableArray hash](self->_kCellularLteComponentCarrierInfos, "hash");
  v63 = v62 ^ -[NSMutableArray hash](self->_kCellularLteRxTxStateHists, "hash");
  v64 = v63 ^ -[NSMutableArray hash](self->_kCellularLteTotalDlTbsHists, "hash");
  v65 = v64 ^ -[NSMutableArray hash](self->_kCellularLteDataInactivityBeforeIdles, "hash");
  v66 = v65 ^ -[NSMutableArray hash](self->_kCellularLteIdleToConnectedUserDatas, "hash");
  v67 = v66 ^ -[NSMutableArray hash](self->_kCellularLteDlSccStateHistV3s, "hash");
  v68 = v67 ^ -[NSMutableArray hash](self->_kCellularLteRxDiversityHists, "hash");
  v69 = v58 ^ v68 ^ -[NSMutableArray hash](self->_kCellularLtePdcchStateHists, "hash");
  v70 = -[NSMutableArray hash](self->_kCellularProtocolStackStateHists, "hash");
  v71 = v70 ^ -[NSMutableArray hash](self->_kCellularCellPlmnSearchCounts, "hash");
  v72 = v71 ^ -[NSMutableArray hash](self->_kCellularCellPlmnSearchHists, "hash");
  v73 = v72 ^ -[NSMutableArray hash](self->_kCellularProtocolStackPowerStates, "hash");
  v74 = v73 ^ -[NSMutableArray hash](self->_kCellularDownlinkIpPacketFilterStatus, "hash");
  v75 = v74 ^ -[NSMutableArray hash](self->_kCellularDownlinkIpPacketDiscardeds, "hash");
  v76 = v75 ^ -[NSMutableArray hash](self->_kCellularServingCellRfBandHists, "hash");
  v77 = v76 ^ -[NSMutableArray hash](self->_kCellularProtocolStackStateHist2s, "hash");
  v78 = v77 ^ -[NSMutableArray hash](self->_kCellularProtocolStackStates, "hash");
  v79 = v78 ^ -[NSMutableArray hash](self->_kCellularCdma1XRxDiversityHists, "hash");
  v80 = v79 ^ -[NSMutableArray hash](self->_kCellularCdma1XServingCellRx0RssiHists, "hash");
  v81 = v69 ^ v80 ^ -[NSMutableArray hash](self->_kCellularCdma1XServingCellRx1RssiHists, "hash");
  v82 = -[NSMutableArray hash](self->_kCellularCdma1XServingCellRx0EcIoHists, "hash");
  v83 = v82 ^ -[NSMutableArray hash](self->_kCellularCdma1XServingCellRx1EcIoHists, "hash");
  v84 = v83 ^ -[NSMutableArray hash](self->_kCellularCdma1XTxPowerHists, "hash");
  v85 = v84 ^ -[NSMutableArray hash](self->_kCellularCdma1XProtocolStackStateHists, "hash");
  v86 = v85 ^ -[NSMutableArray hash](self->_kCellularCdma1XConnectionHists, "hash");
  v87 = v86 ^ -[NSMutableArray hash](self->_kCellularCdma1XRrStates, "hash");
  v88 = v87 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoRxDiversityHists, "hash");
  v89 = v88 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "hash");
  v90 = v89 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "hash");
  v91 = v90 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "hash");
  v92 = v91 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "hash");
  v93 = v92 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoTxPowerHists, "hash");
  v94 = v81 ^ v93 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoProtocolStackStateHists, "hash");
  return v94 ^ -[NSMutableArray hash](self->_kCellularCdmaEvdoRrStates, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  id v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  id v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  id v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  id v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  id v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  id v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  id v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  id v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  id v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  id v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  id v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  id v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  id v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  id v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  id v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  id v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  id v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  id v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  id v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  id v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  id v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  id v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  id v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  id v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  id v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  id v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  id v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  id v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  id v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  id v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  id v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  id v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  id v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  id v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  id v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  id v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  __int128 v807;
  __int128 v808;
  __int128 v809;
  __int128 v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  __int128 v815;
  __int128 v816;
  __int128 v817;
  __int128 v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  __int128 v831;
  __int128 v832;
  __int128 v833;
  __int128 v834;
  __int128 v835;
  __int128 v836;
  __int128 v837;
  __int128 v838;
  __int128 v839;
  __int128 v840;
  __int128 v841;
  _BYTE v842[128];
  _BYTE v843[128];
  _BYTE v844[128];
  _BYTE v845[128];
  _BYTE v846[128];
  _BYTE v847[128];
  _BYTE v848[128];
  _BYTE v849[128];
  _BYTE v850[128];
  _BYTE v851[128];
  _BYTE v852[128];
  _BYTE v853[128];
  _BYTE v854[128];
  _BYTE v855[128];
  _BYTE v856[128];
  _BYTE v857[128];
  _BYTE v858[128];
  _BYTE v859[128];
  _BYTE v860[128];
  _BYTE v861[128];
  _BYTE v862[128];
  _BYTE v863[128];
  _BYTE v864[128];
  _BYTE v865[128];
  _BYTE v866[128];
  _BYTE v867[128];
  _BYTE v868[128];
  _BYTE v869[128];
  _BYTE v870[128];
  _BYTE v871[128];
  _BYTE v872[128];
  _BYTE v873[128];
  _BYTE v874[128];
  _BYTE v875[128];
  _BYTE v876[128];
  _BYTE v877[128];
  _BYTE v878[128];
  _BYTE v879[128];
  _BYTE v880[128];
  _BYTE v881[128];
  _BYTE v882[128];
  _BYTE v883[128];
  _BYTE v884[128];
  _BYTE v885[128];
  _BYTE v886[128];
  _BYTE v887[128];
  _BYTE v888[128];
  _BYTE v889[128];
  _BYTE v890[128];
  _BYTE v891[128];
  _BYTE v892[128];
  _BYTE v893[128];
  _BYTE v894[128];
  _BYTE v895[128];
  _BYTE v896[128];
  _BYTE v897[128];
  _BYTE v898[128];
  _BYTE v899[128];
  _BYTE v900[128];
  _BYTE v901[128];
  _BYTE v902[128];
  _BYTE v903[128];
  _BYTE v904[128];
  _BYTE v905[128];
  _BYTE v906[128];
  _BYTE v907[128];
  _BYTE v908[128];
  _BYTE v909[128];
  _BYTE v910[128];
  _BYTE v911[128];
  _BYTE v912[128];
  _BYTE v913[128];
  _BYTE v914[128];
  _BYTE v915[128];
  _BYTE v916[128];
  _BYTE v917[128];
  _BYTE v918[128];
  _BYTE v919[128];
  _BYTE v920[128];
  _BYTE v921[128];
  _BYTE v922[128];
  _BYTE v923[128];
  _BYTE v924[128];
  _BYTE v925[128];
  _BYTE v926[128];
  _BYTE v927[128];
  _BYTE v928[128];
  _BYTE v929[128];
  _BYTE v930[128];
  _BYTE v931[128];
  _BYTE v932[128];
  _BYTE v933[128];
  _BYTE v934[128];
  uint64_t v935;

  v935 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v838 = 0u;
  v839 = 0u;
  v840 = 0u;
  v841 = 0u;
  v5 = v4[54];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v838, v934, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v839;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v839 != v8)
          objc_enumerationMutation(v5);
        -[PowerlogMetricLog addKCellularPerClientProfileTriggerCount:](self, "addKCellularPerClientProfileTriggerCount:", *(_QWORD *)(*((_QWORD *)&v838 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v838, v934, 16);
    }
    while (v7);
  }

  v837 = 0u;
  v836 = 0u;
  v835 = 0u;
  v834 = 0u;
  v10 = v4[58];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v834, v933, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v835;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v835 != v13)
          objc_enumerationMutation(v10);
        -[PowerlogMetricLog addKCellularProtocolStackCpuStats:](self, "addKCellularProtocolStackCpuStats:", *(_QWORD *)(*((_QWORD *)&v834 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v834, v933, 16);
    }
    while (v12);
  }

  v833 = 0u;
  v832 = 0u;
  v831 = 0u;
  v830 = 0u;
  v15 = v4[55];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v830, v932, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v831;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v831 != v18)
          objc_enumerationMutation(v15);
        -[PowerlogMetricLog addKCellularPeripheralStats:](self, "addKCellularPeripheralStats:", *(_QWORD *)(*((_QWORD *)&v830 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v830, v932, 16);
    }
    while (v17);
  }

  v829 = 0u;
  v828 = 0u;
  v827 = 0u;
  v826 = 0u;
  v20 = v4[22];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v826, v931, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v827;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v827 != v23)
          objc_enumerationMutation(v20);
        -[PowerlogMetricLog addKCellularDvfsStats:](self, "addKCellularDvfsStats:", *(_QWORD *)(*((_QWORD *)&v826 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v826, v931, 16);
    }
    while (v22);
  }

  v825 = 0u;
  v824 = 0u;
  v823 = 0u;
  v822 = 0u;
  v25 = v4[52];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v822, v930, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v823;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v823 != v28)
          objc_enumerationMutation(v25);
        -[PowerlogMetricLog addKCellularLteWcdmaGsmHwStats:](self, "addKCellularLteWcdmaGsmHwStats:", *(_QWORD *)(*((_QWORD *)&v822 + 1) + 8 * v29++));
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v822, v930, 16);
    }
    while (v27);
  }

  v821 = 0u;
  v820 = 0u;
  v819 = 0u;
  v818 = 0u;
  v30 = v4[48];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v818, v929, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v819;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v819 != v33)
          objc_enumerationMutation(v30);
        -[PowerlogMetricLog addKCellularLteTdsGsmHwStats:](self, "addKCellularLteTdsGsmHwStats:", *(_QWORD *)(*((_QWORD *)&v818 + 1) + 8 * v34++));
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v818, v929, 16);
    }
    while (v32);
  }

  v817 = 0u;
  v816 = 0u;
  v815 = 0u;
  v814 = 0u;
  v35 = v4[57];
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v814, v928, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v815;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v815 != v38)
          objc_enumerationMutation(v35);
        -[PowerlogMetricLog addKCellularPmuAverageCurrent:](self, "addKCellularPmuAverageCurrent:", *(_QWORD *)(*((_QWORD *)&v814 + 1) + 8 * v39++));
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v814, v928, 16);
    }
    while (v37);
  }

  v813 = 0u;
  v812 = 0u;
  v811 = 0u;
  v810 = 0u;
  v40 = v4[23];
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v810, v927, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v811;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v811 != v43)
          objc_enumerationMutation(v40);
        -[PowerlogMetricLog addKCellularFwCoreStats:](self, "addKCellularFwCoreStats:", *(_QWORD *)(*((_QWORD *)&v810 + 1) + 8 * v44++));
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v810, v927, 16);
    }
    while (v42);
  }

  v809 = 0u;
  v808 = 0u;
  v807 = 0u;
  v806 = 0u;
  v45 = v4[53];
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v806, v926, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v807;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v807 != v48)
          objc_enumerationMutation(v45);
        -[PowerlogMetricLog addKCellularLteWcdmaTdsHwStats:](self, "addKCellularLteWcdmaTdsHwStats:", *(_QWORD *)(*((_QWORD *)&v806 + 1) + 8 * v49++));
      }
      while (v47 != v49);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v806, v926, 16);
    }
    while (v47);
  }

  v805 = 0u;
  v804 = 0u;
  v803 = 0u;
  v802 = 0u;
  v50 = v4[56];
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v802, v925, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v803;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v803 != v53)
          objc_enumerationMutation(v50);
        -[PowerlogMetricLog addKCellularPmicHwStats:](self, "addKCellularPmicHwStats:", *(_QWORD *)(*((_QWORD *)&v802 + 1) + 8 * v54++));
      }
      while (v52 != v54);
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v802, v925, 16);
    }
    while (v52);
  }

  v801 = 0u;
  v800 = 0u;
  v799 = 0u;
  v798 = 0u;
  v55 = v4[68];
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v798, v924, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v799;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v799 != v58)
          objc_enumerationMutation(v55);
        -[PowerlogMetricLog addKCellularTdsRrcState:](self, "addKCellularTdsRrcState:", *(_QWORD *)(*((_QWORD *)&v798 + 1) + 8 * v59++));
      }
      while (v57 != v59);
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v798, v924, 16);
    }
    while (v57);
  }

  v797 = 0u;
  v796 = 0u;
  v795 = 0u;
  v794 = 0u;
  v60 = v4[42];
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v794, v923, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v795;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v795 != v63)
          objc_enumerationMutation(v60);
        -[PowerlogMetricLog addKCellularLteRrcState:](self, "addKCellularLteRrcState:", *(_QWORD *)(*((_QWORD *)&v794 + 1) + 8 * v64++));
      }
      while (v62 != v64);
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v794, v923, 16);
    }
    while (v62);
  }

  v793 = 0u;
  v792 = 0u;
  v791 = 0u;
  v790 = 0u;
  v65 = v4[38];
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v790, v922, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v791;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v791 != v68)
          objc_enumerationMutation(v65);
        -[PowerlogMetricLog addKCellularLtePagingCycle:](self, "addKCellularLtePagingCycle:", *(_QWORD *)(*((_QWORD *)&v790 + 1) + 8 * v69++));
      }
      while (v67 != v69);
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v790, v922, 16);
    }
    while (v67);
  }

  v789 = 0u;
  v788 = 0u;
  v787 = 0u;
  v786 = 0u;
  v70 = v4[31];
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v786, v921, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v787;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v787 != v73)
          objc_enumerationMutation(v70);
        -[PowerlogMetricLog addKCellularLteCdrxConfig:](self, "addKCellularLteCdrxConfig:", *(_QWORD *)(*((_QWORD *)&v786 + 1) + 8 * v74++));
      }
      while (v72 != v74);
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v786, v921, 16);
    }
    while (v72);
  }

  v785 = 0u;
  v784 = 0u;
  v783 = 0u;
  v782 = 0u;
  v75 = v4[41];
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v782, v920, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v783;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v783 != v78)
          objc_enumerationMutation(v75);
        -[PowerlogMetricLog addKCellularLteRadioLinkFailure:](self, "addKCellularLteRadioLinkFailure:", *(_QWORD *)(*((_QWORD *)&v782 + 1) + 8 * v79++));
      }
      while (v77 != v79);
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v782, v920, 16);
    }
    while (v77);
  }

  v781 = 0u;
  v780 = 0u;
  v779 = 0u;
  v778 = 0u;
  v80 = v4[40];
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v778, v919, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v779;
    do
    {
      v84 = 0;
      do
      {
        if (*(_QWORD *)v779 != v83)
          objc_enumerationMutation(v80);
        -[PowerlogMetricLog addKCellularLtePdcchStateStats:](self, "addKCellularLtePdcchStateStats:", *(_QWORD *)(*((_QWORD *)&v778 + 1) + 8 * v84++));
      }
      while (v82 != v84);
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v778, v919, 16);
    }
    while (v82);
  }

  v777 = 0u;
  v776 = 0u;
  v775 = 0u;
  v774 = 0u;
  v85 = v4[29];
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v774, v918, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v775;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v775 != v88)
          objc_enumerationMutation(v85);
        -[PowerlogMetricLog addKCellularLqmStateChange:](self, "addKCellularLqmStateChange:", *(_QWORD *)(*((_QWORD *)&v774 + 1) + 8 * v89++));
      }
      while (v87 != v89);
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v774, v918, 16);
    }
    while (v87);
  }

  v773 = 0u;
  v772 = 0u;
  v771 = 0u;
  v770 = 0u;
  v90 = v4[63];
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v770, v917, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v771;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v771 != v93)
          objc_enumerationMutation(v90);
        -[PowerlogMetricLog addKCellularServiceLost:](self, "addKCellularServiceLost:", *(_QWORD *)(*((_QWORD *)&v770 + 1) + 8 * v94++));
      }
      while (v92 != v94);
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v770, v917, 16);
    }
    while (v92);
  }

  v769 = 0u;
  v768 = 0u;
  v767 = 0u;
  v766 = 0u;
  v95 = v4[26];
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v766, v916, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v767;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v767 != v98)
          objc_enumerationMutation(v95);
        -[PowerlogMetricLog addKCellularGsmServingCellRssiHist:](self, "addKCellularGsmServingCellRssiHist:", *(_QWORD *)(*((_QWORD *)&v766 + 1) + 8 * v99++));
      }
      while (v97 != v99);
      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v766, v916, 16);
    }
    while (v97);
  }

  v765 = 0u;
  v764 = 0u;
  v763 = 0u;
  v762 = 0u;
  v100 = v4[27];
  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v762, v915, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v763;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v763 != v103)
          objc_enumerationMutation(v100);
        -[PowerlogMetricLog addKCellularGsmServingCellSnrHist:](self, "addKCellularGsmServingCellSnrHist:", *(_QWORD *)(*((_QWORD *)&v762 + 1) + 8 * v104++));
      }
      while (v102 != v104);
      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v762, v915, 16);
    }
    while (v102);
  }

  v761 = 0u;
  v760 = 0u;
  v759 = 0u;
  v758 = 0u;
  v105 = v4[28];
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v758, v914, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v759;
    do
    {
      v109 = 0;
      do
      {
        if (*(_QWORD *)v759 != v108)
          objc_enumerationMutation(v105);
        -[PowerlogMetricLog addKCellularGsmTxPowerHist:](self, "addKCellularGsmTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v758 + 1) + 8 * v109++));
      }
      while (v107 != v109);
      v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v758, v914, 16);
    }
    while (v107);
  }

  v757 = 0u;
  v756 = 0u;
  v755 = 0u;
  v754 = 0u;
  v110 = v4[24];
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v754, v913, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v755;
    do
    {
      v114 = 0;
      do
      {
        if (*(_QWORD *)v755 != v113)
          objc_enumerationMutation(v110);
        -[PowerlogMetricLog addKCellularGsmConnectedModeHist:](self, "addKCellularGsmConnectedModeHist:", *(_QWORD *)(*((_QWORD *)&v754 + 1) + 8 * v114++));
      }
      while (v112 != v114);
      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v754, v913, 16);
    }
    while (v112);
  }

  v753 = 0u;
  v752 = 0u;
  v751 = 0u;
  v750 = 0u;
  v115 = v4[25];
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v750, v912, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v751;
    do
    {
      v119 = 0;
      do
      {
        if (*(_QWORD *)v751 != v118)
          objc_enumerationMutation(v115);
        -[PowerlogMetricLog addKCellularGsmL1State:](self, "addKCellularGsmL1State:", *(_QWORD *)(*((_QWORD *)&v750 + 1) + 8 * v119++));
      }
      while (v117 != v119);
      v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v750, v912, 16);
    }
    while (v117);
  }

  v749 = 0u;
  v748 = 0u;
  v747 = 0u;
  v746 = 0u;
  v120 = v4[76];
  v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v746, v911, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v747;
    do
    {
      v124 = 0;
      do
      {
        if (*(_QWORD *)v747 != v123)
          objc_enumerationMutation(v120);
        -[PowerlogMetricLog addKCellularWcdmaCpcStat:](self, "addKCellularWcdmaCpcStat:", *(_QWORD *)(*((_QWORD *)&v746 + 1) + 8 * v124++));
      }
      while (v122 != v124);
      v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v746, v911, 16);
    }
    while (v122);
  }

  v745 = 0u;
  v744 = 0u;
  v743 = 0u;
  v742 = 0u;
  v125 = v4[87];
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v742, v910, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v743;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v743 != v128)
          objc_enumerationMutation(v125);
        -[PowerlogMetricLog addKCellularWcdmaRxDiversityHist:](self, "addKCellularWcdmaRxDiversityHist:", *(_QWORD *)(*((_QWORD *)&v742 + 1) + 8 * v129++));
      }
      while (v127 != v129);
      v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v742, v910, 16);
    }
    while (v127);
  }

  v741 = 0u;
  v740 = 0u;
  v739 = 0u;
  v738 = 0u;
  v130 = v4[89];
  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v738, v909, 16);
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v739;
    do
    {
      v134 = 0;
      do
      {
        if (*(_QWORD *)v739 != v133)
          objc_enumerationMutation(v130);
        -[PowerlogMetricLog addKCellularWcdmaServingCellRx0RssiHist:](self, "addKCellularWcdmaServingCellRx0RssiHist:", *(_QWORD *)(*((_QWORD *)&v738 + 1) + 8 * v134++));
      }
      while (v132 != v134);
      v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v738, v909, 16);
    }
    while (v132);
  }

  v737 = 0u;
  v736 = 0u;
  v735 = 0u;
  v734 = 0u;
  v135 = v4[91];
  v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v734, v908, 16);
  if (v136)
  {
    v137 = v136;
    v138 = *(_QWORD *)v735;
    do
    {
      v139 = 0;
      do
      {
        if (*(_QWORD *)v735 != v138)
          objc_enumerationMutation(v135);
        -[PowerlogMetricLog addKCellularWcdmaServingCellRx1RssiHist:](self, "addKCellularWcdmaServingCellRx1RssiHist:", *(_QWORD *)(*((_QWORD *)&v734 + 1) + 8 * v139++));
      }
      while (v137 != v139);
      v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v734, v908, 16);
    }
    while (v137);
  }

  v733 = 0u;
  v732 = 0u;
  v731 = 0u;
  v730 = 0u;
  v140 = v4[88];
  v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v730, v907, 16);
  if (v141)
  {
    v142 = v141;
    v143 = *(_QWORD *)v731;
    do
    {
      v144 = 0;
      do
      {
        if (*(_QWORD *)v731 != v143)
          objc_enumerationMutation(v140);
        -[PowerlogMetricLog addKCellularWcdmaServingCellRx0EcNoHist:](self, "addKCellularWcdmaServingCellRx0EcNoHist:", *(_QWORD *)(*((_QWORD *)&v730 + 1) + 8 * v144++));
      }
      while (v142 != v144);
      v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v730, v907, 16);
    }
    while (v142);
  }

  v729 = 0u;
  v728 = 0u;
  v727 = 0u;
  v726 = 0u;
  v145 = v4[90];
  v146 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v726, v906, 16);
  if (v146)
  {
    v147 = v146;
    v148 = *(_QWORD *)v727;
    do
    {
      v149 = 0;
      do
      {
        if (*(_QWORD *)v727 != v148)
          objc_enumerationMutation(v145);
        -[PowerlogMetricLog addKCellularWcdmaServingCellRx1EcNoHist:](self, "addKCellularWcdmaServingCellRx1EcNoHist:", *(_QWORD *)(*((_QWORD *)&v726 + 1) + 8 * v149++));
      }
      while (v147 != v149);
      v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v726, v906, 16);
    }
    while (v147);
  }

  v725 = 0u;
  v724 = 0u;
  v723 = 0u;
  v722 = 0u;
  v150 = v4[92];
  v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v722, v905, 16);
  if (v151)
  {
    v152 = v151;
    v153 = *(_QWORD *)v723;
    do
    {
      v154 = 0;
      do
      {
        if (*(_QWORD *)v723 != v153)
          objc_enumerationMutation(v150);
        -[PowerlogMetricLog addKCellularWcdmaTxPowerHist:](self, "addKCellularWcdmaTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v722 + 1) + 8 * v154++));
      }
      while (v152 != v154);
      v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v722, v905, 16);
    }
    while (v152);
  }

  v721 = 0u;
  v720 = 0u;
  v719 = 0u;
  v718 = 0u;
  v155 = v4[83];
  v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v718, v904, 16);
  if (v156)
  {
    v157 = v156;
    v158 = *(_QWORD *)v719;
    do
    {
      v159 = 0;
      do
      {
        if (*(_QWORD *)v719 != v158)
          objc_enumerationMutation(v155);
        -[PowerlogMetricLog addKCellularWcdmaReceiverStatusOnC0Hist:](self, "addKCellularWcdmaReceiverStatusOnC0Hist:", *(_QWORD *)(*((_QWORD *)&v718 + 1) + 8 * v159++));
      }
      while (v157 != v159);
      v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v718, v904, 16);
    }
    while (v157);
  }

  v717 = 0u;
  v716 = 0u;
  v715 = 0u;
  v714 = 0u;
  v160 = v4[84];
  v161 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v714, v903, 16);
  if (v161)
  {
    v162 = v161;
    v163 = *(_QWORD *)v715;
    do
    {
      v164 = 0;
      do
      {
        if (*(_QWORD *)v715 != v163)
          objc_enumerationMutation(v160);
        -[PowerlogMetricLog addKCellularWcdmaReceiverStatusOnC1Hist:](self, "addKCellularWcdmaReceiverStatusOnC1Hist:", *(_QWORD *)(*((_QWORD *)&v714 + 1) + 8 * v164++));
      }
      while (v162 != v164);
      v162 = objc_msgSend(v160, "countByEnumeratingWithState:objects:count:", &v714, v903, 16);
    }
    while (v162);
  }

  v713 = 0u;
  v712 = 0u;
  v711 = 0u;
  v710 = 0u;
  v165 = v4[75];
  v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v710, v902, 16);
  if (v166)
  {
    v167 = v166;
    v168 = *(_QWORD *)v711;
    do
    {
      v169 = 0;
      do
      {
        if (*(_QWORD *)v711 != v168)
          objc_enumerationMutation(v165);
        -[PowerlogMetricLog addKCellularWcdmaCarrierStatusHist:](self, "addKCellularWcdmaCarrierStatusHist:", *(_QWORD *)(*((_QWORD *)&v710 + 1) + 8 * v169++));
      }
      while (v167 != v169);
      v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v710, v902, 16);
    }
    while (v167);
  }

  v709 = 0u;
  v708 = 0u;
  v707 = 0u;
  v706 = 0u;
  v170 = v4[80];
  v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v706, v901, 16);
  if (v171)
  {
    v172 = v171;
    v173 = *(_QWORD *)v707;
    do
    {
      v174 = 0;
      do
      {
        if (*(_QWORD *)v707 != v173)
          objc_enumerationMutation(v170);
        -[PowerlogMetricLog addKCellularWcdmaRabModeHist:](self, "addKCellularWcdmaRabModeHist:", *(_QWORD *)(*((_QWORD *)&v706 + 1) + 8 * v174++));
      }
      while (v172 != v174);
      v172 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v706, v901, 16);
    }
    while (v172);
  }

  v705 = 0u;
  v704 = 0u;
  v703 = 0u;
  v702 = 0u;
  v175 = v4[82];
  v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v702, v900, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v703;
    do
    {
      v179 = 0;
      do
      {
        if (*(_QWORD *)v703 != v178)
          objc_enumerationMutation(v175);
        -[PowerlogMetricLog addKCellularWcdmaRabTypeHist:](self, "addKCellularWcdmaRabTypeHist:", *(_QWORD *)(*((_QWORD *)&v702 + 1) + 8 * v179++));
      }
      while (v177 != v179);
      v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v702, v900, 16);
    }
    while (v177);
  }

  v701 = 0u;
  v700 = 0u;
  v699 = 0u;
  v698 = 0u;
  v180 = v4[86];
  v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v698, v899, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v699;
    do
    {
      v184 = 0;
      do
      {
        if (*(_QWORD *)v699 != v183)
          objc_enumerationMutation(v180);
        -[PowerlogMetricLog addKCellularWcdmaRrcConnectionState:](self, "addKCellularWcdmaRrcConnectionState:", *(_QWORD *)(*((_QWORD *)&v698 + 1) + 8 * v184++));
      }
      while (v182 != v184);
      v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v698, v899, 16);
    }
    while (v182);
  }

  v697 = 0u;
  v696 = 0u;
  v695 = 0u;
  v694 = 0u;
  v185 = v4[85];
  v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v694, v898, 16);
  if (v186)
  {
    v187 = v186;
    v188 = *(_QWORD *)v695;
    do
    {
      v189 = 0;
      do
      {
        if (*(_QWORD *)v695 != v188)
          objc_enumerationMutation(v185);
        -[PowerlogMetricLog addKCellularWcdmaRrcConfiguration:](self, "addKCellularWcdmaRrcConfiguration:", *(_QWORD *)(*((_QWORD *)&v694 + 1) + 8 * v189++));
      }
      while (v187 != v189);
      v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v694, v898, 16);
    }
    while (v187);
  }

  v693 = 0u;
  v692 = 0u;
  v691 = 0u;
  v690 = 0u;
  v190 = v4[81];
  v191 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v690, v897, 16);
  if (v191)
  {
    v192 = v191;
    v193 = *(_QWORD *)v691;
    do
    {
      v194 = 0;
      do
      {
        if (*(_QWORD *)v691 != v193)
          objc_enumerationMutation(v190);
        -[PowerlogMetricLog addKCellularWcdmaRabStatus:](self, "addKCellularWcdmaRabStatus:", *(_QWORD *)(*((_QWORD *)&v690 + 1) + 8 * v194++));
      }
      while (v192 != v194);
      v192 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v690, v897, 16);
    }
    while (v192);
  }

  v689 = 0u;
  v688 = 0u;
  v687 = 0u;
  v686 = 0u;
  v195 = v4[79];
  v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v686, v896, 16);
  if (v196)
  {
    v197 = v196;
    v198 = *(_QWORD *)v687;
    do
    {
      v199 = 0;
      do
      {
        if (*(_QWORD *)v687 != v198)
          objc_enumerationMutation(v195);
        -[PowerlogMetricLog addKCellularWcdmaL1State:](self, "addKCellularWcdmaL1State:", *(_QWORD *)(*((_QWORD *)&v686 + 1) + 8 * v199++));
      }
      while (v197 != v199);
      v197 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v686, v896, 16);
    }
    while (v197);
  }

  v685 = 0u;
  v684 = 0u;
  v683 = 0u;
  v682 = 0u;
  v200 = v4[77];
  v201 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v682, v895, 16);
  if (v201)
  {
    v202 = v201;
    v203 = *(_QWORD *)v683;
    do
    {
      v204 = 0;
      do
      {
        if (*(_QWORD *)v683 != v203)
          objc_enumerationMutation(v200);
        -[PowerlogMetricLog addKCellularWcdmaDataInactivityBeforeIdle:](self, "addKCellularWcdmaDataInactivityBeforeIdle:", *(_QWORD *)(*((_QWORD *)&v682 + 1) + 8 * v204++));
      }
      while (v202 != v204);
      v202 = objc_msgSend(v200, "countByEnumeratingWithState:objects:count:", &v682, v895, 16);
    }
    while (v202);
  }

  v681 = 0u;
  v680 = 0u;
  v679 = 0u;
  v678 = 0u;
  v205 = v4[78];
  v206 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v678, v894, 16);
  if (v206)
  {
    v207 = v206;
    v208 = *(_QWORD *)v679;
    do
    {
      v209 = 0;
      do
      {
        if (*(_QWORD *)v679 != v208)
          objc_enumerationMutation(v205);
        -[PowerlogMetricLog addKCellularWcdmaIdleToConnectedUserData:](self, "addKCellularWcdmaIdleToConnectedUserData:", *(_QWORD *)(*((_QWORD *)&v678 + 1) + 8 * v209++));
      }
      while (v207 != v209);
      v207 = objc_msgSend(v205, "countByEnumeratingWithState:objects:count:", &v678, v894, 16);
    }
    while (v207);
  }

  v677 = 0u;
  v676 = 0u;
  v675 = 0u;
  v674 = 0u;
  v210 = v4[93];
  v211 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v674, v893, 16);
  if (v211)
  {
    v212 = v211;
    v213 = *(_QWORD *)v675;
    do
    {
      v214 = 0;
      do
      {
        if (*(_QWORD *)v675 != v213)
          objc_enumerationMutation(v210);
        -[PowerlogMetricLog addKCellularWcdmaVadHist:](self, "addKCellularWcdmaVadHist:", *(_QWORD *)(*((_QWORD *)&v674 + 1) + 8 * v214++));
      }
      while (v212 != v214);
      v212 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v674, v893, 16);
    }
    while (v212);
  }

  v673 = 0u;
  v672 = 0u;
  v671 = 0u;
  v670 = 0u;
  v215 = v4[69];
  v216 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v670, v892, 16);
  if (v216)
  {
    v217 = v216;
    v218 = *(_QWORD *)v671;
    do
    {
      v219 = 0;
      do
      {
        if (*(_QWORD *)v671 != v218)
          objc_enumerationMutation(v215);
        -[PowerlogMetricLog addKCellularTdsRxDiversityHist:](self, "addKCellularTdsRxDiversityHist:", *(_QWORD *)(*((_QWORD *)&v670 + 1) + 8 * v219++));
      }
      while (v217 != v219);
      v217 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v670, v892, 16);
    }
    while (v217);
  }

  v669 = 0u;
  v668 = 0u;
  v667 = 0u;
  v666 = 0u;
  v220 = v4[71];
  v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v666, v891, 16);
  if (v221)
  {
    v222 = v221;
    v223 = *(_QWORD *)v667;
    do
    {
      v224 = 0;
      do
      {
        if (*(_QWORD *)v667 != v223)
          objc_enumerationMutation(v220);
        -[PowerlogMetricLog addKCellularTdsServingCellRx0RssiHist:](self, "addKCellularTdsServingCellRx0RssiHist:", *(_QWORD *)(*((_QWORD *)&v666 + 1) + 8 * v224++));
      }
      while (v222 != v224);
      v222 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v666, v891, 16);
    }
    while (v222);
  }

  v665 = 0u;
  v664 = 0u;
  v663 = 0u;
  v662 = 0u;
  v225 = v4[73];
  v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v662, v890, 16);
  if (v226)
  {
    v227 = v226;
    v228 = *(_QWORD *)v663;
    do
    {
      v229 = 0;
      do
      {
        if (*(_QWORD *)v663 != v228)
          objc_enumerationMutation(v225);
        -[PowerlogMetricLog addKCellularTdsServingCellRx1RssiHist:](self, "addKCellularTdsServingCellRx1RssiHist:", *(_QWORD *)(*((_QWORD *)&v662 + 1) + 8 * v229++));
      }
      while (v227 != v229);
      v227 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v662, v890, 16);
    }
    while (v227);
  }

  v661 = 0u;
  v660 = 0u;
  v659 = 0u;
  v658 = 0u;
  v230 = v4[70];
  v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v658, v889, 16);
  if (v231)
  {
    v232 = v231;
    v233 = *(_QWORD *)v659;
    do
    {
      v234 = 0;
      do
      {
        if (*(_QWORD *)v659 != v233)
          objc_enumerationMutation(v230);
        -[PowerlogMetricLog addKCellularTdsServingCellRx0RscpHist:](self, "addKCellularTdsServingCellRx0RscpHist:", *(_QWORD *)(*((_QWORD *)&v658 + 1) + 8 * v234++));
      }
      while (v232 != v234);
      v232 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v658, v889, 16);
    }
    while (v232);
  }

  v657 = 0u;
  v656 = 0u;
  v655 = 0u;
  v654 = 0u;
  v235 = v4[72];
  v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v654, v888, 16);
  if (v236)
  {
    v237 = v236;
    v238 = *(_QWORD *)v655;
    do
    {
      v239 = 0;
      do
      {
        if (*(_QWORD *)v655 != v238)
          objc_enumerationMutation(v235);
        -[PowerlogMetricLog addKCellularTdsServingCellRx1RscpHist:](self, "addKCellularTdsServingCellRx1RscpHist:", *(_QWORD *)(*((_QWORD *)&v654 + 1) + 8 * v239++));
      }
      while (v237 != v239);
      v237 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v654, v888, 16);
    }
    while (v237);
  }

  v653 = 0u;
  v652 = 0u;
  v651 = 0u;
  v650 = 0u;
  v240 = v4[74];
  v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v650, v887, 16);
  if (v241)
  {
    v242 = v241;
    v243 = *(_QWORD *)v651;
    do
    {
      v244 = 0;
      do
      {
        if (*(_QWORD *)v651 != v243)
          objc_enumerationMutation(v240);
        -[PowerlogMetricLog addKCellularTdsTxPowerHist:](self, "addKCellularTdsTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v650 + 1) + 8 * v244++));
      }
      while (v242 != v244);
      v242 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v650, v887, 16);
    }
    while (v242);
  }

  v649 = 0u;
  v648 = 0u;
  v647 = 0u;
  v646 = 0u;
  v245 = v4[66];
  v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v646, v886, 16);
  if (v246)
  {
    v247 = v246;
    v248 = *(_QWORD *)v647;
    do
    {
      v249 = 0;
      do
      {
        if (*(_QWORD *)v647 != v248)
          objc_enumerationMutation(v245);
        -[PowerlogMetricLog addKCellularTdsRabModeHist:](self, "addKCellularTdsRabModeHist:", *(_QWORD *)(*((_QWORD *)&v646 + 1) + 8 * v249++));
      }
      while (v247 != v249);
      v247 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v646, v886, 16);
    }
    while (v247);
  }

  v645 = 0u;
  v644 = 0u;
  v643 = 0u;
  v642 = 0u;
  v250 = v4[67];
  v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v642, v885, 16);
  if (v251)
  {
    v252 = v251;
    v253 = *(_QWORD *)v643;
    do
    {
      v254 = 0;
      do
      {
        if (*(_QWORD *)v643 != v253)
          objc_enumerationMutation(v250);
        -[PowerlogMetricLog addKCellularTdsRabTypeHist:](self, "addKCellularTdsRabTypeHist:", *(_QWORD *)(*((_QWORD *)&v642 + 1) + 8 * v254++));
      }
      while (v252 != v254);
      v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v642, v885, 16);
    }
    while (v252);
  }

  v641 = 0u;
  v640 = 0u;
  v639 = 0u;
  v638 = 0u;
  v255 = v4[65];
  v256 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v638, v884, 16);
  if (v256)
  {
    v257 = v256;
    v258 = *(_QWORD *)v639;
    do
    {
      v259 = 0;
      do
      {
        if (*(_QWORD *)v639 != v258)
          objc_enumerationMutation(v255);
        -[PowerlogMetricLog addKCellularTdsL1State:](self, "addKCellularTdsL1State:", *(_QWORD *)(*((_QWORD *)&v638 + 1) + 8 * v259++));
      }
      while (v257 != v259);
      v257 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v638, v884, 16);
    }
    while (v257);
  }

  v637 = 0u;
  v636 = 0u;
  v635 = 0u;
  v634 = 0u;
  v260 = v4[36];
  v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v634, v883, 16);
  if (v261)
  {
    v262 = v261;
    v263 = *(_QWORD *)v635;
    do
    {
      v264 = 0;
      do
      {
        if (*(_QWORD *)v635 != v263)
          objc_enumerationMutation(v260);
        -[PowerlogMetricLog addKCellularLteFwDuplexMode:](self, "addKCellularLteFwDuplexMode:", *(_QWORD *)(*((_QWORD *)&v634 + 1) + 8 * v264++));
      }
      while (v262 != v264);
      v262 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v634, v883, 16);
    }
    while (v262);
  }

  v633 = 0u;
  v632 = 0u;
  v631 = 0u;
  v630 = 0u;
  v265 = v4[45];
  v266 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v630, v882, 16);
  if (v266)
  {
    v267 = v266;
    v268 = *(_QWORD *)v631;
    do
    {
      v269 = 0;
      do
      {
        if (*(_QWORD *)v631 != v268)
          objc_enumerationMutation(v265);
        -[PowerlogMetricLog addKCellularLteServingCellRsrpHist:](self, "addKCellularLteServingCellRsrpHist:", *(_QWORD *)(*((_QWORD *)&v630 + 1) + 8 * v269++));
      }
      while (v267 != v269);
      v267 = objc_msgSend(v265, "countByEnumeratingWithState:objects:count:", &v630, v882, 16);
    }
    while (v267);
  }

  v629 = 0u;
  v628 = 0u;
  v627 = 0u;
  v626 = 0u;
  v270 = v4[46];
  v271 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v626, v881, 16);
  if (v271)
  {
    v272 = v271;
    v273 = *(_QWORD *)v627;
    do
    {
      v274 = 0;
      do
      {
        if (*(_QWORD *)v627 != v273)
          objc_enumerationMutation(v270);
        -[PowerlogMetricLog addKCellularLteServingCellSinrHist:](self, "addKCellularLteServingCellSinrHist:", *(_QWORD *)(*((_QWORD *)&v626 + 1) + 8 * v274++));
      }
      while (v272 != v274);
      v272 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v626, v881, 16);
    }
    while (v272);
  }

  v625 = 0u;
  v624 = 0u;
  v623 = 0u;
  v622 = 0u;
  v275 = v4[47];
  v276 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v622, v880, 16);
  if (v276)
  {
    v277 = v276;
    v278 = *(_QWORD *)v623;
    do
    {
      v279 = 0;
      do
      {
        if (*(_QWORD *)v623 != v278)
          objc_enumerationMutation(v275);
        -[PowerlogMetricLog addKCellularLteSleepStateHist:](self, "addKCellularLteSleepStateHist:", *(_QWORD *)(*((_QWORD *)&v622 + 1) + 8 * v279++));
      }
      while (v277 != v279);
      v277 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v622, v880, 16);
    }
    while (v277);
  }

  v621 = 0u;
  v620 = 0u;
  v619 = 0u;
  v618 = 0u;
  v280 = v4[50];
  v281 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v618, v879, 16);
  if (v281)
  {
    v282 = v281;
    v283 = *(_QWORD *)v619;
    do
    {
      v284 = 0;
      do
      {
        if (*(_QWORD *)v619 != v283)
          objc_enumerationMutation(v280);
        -[PowerlogMetricLog addKCellularLteTxPowerHist:](self, "addKCellularLteTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v618 + 1) + 8 * v284++));
      }
      while (v282 != v284);
      v282 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v618, v879, 16);
    }
    while (v282);
  }

  v617 = 0u;
  v616 = 0u;
  v615 = 0u;
  v614 = 0u;
  v285 = v4[35];
  v286 = objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v614, v878, 16);
  if (v286)
  {
    v287 = v286;
    v288 = *(_QWORD *)v615;
    do
    {
      v289 = 0;
      do
      {
        if (*(_QWORD *)v615 != v288)
          objc_enumerationMutation(v285);
        -[PowerlogMetricLog addKCellularLteDlSccStateHist:](self, "addKCellularLteDlSccStateHist:", *(_QWORD *)(*((_QWORD *)&v614 + 1) + 8 * v289++));
      }
      while (v287 != v289);
      v287 = objc_msgSend(v285, "countByEnumeratingWithState:objects:count:", &v614, v878, 16);
    }
    while (v287);
  }

  v613 = 0u;
  v612 = 0u;
  v611 = 0u;
  v610 = 0u;
  v290 = v4[51];
  v291 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v610, v877, 16);
  if (v291)
  {
    v292 = v291;
    v293 = *(_QWORD *)v611;
    do
    {
      v294 = 0;
      do
      {
        if (*(_QWORD *)v611 != v293)
          objc_enumerationMutation(v290);
        -[PowerlogMetricLog addKCellularLteUlSccStateHist:](self, "addKCellularLteUlSccStateHist:", *(_QWORD *)(*((_QWORD *)&v610 + 1) + 8 * v294++));
      }
      while (v292 != v294);
      v292 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v610, v877, 16);
    }
    while (v292);
  }

  v609 = 0u;
  v608 = 0u;
  v607 = 0u;
  v606 = 0u;
  v295 = v4[30];
  v296 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v606, v876, 16);
  if (v296)
  {
    v297 = v296;
    v298 = *(_QWORD *)v607;
    do
    {
      v299 = 0;
      do
      {
        if (*(_QWORD *)v607 != v298)
          objc_enumerationMutation(v295);
        -[PowerlogMetricLog addKCellularLteAdvancedRxStateHist:](self, "addKCellularLteAdvancedRxStateHist:", *(_QWORD *)(*((_QWORD *)&v606 + 1) + 8 * v299++));
      }
      while (v297 != v299);
      v297 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v606, v876, 16);
    }
    while (v297);
  }

  v605 = 0u;
  v604 = 0u;
  v603 = 0u;
  v602 = 0u;
  v300 = v4[32];
  v301 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v602, v875, 16);
  if (v301)
  {
    v302 = v301;
    v303 = *(_QWORD *)v603;
    do
    {
      v304 = 0;
      do
      {
        if (*(_QWORD *)v603 != v303)
          objc_enumerationMutation(v300);
        -[PowerlogMetricLog addKCellularLteComponentCarrierInfo:](self, "addKCellularLteComponentCarrierInfo:", *(_QWORD *)(*((_QWORD *)&v602 + 1) + 8 * v304++));
      }
      while (v302 != v304);
      v302 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v602, v875, 16);
    }
    while (v302);
  }

  v601 = 0u;
  v600 = 0u;
  v599 = 0u;
  v598 = 0u;
  v305 = v4[44];
  v306 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v598, v874, 16);
  if (v306)
  {
    v307 = v306;
    v308 = *(_QWORD *)v599;
    do
    {
      v309 = 0;
      do
      {
        if (*(_QWORD *)v599 != v308)
          objc_enumerationMutation(v305);
        -[PowerlogMetricLog addKCellularLteRxTxStateHist:](self, "addKCellularLteRxTxStateHist:", *(_QWORD *)(*((_QWORD *)&v598 + 1) + 8 * v309++));
      }
      while (v307 != v309);
      v307 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v598, v874, 16);
    }
    while (v307);
  }

  v597 = 0u;
  v596 = 0u;
  v595 = 0u;
  v594 = 0u;
  v310 = v4[49];
  v311 = objc_msgSend(v310, "countByEnumeratingWithState:objects:count:", &v594, v873, 16);
  if (v311)
  {
    v312 = v311;
    v313 = *(_QWORD *)v595;
    do
    {
      v314 = 0;
      do
      {
        if (*(_QWORD *)v595 != v313)
          objc_enumerationMutation(v310);
        -[PowerlogMetricLog addKCellularLteTotalDlTbsHist:](self, "addKCellularLteTotalDlTbsHist:", *(_QWORD *)(*((_QWORD *)&v594 + 1) + 8 * v314++));
      }
      while (v312 != v314);
      v312 = objc_msgSend(v310, "countByEnumeratingWithState:objects:count:", &v594, v873, 16);
    }
    while (v312);
  }

  v593 = 0u;
  v592 = 0u;
  v591 = 0u;
  v590 = 0u;
  v315 = v4[33];
  v316 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v590, v872, 16);
  if (v316)
  {
    v317 = v316;
    v318 = *(_QWORD *)v591;
    do
    {
      v319 = 0;
      do
      {
        if (*(_QWORD *)v591 != v318)
          objc_enumerationMutation(v315);
        -[PowerlogMetricLog addKCellularLteDataInactivityBeforeIdle:](self, "addKCellularLteDataInactivityBeforeIdle:", *(_QWORD *)(*((_QWORD *)&v590 + 1) + 8 * v319++));
      }
      while (v317 != v319);
      v317 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v590, v872, 16);
    }
    while (v317);
  }

  v589 = 0u;
  v588 = 0u;
  v587 = 0u;
  v586 = 0u;
  v320 = v4[37];
  v321 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v586, v871, 16);
  if (v321)
  {
    v322 = v321;
    v323 = *(_QWORD *)v587;
    do
    {
      v324 = 0;
      do
      {
        if (*(_QWORD *)v587 != v323)
          objc_enumerationMutation(v320);
        -[PowerlogMetricLog addKCellularLteIdleToConnectedUserData:](self, "addKCellularLteIdleToConnectedUserData:", *(_QWORD *)(*((_QWORD *)&v586 + 1) + 8 * v324++));
      }
      while (v322 != v324);
      v322 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v586, v871, 16);
    }
    while (v322);
  }

  v585 = 0u;
  v584 = 0u;
  v583 = 0u;
  v582 = 0u;
  v325 = v4[34];
  v326 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v582, v870, 16);
  if (v326)
  {
    v327 = v326;
    v328 = *(_QWORD *)v583;
    do
    {
      v329 = 0;
      do
      {
        if (*(_QWORD *)v583 != v328)
          objc_enumerationMutation(v325);
        -[PowerlogMetricLog addKCellularLteDlSccStateHistV3:](self, "addKCellularLteDlSccStateHistV3:", *(_QWORD *)(*((_QWORD *)&v582 + 1) + 8 * v329++));
      }
      while (v327 != v329);
      v327 = objc_msgSend(v325, "countByEnumeratingWithState:objects:count:", &v582, v870, 16);
    }
    while (v327);
  }

  v581 = 0u;
  v580 = 0u;
  v579 = 0u;
  v578 = 0u;
  v330 = v4[43];
  v331 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v578, v869, 16);
  if (v331)
  {
    v332 = v331;
    v333 = *(_QWORD *)v579;
    do
    {
      v334 = 0;
      do
      {
        if (*(_QWORD *)v579 != v333)
          objc_enumerationMutation(v330);
        -[PowerlogMetricLog addKCellularLteRxDiversityHist:](self, "addKCellularLteRxDiversityHist:", *(_QWORD *)(*((_QWORD *)&v578 + 1) + 8 * v334++));
      }
      while (v332 != v334);
      v332 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v578, v869, 16);
    }
    while (v332);
  }

  v577 = 0u;
  v576 = 0u;
  v575 = 0u;
  v574 = 0u;
  v335 = v4[39];
  v336 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v574, v868, 16);
  if (v336)
  {
    v337 = v336;
    v338 = *(_QWORD *)v575;
    do
    {
      v339 = 0;
      do
      {
        if (*(_QWORD *)v575 != v338)
          objc_enumerationMutation(v335);
        -[PowerlogMetricLog addKCellularLtePdcchStateHist:](self, "addKCellularLtePdcchStateHist:", *(_QWORD *)(*((_QWORD *)&v574 + 1) + 8 * v339++));
      }
      while (v337 != v339);
      v337 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v574, v868, 16);
    }
    while (v337);
  }

  v573 = 0u;
  v572 = 0u;
  v571 = 0u;
  v570 = 0u;
  v340 = v4[61];
  v341 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v570, v867, 16);
  if (v341)
  {
    v342 = v341;
    v343 = *(_QWORD *)v571;
    do
    {
      v344 = 0;
      do
      {
        if (*(_QWORD *)v571 != v343)
          objc_enumerationMutation(v340);
        -[PowerlogMetricLog addKCellularProtocolStackStateHist:](self, "addKCellularProtocolStackStateHist:", *(_QWORD *)(*((_QWORD *)&v570 + 1) + 8 * v344++));
      }
      while (v342 != v344);
      v342 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v570, v867, 16);
    }
    while (v342);
  }

  v569 = 0u;
  v568 = 0u;
  v567 = 0u;
  v566 = 0u;
  v345 = v4[18];
  v346 = objc_msgSend(v345, "countByEnumeratingWithState:objects:count:", &v566, v866, 16);
  if (v346)
  {
    v347 = v346;
    v348 = *(_QWORD *)v567;
    do
    {
      v349 = 0;
      do
      {
        if (*(_QWORD *)v567 != v348)
          objc_enumerationMutation(v345);
        -[PowerlogMetricLog addKCellularCellPlmnSearchCount:](self, "addKCellularCellPlmnSearchCount:", *(_QWORD *)(*((_QWORD *)&v566 + 1) + 8 * v349++));
      }
      while (v347 != v349);
      v347 = objc_msgSend(v345, "countByEnumeratingWithState:objects:count:", &v566, v866, 16);
    }
    while (v347);
  }

  v565 = 0u;
  v564 = 0u;
  v563 = 0u;
  v562 = 0u;
  v350 = v4[19];
  v351 = objc_msgSend(v350, "countByEnumeratingWithState:objects:count:", &v562, v865, 16);
  if (v351)
  {
    v352 = v351;
    v353 = *(_QWORD *)v563;
    do
    {
      v354 = 0;
      do
      {
        if (*(_QWORD *)v563 != v353)
          objc_enumerationMutation(v350);
        -[PowerlogMetricLog addKCellularCellPlmnSearchHist:](self, "addKCellularCellPlmnSearchHist:", *(_QWORD *)(*((_QWORD *)&v562 + 1) + 8 * v354++));
      }
      while (v352 != v354);
      v352 = objc_msgSend(v350, "countByEnumeratingWithState:objects:count:", &v562, v865, 16);
    }
    while (v352);
  }

  v561 = 0u;
  v560 = 0u;
  v559 = 0u;
  v558 = 0u;
  v355 = v4[59];
  v356 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v558, v864, 16);
  if (v356)
  {
    v357 = v356;
    v358 = *(_QWORD *)v559;
    do
    {
      v359 = 0;
      do
      {
        if (*(_QWORD *)v559 != v358)
          objc_enumerationMutation(v355);
        -[PowerlogMetricLog addKCellularProtocolStackPowerState:](self, "addKCellularProtocolStackPowerState:", *(_QWORD *)(*((_QWORD *)&v558 + 1) + 8 * v359++));
      }
      while (v357 != v359);
      v357 = objc_msgSend(v355, "countByEnumeratingWithState:objects:count:", &v558, v864, 16);
    }
    while (v357);
  }

  v557 = 0u;
  v556 = 0u;
  v555 = 0u;
  v554 = 0u;
  v360 = v4[21];
  v361 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v554, v863, 16);
  if (v361)
  {
    v362 = v361;
    v363 = *(_QWORD *)v555;
    do
    {
      v364 = 0;
      do
      {
        if (*(_QWORD *)v555 != v363)
          objc_enumerationMutation(v360);
        -[PowerlogMetricLog addKCellularDownlinkIpPacketFilterStatus:](self, "addKCellularDownlinkIpPacketFilterStatus:", *(_QWORD *)(*((_QWORD *)&v554 + 1) + 8 * v364++));
      }
      while (v362 != v364);
      v362 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v554, v863, 16);
    }
    while (v362);
  }

  v553 = 0u;
  v552 = 0u;
  v551 = 0u;
  v550 = 0u;
  v365 = v4[20];
  v366 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v550, v862, 16);
  if (v366)
  {
    v367 = v366;
    v368 = *(_QWORD *)v551;
    do
    {
      v369 = 0;
      do
      {
        if (*(_QWORD *)v551 != v368)
          objc_enumerationMutation(v365);
        -[PowerlogMetricLog addKCellularDownlinkIpPacketDiscarded:](self, "addKCellularDownlinkIpPacketDiscarded:", *(_QWORD *)(*((_QWORD *)&v550 + 1) + 8 * v369++));
      }
      while (v367 != v369);
      v367 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v550, v862, 16);
    }
    while (v367);
  }

  v549 = 0u;
  v548 = 0u;
  v547 = 0u;
  v546 = 0u;
  v370 = v4[64];
  v371 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v546, v861, 16);
  if (v371)
  {
    v372 = v371;
    v373 = *(_QWORD *)v547;
    do
    {
      v374 = 0;
      do
      {
        if (*(_QWORD *)v547 != v373)
          objc_enumerationMutation(v370);
        -[PowerlogMetricLog addKCellularServingCellRfBandHist:](self, "addKCellularServingCellRfBandHist:", *(_QWORD *)(*((_QWORD *)&v546 + 1) + 8 * v374++));
      }
      while (v372 != v374);
      v372 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v546, v861, 16);
    }
    while (v372);
  }

  v545 = 0u;
  v544 = 0u;
  v543 = 0u;
  v542 = 0u;
  v375 = v4[60];
  v376 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v542, v860, 16);
  if (v376)
  {
    v377 = v376;
    v378 = *(_QWORD *)v543;
    do
    {
      v379 = 0;
      do
      {
        if (*(_QWORD *)v543 != v378)
          objc_enumerationMutation(v375);
        -[PowerlogMetricLog addKCellularProtocolStackStateHist2:](self, "addKCellularProtocolStackStateHist2:", *(_QWORD *)(*((_QWORD *)&v542 + 1) + 8 * v379++));
      }
      while (v377 != v379);
      v377 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v542, v860, 16);
    }
    while (v377);
  }

  v541 = 0u;
  v540 = 0u;
  v539 = 0u;
  v538 = 0u;
  v380 = v4[62];
  v381 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v538, v859, 16);
  if (v381)
  {
    v382 = v381;
    v383 = *(_QWORD *)v539;
    do
    {
      v384 = 0;
      do
      {
        if (*(_QWORD *)v539 != v383)
          objc_enumerationMutation(v380);
        -[PowerlogMetricLog addKCellularProtocolStackState:](self, "addKCellularProtocolStackState:", *(_QWORD *)(*((_QWORD *)&v538 + 1) + 8 * v384++));
      }
      while (v382 != v384);
      v382 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v538, v859, 16);
    }
    while (v382);
  }

  v537 = 0u;
  v536 = 0u;
  v535 = 0u;
  v534 = 0u;
  v385 = v4[4];
  v386 = objc_msgSend(v385, "countByEnumeratingWithState:objects:count:", &v534, v858, 16);
  if (v386)
  {
    v387 = v386;
    v388 = *(_QWORD *)v535;
    do
    {
      v389 = 0;
      do
      {
        if (*(_QWORD *)v535 != v388)
          objc_enumerationMutation(v385);
        -[PowerlogMetricLog addKCellularCdma1XRxDiversityHist:](self, "addKCellularCdma1XRxDiversityHist:", *(_QWORD *)(*((_QWORD *)&v534 + 1) + 8 * v389++));
      }
      while (v387 != v389);
      v387 = objc_msgSend(v385, "countByEnumeratingWithState:objects:count:", &v534, v858, 16);
    }
    while (v387);
  }

  v532 = 0u;
  v533 = 0u;
  v530 = 0u;
  v531 = 0u;
  v390 = v4[6];
  v391 = objc_msgSend(v390, "countByEnumeratingWithState:objects:count:", &v530, v857, 16);
  if (v391)
  {
    v392 = v391;
    v393 = *(_QWORD *)v531;
    do
    {
      v394 = 0;
      do
      {
        if (*(_QWORD *)v531 != v393)
          objc_enumerationMutation(v390);
        -[PowerlogMetricLog addKCellularCdma1XServingCellRx0RssiHist:](self, "addKCellularCdma1XServingCellRx0RssiHist:", *(_QWORD *)(*((_QWORD *)&v530 + 1) + 8 * v394++));
      }
      while (v392 != v394);
      v392 = objc_msgSend(v390, "countByEnumeratingWithState:objects:count:", &v530, v857, 16);
    }
    while (v392);
  }

  v528 = 0u;
  v529 = 0u;
  v526 = 0u;
  v527 = 0u;
  v395 = v4[8];
  v396 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v526, v856, 16);
  if (v396)
  {
    v397 = v396;
    v398 = *(_QWORD *)v527;
    do
    {
      v399 = 0;
      do
      {
        if (*(_QWORD *)v527 != v398)
          objc_enumerationMutation(v395);
        -[PowerlogMetricLog addKCellularCdma1XServingCellRx1RssiHist:](self, "addKCellularCdma1XServingCellRx1RssiHist:", *(_QWORD *)(*((_QWORD *)&v526 + 1) + 8 * v399++));
      }
      while (v397 != v399);
      v397 = objc_msgSend(v395, "countByEnumeratingWithState:objects:count:", &v526, v856, 16);
    }
    while (v397);
  }

  v524 = 0u;
  v525 = 0u;
  v522 = 0u;
  v523 = 0u;
  v400 = v4[5];
  v401 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v522, v855, 16);
  if (v401)
  {
    v402 = v401;
    v403 = *(_QWORD *)v523;
    do
    {
      v404 = 0;
      do
      {
        if (*(_QWORD *)v523 != v403)
          objc_enumerationMutation(v400);
        -[PowerlogMetricLog addKCellularCdma1XServingCellRx0EcIoHist:](self, "addKCellularCdma1XServingCellRx0EcIoHist:", *(_QWORD *)(*((_QWORD *)&v522 + 1) + 8 * v404++));
      }
      while (v402 != v404);
      v402 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v522, v855, 16);
    }
    while (v402);
  }

  v520 = 0u;
  v521 = 0u;
  v518 = 0u;
  v519 = 0u;
  v405 = v4[7];
  v406 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v518, v854, 16);
  if (v406)
  {
    v407 = v406;
    v408 = *(_QWORD *)v519;
    do
    {
      v409 = 0;
      do
      {
        if (*(_QWORD *)v519 != v408)
          objc_enumerationMutation(v405);
        -[PowerlogMetricLog addKCellularCdma1XServingCellRx1EcIoHist:](self, "addKCellularCdma1XServingCellRx1EcIoHist:", *(_QWORD *)(*((_QWORD *)&v518 + 1) + 8 * v409++));
      }
      while (v407 != v409);
      v407 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v518, v854, 16);
    }
    while (v407);
  }

  v516 = 0u;
  v517 = 0u;
  v514 = 0u;
  v515 = 0u;
  v410 = v4[9];
  v411 = objc_msgSend(v410, "countByEnumeratingWithState:objects:count:", &v514, v853, 16);
  if (v411)
  {
    v412 = v411;
    v413 = *(_QWORD *)v515;
    do
    {
      v414 = 0;
      do
      {
        if (*(_QWORD *)v515 != v413)
          objc_enumerationMutation(v410);
        -[PowerlogMetricLog addKCellularCdma1XTxPowerHist:](self, "addKCellularCdma1XTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v514 + 1) + 8 * v414++));
      }
      while (v412 != v414);
      v412 = objc_msgSend(v410, "countByEnumeratingWithState:objects:count:", &v514, v853, 16);
    }
    while (v412);
  }

  v512 = 0u;
  v513 = 0u;
  v510 = 0u;
  v511 = 0u;
  v415 = v4[2];
  v416 = objc_msgSend(v415, "countByEnumeratingWithState:objects:count:", &v510, v852, 16);
  if (v416)
  {
    v417 = v416;
    v418 = *(_QWORD *)v511;
    do
    {
      v419 = 0;
      do
      {
        if (*(_QWORD *)v511 != v418)
          objc_enumerationMutation(v415);
        -[PowerlogMetricLog addKCellularCdma1XProtocolStackStateHist:](self, "addKCellularCdma1XProtocolStackStateHist:", *(_QWORD *)(*((_QWORD *)&v510 + 1) + 8 * v419++));
      }
      while (v417 != v419);
      v417 = objc_msgSend(v415, "countByEnumeratingWithState:objects:count:", &v510, v852, 16);
    }
    while (v417);
  }

  v508 = 0u;
  v509 = 0u;
  v506 = 0u;
  v507 = 0u;
  v420 = v4[1];
  v421 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v506, v851, 16);
  if (v421)
  {
    v422 = v421;
    v423 = *(_QWORD *)v507;
    do
    {
      v424 = 0;
      do
      {
        if (*(_QWORD *)v507 != v423)
          objc_enumerationMutation(v420);
        -[PowerlogMetricLog addKCellularCdma1XConnectionHist:](self, "addKCellularCdma1XConnectionHist:", *(_QWORD *)(*((_QWORD *)&v506 + 1) + 8 * v424++));
      }
      while (v422 != v424);
      v422 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v506, v851, 16);
    }
    while (v422);
  }

  v504 = 0u;
  v505 = 0u;
  v502 = 0u;
  v503 = 0u;
  v425 = v4[3];
  v426 = objc_msgSend(v425, "countByEnumeratingWithState:objects:count:", &v502, v850, 16);
  if (v426)
  {
    v427 = v426;
    v428 = *(_QWORD *)v503;
    do
    {
      v429 = 0;
      do
      {
        if (*(_QWORD *)v503 != v428)
          objc_enumerationMutation(v425);
        -[PowerlogMetricLog addKCellularCdma1XRrState:](self, "addKCellularCdma1XRrState:", *(_QWORD *)(*((_QWORD *)&v502 + 1) + 8 * v429++));
      }
      while (v427 != v429);
      v427 = objc_msgSend(v425, "countByEnumeratingWithState:objects:count:", &v502, v850, 16);
    }
    while (v427);
  }

  v500 = 0u;
  v501 = 0u;
  v498 = 0u;
  v499 = 0u;
  v430 = v4[12];
  v431 = objc_msgSend(v430, "countByEnumeratingWithState:objects:count:", &v498, v849, 16);
  if (v431)
  {
    v432 = v431;
    v433 = *(_QWORD *)v499;
    do
    {
      v434 = 0;
      do
      {
        if (*(_QWORD *)v499 != v433)
          objc_enumerationMutation(v430);
        -[PowerlogMetricLog addKCellularCdmaEvdoRxDiversityHist:](self, "addKCellularCdmaEvdoRxDiversityHist:", *(_QWORD *)(*((_QWORD *)&v498 + 1) + 8 * v434++));
      }
      while (v432 != v434);
      v432 = objc_msgSend(v430, "countByEnumeratingWithState:objects:count:", &v498, v849, 16);
    }
    while (v432);
  }

  v496 = 0u;
  v497 = 0u;
  v494 = 0u;
  v495 = 0u;
  v435 = v4[14];
  v436 = objc_msgSend(v435, "countByEnumeratingWithState:objects:count:", &v494, v848, 16);
  if (v436)
  {
    v437 = v436;
    v438 = *(_QWORD *)v495;
    do
    {
      v439 = 0;
      do
      {
        if (*(_QWORD *)v495 != v438)
          objc_enumerationMutation(v435);
        -[PowerlogMetricLog addKCellularCdmaEvdoServingCellRx0RssiHist:](self, "addKCellularCdmaEvdoServingCellRx0RssiHist:", *(_QWORD *)(*((_QWORD *)&v494 + 1) + 8 * v439++));
      }
      while (v437 != v439);
      v437 = objc_msgSend(v435, "countByEnumeratingWithState:objects:count:", &v494, v848, 16);
    }
    while (v437);
  }

  v492 = 0u;
  v493 = 0u;
  v490 = 0u;
  v491 = 0u;
  v440 = v4[16];
  v441 = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v490, v847, 16);
  if (v441)
  {
    v442 = v441;
    v443 = *(_QWORD *)v491;
    do
    {
      v444 = 0;
      do
      {
        if (*(_QWORD *)v491 != v443)
          objc_enumerationMutation(v440);
        -[PowerlogMetricLog addKCellularCdmaEvdoServingCellRx1RssiHist:](self, "addKCellularCdmaEvdoServingCellRx1RssiHist:", *(_QWORD *)(*((_QWORD *)&v490 + 1) + 8 * v444++));
      }
      while (v442 != v444);
      v442 = objc_msgSend(v440, "countByEnumeratingWithState:objects:count:", &v490, v847, 16);
    }
    while (v442);
  }

  v488 = 0u;
  v489 = 0u;
  v486 = 0u;
  v487 = 0u;
  v445 = v4[13];
  v446 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v486, v846, 16);
  if (v446)
  {
    v447 = v446;
    v448 = *(_QWORD *)v487;
    do
    {
      v449 = 0;
      do
      {
        if (*(_QWORD *)v487 != v448)
          objc_enumerationMutation(v445);
        -[PowerlogMetricLog addKCellularCdmaEvdoServingCellRx0EcIoHist:](self, "addKCellularCdmaEvdoServingCellRx0EcIoHist:", *(_QWORD *)(*((_QWORD *)&v486 + 1) + 8 * v449++));
      }
      while (v447 != v449);
      v447 = objc_msgSend(v445, "countByEnumeratingWithState:objects:count:", &v486, v846, 16);
    }
    while (v447);
  }

  v484 = 0u;
  v485 = 0u;
  v482 = 0u;
  v483 = 0u;
  v450 = v4[15];
  v451 = objc_msgSend(v450, "countByEnumeratingWithState:objects:count:", &v482, v845, 16);
  if (v451)
  {
    v452 = v451;
    v453 = *(_QWORD *)v483;
    do
    {
      v454 = 0;
      do
      {
        if (*(_QWORD *)v483 != v453)
          objc_enumerationMutation(v450);
        -[PowerlogMetricLog addKCellularCdmaEvdoServingCellRx1EcIoHist:](self, "addKCellularCdmaEvdoServingCellRx1EcIoHist:", *(_QWORD *)(*((_QWORD *)&v482 + 1) + 8 * v454++));
      }
      while (v452 != v454);
      v452 = objc_msgSend(v450, "countByEnumeratingWithState:objects:count:", &v482, v845, 16);
    }
    while (v452);
  }

  v480 = 0u;
  v481 = 0u;
  v478 = 0u;
  v479 = 0u;
  v455 = v4[17];
  v456 = objc_msgSend(v455, "countByEnumeratingWithState:objects:count:", &v478, v844, 16);
  if (v456)
  {
    v457 = v456;
    v458 = *(_QWORD *)v479;
    do
    {
      v459 = 0;
      do
      {
        if (*(_QWORD *)v479 != v458)
          objc_enumerationMutation(v455);
        -[PowerlogMetricLog addKCellularCdmaEvdoTxPowerHist:](self, "addKCellularCdmaEvdoTxPowerHist:", *(_QWORD *)(*((_QWORD *)&v478 + 1) + 8 * v459++));
      }
      while (v457 != v459);
      v457 = objc_msgSend(v455, "countByEnumeratingWithState:objects:count:", &v478, v844, 16);
    }
    while (v457);
  }

  v476 = 0u;
  v477 = 0u;
  v474 = 0u;
  v475 = 0u;
  v460 = v4[10];
  v461 = objc_msgSend(v460, "countByEnumeratingWithState:objects:count:", &v474, v843, 16);
  if (v461)
  {
    v462 = v461;
    v463 = *(_QWORD *)v475;
    do
    {
      v464 = 0;
      do
      {
        if (*(_QWORD *)v475 != v463)
          objc_enumerationMutation(v460);
        -[PowerlogMetricLog addKCellularCdmaEvdoProtocolStackStateHist:](self, "addKCellularCdmaEvdoProtocolStackStateHist:", *(_QWORD *)(*((_QWORD *)&v474 + 1) + 8 * v464++));
      }
      while (v462 != v464);
      v462 = objc_msgSend(v460, "countByEnumeratingWithState:objects:count:", &v474, v843, 16);
    }
    while (v462);
  }

  v472 = 0u;
  v473 = 0u;
  v470 = 0u;
  v471 = 0u;
  v465 = v4[11];
  v466 = objc_msgSend(v465, "countByEnumeratingWithState:objects:count:", &v470, v842, 16);
  if (v466)
  {
    v467 = v466;
    v468 = *(_QWORD *)v471;
    do
    {
      v469 = 0;
      do
      {
        if (*(_QWORD *)v471 != v468)
          objc_enumerationMutation(v465);
        -[PowerlogMetricLog addKCellularCdmaEvdoRrState:](self, "addKCellularCdmaEvdoRrState:", *(_QWORD *)(*((_QWORD *)&v470 + 1) + 8 * v469++), (_QWORD)v470);
      }
      while (v467 != v469);
      v467 = objc_msgSend(v465, "countByEnumeratingWithState:objects:count:", &v470, v842, 16);
    }
    while (v467);
  }

}

- (NSMutableArray)kCellularPerClientProfileTriggerCounts
{
  return self->_kCellularPerClientProfileTriggerCounts;
}

- (void)setKCellularPerClientProfileTriggerCounts:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularPerClientProfileTriggerCounts, a3);
}

- (NSMutableArray)kCellularProtocolStackCpuStats
{
  return self->_kCellularProtocolStackCpuStats;
}

- (void)setKCellularProtocolStackCpuStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularProtocolStackCpuStats, a3);
}

- (NSMutableArray)kCellularPeripheralStats
{
  return self->_kCellularPeripheralStats;
}

- (void)setKCellularPeripheralStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularPeripheralStats, a3);
}

- (NSMutableArray)kCellularDvfsStats
{
  return self->_kCellularDvfsStats;
}

- (void)setKCellularDvfsStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularDvfsStats, a3);
}

- (NSMutableArray)kCellularLteWcdmaGsmHwStats
{
  return self->_kCellularLteWcdmaGsmHwStats;
}

- (void)setKCellularLteWcdmaGsmHwStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteWcdmaGsmHwStats, a3);
}

- (NSMutableArray)kCellularLteTdsGsmHwStats
{
  return self->_kCellularLteTdsGsmHwStats;
}

- (void)setKCellularLteTdsGsmHwStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteTdsGsmHwStats, a3);
}

- (NSMutableArray)kCellularPmuAverageCurrents
{
  return self->_kCellularPmuAverageCurrents;
}

- (void)setKCellularPmuAverageCurrents:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularPmuAverageCurrents, a3);
}

- (NSMutableArray)kCellularFwCoreStats
{
  return self->_kCellularFwCoreStats;
}

- (void)setKCellularFwCoreStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularFwCoreStats, a3);
}

- (NSMutableArray)kCellularLteWcdmaTdsHwStats
{
  return self->_kCellularLteWcdmaTdsHwStats;
}

- (void)setKCellularLteWcdmaTdsHwStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteWcdmaTdsHwStats, a3);
}

- (NSMutableArray)kCellularPmicHwStats
{
  return self->_kCellularPmicHwStats;
}

- (void)setKCellularPmicHwStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularPmicHwStats, a3);
}

- (NSMutableArray)kCellularGsmServingCellRssiHists
{
  return self->_kCellularGsmServingCellRssiHists;
}

- (void)setKCellularGsmServingCellRssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularGsmServingCellRssiHists, a3);
}

- (NSMutableArray)kCellularGsmServingCellSnrHists
{
  return self->_kCellularGsmServingCellSnrHists;
}

- (void)setKCellularGsmServingCellSnrHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularGsmServingCellSnrHists, a3);
}

- (NSMutableArray)kCellularGsmTxPowerHists
{
  return self->_kCellularGsmTxPowerHists;
}

- (void)setKCellularGsmTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularGsmTxPowerHists, a3);
}

- (NSMutableArray)kCellularGsmConnectedModeHists
{
  return self->_kCellularGsmConnectedModeHists;
}

- (void)setKCellularGsmConnectedModeHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularGsmConnectedModeHists, a3);
}

- (NSMutableArray)kCellularGsmL1States
{
  return self->_kCellularGsmL1States;
}

- (void)setKCellularGsmL1States:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularGsmL1States, a3);
}

- (NSMutableArray)kCellularWcdmaCpcStats
{
  return self->_kCellularWcdmaCpcStats;
}

- (void)setKCellularWcdmaCpcStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaCpcStats, a3);
}

- (NSMutableArray)kCellularWcdmaRxDiversityHists
{
  return self->_kCellularWcdmaRxDiversityHists;
}

- (void)setKCellularWcdmaRxDiversityHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRxDiversityHists, a3);
}

- (NSMutableArray)kCellularWcdmaServingCellRx0RssiHists
{
  return self->_kCellularWcdmaServingCellRx0RssiHists;
}

- (void)setKCellularWcdmaServingCellRx0RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0RssiHists, a3);
}

- (NSMutableArray)kCellularWcdmaServingCellRx1RssiHists
{
  return self->_kCellularWcdmaServingCellRx1RssiHists;
}

- (void)setKCellularWcdmaServingCellRx1RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1RssiHists, a3);
}

- (NSMutableArray)kCellularWcdmaServingCellRx0EcNoHists
{
  return self->_kCellularWcdmaServingCellRx0EcNoHists;
}

- (void)setKCellularWcdmaServingCellRx0EcNoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0EcNoHists, a3);
}

- (NSMutableArray)kCellularWcdmaServingCellRx1EcNoHists
{
  return self->_kCellularWcdmaServingCellRx1EcNoHists;
}

- (void)setKCellularWcdmaServingCellRx1EcNoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1EcNoHists, a3);
}

- (NSMutableArray)kCellularWcdmaTxPowerHists
{
  return self->_kCellularWcdmaTxPowerHists;
}

- (void)setKCellularWcdmaTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaTxPowerHists, a3);
}

- (NSMutableArray)kCellularWcdmaReceiverStatusOnC0Hists
{
  return self->_kCellularWcdmaReceiverStatusOnC0Hists;
}

- (void)setKCellularWcdmaReceiverStatusOnC0Hists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC0Hists, a3);
}

- (NSMutableArray)kCellularWcdmaReceiverStatusOnC1Hists
{
  return self->_kCellularWcdmaReceiverStatusOnC1Hists;
}

- (void)setKCellularWcdmaReceiverStatusOnC1Hists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC1Hists, a3);
}

- (NSMutableArray)kCellularWcdmaCarrierStatusHists
{
  return self->_kCellularWcdmaCarrierStatusHists;
}

- (void)setKCellularWcdmaCarrierStatusHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaCarrierStatusHists, a3);
}

- (NSMutableArray)kCellularWcdmaRabModeHists
{
  return self->_kCellularWcdmaRabModeHists;
}

- (void)setKCellularWcdmaRabModeHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRabModeHists, a3);
}

- (NSMutableArray)kCellularWcdmaRabTypeHists
{
  return self->_kCellularWcdmaRabTypeHists;
}

- (void)setKCellularWcdmaRabTypeHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRabTypeHists, a3);
}

- (NSMutableArray)kCellularWcdmaRrcConnectionStates
{
  return self->_kCellularWcdmaRrcConnectionStates;
}

- (void)setKCellularWcdmaRrcConnectionStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConnectionStates, a3);
}

- (NSMutableArray)kCellularWcdmaRrcConfigurations
{
  return self->_kCellularWcdmaRrcConfigurations;
}

- (void)setKCellularWcdmaRrcConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConfigurations, a3);
}

- (NSMutableArray)kCellularWcdmaRabStatus
{
  return self->_kCellularWcdmaRabStatus;
}

- (void)setKCellularWcdmaRabStatus:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaRabStatus, a3);
}

- (NSMutableArray)kCellularWcdmaL1States
{
  return self->_kCellularWcdmaL1States;
}

- (void)setKCellularWcdmaL1States:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaL1States, a3);
}

- (NSMutableArray)kCellularWcdmaDataInactivityBeforeIdles
{
  return self->_kCellularWcdmaDataInactivityBeforeIdles;
}

- (void)setKCellularWcdmaDataInactivityBeforeIdles:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaDataInactivityBeforeIdles, a3);
}

- (NSMutableArray)kCellularWcdmaIdleToConnectedUserDatas
{
  return self->_kCellularWcdmaIdleToConnectedUserDatas;
}

- (void)setKCellularWcdmaIdleToConnectedUserDatas:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaIdleToConnectedUserDatas, a3);
}

- (NSMutableArray)kCellularWcdmaVadHists
{
  return self->_kCellularWcdmaVadHists;
}

- (void)setKCellularWcdmaVadHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularWcdmaVadHists, a3);
}

- (NSMutableArray)kCellularTdsRxDiversityHists
{
  return self->_kCellularTdsRxDiversityHists;
}

- (void)setKCellularTdsRxDiversityHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsRxDiversityHists, a3);
}

- (NSMutableArray)kCellularTdsServingCellRx0RssiHists
{
  return self->_kCellularTdsServingCellRx0RssiHists;
}

- (void)setKCellularTdsServingCellRx0RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RssiHists, a3);
}

- (NSMutableArray)kCellularTdsServingCellRx1RssiHists
{
  return self->_kCellularTdsServingCellRx1RssiHists;
}

- (void)setKCellularTdsServingCellRx1RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RssiHists, a3);
}

- (NSMutableArray)kCellularTdsServingCellRx0RscpHists
{
  return self->_kCellularTdsServingCellRx0RscpHists;
}

- (void)setKCellularTdsServingCellRx0RscpHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RscpHists, a3);
}

- (NSMutableArray)kCellularTdsServingCellRx1RscpHists
{
  return self->_kCellularTdsServingCellRx1RscpHists;
}

- (void)setKCellularTdsServingCellRx1RscpHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RscpHists, a3);
}

- (NSMutableArray)kCellularTdsTxPowerHists
{
  return self->_kCellularTdsTxPowerHists;
}

- (void)setKCellularTdsTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsTxPowerHists, a3);
}

- (NSMutableArray)kCellularTdsRabModeHists
{
  return self->_kCellularTdsRabModeHists;
}

- (void)setKCellularTdsRabModeHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsRabModeHists, a3);
}

- (NSMutableArray)kCellularTdsRabTypeHists
{
  return self->_kCellularTdsRabTypeHists;
}

- (void)setKCellularTdsRabTypeHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsRabTypeHists, a3);
}

- (NSMutableArray)kCellularTdsRrcStates
{
  return self->_kCellularTdsRrcStates;
}

- (void)setKCellularTdsRrcStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsRrcStates, a3);
}

- (NSMutableArray)kCellularTdsL1States
{
  return self->_kCellularTdsL1States;
}

- (void)setKCellularTdsL1States:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularTdsL1States, a3);
}

- (NSMutableArray)kCellularLteFwDuplexModes
{
  return self->_kCellularLteFwDuplexModes;
}

- (void)setKCellularLteFwDuplexModes:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteFwDuplexModes, a3);
}

- (NSMutableArray)kCellularLteServingCellRsrpHists
{
  return self->_kCellularLteServingCellRsrpHists;
}

- (void)setKCellularLteServingCellRsrpHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteServingCellRsrpHists, a3);
}

- (NSMutableArray)kCellularLteServingCellSinrHists
{
  return self->_kCellularLteServingCellSinrHists;
}

- (void)setKCellularLteServingCellSinrHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteServingCellSinrHists, a3);
}

- (NSMutableArray)kCellularLteSleepStateHists
{
  return self->_kCellularLteSleepStateHists;
}

- (void)setKCellularLteSleepStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteSleepStateHists, a3);
}

- (NSMutableArray)kCellularLteTxPowerHists
{
  return self->_kCellularLteTxPowerHists;
}

- (void)setKCellularLteTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteTxPowerHists, a3);
}

- (NSMutableArray)kCellularLteDlSccStateHists
{
  return self->_kCellularLteDlSccStateHists;
}

- (void)setKCellularLteDlSccStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHists, a3);
}

- (NSMutableArray)kCellularLteUlSccStateHists
{
  return self->_kCellularLteUlSccStateHists;
}

- (void)setKCellularLteUlSccStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteUlSccStateHists, a3);
}

- (NSMutableArray)kCellularLteAdvancedRxStateHists
{
  return self->_kCellularLteAdvancedRxStateHists;
}

- (void)setKCellularLteAdvancedRxStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteAdvancedRxStateHists, a3);
}

- (NSMutableArray)kCellularLteComponentCarrierInfos
{
  return self->_kCellularLteComponentCarrierInfos;
}

- (void)setKCellularLteComponentCarrierInfos:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteComponentCarrierInfos, a3);
}

- (NSMutableArray)kCellularLteRxTxStateHists
{
  return self->_kCellularLteRxTxStateHists;
}

- (void)setKCellularLteRxTxStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteRxTxStateHists, a3);
}

- (NSMutableArray)kCellularLteTotalDlTbsHists
{
  return self->_kCellularLteTotalDlTbsHists;
}

- (void)setKCellularLteTotalDlTbsHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteTotalDlTbsHists, a3);
}

- (NSMutableArray)kCellularLteDataInactivityBeforeIdles
{
  return self->_kCellularLteDataInactivityBeforeIdles;
}

- (void)setKCellularLteDataInactivityBeforeIdles:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteDataInactivityBeforeIdles, a3);
}

- (NSMutableArray)kCellularLteIdleToConnectedUserDatas
{
  return self->_kCellularLteIdleToConnectedUserDatas;
}

- (void)setKCellularLteIdleToConnectedUserDatas:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteIdleToConnectedUserDatas, a3);
}

- (NSMutableArray)kCellularLteDlSccStateHistV3s
{
  return self->_kCellularLteDlSccStateHistV3s;
}

- (void)setKCellularLteDlSccStateHistV3s:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHistV3s, a3);
}

- (NSMutableArray)kCellularLteRxDiversityHists
{
  return self->_kCellularLteRxDiversityHists;
}

- (void)setKCellularLteRxDiversityHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteRxDiversityHists, a3);
}

- (NSMutableArray)kCellularLtePdcchStateHists
{
  return self->_kCellularLtePdcchStateHists;
}

- (void)setKCellularLtePdcchStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateHists, a3);
}

- (NSMutableArray)kCellularLteRrcStates
{
  return self->_kCellularLteRrcStates;
}

- (void)setKCellularLteRrcStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteRrcStates, a3);
}

- (NSMutableArray)kCellularLtePagingCycles
{
  return self->_kCellularLtePagingCycles;
}

- (void)setKCellularLtePagingCycles:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLtePagingCycles, a3);
}

- (NSMutableArray)kCellularLteCdrxConfigs
{
  return self->_kCellularLteCdrxConfigs;
}

- (void)setKCellularLteCdrxConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteCdrxConfigs, a3);
}

- (NSMutableArray)kCellularLteRadioLinkFailures
{
  return self->_kCellularLteRadioLinkFailures;
}

- (void)setKCellularLteRadioLinkFailures:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLteRadioLinkFailures, a3);
}

- (NSMutableArray)kCellularLtePdcchStateStats
{
  return self->_kCellularLtePdcchStateStats;
}

- (void)setKCellularLtePdcchStateStats:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateStats, a3);
}

- (NSMutableArray)kCellularLqmStateChanges
{
  return self->_kCellularLqmStateChanges;
}

- (void)setKCellularLqmStateChanges:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularLqmStateChanges, a3);
}

- (NSMutableArray)kCellularServiceLosts
{
  return self->_kCellularServiceLosts;
}

- (void)setKCellularServiceLosts:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularServiceLosts, a3);
}

- (NSMutableArray)kCellularProtocolStackStateHists
{
  return self->_kCellularProtocolStackStateHists;
}

- (void)setKCellularProtocolStackStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHists, a3);
}

- (NSMutableArray)kCellularCellPlmnSearchCounts
{
  return self->_kCellularCellPlmnSearchCounts;
}

- (void)setKCellularCellPlmnSearchCounts:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchCounts, a3);
}

- (NSMutableArray)kCellularCellPlmnSearchHists
{
  return self->_kCellularCellPlmnSearchHists;
}

- (void)setKCellularCellPlmnSearchHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchHists, a3);
}

- (NSMutableArray)kCellularProtocolStackPowerStates
{
  return self->_kCellularProtocolStackPowerStates;
}

- (void)setKCellularProtocolStackPowerStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularProtocolStackPowerStates, a3);
}

- (NSMutableArray)kCellularDownlinkIpPacketFilterStatus
{
  return self->_kCellularDownlinkIpPacketFilterStatus;
}

- (void)setKCellularDownlinkIpPacketFilterStatus:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketFilterStatus, a3);
}

- (NSMutableArray)kCellularDownlinkIpPacketDiscardeds
{
  return self->_kCellularDownlinkIpPacketDiscardeds;
}

- (void)setKCellularDownlinkIpPacketDiscardeds:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketDiscardeds, a3);
}

- (NSMutableArray)kCellularServingCellRfBandHists
{
  return self->_kCellularServingCellRfBandHists;
}

- (void)setKCellularServingCellRfBandHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularServingCellRfBandHists, a3);
}

- (NSMutableArray)kCellularProtocolStackStateHist2s
{
  return self->_kCellularProtocolStackStateHist2s;
}

- (void)setKCellularProtocolStackStateHist2s:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHist2s, a3);
}

- (NSMutableArray)kCellularProtocolStackStates
{
  return self->_kCellularProtocolStackStates;
}

- (void)setKCellularProtocolStackStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularProtocolStackStates, a3);
}

- (NSMutableArray)kCellularCdma1XRxDiversityHists
{
  return self->_kCellularCdma1XRxDiversityHists;
}

- (void)setKCellularCdma1XRxDiversityHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XRxDiversityHists, a3);
}

- (NSMutableArray)kCellularCdma1XServingCellRx0RssiHists
{
  return self->_kCellularCdma1XServingCellRx0RssiHists;
}

- (void)setKCellularCdma1XServingCellRx0RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0RssiHists, a3);
}

- (NSMutableArray)kCellularCdma1XServingCellRx1RssiHists
{
  return self->_kCellularCdma1XServingCellRx1RssiHists;
}

- (void)setKCellularCdma1XServingCellRx1RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1RssiHists, a3);
}

- (NSMutableArray)kCellularCdma1XServingCellRx0EcIoHists
{
  return self->_kCellularCdma1XServingCellRx0EcIoHists;
}

- (void)setKCellularCdma1XServingCellRx0EcIoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0EcIoHists, a3);
}

- (NSMutableArray)kCellularCdma1XServingCellRx1EcIoHists
{
  return self->_kCellularCdma1XServingCellRx1EcIoHists;
}

- (void)setKCellularCdma1XServingCellRx1EcIoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1EcIoHists, a3);
}

- (NSMutableArray)kCellularCdma1XTxPowerHists
{
  return self->_kCellularCdma1XTxPowerHists;
}

- (void)setKCellularCdma1XTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XTxPowerHists, a3);
}

- (NSMutableArray)kCellularCdma1XProtocolStackStateHists
{
  return self->_kCellularCdma1XProtocolStackStateHists;
}

- (void)setKCellularCdma1XProtocolStackStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XProtocolStackStateHists, a3);
}

- (NSMutableArray)kCellularCdma1XConnectionHists
{
  return self->_kCellularCdma1XConnectionHists;
}

- (void)setKCellularCdma1XConnectionHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XConnectionHists, a3);
}

- (NSMutableArray)kCellularCdma1XRrStates
{
  return self->_kCellularCdma1XRrStates;
}

- (void)setKCellularCdma1XRrStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdma1XRrStates, a3);
}

- (NSMutableArray)kCellularCdmaEvdoRxDiversityHists
{
  return self->_kCellularCdmaEvdoRxDiversityHists;
}

- (void)setKCellularCdmaEvdoRxDiversityHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRxDiversityHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx0RssiHists
{
  return self->_kCellularCdmaEvdoServingCellRx0RssiHists;
}

- (void)setKCellularCdmaEvdoServingCellRx0RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0RssiHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx1RssiHists
{
  return self->_kCellularCdmaEvdoServingCellRx1RssiHists;
}

- (void)setKCellularCdmaEvdoServingCellRx1RssiHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1RssiHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx0EcIoHists
{
  return self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
}

- (void)setKCellularCdmaEvdoServingCellRx0EcIoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0EcIoHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx1EcIoHists
{
  return self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
}

- (void)setKCellularCdmaEvdoServingCellRx1EcIoHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1EcIoHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoTxPowerHists
{
  return self->_kCellularCdmaEvdoTxPowerHists;
}

- (void)setKCellularCdmaEvdoTxPowerHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoTxPowerHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoProtocolStackStateHists
{
  return self->_kCellularCdmaEvdoProtocolStackStateHists;
}

- (void)setKCellularCdmaEvdoProtocolStackStateHists:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoProtocolStackStateHists, a3);
}

- (NSMutableArray)kCellularCdmaEvdoRrStates
{
  return self->_kCellularCdmaEvdoRrStates;
}

- (void)setKCellularCdmaEvdoRrStates:(id)a3
{
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRrStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kCellularWcdmaVadHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1EcNoHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0EcNoHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConnectionStates, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConfigurations, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC1Hists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC0Hists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabTypeHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabStatus, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaL1States, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaIdleToConnectedUserDatas, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaDataInactivityBeforeIdles, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaCpcStats, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaCarrierStatusHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RscpHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RscpHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRrcStates, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRabTypeHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRabModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsL1States, 0);
  objc_storeStrong((id *)&self->_kCellularServingCellRfBandHists, 0);
  objc_storeStrong((id *)&self->_kCellularServiceLosts, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStates, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHist2s, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackPowerStates, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackCpuStats, 0);
  objc_storeStrong((id *)&self->_kCellularPmuAverageCurrents, 0);
  objc_storeStrong((id *)&self->_kCellularPmicHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularPeripheralStats, 0);
  objc_storeStrong((id *)&self->_kCellularPerClientProfileTriggerCounts, 0);
  objc_storeStrong((id *)&self->_kCellularLteWcdmaTdsHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteWcdmaGsmHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteUlSccStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTotalDlTbsHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTdsGsmHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteSleepStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteServingCellSinrHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteServingCellRsrpHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRxTxStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRrcStates, 0);
  objc_storeStrong((id *)&self->_kCellularLteRadioLinkFailures, 0);
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateStats, 0);
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLtePagingCycles, 0);
  objc_storeStrong((id *)&self->_kCellularLteIdleToConnectedUserDatas, 0);
  objc_storeStrong((id *)&self->_kCellularLteFwDuplexModes, 0);
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHistV3s, 0);
  objc_storeStrong((id *)&self->_kCellularLteDataInactivityBeforeIdles, 0);
  objc_storeStrong((id *)&self->_kCellularLteComponentCarrierInfos, 0);
  objc_storeStrong((id *)&self->_kCellularLteCdrxConfigs, 0);
  objc_storeStrong((id *)&self->_kCellularLteAdvancedRxStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLqmStateChanges, 0);
  objc_storeStrong((id *)&self->_kCellularGsmTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmServingCellSnrHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmServingCellRssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmL1States, 0);
  objc_storeStrong((id *)&self->_kCellularGsmConnectedModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularFwCoreStats, 0);
  objc_storeStrong((id *)&self->_kCellularDvfsStats, 0);
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketFilterStatus, 0);
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketDiscardeds, 0);
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchHists, 0);
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchCounts, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRrStates, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XRrStates, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XConnectionHists, 0);
}

@end
