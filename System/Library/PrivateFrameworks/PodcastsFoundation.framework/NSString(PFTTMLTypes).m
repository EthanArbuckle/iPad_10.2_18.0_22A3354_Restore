@implementation NSString(PFTTMLTypes)

- (double)intervalFromTimecode
{
  char *v1;
  int v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  double v12;
  double v13;
  char *v15;

  v1 = (char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  v2 = 0;
  v3 = &v1[strlen(v1)];
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  while (v1 < v3)
  {
    v7 = v3 - v1;
    while (1)
    {
      v8 = *v1;
      v9 = (v8 - 45);
      v10 = v8 - 48;
      if (v9 < 2 || v10 < 0xA)
        break;
      ++v1;
      if (!--v7)
        goto LABEL_16;
    }
    v15 = 0;
    v12 = strtod(v1, &v15);
    v13 = INFINITY;
    if (fabs(v12) == INFINITY)
      return v13;
    v1 = v15;
    if (v2)
    {
      v4 = v5;
      v5 = v6;
    }
    ++v2;
    v6 = v12;
    if (v2 == 3)
      return v12 + v5 * 60.0 + v4 * 60.0 * 60.0;
  }
LABEL_16:
  v12 = v6;
  return v12 + v5 * 60.0 + v4 * 60.0 * 60.0;
}

@end
