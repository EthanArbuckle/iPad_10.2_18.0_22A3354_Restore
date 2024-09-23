@implementation TVPPlaybackUtilities

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3;
  double v5;
  unint64_t v6;

  v3 = 0.0;
  if (a3 != 0.0 && a3 > 0.0 && a3 != 3.40282347e38)
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
            v5 = -660.0;
            return a3 + v5;
          }
          v6 = 0xC07E000000000000;
        }
        else
        {
          v6 = 0xC06E000000000000;
        }
        v5 = *(double *)&v6;
      }
      else
      {
        v5 = -180.0;
      }
    }
    else
    {
      v5 = -10.0;
    }
    return a3 + v5;
  }
  return v3;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4
{
  double result;

  objc_msgSend(a1, "suggestedBookmarkTimeForElapsedTime:duration:playedThreshold:", 0, a3, a4);
  return result;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4 playedThreshold:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v8 = a5;
  v9 = v8;
  v10 = 0.0;
  if (a4 != 0.0 && a3 >= 15.0 && a4 > 0.0 && a4 != 3.40282347e38)
  {
    if (v8 && (objc_msgSend(v8, "doubleValue", 3.40282347e38), v11 > 0.0))
    {
      objc_msgSend(v9, "doubleValue");
      v13 = fmin(a4, v12);
    }
    else
    {
      objc_msgSend(a1, "playedThresholdTimeForDuration:", a4);
    }
    if (v13 <= a3)
      v10 = 0.0;
    else
      v10 = a3;
  }

  return v10;
}

+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6
{
  return objc_msgSend(a1, "blueDotStateForDuration:elapsedTime:hasBeenPlayed:playCount:respectPlayCount:", a5, a6, 1, a3, a4);
}

+ (int64_t)blueDotStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7
{
  int64_t v8;
  double v9;

  if (!a6 || a7)
  {
    v8 = 2 * (a6 != 0);
    if (a6 || !a5)
      return v8;
    if (a4 < 15.0)
      return 0;
  }
  else if (a4 < 15.0)
  {
    return 2;
  }
  objc_msgSend(a1, "playedThresholdTimeForDuration:", a5, a3);
  v8 = 2;
  if (v9 > a4)
    return 1;
  return v8;
}

@end
