@implementation PGMusicCurationInflationOptions

- (PGMusicCurationInflationOptions)initWithInflationActionSource:(int64_t)a3
{
  PGMusicCurationInflationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMusicCurationInflationOptions;
  result = -[PGMusicCurationInflationOptions init](&v5, sel_init);
  if (result)
  {
    result->_shouldForceMetadataRefetch = 0;
    result->_inflationActionSource = a3;
  }
  return result;
}

- (PGMusicCurationInflationOptions)initWithRequestOptionsDictionary:(id)a3 inflationActionSource:(int64_t)a4
{
  id v6;
  PGMusicCurationInflationOptions *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = -[PGMusicCurationInflationOptions initWithInflationActionSource:](self, "initWithInflationActionSource:", a4);
  if (v7)
  {
    v8 = *MEMORY[0x1E0D72218];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D72218]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_shouldForceMetadataRefetch = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      v7->_shouldForceMetadataRefetch = 0;
    }

  }
  return v7;
}

- (BOOL)shouldForceMetadataRefetch
{
  return self->_shouldForceMetadataRefetch;
}

- (int64_t)inflationActionSource
{
  return self->_inflationActionSource;
}

- (void)setInflationActionSource:(int64_t)a3
{
  self->_inflationActionSource = a3;
}

+ (id)stringFromInflationActionSource:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_1E8433720[a3];
}

@end
