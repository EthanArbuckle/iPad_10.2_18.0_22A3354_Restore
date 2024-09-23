@implementation ICSDuration

- (ICSDuration)initWithWeeks:(int64_t)a3 days:(int64_t)a4 hours:(int64_t)a5 minutes:(int64_t)a6 seconds:(int64_t)a7
{
  ICSDuration *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICSDuration;
  result = -[ICSDuration init](&v13, sel_init);
  if (result)
    result->_duration = (double)(604800 * a3 + 86400 * a4 + 3600 * a5 + 60 * a6 + a7);
  return result;
}

- (double)timeInterval
{
  return self->_duration;
}

- (int64_t)weeks
{
  return (uint64_t)self->_duration / 604800;
}

- (int64_t)days
{
  return (int)(uint64_t)self->_duration % 604800 / 86400;
}

- (int64_t)hours
{
  return (int)(uint64_t)self->_duration % 86400 / 3600;
}

- (int64_t)minutes
{
  return (int)(((__int16)((34953 * ((int)(uint64_t)self->_duration % 3600)) >> 16) >> 5)
             + ((((int)(uint64_t)self->_duration % 3600
                + ((-30583 * ((int)(uint64_t)self->_duration % 3600)) >> 16)) & 0x8000) >> 15));
}

- (int64_t)seconds
{
  return (uint64_t)self->_duration % 60;
}

- (BOOL)isNegative
{
  return self->_duration < 0.0;
}

+ (id)generateDurationFromICSString:(id)a3
{
  return +[ICSDuration durationFromICSString:](ICSDuration, "durationFromICSString:", a3);
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  ICSStringWriter *v5;
  void *v6;

  v5 = objc_alloc_init(ICSStringWriter);
  -[ICSDuration _ICSStringWithOptions:appendingToString:](self, "_ICSStringWithOptions:appendingToString:", a3, v5);
  -[ICSStringWriter result](v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("Duration"), self->_duration);
}

- (ICSDuration)initWithCoder:(id)a3
{
  id v4;
  ICSDuration *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSDuration;
  v5 = -[ICSDuration init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Duration"));
    v5->_duration = v6;
  }

  return v5;
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  id v17;

  v17 = a4;
  if (-[ICSDuration isNegative](self, "isNegative"))
    objc_msgSend(v17, "appendString:", CFSTR("-"));
  objc_msgSend(v17, "appendString:", CFSTR("P"));
  v5 = -[ICSDuration weeks](self, "weeks");
  v6 = -[ICSDuration days](self, "days");
  v7 = -[ICSDuration hours](self, "hours");
  v8 = -[ICSDuration minutes](self, "minutes");
  v9 = -[ICSDuration seconds](self, "seconds");
  v10 = v9;
  if (!v5 || v6 || v7 || v8 || v9)
  {
    v5 = v6 - v5 + 8 * v5;
    if (!v5)
      goto LABEL_15;
    v11 = CFSTR("%ldD");
  }
  else
  {
    v11 = CFSTR("%ldW");
  }
  if (v5 >= 0)
    v12 = v5;
  else
    v12 = -v5;
  objc_msgSend(v17, "appendFormat:", v11, v12);
LABEL_15:
  if (v7 || v8 || v10)
  {
    objc_msgSend(v17, "appendString:", CFSTR("T"));
    if (v7)
    {
      if (v7 >= 0)
        v13 = v7;
      else
        v13 = -v7;
      objc_msgSend(v17, "appendFormat:", CFSTR("%ldH"), v13);
    }
    if (v8)
    {
      if (v8 >= 0)
        v14 = v8;
      else
        v14 = -v8;
      objc_msgSend(v17, "appendFormat:", CFSTR("%ldM"), v14);
    }
    if (v10)
    {
      if (v10 >= 0)
        v15 = v10;
      else
        v15 = -v10;
      objc_msgSend(v17, "appendFormat:", CFSTR("%ldS"), v15);
    }
  }
  -[ICSDuration timeInterval](self, "timeInterval");
  if (fabs(v16) < 2.22044605e-16)
    objc_msgSend(v17, "appendString:", CFSTR("T0S"));

}

