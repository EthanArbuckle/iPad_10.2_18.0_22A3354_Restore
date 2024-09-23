@implementation CLSIVSNSFWModel

- (CLSIVSNSFWModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSIVSNSFWModel *v4;
  CLSIVSNSFWModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSIVSNSFWModel;
  v4 = -[CLSIVSNSFWModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x62)
    {
      if (a3 < 0x5F)
      {
        if (a3 < 0x4C)
        {
          if (a3 < 0x3D)
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
          else
          {
            -[CLSIVSNSFWModel setupVersion61](v4, "setupVersion61");
          }
        }
        else
        {
          -[CLSIVSNSFWModel setupVersion76](v4, "setupVersion76");
        }
      }
      else
      {
        -[CLSIVSNSFWModel setupVersion95](v4, "setupVersion95");
      }
    }
    else
    {
      -[CLSIVSNSFWModel setupVersion98](v4, "setupVersion98");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSIVSNSFWModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 98);
}

- (void)setupVersion61
{
  CLSSignalNode *v3;
  CLSSignalNode *anyNode;
  CLSSignalNode *v5;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v7;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v9;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v11;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v13;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v15;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v17;
  CLSSignalNode *noneNode;
  CLSSignalNode *v19;
  CLSSignalNode *underwearNode;

  self->_version = 61;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481853, CFSTR("IVS NSFW - Any"), 0.87, 0.95, 0.11);
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481846, CFSTR("IVS NSFW - FB"), 0.14, 0.82, 0.04);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481847, CFSTR("IVS NSFW - MB"), 0.46, 0.89, 0.02);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481848, CFSTR("IVS NSFW - BT"), 0.62, 0.68, 0.07);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481854, CFSTR("IVS NSFW - Explicit"), 0.17, 0.76, 0.02);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481849, CFSTR("IVS NSFW - FG"), 0.45, 0.46, 0.01);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481850, CFSTR("IVS NSFW - MG"), 0.08, 0.77, 0.06);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481851, CFSTR("IVS NSFW - None"), 0.13, 0.82, 0.01);
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481852, CFSTR("IVS NSFW - UW"), 0.13, 0.62, 0.11);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v19;

}

- (void)setupVersion76
{
  CLSSignalNode *v3;
  CLSSignalNode *anyNode;
  CLSSignalNode *v5;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v7;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v9;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v11;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v13;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v15;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v17;
  CLSSignalNode *noneNode;
  CLSSignalNode *v19;
  CLSSignalNode *underwearNode;

  self->_version = 76;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481853, CFSTR("IVS NSFW - Any"), 0.77, 0.91, 0.18);
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481846, CFSTR("IVS NSFW - FB"), 0.48, 0.79, 0.15);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481847, CFSTR("IVS NSFW - MB"), 0.19, 0.74, 0.08);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481848, CFSTR("IVS NSFW - BT"), 0.32, 0.62, 0.1);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481854, CFSTR("IVS NSFW - Explicit"), 0.63, 0.84, 0.21);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481849, CFSTR("IVS NSFW - FG"), 0.4, 0.73, 0.13);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481850, CFSTR("IVS NSFW - MG"), 0.41, 0.7, 0.13);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481851, CFSTR("IVS NSFW - None"), 0.15, 0.64, 0.05);
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481852, CFSTR("IVS NSFW - UW"), 0.4, 0.61, 0.09);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v19;

}

- (void)setupVersion95
{
  CLSSignalNode *v3;
  CLSSignalNode *anyNode;
  CLSSignalNode *v5;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v7;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v9;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v11;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v13;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v15;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v17;
  CLSSignalNode *noneNode;
  CLSSignalNode *v19;
  CLSSignalNode *underwearNode;

  self->_version = 95;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481853, CFSTR("IVS NSFW - Any"), 0.66, 0.87, 0.2);
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481846, CFSTR("IVS NSFW - FB"), 0.0, 0.0, 0.0);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481847, CFSTR("IVS NSFW - MB"), 0.0, 0.0, 0.0);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481848, CFSTR("IVS NSFW - BT"), 0.0, 0.0, 0.0);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481854, CFSTR("IVS NSFW - Explicit"), 0.527, 0.873, 0.167);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481849, CFSTR("IVS NSFW - FG"), 0.0, 0.0, 0.0);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481850, CFSTR("IVS NSFW - MG"), 0.0, 0.0, 0.0);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481851, CFSTR("IVS NSFW - None"), 0.0, 0.0, 0.0);
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481852, CFSTR("IVS NSFW - UW"), 0.0, 0.0, 0.0);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v19;

}

