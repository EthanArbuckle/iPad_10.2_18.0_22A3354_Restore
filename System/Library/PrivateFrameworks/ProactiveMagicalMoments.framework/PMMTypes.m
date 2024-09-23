@implementation PMMTypes

+ (id)consumerToString:(unint64_t)a3
{
  if (a3 > 5)
    return 0;
  else
    return off_24D972560[a3];
}

+ (id)predictionSourceToString:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_24D972590[a3];
}

+ (id)predictedAnchorTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x12)
    return CFSTR("Unknown");
  else
    return off_24D9725A8[a3 - 1];
}

@end
