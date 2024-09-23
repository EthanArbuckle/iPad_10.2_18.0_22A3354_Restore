@implementation CLSNSFWModel

- (CLSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSNSFWModel *v4;
  CLSNSFWModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSNSFWModel;
  v4 = -[CLSNSFWModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x32)
    {
      if (a3 < 0x21)
      {
        if (a3 == 32)
        {
          -[CLSNSFWModel setupVersion32](v4, "setupVersion32");
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            v10 = a3;
            v11 = 2112;
            v12 = v6;
            _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
      }
      else
      {
        -[CLSNSFWModel setupVersion33](v4, "setupVersion33");
      }
    }
    else
    {
      -[CLSNSFWModel setupVersion50](v4, "setupVersion50");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSNSFWModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 50);
}

- (void)setupVersion32
{
  CLSSignalNode *v3;
  CLSSignalNode *noneNode;
  CLSSignalNode *v5;
  CLSSignalNode *generalNode;
  CLSSignalNode *v7;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v9;
  CLSSignalNode *brassiereNode;
  CLSSignalNode *v11;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v13;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v15;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v17;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v19;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v21;
  CLSSignalNode *underwearNode;
  CLSSignalNode *v23;
  CLSSignalNode *maleUnderwearNode;

  self->_version = 32;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483381, CFSTR("NSFW - None"), 0.0, 0.0, 0.0);
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483382, CFSTR("NSFW - General"), 0.79, 0.92, 0.49);
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483383, CFSTR("NSFW - Explicit"), 0.21, 0.39, 0.06);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483384, CFSTR("NSFW - BR"), 0.0, 0.0, 0.0);
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483385, CFSTR("NSFW - FB"), 0.0, 0.0, 0.0);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483386, CFSTR("NSFW - MB"), 0.0, 0.0, 0.0);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483387, CFSTR("NSFW - BT"), 0.0, 0.0, 0.0);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483388, CFSTR("NSFW - FG"), 0.0, 0.0, 0.0);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483389, CFSTR("NSFW - MG"), 0.0, 0.0, 0.0);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483390, CFSTR("NSFW - UW"), 0.0, 0.0, 0.0);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483391, CFSTR("NSFW - MU"), 0.0, 0.0, 0.0);
  maleUnderwearNode = self->_maleUnderwearNode;
  self->_maleUnderwearNode = v23;

}

- (void)setupVersion33
{
  CLSSignalNode *v3;
  CLSSignalNode *noneNode;
  CLSSignalNode *v5;
  CLSSignalNode *generalNode;
  CLSSignalNode *v7;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v9;
  CLSSignalNode *brassiereNode;
  CLSSignalNode *v11;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v13;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v15;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v17;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v19;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v21;
  CLSSignalNode *underwearNode;
  CLSSignalNode *v23;
  CLSSignalNode *maleUnderwearNode;

  self->_version = 33;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483381, CFSTR("NSFW - None"), 0.0, 0.0, 0.0);
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483382, CFSTR("NSFW - General"), 0.37, 0.63, 0.22);
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483383, CFSTR("NSFW - Explicit"), 0.21, 0.33, 0.08);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483384, CFSTR("NSFW - BR"), 0.0, 0.0, 0.0);
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483385, CFSTR("NSFW - FB"), 0.0, 0.0, 0.0);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483386, CFSTR("NSFW - MB"), 0.0, 0.0, 0.0);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483387, CFSTR("NSFW - BT"), 0.0, 0.0, 0.0);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483388, CFSTR("NSFW - FG"), 0.0, 0.0, 0.0);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483389, CFSTR("NSFW - MG"), 0.0, 0.0, 0.0);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483390, CFSTR("NSFW - UW"), 0.0, 0.0, 0.0);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483391, CFSTR("NSFW - MU"), 0.0, 0.0, 0.0);
  maleUnderwearNode = self->_maleUnderwearNode;
  self->_maleUnderwearNode = v23;

}

