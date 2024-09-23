@implementation PLAccountingCorrectionOwner

- (id)ID
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionOwner rootEnergyEstimate](self, "rootEnergyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)range
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionOwner rootEnergyEstimate](self, "rootEnergyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLAccountingEnergyEstimateEventEntry)rootEnergyEstimate
{
  return (PLAccountingEnergyEstimateEventEntry *)objc_getProperty(self, a2, 64, 1);
}

- (PLAccountingCorrectionOwner)initWithRootEnergyEstimate:(id)a3
{
  id v5;
  PLAccountingCorrectionOwner *v6;
  PLAccountingCorrectionOwner *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingCorrectionOwner;
  v6 = -[PLAccountingCorrectionOwner init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootEnergyEstimate, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootEnergyEstimate, 0);
}

- (id)activationDate
{
  void *v2;
  void *v3;

  -[PLAccountingCorrectionOwner rootEnergyEstimate](self, "rootEnergyEstimate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRunDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLAccountingCorrectionOwner rootEnergyEstimate](self, "rootEnergyEstimate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCorrectionDate:", v4);

}

- (void)correct
{
  OUTLINED_FUNCTION_0(&dword_21A62B000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_14 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_19 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_24 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_29 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_34 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_40 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_45 = result;
  return result;
}

uint64_t __38__PLAccountingCorrectionOwner_correct__block_invoke_51(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  correct_classDebugEnabled_50 = result;
  return result;
}

- (void)setRootEnergyEstimate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
