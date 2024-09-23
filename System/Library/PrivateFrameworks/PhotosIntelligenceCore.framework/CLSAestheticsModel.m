@implementation CLSAestheticsModel

- (CLSAestheticsModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSAestheticsModel *v4;
  CLSAestheticsModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSAestheticsModel;
  v4 = -[CLSAestheticsModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x56)
    {
      if (a3 < 0x20)
      {
        if (a3 == 31)
        {
          -[CLSAestheticsModel setupVersion31](v4, "setupVersion31");
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
        -[CLSAestheticsModel setupVersion32](v4, "setupVersion32");
      }
    }
    else
    {
      -[CLSAestheticsModel setupVersion86](v4, "setupVersion86");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSAestheticsModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 86);
}

- (void)setupVersion31
{
  CLSSignalNode *v3;
  CLSSignalNode *overallAestheticScoreNode;
  CLSSignalNode *v5;
  CLSSignalNode *wellFramedSubjectScoreNode;
  CLSSignalNode *v7;
  CLSSignalNode *wellChosenSubjectScoreNode;
  CLSSignalNode *v9;
  CLSSignalNode *tastefullyBlurredScoreNode;
  CLSSignalNode *v11;
  CLSSignalNode *sharplyFocusedSubjectScoreNode;
  CLSSignalNode *v13;
  CLSSignalNode *wellTimedShotScoreNode;
  CLSSignalNode *v15;
  CLSSignalNode *pleasantLightingScoreNode;
  CLSSignalNode *v17;
  CLSSignalNode *pleasantReflectionsScoreNode;
  CLSSignalNode *v19;
  CLSSignalNode *harmoniousColorScoreNode;
  CLSSignalNode *v21;
  CLSSignalNode *livelyColorScoreNode;
  CLSSignalNode *v23;
  CLSSignalNode *pleasantSymmetryScoreNode;
  CLSSignalNode *v25;
  CLSSignalNode *pleasantPatternScoreNode;
  CLSSignalNode *v27;
  CLSSignalNode *immersivenessScoreNode;
  CLSSignalNode *v29;
  CLSSignalNode *pleasantPerspectiveScoreNode;
  CLSSignalNode *v31;
  CLSSignalNode *pleasantPostProcessingScoreNode;
  CLSSignalNode *v33;
  CLSSignalNode *noiseScoreNode;
  CLSSignalNode *v35;
  CLSSignalNode *failureScoreNode;
  CLSSignalNode *v37;
  CLSSignalNode *pleasantCompositionScoreNode;
  CLSSignalNode *v39;
  CLSSignalNode *interestingSubjectScoreNode;
  CLSSignalNode *v41;
  CLSSignalNode *intrusiveObjectPresenceScoreNode;
  CLSSignalNode *v43;
  CLSSignalNode *pleasantCameraTiltScoreNode;
  CLSSignalNode *v45;
  CLSSignalNode *lowLightNode;

  self->_version = 31;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Overall Aesthetics"), 0.1, 0.18, 0.1);
  overallAestheticScoreNode = self->_overallAestheticScoreNode;
  self->_overallAestheticScoreNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Well Framed Subject"), 0.0, 0.0, 0.0);
  wellFramedSubjectScoreNode = self->_wellFramedSubjectScoreNode;
  self->_wellFramedSubjectScoreNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Well Chosen Subject"), 0.0, 0.0, 0.0);
  wellChosenSubjectScoreNode = self->_wellChosenSubjectScoreNode;
  self->_wellChosenSubjectScoreNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Tastefully Blurred"), -0.92, -0.29, -0.92);
  tastefullyBlurredScoreNode = self->_tastefullyBlurredScoreNode;
  self->_tastefullyBlurredScoreNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Sharply Focused Subject"), 0.0, 0.0, 0.0);
  sharplyFocusedSubjectScoreNode = self->_sharplyFocusedSubjectScoreNode;
  self->_sharplyFocusedSubjectScoreNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Well Timed Shot"), 0.0, 0.0, 0.0);
  wellTimedShotScoreNode = self->_wellTimedShotScoreNode;
  self->_wellTimedShotScoreNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Lighting"), -0.76, -0.65, -0.76);
  pleasantLightingScoreNode = self->_pleasantLightingScoreNode;
  self->_pleasantLightingScoreNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Reflections"), 0.0, 0.0, 0.0);
  pleasantReflectionsScoreNode = self->_pleasantReflectionsScoreNode;
  self->_pleasantReflectionsScoreNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Harmonious Color"), 0.0, 0.0, 0.0);
  harmoniousColorScoreNode = self->_harmoniousColorScoreNode;
  self->_harmoniousColorScoreNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Lively Color"), 0.0, 0.0, 0.0);
  livelyColorScoreNode = self->_livelyColorScoreNode;
  self->_livelyColorScoreNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Symmetry"), 0.0, 0.0, 0.0);
  pleasantSymmetryScoreNode = self->_pleasantSymmetryScoreNode;
  self->_pleasantSymmetryScoreNode = v23;

  v25 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Pattern"), 0.0, 0.0, 0.0);
  pleasantPatternScoreNode = self->_pleasantPatternScoreNode;
  self->_pleasantPatternScoreNode = v25;

  v27 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Immersiveness"), 0.0, 0.0, 0.0);
  immersivenessScoreNode = self->_immersivenessScoreNode;
  self->_immersivenessScoreNode = v27;

  v29 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Perspective"), 0.0, 0.0, 0.0);
  pleasantPerspectiveScoreNode = self->_pleasantPerspectiveScoreNode;
  self->_pleasantPerspectiveScoreNode = v29;

  v31 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Postprocessing"), 0.0, 0.0, 0.0);
  pleasantPostProcessingScoreNode = self->_pleasantPostProcessingScoreNode;
  self->_pleasantPostProcessingScoreNode = v31;

  v33 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Noise"), 0.0, 0.0, 0.0);
  noiseScoreNode = self->_noiseScoreNode;
  self->_noiseScoreNode = v33;

  v35 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Failure"), -0.45, -0.035, -0.45);
  failureScoreNode = self->_failureScoreNode;
  self->_failureScoreNode = v35;

  v37 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Composition"), 0.0, 0.0, 0.0);
  pleasantCompositionScoreNode = self->_pleasantCompositionScoreNode;
  self->_pleasantCompositionScoreNode = v37;

  v39 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Interesting Subject"), 0.0, 0.0, 0.0);
  interestingSubjectScoreNode = self->_interestingSubjectScoreNode;
  self->_interestingSubjectScoreNode = v39;

  v41 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Intrusive Object Presence"), 0.0, 0.0, 0.0);
  intrusiveObjectPresenceScoreNode = self->_intrusiveObjectPresenceScoreNode;
  self->_intrusiveObjectPresenceScoreNode = v41;

  v43 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Pleasant Camera Tilt"), 0.0, 0.0, 0.0);
  pleasantCameraTiltScoreNode = self->_pleasantCameraTiltScoreNode;
  self->_pleasantCameraTiltScoreNode = v43;

  v45 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Low Light"), 0.0, 0.0, 0.0);
  lowLightNode = self->_lowLightNode;
  self->_lowLightNode = v45;

  *(_OWORD *)&self->_aestheticScoreThresholdToBeAwesome = xmmword_24406CCD0;
}

- (void)setupVersion32
{
  CLSSignalNode *v3;
  CLSSignalNode *overallAestheticScoreNode;

  -[CLSAestheticsModel setupVersion31](self, "setupVersion31");
  self->_version = 32;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Overall Aesthetics"), 0.1, 0.22, 0.1);
  overallAestheticScoreNode = self->_overallAestheticScoreNode;
  self->_overallAestheticScoreNode = v3;

  self->_aestheticScoreThresholdToBeAwesome = 0.7;
}

- (void)setupVersion86
{
  CLSSignalNode *v3;
  CLSSignalNode *lowLightNode;

  -[CLSAestheticsModel setupVersion32](self, "setupVersion32");
  self->_version = 86;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("Low Light"), 0.8, 0.8, 0.8);
  lowLightNode = self->_lowLightNode;
  self->_lowLightNode = v3;

}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)overallAestheticScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)wellFramedSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)wellChosenSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)tastefullyBlurredScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)sharplyFocusedSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)wellTimedShotScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)pleasantLightingScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)pleasantReflectionsScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)harmoniousColorScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)livelyColorScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)pleasantSymmetryScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 96, 1);
}

