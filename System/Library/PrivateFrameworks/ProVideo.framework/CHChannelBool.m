@implementation CHChannelBool

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBool)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return CreateNewOZChannel<OZChannelBool>(a3, a4, a5);
}

- (OZChannelBool)ozChannel
{
  OZChannelBool *result;

  result = (OZChannelBool *)self->super.super.super._pOZChannel;
  if (result)
  return result;
}

- (BOOL)BOOLValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[CHChannelIntegral _intValueAtTime:](self, "_intValueAtTime:", &v4) != 0;
}

- (BOOL)curveBoolValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[CHChannelIntegral _curveIntValueAtTime:](self, "_curveIntValueAtTime:", &v4) != 0;
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minBoolValue:(BOOL *)a5 maxBoolValue:(BOOL *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  uint64_t v10;

  v10 = 0;
  v9 = *a3;
  v8 = *a4;
  -[CHChannelIntegral _getExtremaBetweenStart:end:minIntValue:maxIntValue:](self, "_getExtremaBetweenStart:end:minIntValue:maxIntValue:", &v9, &v8, (char *)&v10 + 4, &v10);
  if (a5)
    *a5 = HIDWORD(v10) != 0;
  if (a6)
    *a6 = (_DWORD)v10 != 0;
}

- (void)setCurveBoolValue:(BOOL)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[CHChannelIntegral _setCurveIntValue:atTime:options:](self, "_setCurveIntValue:atTime:options:", a3, &v5, *(_QWORD *)&a5);
}

- (BOOL)defaultCurveBoolValue
{
  return -[CHChannelIntegral _defaultCurveIntValue](self, "_defaultCurveIntValue") != 0;
}

- (BOOL)minCurveBoolValue
{
  return -[CHChannelIntegral _minCurveIntValue](self, "_minCurveIntValue") != 0;
}

- (BOOL)maxCurveBoolValue
{
  return -[CHChannelIntegral _maxCurveIntValue](self, "_maxCurveIntValue") != 0;
}

- (BOOL)minUIBoolValue
{
  return -[CHChannelIntegral _minUIIntValue](self, "_minUIIntValue") != 0;
}

- (BOOL)maxUIBoolValue
{
  return -[CHChannelIntegral _maxUIIntValue](self, "_maxUIIntValue") != 0;
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4
{
  BOOL result;
  int v6;

  v6 = 0;
  result = -[CHChannelIntegral getFirstKeyframeTime:curveIntValue:](self, "getFirstKeyframeTime:curveIntValue:", a3, &v6);
  if (a4)
    *a4 = v6 != 0;
  return result;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4
{
  BOOL result;
  int v6;

  v6 = 0;
  result = -[CHChannelIntegral getLastKeyframeTime:curveIntValue:](self, "getLastKeyframeTime:curveIntValue:", a3, &v6);
  if (a4)
    *a4 = v6 != 0;
  return result;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5
{
  BOOL result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  int v8;

  v8 = 0;
  v7 = *a3;
  result = -[CHChannelIntegral getKeyframeAfterTime:time:curveIntValue:](self, "getKeyframeAfterTime:time:curveIntValue:", &v7, a4, &v8);
  if (a5)
    *a5 = v8 != 0;
  return result;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5
{
  BOOL result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  int v8;

  v8 = 0;
  v7 = *a3;
  result = -[CHChannelIntegral getKeyframeBeforeTime:time:curveIntValue:](self, "getKeyframeBeforeTime:time:curveIntValue:", &v7, a4, &v8);
  if (a5)
    *a5 = v8 != 0;
  return result;
}

@end