- (void)setupVersion98
{
  CLSSignalNode *v3;
  CLSSignalNode *anyNode;
  CLSSignalNode *v5;
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v7;
  CLSSignalNode *maleBreastNode;
  CLSSignalNode *v9;
  CLSSignalNode *buttocksNode;
  CLSSignalNode *v11;
  CLSSignalNode *explicitNode;
  CLSSignalNode *v13;
  CLSSignalNode *femaleGenitalsNode;
  CLSSignalNode *v15;
  CLSSignalNode *maleGenitalsNode;
  CLSSignalNode *v17;
  CLSSignalNode *noneNode;
  CLSSignalNode *v19;
  CLSSignalNode *underwearNode;

  self->_version = 98;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481853, CFSTR("IVS NSFW - Any"), 0.73, 0.91, 0.24);
  anyNode = self->_anyNode;
  self->_anyNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481846, CFSTR("IVS NSFW - FB"), 0.0, 0.0, 0.0);
  femaleBreastNode = self->_femaleBreastNode;
  self->_femaleBreastNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481847, CFSTR("IVS NSFW - MB"), 0.0, 0.0, 0.0);
  maleBreastNode = self->_maleBreastNode;
  self->_maleBreastNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481848, CFSTR("IVS NSFW - BT"), 0.0, 0.0, 0.0);
  buttocksNode = self->_buttocksNode;
  self->_buttocksNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481854, CFSTR("IVS NSFW - Explicit"), 0.68, 0.883, 0.29);
  explicitNode = self->_explicitNode;
  self->_explicitNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481849, CFSTR("IVS NSFW - FG"), 0.0, 0.0, 0.0);
  femaleGenitalsNode = self->_femaleGenitalsNode;
  self->_femaleGenitalsNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481850, CFSTR("IVS NSFW - MG"), 0.0, 0.0, 0.0);
  maleGenitalsNode = self->_maleGenitalsNode;
  self->_maleGenitalsNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481851, CFSTR("IVS NSFW - None"), 0.0, 0.0, 0.0);
  noneNode = self->_noneNode;
  self->_noneNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147481852, CFSTR("IVS NSFW - UW"), 0.0, 0.0, 0.0);
  underwearNode = self->_underwearNode;
  self->_underwearNode = v19;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *femaleBreastNode;
  CLSSignalNode *v4;
  void *v7;

  switch(a3)
  {
    case 0x7FFFF8F6uLL:
      femaleBreastNode = self->_femaleBreastNode;
      goto LABEL_11;
    case 0x7FFFF8F7uLL:
      femaleBreastNode = self->_maleBreastNode;
      goto LABEL_11;
    case 0x7FFFF8F8uLL:
      femaleBreastNode = self->_buttocksNode;
      goto LABEL_11;
    case 0x7FFFF8F9uLL:
      femaleBreastNode = self->_femaleGenitalsNode;
      goto LABEL_11;
    case 0x7FFFF8FAuLL:
      femaleBreastNode = self->_maleGenitalsNode;
      goto LABEL_11;
    case 0x7FFFF8FBuLL:
      femaleBreastNode = self->_noneNode;
      goto LABEL_11;
    case 0x7FFFF8FCuLL:
      femaleBreastNode = self->_underwearNode;
      goto LABEL_11;
    case 0x7FFFF8FDuLL:
      femaleBreastNode = self->_anyNode;
      goto LABEL_11;
    case 0x7FFFF8FEuLL:
      femaleBreastNode = self->_explicitNode;
LABEL_11:
      v4 = femaleBreastNode;
      break;
    default:
      if (-[CLSIVSNSFWModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IVS NSFW - Unknown (%X)"), a3);
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
  return (a3 & 0x7FFFFF00) == 2147481600;
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  void *v6;
  double v7;
  double v8;
  unint64_t version;
  double v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", &unk_2514A19A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v12, "setIsRecallinglyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v8));
  objc_msgSend(v12, "setIsNSFWExplicit:", -[CLSSignalNode passesWithConfidence:](self->_explicitNode, "passesWithConfidence:", v8));
  objc_msgSend(v12, "setIsPreciselyNSFWExplicit:", -[CLSSignalNode passesHighRecallWithConfidence:](self->_explicitNode, "passesHighRecallWithConfidence:", v8));
  version = self->_version;
  if (version > 0x61)
  {
    v10 = 0.883;
LABEL_9:
    objc_msgSend(v12, "setIsVeryPreciselyIVSNSFWExplicit:", v8 >= v10);
    v11 = v12;
    goto LABEL_10;
  }
  v11 = v12;
  if (version > 0x5E)
  {
    v10 = 0.87;
    goto LABEL_9;
  }
  if (version > 0x4B)
  {
    v10 = 0.898;
    goto LABEL_9;
  }
  if (version >= 0x3D)
  {
    v10 = 0.96;
    goto LABEL_9;
  }
LABEL_10:

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
  v8[2] = __28__CLSIVSNSFWModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_anyNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_femaleBreastNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_maleBreastNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_buttocksNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_explicitNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_femaleGenitalsNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_maleGenitalsNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_noneNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_underwearNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)anyNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)femaleBreastNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)maleBreastNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)buttocksNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)explicitNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)femaleGenitalsNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)maleGenitalsNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)noneNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)underwearNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underwearNode, 0);
  objc_storeStrong((id *)&self->_noneNode, 0);
  objc_storeStrong((id *)&self->_maleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_femaleGenitalsNode, 0);
  objc_storeStrong((id *)&self->_explicitNode, 0);
  objc_storeStrong((id *)&self->_buttocksNode, 0);
  objc_storeStrong((id *)&self->_maleBreastNode, 0);
  objc_storeStrong((id *)&self->_femaleBreastNode, 0);
  objc_storeStrong((id *)&self->_anyNode, 0);
}

void __28__CLSIVSNSFWModel_modelInfo__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v4;
  uint64_t v5;

  v3 = 95;
  v4 = 76;
  v5 = 61;
  if (a3 < 0x3D)
    v5 = 0;
  if (a3 <= 0x4B)
    v4 = v5;
  if (a3 <= 0x5E)
    v3 = v4;
  if (a3 <= 0x61)
    return v3;
  else
    return 98;
}

+ (NSString)name
{
  return (NSString *)CFSTR("IVS NSFW");
}

+ (unint64_t)latestVersion
{
  return 98;
}

@end
