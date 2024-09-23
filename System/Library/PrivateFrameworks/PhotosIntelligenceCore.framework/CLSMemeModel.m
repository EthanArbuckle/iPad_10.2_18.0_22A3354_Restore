@implementation CLSMemeModel

- (CLSMemeModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSMemeModel *v4;
  CLSMemeModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSMemeModel;
  v4 = -[CLSMemeModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x3E)
    {
      if (a3 < 0x3B)
      {
        if (a3 < 0x37)
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
          -[CLSMemeModel setupVersion55](v4, "setupVersion55");
        }
      }
      else
      {
        -[CLSMemeModel setupVersion59](v4, "setupVersion59");
      }
    }
    else
    {
      -[CLSMemeModel setupVersion62](v4, "setupVersion62");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSMemeModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 62);
}

- (void)setupVersion55
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *documentNode;
  CLSSignalNode *v7;
  CLSSignalNode *memeScreenshotEtcNode;

  self->_version = 55;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482365, CFSTR("Meme - Negative"), 0.889, 0.975, 0.707);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482366, CFSTR("Meme - Document"), 0.406, 0.727, 0.078);
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482367, CFSTR("Meme - MemeScreenshotEtc"), 0.993, 0.997, 0.925);
  memeScreenshotEtcNode = self->_memeScreenshotEtcNode;
  self->_memeScreenshotEtcNode = v7;

}

- (void)setupVersion59
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *documentNode;
  CLSSignalNode *v7;
  CLSSignalNode *memeScreenshotEtcNode;

  self->_version = 59;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482365, CFSTR("Meme - Negative"), 0.858, 0.935, 0.232);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482366, CFSTR("Meme - Document"), 0.543, 0.866, 0.282);
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482367, CFSTR("Meme - MemeScreenshotEtc"), 0.976, 0.996, 0.868);
  memeScreenshotEtcNode = self->_memeScreenshotEtcNode;
  self->_memeScreenshotEtcNode = v7;

}

- (void)setupVersion62
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *documentNode;
  CLSSignalNode *v7;
  CLSSignalNode *memeScreenshotEtcNode;

  self->_version = 62;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482365, CFSTR("Meme - Negative"), 0.98, 0.997, 0.868);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482366, CFSTR("Meme - Document"), 0.838, 0.955, 0.556);
  documentNode = self->_documentNode;
  self->_documentNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147482367, CFSTR("Meme - MemeScreenshotEtc"), 0.91, 0.98, 0.6);
  memeScreenshotEtcNode = self->_memeScreenshotEtcNode;
  self->_memeScreenshotEtcNode = v7;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  uint64_t v4;
  CLSSignalNode *v5;
  void *v7;

  switch((_DWORD)a3)
  {
    case 0x7FFFFAFF:
      -[CLSMemeModel memeScreenshotEtcNode](self, "memeScreenshotEtcNode");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0x7FFFFAFE:
      -[CLSMemeModel documentNode](self, "documentNode");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0x7FFFFAFD:
      -[CLSMemeModel negativeNode](self, "negativeNode");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (CLSSignalNode *)v4;
      return v5;
  }
  if (-[CLSMemeModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Meme - Unknown (%X)"), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v7, 0.0, 0.0, 0.0);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)modelInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  -[CLSMemeModel negativeNode](self, "negativeNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signalInfoWithIsHierarchical:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSMemeModel documentNode](self, "documentNode", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signalInfoWithIsHierarchical:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  -[CLSMemeModel memeScreenshotEtcNode](self, "memeScreenshotEtcNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalInfoWithIsHierarchical:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482112;
}

- (BOOL)isMemeExclusiveFromSceneClassifications:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[CLSMemeModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", objc_msgSend(v10, "sceneIdentifier", (_QWORD)v12)))
        {
          if (-[CLSSignalNode passesWithSignal:](self->_negativeNode, "passesWithSignal:", v10))
            goto LABEL_12;
          v7 |= -[CLSSignalNode passesWithSignal:](self->_memeScreenshotEtcNode, "passesWithSignal:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
LABEL_12:
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)isMemeFromSceneClassifications:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[CLSMemeModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", objc_msgSend(v10, "sceneIdentifier", (_QWORD)v12)))
        {
          if (-[CLSSignalNode passesWithSignal:](self->_negativeNode, "passesWithSignal:", v10))
            goto LABEL_14;
          if (-[CLSSignalNode passesWithSignal:](self->_memeScreenshotEtcNode, "passesWithSignal:", v10)
            || -[CLSSignalNode passesWithSignal:](self->_documentNode, "passesWithSignal:", v10))
          {
            v7 = 1;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
LABEL_14:
    v7 = 0;
  }

  return v7 & 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)negativeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)documentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)memeScreenshotEtcNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memeScreenshotEtcNode, 0);
  objc_storeStrong((id *)&self->_documentNode, 0);
  objc_storeStrong((id *)&self->_negativeNode, 0);
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 59;
  v4 = 55;
  if (a3 < 0x37)
    v4 = 0;
  if (a3 <= 0x3A)
    v3 = v4;
  if (a3 <= 0x3D)
    return v3;
  else
    return 62;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Meme Model");
}

+ (unint64_t)latestVersion
{
  return 62;
}

@end
