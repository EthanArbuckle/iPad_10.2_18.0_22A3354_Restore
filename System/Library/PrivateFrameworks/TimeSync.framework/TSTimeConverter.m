@implementation TSTimeConverter

- (TSTimeConverter)init
{
  void *v3;
  void *v4;
  void *v5;
  TSTimeConverter *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("tai_utc_history.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[TSTimeConverter initWithContentsOfURL:](self, "initWithContentsOfURL:", v5);
  return v6;
}

- (TSTimeConverter)initWithTAIUTCArray:(id)a3
{
  id v4;
  TSTimeConverter *v5;
  uint64_t v6;
  void *taiutc;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSTimeConverter;
  v5 = -[TSTimeConverter init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = objc_msgSend(v4, "copy");
      taiutc = v5->_taiutc;
      v5->_taiutc = (NSArray *)v6;
    }
    else
    {
      taiutc = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (TSTimeConverter)initWithContentsOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSTAIUTCValue *v11;
  TSTimeConverter *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[TSTAIUTCValue initWithDictionary:]([TSTAIUTCValue alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v12 = -[TSTimeConverter initWithTAIUTCArray:](self, "initWithTAIUTCArray:", v5);

  return v12;
}

- (id)taiDateFromUTCDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSTimeConverter leapSecondForUTCDate:](self, "leapSecondForUTCDate:", v4);
  objc_msgSend(v4, "dateByAddingTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)utcDateFromTAIDate:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[TSTimeConverter leapSecondForTAIDate:](self, "leapSecondForTAIDate:", v4);
  objc_msgSend(v4, "dateByAddingTimeInterval:", -v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)leapSecondForUTCDate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;

  v4 = a3;
  v5 = -[NSArray count](self->_taiutc, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "utcDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (v11 >= 0.0)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
    -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coefficient");
    v15 = v14;

    -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 == 0.0)
    {
      objc_msgSend(v16, "constant");
      v12 = v29;
    }
    else
    {
      objc_msgSend(v16, "utcDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v18);
      v20 = v19 / 86400.0;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (uint64_t)(v20 + (double)(unint64_t)objc_msgSend(v21, "modifiedJulianDay"));

      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constant");
      v24 = v23;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (double)(v22 - objc_msgSend(v25, "offset"));
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "coefficient");
      v12 = v24 + v26 * v28;

    }
  }
  else
  {
LABEL_5:
    v12 = NAN;
  }

  return v12;
}

- (double)leapSecondForTAIDate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;

  v4 = a3;
  v5 = -[NSArray count](self->_taiutc, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "taiDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (v11 >= 0.0)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
    -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coefficient");
    v15 = v14;

    -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 == 0.0)
    {
      objc_msgSend(v16, "constant");
      v12 = v44;
    }
    else
    {
      objc_msgSend(v16, "taiDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v18);
      v20 = v19 / 86400.0;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (uint64_t)(v20 + (double)(unint64_t)objc_msgSend(v21, "modifiedJulianDay"));

      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constant");
      v25 = v24;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (double)(v22 - objc_msgSend(v26, "offset"));
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "coefficient");
      v30 = v29;

      objc_msgSend(v4, "dateByAddingTimeInterval:", -(v25 + v27 * v30));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "utcDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v32);
      v34 = v33 / 86400.0;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (uint64_t)(v34 + (double)(unint64_t)objc_msgSend(v35, "modifiedJulianDay"));

      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constant");
      v39 = v38;
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (double)(v36 - objc_msgSend(v40, "offset"));
      -[NSArray objectAtIndexedSubscript:](self->_taiutc, "objectAtIndexedSubscript:", v7);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "coefficient");
      v12 = v39 + v41 * v43;

    }
  }
  else
  {
LABEL_5:
    v12 = NAN;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taiutc, 0);
}

@end
