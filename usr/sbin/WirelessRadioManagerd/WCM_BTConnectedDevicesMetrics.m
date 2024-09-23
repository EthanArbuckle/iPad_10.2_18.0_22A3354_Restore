@implementation WCM_BTConnectedDevicesMetrics

- (WCM_BTConnectedDevicesMetrics)initWithBTConnections:(WCM_BTConnections *)a3 at:(double)a4
{
  WCM_BTConnectedDevicesMetrics *result;
  __int128 v7;
  __int128 v8;
  unint64_t numLEA;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WCM_BTConnectedDevicesMetrics;
  result = -[WCM_BTConnectedDevicesMetrics init](&v10, "init");
  if (result)
  {
    v7 = *(_OWORD *)&a3->numA2DP;
    v8 = *(_OWORD *)&a3->numeSCO;
    numLEA = a3->numLEA;
    *(_OWORD *)&result->mBTConnections.numHID = *(_OWORD *)&a3->numHID;
    *(_OWORD *)&result->mBTConnections.numeSCO = v8;
    *(_OWORD *)&result->mBTConnections.numA2DP = v7;
    result->mTimestamp = a4;
    result->mBTConnections.numLEA = numLEA;
    result->mDuration = 0.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_BTConnectedDevicesMetrics;
  -[WCM_BTConnectedDevicesMetrics dealloc](&v2, "dealloc");
}

- (unint64_t)numConnections
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->mBTConnections.numA2DP, *(int64x2_t *)&self->mBTConnections.numHID))
       + self->mBTConnections.numeSCO
       + self->mBTConnections.numLE
       + self->mBTConnections.numLEA;
}

- (BOOL)isEqualTo:(WCM_BTConnections *)a3
{
  return self->mBTConnections.numA2DP == a3->numA2DP
      && self->mBTConnections.numLLA == a3->numLLA
      && self->mBTConnections.numHID == a3->numHID
      && self->mBTConnections.numSCO == a3->numSCO
      && self->mBTConnections.numeSCO == a3->numeSCO
      && self->mBTConnections.numLE == a3->numLE
      && self->mBTConnections.numLEA == a3->numLEA;
}

- (BOOL)isSubsetOf:(WCM_BTConnections *)a3
{
  return self->mBTConnections.numA2DP <= a3->numA2DP
      && self->mBTConnections.numLLA <= a3->numLLA
      && self->mBTConnections.numHID <= a3->numHID
      && self->mBTConnections.numSCO <= a3->numSCO
      && self->mBTConnections.numeSCO <= a3->numeSCO
      && self->mBTConnections.numLE <= a3->numLE
      && self->mBTConnections.numLEA <= a3->numLEA;
}

- (BOOL)isTimerActive
{
  return self->mTimestamp != 0.0;
}

- (void)stopWiFi2GTimer:(double)a3 wifi2GStartTime:(double)mTimestamp
{
  if (mTimestamp != 0.0)
  {
    if (self->mTimestamp >= mTimestamp)
      mTimestamp = self->mTimestamp;
    self->mDurInWiFi2G = a3 - mTimestamp + self->mDurInWiFi2G;
  }
}

- (void)stopTimer:(double)a3 wifi2GStartTime:(double)a4
{
  double mTimestamp;

  mTimestamp = self->mTimestamp;
  if (mTimestamp != 0.0)
  {
    self->mDuration = a3 - mTimestamp + self->mDuration;
    -[WCM_BTConnectedDevicesMetrics stopWiFi2GTimer:wifi2GStartTime:](self, "stopWiFi2GTimer:wifi2GStartTime:");
    self->mTimestamp = 0.0;
  }
}

- (void)startTimer:(double)a3
{
  if (self->mTimestamp == 0.0)
    self->mTimestamp = a3;
}

- (id)getEnumerationString
{
  const __CFString *v3;
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (self->mBTConnections.numA2DP)
  {
    if (objc_msgSend(&stru_100219FA0, "length"))
      v3 = CFSTR(",");
    else
      v3 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luA2DP"), &stru_100219FA0, v3, self->mBTConnections.numA2DP);
  }
  else
  {
    v4 = &stru_100219FA0;
  }
  if (self->mBTConnections.numLLA)
  {
    if (-[__CFString length](v4, "length"))
      v5 = CFSTR(",");
    else
      v5 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luLLA"), v4, v5, self->mBTConnections.numLLA);
  }
  if (self->mBTConnections.numHID)
  {
    if (-[__CFString length](v4, "length"))
      v6 = CFSTR(",");
    else
      v6 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luHID"), v4, v6, self->mBTConnections.numHID);
  }
  if (self->mBTConnections.numSCO)
  {
    if (-[__CFString length](v4, "length"))
      v7 = CFSTR(",");
    else
      v7 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luSCO"), v4, v7, self->mBTConnections.numSCO);
  }
  if (self->mBTConnections.numeSCO)
  {
    if (-[__CFString length](v4, "length"))
      v8 = CFSTR(",");
    else
      v8 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%lueSCO"), v4, v8, self->mBTConnections.numeSCO);
  }
  if (self->mBTConnections.numLE)
  {
    if (-[__CFString length](v4, "length"))
      v9 = CFSTR(",");
    else
      v9 = &stru_100219FA0;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luLE"), v4, v9, self->mBTConnections.numLE);
  }
  if (!self->mBTConnections.numLEA)
    return v4;
  if (-[__CFString length](v4, "length"))
    v10 = CFSTR(",");
  else
    v10 = &stru_100219FA0;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%luLEA"), v4, v10, self->mBTConnections.numLEA);
}

- (double)getDuration
{
  return self->mDuration;
}

- (double)getDurationInWiFi2G
{
  return self->mDurInWiFi2G;
}

@end
