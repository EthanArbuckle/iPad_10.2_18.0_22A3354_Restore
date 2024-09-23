@implementation VUIPlaybackUtilities

+ (BOOL)playerIsLive:(id)a3
{
  double v3;

  objc_msgSend(a3, "duration");
  return v3 == *MEMORY[0x1E0DB1990];
}

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3;
  double v4;
  unint64_t v5;

  v3 = 0.0;
  if (a3 > 0.0 && a3 != 3.40282347e38)
  {
    if (a3 < 10.0)
      return a3;
    if (a3 >= 900.0)
    {
      if (a3 >= 1800.0)
      {
        if (a3 >= 3900.0)
        {
          if (a3 >= 6000.0)
          {
            v4 = -660.0;
            return a3 + v4;
          }
          v5 = 0xC07E000000000000;
        }
        else
        {
          v5 = 0xC06E000000000000;
        }
        v4 = *(double *)&v5;
      }
      else
      {
        v4 = -180.0;
      }
    }
    else
    {
      v4 = -10.0;
    }
    return a3 + v4;
  }
  return v3;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4
{
  double result;
  double v6;
  BOOL v7;

  result = 0.0;
  if (a3 >= 15.0 && a4 > 0.0 && a4 != 3.40282347e38)
  {
    objc_msgSend(a1, "playedThresholdTimeForDuration:", a4);
    v7 = v6 <= a3;
    result = 0.0;
    if (!v7)
      return a3;
  }
  return result;
}

+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6
{
  return objc_msgSend(a1, "playedStateForDuration:elapsedTime:hasBeenPlayed:playCount:respectPlayCount:", a5, a6, 1, a3, a4);
}

+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7
{
  int64_t v8;
  double v9;

  if (!a6 || a7)
  {
    v8 = 3;
    if (a6)
      return v8;
    v8 = 1;
    if (!a5)
      return v8;
    if (a4 < 15.0)
      return 1;
  }
  else if (a4 < 15.0)
  {
    return 3;
  }
  objc_msgSend(a1, "playedThresholdTimeForDuration:", a5, a3);
  v8 = 3;
  if (v9 > a4)
    return 2;
  return v8;
}

@end
