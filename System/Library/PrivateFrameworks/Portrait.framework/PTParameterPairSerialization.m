@implementation PTParameterPairSerialization

+ (void)appendFloatParameter:(unsigned __int16)a3 value:(float)a4 toOutput:(id *)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;

  v6 = *a5;
  *(_WORD *)v6 = __rev16(a3);
  *((_WORD *)v6 + 1) = 256;
  _PTSwapBigAssignFloat((_DWORD *)v6 + 1, a4);
  *a5 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)*a5 + 8);
}

+ (void)appendUIntParameter:(unsigned __int16)a3 value:(unsigned int)a4 toOutput:(id *)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;

  v5 = *a5;
  *(_WORD *)v5 = __rev16(a3);
  *((_WORD *)v5 + 1) = 512;
  *((_DWORD *)v5 + 1) = bswap32(a4);
  *a5 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)*a5 + 8);
}

+ (void)appendCMTimeParameter:(unsigned __int16)a3 value:(id *)a4 scale:(int)a5 toOutput:(id *)a6
{
  uint64_t v7;
  uint64_t v10;
  unint64_t v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  CMTime v16;
  CMTime time;
  uint64_t v18;

  v7 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if ((a4->var2 & 0x1D) == 1)
  {
    memset(&v16, 0, sizeof(v16));
    time = *(CMTime *)a4;
    CMTimeMultiply(&v16, &time, 90000);
    time = v16;
    v10 = llround(CMTimeGetSeconds(&time));
    if (v10 >= 0)
      v11 = v10;
    else
      v11 = -v10;
    if (v11 >> 31)
    {
      time = (CMTime)*a4;
      v12 = (__CFString *)CMTimeCopyDescription(0, &time);
      _PTLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 67109634;
        HIDWORD(time.value) = v7;
        LOWORD(time.timescale) = 2112;
        *(_QWORD *)((char *)&time.timescale + 2) = v12;
        WORD1(time.epoch) = 1024;
        HIDWORD(time.epoch) = a5;
        _os_log_error_impl(&dword_1C9281000, v13, OS_LOG_TYPE_ERROR, "Failed to set parameter %d to CMTime value %@ using scale %d", (uint8_t *)&time, 0x18u);
      }

    }
    else
    {
      objc_msgSend(a1, "appendUIntParameter:value:toOutput:", v7);
    }
  }
  else
  {
    v16 = *(CMTime *)a4;
    v14 = (__CFString *)CMTimeCopyDescription(0, &v16);
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[PTParameterPairSerialization appendCMTimeParameter:value:scale:toOutput:].cold.1(v7, (uint64_t)v14, v15);

  }
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6
{
  char Parameter;
  float v9;

  v9 = NAN;
  Parameter = PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 1, &v9);
  if (a6)
    *a6 = Parameter;
  return v9;
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5
{
  float result;

  +[PTParameterPairSerialization getFloatParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getFloatParameter:fromPairs:numPairs:didFindValue:", a3, a4, *(_QWORD *)&a5, 0);
  return result;
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(float)a6
{
  float v7;

  v7 = a6;
  PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 1, &v7);
  return v7;
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6
{
  return +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:withDefault:didFindValue:", a3, a4, *(_QWORD *)&a5, 0x7FFFFFFFLL, a6);
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5
{
  return +[PTParameterPairSerialization getUIntParameter:fromPairs:numPairs:didFindValue:](PTParameterPairSerialization, "getUIntParameter:fromPairs:numPairs:didFindValue:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(unsigned int)a6 didFindValue:(BOOL *)a7
{
  char Parameter;
  unsigned int v10;

  v10 = a6;
  Parameter = PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 2, (float *)&v10);
  if (a7)
    *a7 = Parameter;
  return v10;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)getCMTimeParameter:(SEL)a3 scale:(unsigned __int16)a4 fromPairs:(int)a5 numPairs:(id *)a6 withDefault:(unsigned int)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int64_t value;

  LODWORD(value) = 0;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)PTParameterPairSerialization_GetParameter((uint64_t)a6, a7, a4, 2, (float *)&value);
  if ((_DWORD)result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, (int)value, a5);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a8->var0;
  retstr->var3 = a8->var3;
  return result;
}

+ (void)appendCMTimeParameter:(os_log_t)log value:scale:toOutput:.cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Failed to set parameter %d to non-numeric CMTime value %@", (uint8_t *)v3, 0x12u);
}

@end
