@implementation CLSMemorySimilarityModel

- (CLSMemorySimilarityModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSMemorySimilarityModel *v4;
  CLSMemorySimilarityModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSMemorySimilarityModel;
  v4 = -[CLSMemorySimilarityModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (a3 < 0x50)
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
          -[CLSMemorySimilarityModel setupVersion33](v4, "setupVersion33");
        }
      }
      else
      {
        -[CLSMemorySimilarityModel setupVersion80](v4, "setupVersion80");
      }
    }
    else
    {
      -[CLSMemorySimilarityModel setupVersion84](v4, "setupVersion84");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSMemorySimilarityModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 84);
}

- (void)setupVersion33
{
  *(_OWORD *)&self->_version = xmmword_24406CC80;
  *(int64x2_t *)&self->_identicalSimilarityDistanceThreshold = vdupq_n_s64(0x3FE4FDF3B645A1CBuLL);
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FEE5E353F7CED91uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.8;
}

- (void)setupVersion80
{
  *(_OWORD *)&self->_version = xmmword_24406CC90;
  *(int64x2_t *)&self->_identicalSimilarityDistanceThreshold = vdupq_n_s64(0x3FBBB51018A5B761uLL);
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FCACB8920F04E57uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.209336415;
}

- (void)setupVersion84
{
  *(_OWORD *)&self->_version = xmmword_24406CCA0;
  *(int64x2_t *)&self->_identicalSimilarityDistanceThreshold = vdupq_n_s64(0x3FB581BC02C66AD8uLL);
  *(int64x2_t *)&self->_semanticalSimilarityDistanceThreshold = vdupq_n_s64(0x3FC3205E293205E3uLL);
  self->_semanticalSimilarityWithPersonDistanceThreshold = 0.111111111;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)metric
{
  return self->_metric;
}

- (double)identicalSimilarityDistanceThreshold
{
  return self->_identicalSimilarityDistanceThreshold;
}

- (double)identicalSimilarityWithPeopleDistanceThreshold
{
  return self->_identicalSimilarityWithPeopleDistanceThreshold;
}

- (double)semanticalSimilarityDistanceThreshold
{
  return self->_semanticalSimilarityDistanceThreshold;
}

- (double)semanticalSimilarityWithPeopleDistanceThreshold
{
  return self->_semanticalSimilarityWithPeopleDistanceThreshold;
}

- (double)semanticalSimilarityWithPersonDistanceThreshold
{
  return self->_semanticalSimilarityWithPersonDistanceThreshold;
}

+ (id)name
{
  return CFSTR("Memory Similarity");
}

+ (unint64_t)latestVersion
{
  return 84;
}

@end
