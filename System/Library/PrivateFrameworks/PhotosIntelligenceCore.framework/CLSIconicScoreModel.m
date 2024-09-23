@implementation CLSIconicScoreModel

- (CLSIconicScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSIconicScoreModel *v4;
  CLSIconicScoreModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSIconicScoreModel;
  v4 = -[CLSIconicScoreModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x64)
    {
      if (a3 < 0x60)
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
        -[CLSIconicScoreModel setupVersion96](v4, "setupVersion96");
      }
    }
    else
    {
      -[CLSIconicScoreModel setupVersion100](v4, "setupVersion100");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSIconicScoreModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 100);
}

- (void)setupVersion96
{
  self->_version = 96;
  *(_OWORD *)&self->_lowestPossibleIconicScore = xmmword_24406CC40;
  *(_OWORD *)&self->_mediumIconicScore = xmmword_24406CC50;
  self->_similarIconicScoreThreshold = 0.5;
}

- (void)setupVersion100
{
  self->_version = 100;
  *(_OWORD *)&self->_lowestPossibleIconicScore = xmmword_24406CC60;
  *(_OWORD *)&self->_mediumIconicScore = xmmword_24406CC70;
  self->_similarIconicScoreThreshold = 0.1;
}

- (unint64_t)bucketForIconicScore:(double)a3
{
  if (self->_minimumMeaningfulIconicScore > a3)
    return 0;
  if (self->_mediumIconicScore > a3)
    return 1;
  if (self->_highIconicScore <= a3)
    return 3;
  return 2;
}

- (unint64_t)version
{
  return self->_version;
}

- (double)lowestPossibleIconicScore
{
  return self->_lowestPossibleIconicScore;
}

- (double)minimumMeaningfulIconicScore
{
  return self->_minimumMeaningfulIconicScore;
}

- (double)mediumIconicScore
{
  return self->_mediumIconicScore;
}

- (double)highIconicScore
{
  return self->_highIconicScore;
}

- (double)similarIconicScoreThreshold
{
  return self->_similarIconicScoreThreshold;
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;

  v3 = 96;
  if (a3 < 0x60)
    v3 = 0;
  if (a3 >= 0x64)
    return 100;
  else
    return v3;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Iconic Score");
}

+ (unint64_t)latestVersion
{
  return 100;
}

@end
