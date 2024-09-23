@implementation PLAccountingEnergyEstimateEventEntry

+ (id)entryKey
{
  if (entryKey_onceToken_1 != -1)
    dispatch_once(&entryKey_onceToken_1, &__block_literal_global_3);
  return (id)entryKey_entryKey_1;
}

- (NSNumber)distributionRuleID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75080]);
}

- (int)numAncestors
{
  void *v2;
  int v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (NSDate)correctionDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75068]);
}

- (void)setDistributionDate:(id)a3
{
  -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BE75078]);
}

- (PLAccountingEnergyEstimateEventEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withParentEntryID:(int)a5 withNumAncestors:(int)a6 withEnergy:(double)a7 withRange:(id)a8 withEntryDate:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  PLAccountingEnergyEstimateEventEntry *v21;
  PLAccountingEnergyEstimateEventEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  PLAccountingEnergyEstimateEventEntry *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  unsigned int v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];
  _QWORD block[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = objc_msgSend(v17, "intValue");
  v21 = 0;
  if ((a5 & 0x80000000) == 0 && v20 >= 1)
  {
    v73.receiver = self;
    v73.super_class = (Class)PLAccountingEnergyEstimateEventEntry;
    v22 = -[PLAccountingEnergyEventEntry initWithNodeID:withEnergy:withRange:withEntryDate:](&v73, sel_initWithNodeID_withEnergy_withRange_withEntryDate_, v16, v18, v19, a7);
    if (v22)
    {
      +[PLAccountingDistributionRuleManager sharedInstance](PLAccountingDistributionRuleManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "distributionRuleForRootNodeID:andNodeID:", v17, v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v60 = objc_msgSend(v24, "entryID");
      else
        v60 = 0;
      +[PLAccountingQualificationRuleManager sharedInstance](PLAccountingQualificationRuleManager, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "qualificationRulesForRootNodeID:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = a5;
      v63 = a6;
      v61 = v26;
      if (v26 && objc_msgSend(v26, "count"))
      {
        v55 = v24;
        v56 = v19;
        v57 = v18;
        v58 = v17;
        v59 = v16;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        obj = v26;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = 0x24BE74000uLL;
          v66 = *(_QWORD *)v70;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v70 != v66)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v31);
              if (objc_msgSend(*(id *)(v30 + 4016), "debugEnabled"))
              {
                v33 = objc_opt_class();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v33;
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce != -1)
                  dispatch_once(&initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce, block);
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled)
                {
                  v65 = v29;
                  v34 = v28;
                  v35 = v30;
                  v36 = v22;
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationRule=%@"), v32);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Energy/PLAccountingEnergyEstimateEventEntry.m");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "lastPathComponent");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:]");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 60);

                  PLLogCommon();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v37;
                    _os_log_debug_impl(&dword_21A62B000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v22 = v36;
                  v30 = v35;
                  v28 = v34;
                  v29 = v65;
                }
              }
              v29 += 1 << (objc_msgSend(v32, "entryID") - 1);
              if (objc_msgSend(*(id *)(v30 + 4016), "debugEnabled"))
              {
                v43 = objc_opt_class();
                v67[0] = MEMORY[0x24BDAC760];
                v67[1] = 3221225472;
                v67[2] = __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke_19;
                v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v67[4] = v43;
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce_17 != -1)
                  dispatch_once(&initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__defaultOnce_17, v67);
                if (initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled_18)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationRuleIDSum=%llu"), v29);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Energy/PLAccountingEnergyEstimateEventEntry.m");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "lastPathComponent");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:]");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 64);

                  PLLogCommon();
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v44;
                    _os_log_debug_impl(&dword_21A62B000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                }
              }
              ++v31;
            }
            while (v28 != v31);
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
          }
          while (v28);
        }
        else
        {
          v29 = 0;
        }

        v17 = v58;
        v16 = v59;
        v19 = v56;
        v18 = v57;
        v24 = v55;
      }
      else
      {
        v29 = 0;
      }
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE750C0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v62);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v50, *MEMORY[0x24BE750A8]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v63);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v51, *MEMORY[0x24BE750A0]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v60);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v52, *MEMORY[0x24BE75080]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v29);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v53, *MEMORY[0x24BE750B8]);

      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &unk_24DD01990, *MEMORY[0x24BE75070]);
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &unk_24DD019A8, *MEMORY[0x24BE750D0]);
      v22->_isRootNodeEnergyAggregated = 0;

    }
    self = v22;
    v21 = self;
  }

  return v21;
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750C0]);
}

- (void)setCorrectionEnergy:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__PLAccountingEnergyEstimateEventEntry_setCorrectionEnergy___block_invoke;
  v7[3] = &unk_24DCF9A50;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(v6, "blockingUpdateEntry:withBlock:", self, v7);

}

- (NSDate)distributionDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75078]);
}

- (void)setQualificationDate:(id)a3
{
  -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BE750B0]);
}

- (NSNumber)qualificationRuleIDSum
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750B8]);
}

- (double)terminationRatio
{
  void *v2;
  double v3;
  double v4;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 / 100.0;

  return v4;
}

- (double)correctionEnergy
{
  void *v2;
  double v3;
  double v4;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75070]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 / 1000.0;

  return v4;
}

- (BOOL)isRootNodeEnergyAggregated
{
  return self->_isRootNodeEnergyAggregated;
}

- (void)setTerminationRatio:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__PLAccountingEnergyEstimateEventEntry_setTerminationRatio___block_invoke;
  v7[3] = &unk_24DCF9A50;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(v6, "blockingUpdateEntry:withBlock:", self, v7);

}

- (void)setIsRootNodeEnergyAggregated:(BOOL)a3
{
  self->_isRootNodeEnergyAggregated = a3;
}

void __60__PLAccountingEnergyEstimateEventEntry_setTerminationRatio___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(*(double *)(a1 + 40) * 100.0));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *MEMORY[0x24BE750D0]);

}

- (void)setCorrectionDate:(id)a3
{
  -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, *MEMORY[0x24BE75068]);
}

void __60__PLAccountingEnergyEstimateEventEntry_setCorrectionEnergy___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(*(double *)(a1 + 40) * 1000.0));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *MEMORY[0x24BE75070]);

}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingEnergyEstimateEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __48__PLAccountingEnergyEstimateEventEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75220], *MEMORY[0x24BE75060]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_1;
  entryKey_entryKey_1 = v0;

}

uint64_t __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled = result;
  return result;
}

uint64_t __140__PLAccountingEnergyEstimateEventEntry_initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithNodeID_withRootNodeID_withParentEntryID_withNumAncestors_withEnergy_withRange_withEntryDate__classDebugEnabled_18 = result;
  return result;
}

- (int)parentEntryID
{
  void *v2;
  int v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (NSDate)qualificationDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750B0]);
}

@end
