@implementation CLSTabooEventModel

- (CLSTabooEventModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSTabooEventModel *v4;
  CLSTabooEventModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSTabooEventModel;
  v4 = -[CLSTabooEventModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x32)
      {
        if (a3 < 0x21)
        {
          if (a3 == 32)
          {
            -[CLSTabooEventModel setupVersion32](v4, "setupVersion32");
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
          -[CLSTabooEventModel setupVersion33](v4, "setupVersion33");
        }
      }
      else
      {
        -[CLSTabooEventModel setupVersion50](v4, "setupVersion50");
      }
    }
    else
    {
      -[CLSTabooEventModel setupVersion85](v4, "setupVersion85");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSTabooEventModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 85);
}

- (void)setupVersion32
{
  CLSSignalNode *v3;
  CLSSignalNode *bloodNode;
  CLSSignalNode *v5;
  CLSSignalNode *demonstrationNode;
  CLSSignalNode *v7;
  CLSSignalNode *fireDevastationNode;
  CLSSignalNode *v9;
  CLSSignalNode *floodDevastationNode;
  CLSSignalNode *v11;
  CLSSignalNode *funeralNode;
  CLSSignalNode *v13;
  CLSSignalNode *hospitalNode;
  CLSSignalNode *v15;
  CLSSignalNode *religiousSettingNode;
  CLSSignalNode *v17;
  CLSSignalNode *vehicleCrashNode;
  CLSSignalNode *v19;
  CLSSignalNode *warNode;

  self->_version = 32;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482871, CFSTR("TE - Blood"), 0.24, 0.24, 0.24);
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482872, CFSTR("TE - Demonstration"), 0.75, 0.75, 0.75);
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482873, CFSTR("TE - Fire Devastation"), 0.13, 0.13, 0.13);
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482874, CFSTR("TE - Flood Devastation"), 0.22, 0.22, 0.22);
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482875, CFSTR("TE - Funeral"), 0.33, 0.33, 0.33);
  funeralNode = self->_funeralNode;
  self->_funeralNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482876, CFSTR("TE - Hospital"), 0.52, 0.52, 0.52);
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482877, CFSTR("TE - Religious Setting"), 0.66, 0.66, 0.66);
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482878, CFSTR("TE - Vehicle Crash"), 0.01, 0.01, 0.01);
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482879, CFSTR("TE - War"), 0.26, 0.26, 0.26);
  warNode = self->_warNode;
  self->_warNode = v19;

}

- (void)setupVersion33
{
  CLSSignalNode *v3;
  CLSSignalNode *bloodNode;
  CLSSignalNode *v5;
  CLSSignalNode *demonstrationNode;
  CLSSignalNode *v7;
  CLSSignalNode *destructionNode;
  CLSSignalNode *v9;
  CLSSignalNode *fireDevastationNode;
  CLSSignalNode *v11;
  CLSSignalNode *floodDevastationNode;
  CLSSignalNode *v13;
  CLSSignalNode *funeralNode;
  CLSSignalNode *v15;
  CLSSignalNode *hospitalNode;
  CLSSignalNode *v17;
  CLSSignalNode *religiousSettingNode;
  CLSSignalNode *v19;
  CLSSignalNode *vehicleCrashNode;
  CLSSignalNode *v21;
  CLSSignalNode *warNode;

  self->_version = 33;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482871, CFSTR("TE - Blood"), 0.53, 0.57, 0.14);
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482872, CFSTR("TE - Demonstration"), 0.39, 0.59, 0.25);
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482870, CFSTR("TE - Destruction"), 0.46, 0.49, 0.28);
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482873, CFSTR("TE - Fire Devastation"), 0.5, 0.73, 0.48);
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482874, CFSTR("TE - Flood Devastation"), 0.42, 0.64, 0.18);
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482875, CFSTR("TE - Funeral"), 0.29, 0.65, 0.29);
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482876, CFSTR("TE - Hospital"), 0.46, 0.51, 0.26);
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482877, CFSTR("TE - Religious Setting"), 0.34, 0.49, 0.09);
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482878, CFSTR("TE - Vehicle Crash"), 0.21, 0.27, 0.11);
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482879, CFSTR("TE - War"), 0.12, 0.36, 0.08);
  warNode = self->_warNode;
  self->_warNode = v21;

}

