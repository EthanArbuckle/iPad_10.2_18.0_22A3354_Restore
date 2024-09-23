@implementation PPSentimentScoreEncoder

+ (char)encodeSentimentScore:(double)a3
{
  double v3;
  BOOL v4;
  double v5;

  if (a3 < -1.0)
    a3 = -1.0;
  v3 = a3 / 0.00787401575;
  v4 = a3 < 1.0;
  v5 = 127.0;
  if (v4)
    return (int)v3;
  return (int)v5;
}

+ (double)decodeSentimentScore:(char)a3
{
  return (double)a3 * 0.00787401575;
}

@end
