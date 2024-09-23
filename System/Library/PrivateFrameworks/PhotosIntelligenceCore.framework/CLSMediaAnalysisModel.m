@implementation CLSMediaAnalysisModel

- (CLSMediaAnalysisModel)initWithMediaAnalysisVersion:(unint64_t)a3
{
  CLSMediaAnalysisModel *v4;
  CLSMediaAnalysisModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSMediaAnalysisModel;
  v4 = -[CLSMediaAnalysisModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x3D)
    {
      if (a3 < 0x3B)
      {
        if (a3 < 0x21)
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
          -[CLSMediaAnalysisModel setupVersion33](v4, "setupVersion33");
        }
      }
      else
      {
        -[CLSMediaAnalysisModel setupVersion59](v4, "setupVersion59");
      }
    }
    else
    {
      -[CLSMediaAnalysisModel setupVersion61](v4, "setupVersion61");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSMediaAnalysisModel initWithMediaAnalysisVersion:](self, "initWithMediaAnalysisVersion:", 61);
}

- (void)setupVersion33
{
  self->_version = 33;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_24406CCB0;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_24406CCC0;
}

- (void)setupVersion59
{
  CLSSignalNode *v3;
  CLSSignalNode *settlingEffectScoreNode;

  self->_version = 59;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_24406CCB0;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_24406CCC0;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("SettlingEffectScore"), 0.7, 0.75, 0.65);
  settlingEffectScoreNode = self->_settlingEffectScoreNode;
  self->_settlingEffectScoreNode = v3;

}

- (void)setupVersion61
{
  CLSSignalNode *v3;
  CLSSignalNode *settlingEffectScoreNode;

  self->_version = 61;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_24406CCB0;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_24406CCC0;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0, CFSTR("SettlingEffectScore"), 0.7, 0.75, 0.65);
  settlingEffectScoreNode = self->_settlingEffectScoreNode;
  self->_settlingEffectScoreNode = v3;

}

- (unint64_t)version
{
  return self->_version;
}

- (double)videoScoreThresholdToBeInteresting
{
  return self->_videoScoreThresholdToBeInteresting;
}

- (double)videoScoreThresholdToNotBeJunk
{
  return self->_videoScoreThresholdToNotBeJunk;
}

- (double)autoplaySuggestionScoreThresholdToBeInteresting
{
  return self->_autoplaySuggestionScoreThresholdToBeInteresting;
}

- (double)autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset
{
  return self->_autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset;
}

- (CLSSignalNode)settlingEffectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settlingEffectScoreNode, 0);
}

+ (unint64_t)baseMediaAnalysisVersionWithMediaAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = 59;
  v4 = 33;
  if (a3 < 0x21)
    v4 = 0;
  if (a3 <= 0x3A)
    v3 = v4;
  if (a3 <= 0x3C)
    return v3;
  else
    return 61;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Media Analysis");
}

+ (unint64_t)latestVersion
{
  return 61;
}

@end