- (void)setupVersion50_4
{
  CLSSignalNode *v3;
  CLSSignalNode *noneNode;
  CLSSignalNode *v5;
  CLSSignalNode *generalNode;
  CLSSignalNode *v7;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v9;
  CLSSignalNode *brassiereNode;
  CLSSignalNode *v11;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v13;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v15;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v17;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v19;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v21;
  CLSSignalNode *underwearNode;
  CLSSignalNode *v23;
  CLSSignalNode *maleUnderwearNode;

  self->_version = 50;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483381, CFSTR("NSFW - None"), 0.0, 0.0, 0.0);
  noneNode = self->_noneNode;
  self->_noneNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483382, CFSTR("NSFW - General"), 0.69, 0.86, 0.43);
  generalNode = self->_generalNode;
  self->_generalNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483383, CFSTR("NSFW - Explicit"), 0.28, 0.43, 0.09);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483384, CFSTR("NSFW - BR"), 0.0, 0.0, 0.0);
  brassiereNode = self->_brassiereNode;
  self->_brassiereNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483385, CFSTR("NSFW - FB"), 0.0, 0.0, 0.0);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483386, CFSTR("NSFW - MB"), 0.0, 0.0, 0.0);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483387, CFSTR("NSFW - BT"), 0.0, 0.0, 0.0);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483388, CFSTR("NSFW - FG"), 0.0, 0.0, 0.0);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483389, CFSTR("NSFW - MG"), 0.0, 0.0, 0.0);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483390, CFSTR("NSFW - UW"), 0.0, 0.0, 0.0);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483391, CFSTR("NSFW - MU"), 0.0, 0.0, 0.0);
  maleUnderwearNode = self->_maleUnderwearNode;
  self->_maleUnderwearNode = v23;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *noneNode;
  CLSSignalNode *v4;
  void *v7;

  switch(a3)
  {
    case 0x7FFFFEF5uLL:
      noneNode = self->_noneNode;
      goto LABEL_13;
    case 0x7FFFFEF6uLL:
      noneNode = self->_generalNode;
      goto LABEL_13;
    case 0x7FFFFEF7uLL:
      noneNode = self->_explicitNode;
      goto LABEL_13;
    case 0x7FFFFEF8uLL:
      noneNode = self->_brassiereNode;
      goto LABEL_13;
    case 0x7FFFFEF9uLL:
      noneNode = self->_femaleBreastNode;
      goto LABEL_13;
    case 0x7FFFFEFAuLL:
      noneNode = self->_maleBreastNode;
      goto LABEL_13;
    case 0x7FFFFEFBuLL:
      noneNode = self->_buttocksNode;
      goto LABEL_13;
    case 0x7FFFFEFCuLL:
      noneNode = self->_femaleGenitalsNode;
      goto LABEL_13;
    case 0x7FFFFEFDuLL:
      noneNode = self->_maleGenitalsNode;
      goto LABEL_13;
    case 0x7FFFFEFEuLL:
      noneNode = self->_underwearNode;
      goto LABEL_13;
    case 0x7FFFFEFFuLL:
      noneNode = self->_maleUnderwearNode;
LABEL_13:
      v4 = noneNode;
      break;
    default:
      if (-[CLSNSFWModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NSFW - Unknown (%X)"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v7, 0.0, 0.0, 0.0);

      }
      else
      {
        v4 = 0;
      }
      break;
  }
  return v4;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147483136;
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v17;

  v17 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_2514A19C0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_2514A19D8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_2514A19F0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (self->_version < 0x32)
  {
    objc_msgSend(v17, "setIsRecallinglyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v13));
    objc_msgSend(v17, "setIsNSFWExplicit:", -[CLSSignalNode passesWithConfidence:](self->_explicitNode, "passesWithConfidence:", v13));
  }
  else
  {
    v14 = v9 <= 0.3 && v13 >= 0.29;
    objc_msgSend(v17, "setIsPreciselyNSFWExplicit:", v14);
    v15 = v9 <= 0.39 && v13 >= 0.15;
    objc_msgSend(v17, "setIsNSFWExplicit:", v15);
    v16 = v9 <= 0.66 && v13 >= 0.08;
    objc_msgSend(v17, "setIsRecallinglyNSFWExplicit:", v16);
  }

}

- (id)modelInfo
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __25__CLSNSFWModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_generalNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_explicitNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_noneNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_brassiereNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_femaleBreastNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_maleBreastNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_buttocksNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_femaleGenitalsNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_maleGenitalsNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_underwearNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_maleUnderwearNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)generalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maleUnderwearNode, 0);
  objc_storeStrong((id *)&self->_underwearNode, 0);
  objc_storeStrong((id *)&self->_maleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_femaleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_buttocksNode, 0);
  objc_storeStrong((id *)&self->_maleBreastNode, 0);
  objc_storeStrong((id *)&self->_femaleBreastNode, 0);
  objc_storeStrong((id *)&self->_brassiereNode, 0);
  objc_storeStrong((id *)&self->_explicitNode, 0);
  objc_storeStrong((id *)&self->_generalNode, 0);
  objc_storeStrong((id *)&self->_noneNode, 0);
}

void __25__CLSNSFWModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;

  v3 = 33;
  if (a3 <= 0x20)
    v3 = 32 * (a3 == 32);
  if (a3 <= 0x31)
    return v3;
  else
    return 50;
}

+ (NSString)name
{
  return (NSString *)CFSTR("NSFW");
}

+ (unint64_t)latestVersion
{
  return 50;
}

@end
