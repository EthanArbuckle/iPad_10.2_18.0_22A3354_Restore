@implementation RCUserActivityTypeTransitionInfo

- (RCUserActivityTypeTransitionInfo)initWithToActivityType:(int64_t)a3 toSubType:(int64_t)a4 fromActivityType:(int64_t)a5 fromSubType:(int64_t)a6 displayModel:(id)a7 waveformDataSource:(id)a8 composition:(id)a9
{
  id v15;
  id v16;
  id v17;
  RCUserActivityTypeTransitionInfo *v18;
  RCUserActivityTypeTransitionInfo *v19;
  objc_super v21;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)RCUserActivityTypeTransitionInfo;
  v18 = -[RCUserActivityTypeTransitionInfo init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    -[RCUserActivityTypeTransitionInfo setToActivityType:](v18, "setToActivityType:", a3);
    -[RCUserActivityTypeTransitionInfo setToSubType:](v19, "setToSubType:", a4);
    -[RCUserActivityTypeTransitionInfo setFromActivityType:](v19, "setFromActivityType:", a5);
    -[RCUserActivityTypeTransitionInfo setFromSubType:](v19, "setFromSubType:", a6);
    -[RCUserActivityTypeTransitionInfo setDisplayModel:](v19, "setDisplayModel:", v15);
    -[RCUserActivityTypeTransitionInfo setWaveformDataSource:](v19, "setWaveformDataSource:", v16);
    -[RCUserActivityTypeTransitionInfo setComposition:](v19, "setComposition:", v17);
  }

  return v19;
}

- (int64_t)toActivityType
{
  return self->_toActivityType;
}

- (void)setToActivityType:(int64_t)a3
{
  self->_toActivityType = a3;
}

- (int64_t)toSubType
{
  return self->_toSubType;
}

- (void)setToSubType:(int64_t)a3
{
  self->_toSubType = a3;
}

- (int64_t)fromActivityType
{
  return self->_fromActivityType;
}

- (void)setFromActivityType:(int64_t)a3
{
  self->_fromActivityType = a3;
}

- (int64_t)fromSubType
{
  return self->_fromSubType;
}

- (void)setFromSubType:(int64_t)a3
{
  self->_fromSubType = a3;
}

- (RCRecordingDisplayModel)displayModel
{
  return self->_displayModel;
}

- (void)setDisplayModel:(id)a3
{
  objc_storeStrong((id *)&self->_displayModel, a3);
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_waveformDataSource, a3);
}

- (RCComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_displayModel, 0);
}

@end