+ (id)durationFromRFC2445UTF8String:(const char *)a3
{
  int v3;
  int v4;
  ICSDuration *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  const char *v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  unsigned __int8 v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;

  if (!a3)
  {
    v5 = 0;
    return v5;
  }
  v3 = *(unsigned __int8 *)a3;
  if (v3 == 45)
  {
    v4 = -1;
    goto LABEL_8;
  }
  v4 = 1;
  if (v3 == 43)
  {
LABEL_8:
    v6 = *(unsigned __int8 *)++a3;
    v3 = v6;
  }
  if (v3 == 80)
  {
    v7 = -1;
    while (2)
    {
      v8 = -1;
      while (1)
      {
        v10 = a3 + 1;
        v9 = *((unsigned __int8 *)a3 + 1);
        if (!a3[1] || v9 == 84)
        {
          v15 = 1;
          if (v9 == 84)
          {
            v15 = 2;
            v10 = a3 + 2;
          }
          v16 = a3[v15];
          if (v16)
          {
            v17 = -1;
            v18 = -1;
            v19 = -1;
            while ((v16 - 58) >= 0xF6u)
            {
              v20 = 0;
              ++v10;
              do
              {
                v20 = 10 * v20 + v16 - 48;
                v22 = *v10++;
                v21 = v22;
                v16 = v22;
              }
              while ((v22 - 48) < 0xA);
              if (!v21)
                break;
              if (v21 == 83)
              {
                if (v17 != -1)
                  goto LABEL_54;
              }
              else
              {
                if (v21 == 77)
                {
                  v5 = 0;
                  if (v18 != -1 || v17 != -1)
                    return v5;
                  v18 = v20;
                }
                else
                {
                  if (v21 != 72)
                    goto LABEL_54;
                  v5 = 0;
                  if (v19 != -1 || v18 != -1 || v17 != -1)
                    return v5;
                  v18 = -1;
                  v19 = v20;
                }
                v20 = -1;
              }
              v16 = *v10;
              v17 = v20;
              if (!*v10)
                goto LABEL_49;
            }
          }
          else
          {
            v19 = -1;
            v18 = -1;
            v20 = -1;
LABEL_49:
            if (v7 != -1 || v8 != -1 || v19 != -1 || v18 != -1 || v20 != -1)
            {
              if (v7 == -1)
                v24 = 0;
              else
                v24 = v7;
              if (v8 == -1)
                v25 = 0;
              else
                v25 = v8;
              if (v19 == -1)
                v26 = 0;
              else
                v26 = v19;
              if (v18 == -1)
                v27 = 0;
              else
                v27 = v18;
              if (v20 == -1)
                v28 = 0;
              else
                v28 = v20;
              v5 = -[ICSDuration initWithWeeks:days:hours:minutes:seconds:]([ICSDuration alloc], "initWithWeeks:days:hours:minutes:seconds:", v24 * v4, v25 * v4, v26 * v4, v27 * v4, v28 * v4);
              return v5;
            }
          }
          goto LABEL_54;
        }
        if ((v9 - 58) < 0xF6u)
          goto LABEL_54;
        v11 = 0;
        ++a3;
        do
        {
          v11 = 10 * v11 + v9 - 48;
          v13 = *++a3;
          v12 = v13;
          LOBYTE(v9) = v13;
        }
        while ((v13 - 48) < 0xA);
        if (!v12)
          goto LABEL_54;
        if (v12 != 68)
          break;
        v14 = v8 == -1;
        v8 = v11;
        if (!v14)
          goto LABEL_54;
      }
      if (v12 != 87)
        goto LABEL_54;
      v5 = 0;
      if (v7 == -1)
      {
        v7 = v11;
        if (v8 == -1)
          continue;
      }
      break;
    }
  }
  else
  {
LABEL_54:
    v5 = 0;
  }
  return v5;
}

+ (id)durationFromICSString:(id)a3
{
  return +[ICSDuration durationFromRFC2445UTF8String:](ICSDuration, "durationFromRFC2445UTF8String:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

@end
