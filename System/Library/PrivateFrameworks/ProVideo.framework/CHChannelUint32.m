@implementation CHChannelUint32

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelUint32)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return CreateNewOZChannel<OZChannelUint32>(a3, a4, a5);
}

- (OZChannelUint32)ozChannel
{
  OZChannelUint32 *result;

  result = (OZChannelUint32 *)self->super.super.super._pOZChannel;
  if (result)
  return result;
}

- (unsigned)uint32ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[CHChannelIntegral _intValueAtTime:](self, "_intValueAtTime:", &v4);
}

- (unsigned)curveUint32ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[CHChannelIntegral _curveIntValueAtTime:](self, "_curveIntValueAtTime:", &v4);
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minUint32Value:(unsigned int *)a5 maxUint32Value:(unsigned int *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  uint64_t v10;

  v10 = 0;
  v9 = *a3;
  v8 = *a4;
  -[CHChannelIntegral _getExtremaBetweenStart:end:minIntValue:maxIntValue:](self, "_getExtremaBetweenStart:end:minIntValue:maxIntValue:", &v9, &v8, (char *)&v10 + 4, &v10);
  if (a5)
    *a5 = HIDWORD(v10);
  if (a6)
    *a6 = v10;
}

- (void)setCurveUint32Value:(unsigned int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[CHChannelIntegral _setCurveIntValue:atTime:options:](self, "_setCurveIntValue:atTime:options:", *(_QWORD *)&a3, &v5, *(_QWORD *)&a5);
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4
{
  BOOL result;
  unsigned int v6;

  v6 = 0;
  result = -[CHChannelIntegral getFirstKeyframeTime:curveIntValue:](self, "getFirstKeyframeTime:curveIntValue:", a3, &v6);
  if (a4)
    *a4 = v6;
  return result;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4
{
  BOOL result;
  unsigned int v6;

  v6 = 0;
  result = -[CHChannelIntegral getLastKeyframeTime:curveIntValue:](self, "getLastKeyframeTime:curveIntValue:", a3, &v6);
  if (a4)
    *a4 = v6;
  return result;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5
{
  BOOL result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  unsigned int v8;

  v8 = 0;
  v7 = *a3;
  result = -[CHChannelIntegral getKeyframeAfterTime:time:curveIntValue:](self, "getKeyframeAfterTime:time:curveIntValue:", &v7, a4, &v8);
  if (a5)
    *a5 = v8;
  return result;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5
{
  BOOL result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  unsigned int v8;

  v8 = 0;
  v7 = *a3;
  result = -[CHChannelIntegral getKeyframeBeforeTime:time:curveIntValue:](self, "getKeyframeBeforeTime:time:curveIntValue:", &v7, a4, &v8);
  if (a5)
    *a5 = v8;
  return result;
}

@end