- (void)setupVersion50_4
{
  CLSSignalNode *v3;
  CLSSignalNode *bloodNode;
  CLSSignalNode *v5;
  CLSSignalNode *demonstrationNode;
  CLSSignalNode *v7;
  CLSSignalNode *destructionNode;
  CLSSignalNode *v9;
  CLSSignalNode *fireDevastationNode;
  CLSSignalNode *v11;
  CLSSignalNode *floodDevastationNode;
  CLSSignalNode *v13;
  CLSSignalNode *funeralNode;
  CLSSignalNode *v15;
  CLSSignalNode *hospitalNode;
  CLSSignalNode *v17;
  CLSSignalNode *religiousSettingNode;
  CLSSignalNode *v19;
  CLSSignalNode *vehicleCrashNode;
  CLSSignalNode *v21;
  CLSSignalNode *warNode;

  self->_version = 50;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482871, CFSTR("TE - Blood"), 0.04, 0.16, 0.04);
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482872, CFSTR("TE - Demonstration"), 0.15, 0.22, 0.05);
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482870, CFSTR("TE - Destruction"), 0.11, 0.27, 0.05);
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482873, CFSTR("TE - Fire Devastation"), 0.26, 0.36, 0.06);
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482874, CFSTR("TE - Flood Devastation"), 0.12, 0.18, 0.03);
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482875, CFSTR("TE - Funeral"), 0.16, 0.3, 0.06);
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482876, CFSTR("TE - Hospital"), 0.19, 0.23, 0.05);
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482877, CFSTR("TE - Religious Setting"), 0.13, 0.37, 0.09);
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482878, CFSTR("TE - Vehicle Crash"), 0.1, 0.17, 0.02);
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482879, CFSTR("TE - War"), 0.07, 0.07, 0.03);
  warNode = self->_warNode;
  self->_warNode = v21;

}