- (CLSSignalNode)pleasantPatternScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 104, 1);
}

- (CLSSignalNode)immersivenessScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 112, 1);
}

- (CLSSignalNode)pleasantPerspectiveScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 120, 1);
}

- (CLSSignalNode)pleasantPostProcessingScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 128, 1);
}

- (CLSSignalNode)noiseScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 136, 1);
}

- (CLSSignalNode)failureScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 144, 1);
}

- (CLSSignalNode)pleasantCompositionScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 152, 1);
}

- (CLSSignalNode)interestingSubjectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 160, 1);
}

- (CLSSignalNode)intrusiveObjectPresenceScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 168, 1);
}

- (CLSSignalNode)pleasantCameraTiltScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 176, 1);
}

- (CLSSignalNode)lowLightNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 184, 1);
}

- (double)aestheticScoreThresholdToBeAwesome
{
  return self->_aestheticScoreThresholdToBeAwesome;
}

- (double)aestheticScoreThresholdToBeAestheticallyPrettyGood
{
  return self->_aestheticScoreThresholdToBeAestheticallyPrettyGood;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowLightNode, 0);
  objc_storeStrong((id *)&self->_pleasantCameraTiltScoreNode, 0);
  objc_storeStrong((id *)&self->_intrusiveObjectPresenceScoreNode, 0);
  objc_storeStrong((id *)&self->_interestingSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantCompositionScoreNode, 0);
  objc_storeStrong((id *)&self->_failureScoreNode, 0);
  objc_storeStrong((id *)&self->_noiseScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPostProcessingScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPerspectiveScoreNode, 0);
  objc_storeStrong((id *)&self->_immersivenessScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantPatternScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantSymmetryScoreNode, 0);
  objc_storeStrong((id *)&self->_livelyColorScoreNode, 0);
  objc_storeStrong((id *)&self->_harmoniousColorScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantReflectionsScoreNode, 0);
  objc_storeStrong((id *)&self->_pleasantLightingScoreNode, 0);
  objc_storeStrong((id *)&self->_wellTimedShotScoreNode, 0);
  objc_storeStrong((id *)&self->_sharplyFocusedSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_tastefullyBlurredScoreNode, 0);
  objc_storeStrong((id *)&self->_wellChosenSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_wellFramedSubjectScoreNode, 0);
  objc_storeStrong((id *)&self->_overallAestheticScoreNode, 0);
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 32;
  if (a3 == 31)
    v4 = 31;
  else
    v4 = 0;
  if (a3 <= 0x1F)
    v3 = v4;
  if (a3 <= 0x55)
    return v3;
  else
    return 86;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Aesthetics");
}

+ (unint64_t)latestVersion
{
  return 86;
}

+ (double)legacyAestheticScoreThresholdToBeAwesome
{
  return 0.65;
}

+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood
{
  return 0.45;
}

+ (double)legacyAestheticScoreThresholdToNotBeJunk
{
  return 0.1;
}

@end
