@implementation PXStoryDurationFormatter

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  PXStoryDurationFormatter *v2;
  NSDateComponentsFormatter *v3;
  NSDateComponentsFormatter *dateComponentsFormatter;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dateComponentsFormatter)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    dateComponentsFormatter = v2->_dateComponentsFormatter;
    v2->_dateComponentsFormatter = v3;

    -[NSDateComponentsFormatter setAllowedUnits:](v2->_dateComponentsFormatter, "setAllowedUnits:", 224);
    -[NSDateComponentsFormatter setUnitsStyle:](v2->_dateComponentsFormatter, "setUnitsStyle:", 1);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_dateComponentsFormatter, "setZeroFormattingBehavior:", 1);
  }
  objc_sync_exit(v2);

  return v2->_dateComponentsFormatter;
}

- (id)stringFromTimeInterval:(double)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  if (fabs(a3) == INFINITY)
  {
    v4 = CFSTR("<infinite duration>");
    return v4;
  }
  if (a3 != 0.0)
  {
    if (a3 < 0.0)
    {
      -[PXStoryDurationFormatter stringFromTimeInterval:](self, "stringFromTimeInterval:", -a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("-"), "stringByAppendingString:", v5);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      return v4;
    }
    if (a3 * 1000000.0 >= 10.0)
    {
      if (a3 * 1000.0 >= 1.0)
      {
        if (a3 * 1000.0 >= 10.0)
        {
          if (a3 >= 1.0)
          {
            if (a3 >= 10.0)
            {
              -[PXStoryDurationFormatter dateComponentsFormatter](self, "dateComponentsFormatter");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "stringFromTimeInterval:", a3);
              v8 = objc_claimAutoreleasedReturnValue();
              v9 = (void *)v8;
              v10 = CFSTR("?");
              if (v8)
                v10 = (__CFString *)v8;
              v4 = v10;

              goto LABEL_7;
            }
            v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.1fs"), *(_QWORD *)&a3);
          }
          else
          {
            v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.0fms"), a3 * 1000.0);
          }
        }
        else
        {
          v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.1fms"), a3 * 1000.0);
        }
      }
      else
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.0fµs"), a3 * 1000000.0);
      }
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%0.1fµs"), a3 * 1000000.0);
    }
    v4 = (__CFString *)v6;
    return v4;
  }
  v4 = CFSTR("0s");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponentsFormatter, 0);
}

@end