- (void)setupVersion85
{
  CLSSignalNode *v3;
  CLSSignalNode *bloodNode;
  CLSSignalNode *v5;
  CLSSignalNode *demonstrationNode;
  CLSSignalNode *v7;
  CLSSignalNode *destructionNode;
  CLSSignalNode *v9;
  CLSSignalNode *fireDevastationNode;
  CLSSignalNode *v11;
  CLSSignalNode *floodDevastationNode;
  CLSSignalNode *v13;
  CLSSignalNode *funeralNode;
  CLSSignalNode *v15;
  CLSSignalNode *hospitalNode;
  CLSSignalNode *v17;
  CLSSignalNode *religiousSettingNode;
  CLSSignalNode *v19;
  CLSSignalNode *vehicleCrashNode;
  CLSSignalNode *v21;
  CLSSignalNode *warNode;

  self->_version = 85;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482871, CFSTR("TE - Blood"), 0.09, 0.32, 0.02);
  bloodNode = self->_bloodNode;
  self->_bloodNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482872, CFSTR("TE - Demonstration"), 0.08, 0.41, 0.06);
  demonstrationNode = self->_demonstrationNode;
  self->_demonstrationNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482870, CFSTR("TE - Destruction"), 0.19, 0.39, 0.04);
  destructionNode = self->_destructionNode;
  self->_destructionNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482873, CFSTR("TE - Fire Devastation"), 0.06, 0.29, 0.04);
  fireDevastationNode = self->_fireDevastationNode;
  self->_fireDevastationNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482874, CFSTR("TE - Flood Devastation"), 0.17, 0.31, 0.04);
  floodDevastationNode = self->_floodDevastationNode;
  self->_floodDevastationNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482875, CFSTR("TE - Funeral"), 0.08, 0.24, 0.03);
  funeralNode = self->_funeralNode;
  self->_funeralNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482876, CFSTR("TE - Hospital"), 0.12, 0.31, 0.05);
  hospitalNode = self->_hospitalNode;
  self->_hospitalNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482877, CFSTR("TE - Religious Setting"), 0.12, 0.28, 0.06);
  religiousSettingNode = self->_religiousSettingNode;
  self->_religiousSettingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482878, CFSTR("TE - Vehicle Crash"), 0.1, 0.21, 0.03);
  vehicleCrashNode = self->_vehicleCrashNode;
  self->_vehicleCrashNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482879, CFSTR("TE - War"), 0.1, 0.19, 0.02);
  warNode = self->_warNode;
  self->_warNode = v21;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *destructionNode;
  void *v5;
  CLSSignalNode *v6;

  switch(a3)
  {
    case 0x7FFFFCF6uLL:
      destructionNode = self->_destructionNode;
      goto LABEL_14;
    case 0x7FFFFCF7uLL:
      destructionNode = self->_bloodNode;
      goto LABEL_14;
    case 0x7FFFFCF8uLL:
      destructionNode = self->_demonstrationNode;
      goto LABEL_14;
    case 0x7FFFFCF9uLL:
      destructionNode = self->_fireDevastationNode;
      goto LABEL_14;
    case 0x7FFFFCFAuLL:
      destructionNode = self->_floodDevastationNode;
      goto LABEL_14;
    case 0x7FFFFCFBuLL:
      destructionNode = self->_funeralNode;
      goto LABEL_14;
    case 0x7FFFFCFCuLL:
      destructionNode = self->_hospitalNode;
      goto LABEL_14;
    case 0x7FFFFCFDuLL:
      destructionNode = self->_religiousSettingNode;
      goto LABEL_14;
    case 0x7FFFFCFEuLL:
      destructionNode = self->_vehicleCrashNode;
      goto LABEL_14;
    case 0x7FFFFCFFuLL:
      destructionNode = self->_warNode;
LABEL_14:
      v6 = destructionNode;
      break;
    default:
      if (-[CLSTabooEventModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TE - Unknown (%X)"), a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v5, 0.0, 0.0, 0.0);

      }
      else
      {
        v6 = 0;
      }
      break;
  }
  return v6;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482624;
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
  v8[2] = __31__CLSTabooEventModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_bloodNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_demonstrationNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_destructionNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_fireDevastationNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_floodDevastationNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_funeralNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_hospitalNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_religiousSettingNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_vehicleCrashNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_warNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)bloodNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)demonstrationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)destructionNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)fireDevastationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)floodDevastationNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)funeralNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)hospitalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)religiousSettingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)vehicleCrashNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)warNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warNode, 0);
  objc_storeStrong((id *)&self->_vehicleCrashNode, 0);
  objc_storeStrong((id *)&self->_religiousSettingNode, 0);
  objc_storeStrong((id *)&self->_hospitalNode, 0);
  objc_storeStrong((id *)&self->_funeralNode, 0);
  objc_storeStrong((id *)&self->_floodDevastationNode, 0);
  objc_storeStrong((id *)&self->_fireDevastationNode, 0);
  objc_storeStrong((id *)&self->_destructionNode, 0);
  objc_storeStrong((id *)&self->_demonstrationNode, 0);
  objc_storeStrong((id *)&self->_bloodNode, 0);
}

void __31__CLSTabooEventModel_modelInfo__block_invoke(uint64_t a1, void *a2)
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

  v3 = 50;
  v4 = 33;
  if (a3 <= 0x20)
    v4 = 32 * (a3 == 32);
  if (a3 <= 0x31)
    v3 = v4;
  if (a3 <= 0x54)
    return v3;
  else
    return 85;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Taboo Event");
}

+ (unint64_t)latestVersion
{
  return 85;
}

@end
