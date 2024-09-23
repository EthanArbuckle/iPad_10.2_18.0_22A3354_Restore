@implementation CLIndoorAvailabilityTileParams

- (CLIndoorAvailabilityTileParams)initWithAvailabilityTile:(void *)a3
{
  char *v4;
  int v5;
  char v6;
  objc_super v8;
  _BYTE v9[8];
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v8.receiver = self;
  v8.super_class = (Class)CLIndoorAvailabilityTileParams;
  v4 = -[CLIndoorAvailabilityTileParams init](&v8, "init");
  if (!v4)
    return (CLIndoorAvailabilityTileParams *)v4;
  *((double *)v4 + 50) = sub_1000C2B68((uint64_t)a3);
  *((float *)v4 + 84) = sub_1000C2B34((uint64_t)a3);
  *((_DWORD *)v4 + 85) = sub_1000C2B4C((uint64_t)a3);
  *((_DWORD *)v4 + 86) = sub_1000C2C28((uint64_t)a3);
  *((_DWORD *)v4 + 87) = sub_10000E46C((uint64_t)a3);
  *((_DWORD *)v4 + 88) = sub_1000C2C34((uint64_t)a3);
  v5 = sub_1000C2B58((uint64_t)a3);
  v4[328] = v5;
  if (v5)
  {
    sub_1001D1FF0((uint64_t)a3, (uint64_t)v9);
    v6 = v15;
    v4[329] = v15 & 1;
    if ((v6 & 1) != 0)
    {
      *((_DWORD *)v4 + 89) = v11;
      v4[330] = (v6 & 2) != 0;
      if ((v6 & 2) == 0)
      {
LABEL_5:
        v4[331] = (v6 & 4) != 0;
        if ((v6 & 4) == 0)
          goto LABEL_6;
        goto LABEL_19;
      }
    }
    else
    {
      v4[330] = (v6 & 2) != 0;
      if ((v6 & 2) == 0)
        goto LABEL_5;
    }
    *((_DWORD *)v4 + 90) = v12;
    v4[331] = (v6 & 4) != 0;
    if ((v6 & 4) == 0)
    {
LABEL_6:
      v4[332] = (v6 & 8) != 0;
      if ((v6 & 8) == 0)
      {
LABEL_8:
        sub_1001ADA60((uint64_t)v9);
        goto LABEL_10;
      }
LABEL_7:
      *((_DWORD *)v4 + 92) = v14;
      goto LABEL_8;
    }
LABEL_19:
    *((_DWORD *)v4 + 91) = v13;
    v4[332] = (v6 & 8) != 0;
    if ((v6 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(v4 + 329) = 0;
LABEL_10:
  *((_DWORD *)v4 + 93) = sub_1000C2B40((uint64_t)a3);
  v4[333] = sub_1000C2C18((uint64_t)a3);
  *((float *)v4 + 94) = sub_1000C2B28((uint64_t)a3);
  *((_DWORD *)v4 + 95) = sub_100006194((uint64_t)a3);
  *((_DWORD *)v4 + 96) = sub_10000D008((uint64_t)a3);
  *((_DWORD *)v4 + 97) = sub_1000124E0((uint64_t)a3);
  *((_DWORD *)v4 + 98) = sub_1000081B8((uint64_t)a3);
  sub_1000A73BC((uint64_t)a3, v9);
  if (v4[8])
  {
    if (v9[0])
    {
      sub_10009E880((uint64_t)(v4 + 16), (uint64_t)&v10);
      if (!v9[0])
        return (CLIndoorAvailabilityTileParams *)v4;
      goto LABEL_22;
    }
    sub_1000A87F4((_QWORD *)v4 + 2);
    v4[8] = 0;
    if (v9[0])
LABEL_22:
      sub_1000A87F4(&v10);
  }
  else if (v9[0])
  {
    sub_1000A7424((uint64_t)(v4 + 16), (uint64_t)&v10);
    v4[8] = 1;
    if (v9[0])
      goto LABEL_22;
  }
  return (CLIndoorAvailabilityTileParams *)v4;
}

- (void).cxx_destruct
{
  if (self->_optionalParams.m_initialized)
  {
    sub_1000A87F4((a8 *)((char *)&self->_optionalParams.m_storage.dummy_.aligner_ + 7));
    self->_optionalParams.m_initialized = 0;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  return self;
}

- (CLIndoorAvailabilityTileParams)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLIndoorAvailabilityTileParams;
  return -[CLIndoorAvailabilityTileParams init](&v3, "init");
}

- (optional<proto::params::LocalizerParameters>)localizerParams
{
  _BYTE *v2;
  _BYTE *v3;
  optional<proto::params::LocalizerParameters> result;

  v3 = v2;
  *v2 = 0;
  if (self->_optionalParams.m_initialized)
  {
    self = (CLIndoorAvailabilityTileParams *)sub_1000A7424((uint64_t)(v2 + 8), (uint64_t)&self->_optionalParams.m_storage.dummy_.aligner_ + 7);
    *v3 = 1;
  }
  result.m_storage.dummy_.data[7] = (char)a2;
  result.m_initialized = (char)self;
  *(_DWORD *)result.m_storage.dummy_.data = *(_DWORD *)((char *)&self + 1);
  *((_WORD *)&result.m_storage.dummy_.aligner_ + 2) = *(_WORD *)((char *)&self + 5);
  result.m_storage.dummy_.data[6] = HIBYTE(self);
  return result;
}

- (double)availabilityZScoreConfidenceInterval
{
  return self->_availabilityZScoreConfidenceInterval;
}

- (float)indoorNumberOfDaysBeforeTileRedownload
{
  return self->_indoorNumberOfDaysBeforeTileRedownload;
}

- (unsigned)indoorLocationOfInterestMergeRadiusKM
{
  return self->_indoorLocationOfInterestMergeRadiusKM;
}

- (unsigned)indoorPrefetchMaxFloorCount
{
  return self->_indoorPrefetchMaxFloorCount;
}

- (unsigned)indoorPrefetchMaxTotalBytes
{
  return self->_indoorPrefetchMaxTotalBytes;
}

- (unsigned)indoorPrefetchRadiusKM
{
  return self->_indoorPrefetchRadiusKM;
}

- (BOOL)hasMotionActivityDebounceParameters
{
  return self->_hasMotionActivityDebounceParameters;
}

- (BOOL)hasNonFitnessToCyclingSeconds
{
  return self->_hasNonFitnessToCyclingSeconds;
}

- (unsigned)nonFitnessToCyclingSeconds
{
  return self->_nonFitnessToCyclingSeconds;
}

- (BOOL)hasNonFitnessToRunningSeconds
{
  return self->_hasNonFitnessToRunningSeconds;
}

- (unsigned)nonFitnessToRunningSeconds
{
  return self->_nonFitnessToRunningSeconds;
}

- (BOOL)hasRunningToNonFitnessSeconds
{
  return self->_hasRunningToNonFitnessSeconds;
}

- (unsigned)runningToNonFitnessSeconds
{
  return self->_runningToNonFitnessSeconds;
}

- (BOOL)hasCyclingToNonFitnessSeconds
{
  return self->_hasCyclingToNonFitnessSeconds;
}

- (unsigned)cyclingToNonFitnessSeconds
{
  return self->_cyclingToNonFitnessSeconds;
}

- (unsigned)preferPredictionWithinNActivityCycles
{
  return self->_preferPredictionWithinNActivityCycles;
}

- (BOOL)hasRegionalPrefetchMaxFloorCount
{
  return self->_hasRegionalPrefetchMaxFloorCount;
}

- (float)regionalNumberOfDaysBeforeTileRedownload
{
  return self->_regionalNumberOfDaysBeforeTileRedownload;
}

- (unsigned)regionalLocationOfInterestMergeRadiusKM
{
  return self->_regionalLocationOfInterestMergeRadiusKM;
}

- (unsigned)regionalPrefetchMaxFloorCount
{
  return self->_regionalPrefetchMaxFloorCount;
}

- (unsigned)regionalPrefetchMaxTotalBytes
{
  return self->_regionalPrefetchMaxTotalBytes;
}

- (unsigned)regionalPrefetchRadiusKM
{
  return self->_regionalPrefetchRadiusKM;
}

@end
