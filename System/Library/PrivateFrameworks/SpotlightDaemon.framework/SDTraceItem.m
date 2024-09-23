@implementation SDTraceItem

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (int64_t)identifier
{
  return self->_identifier;
}

+ (id)stringFromReferenceDate:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (stringFromReferenceDate__once != -1)
    dispatch_once(&stringFromReferenceDate__once, &__block_literal_global_5);
  v4 = (void *)stringFromReferenceDate__formatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __39__SDTraceItem_stringFromReferenceDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)stringFromReferenceDate__formatter;
  stringFromReferenceDate__formatter = (uint64_t)v0;

  return objc_msgSend((id)stringFromReferenceDate__formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SDTraceItem *v8;

  v4 = (void *)objc_opt_new();
  -[SDTraceItem startTime](self, "startTime");
  objc_msgSend(v4, "setStartTime:");
  objc_msgSend(v4, "setIdentifier:", -[SDTraceItem identifier](self, "identifier"));
  -[SDTraceItem label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  -[SDTraceItem duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  -[SDTraceItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setData:", v6);

  -[SDTraceItem string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setString:", v7);

  v8 = self;
  return v8;
}

+ (void)appendDescription:(id)a3 prefix:(id)a4 toString:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v11 = v7;
    v12 = &stru_24D0EF078;
    if (v8)
      v12 = v8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@   "), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v9, "appendFormat:", CFSTR("\n"));
          +[SDTraceItem appendDescription:prefix:toString:](SDTraceItem, "appendDescription:prefix:toString:", v19, v13, v9);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v16);
    }

    v7 = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v7;
      v20 = v7;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v33;
        if (v8)
          v24 = v8;
        else
          v24 = &stru_24D0EF078;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v20);
            v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v20, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendFormat:", CFSTR("\n%@%@ - "), v8, v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@   "), v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[SDTraceItem appendDescription:prefix:toString:](SDTraceItem, "appendDescription:prefix:toString:", v27, v28, v9);
            }
            else
            {
              objc_msgSend(v27, "description");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:", v28);
            }

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v22);
      }

      v13 = v8;
      v7 = v31;
    }
    else
    {
      if (v8)
        v29 = v8;
      else
        v29 = &stru_24D0EF078;
      objc_msgSend(v7, "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR("%@%@"), v29, v30);

      v13 = v8;
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  NSObject *data;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDTraceItem stringFromReferenceDate:](SDTraceItem, "stringFromReferenceDate:", self->_startTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  if (self->_identifier != -1)
    objc_msgSend(v3, "appendFormat:", CFSTR("\t%ld"), self->_identifier);
  if (-[NSString length](self->_label, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\t%@"), self->_label);
  if (self->_duration != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR("\telapsed: %g"), *(_QWORD *)&self->_duration);
  if (-[NSString length](self->_string, "length"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\t"));
    objc_msgSend(v3, "appendString:", self->_string);
  }
  data = self->_data;
  if (data)
    +[SDTraceItem appendDescription:prefix:toString:](SDTraceItem, "appendDescription:prefix:toString:", data, CFSTR("   "), v3);
  return v3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)label
{
  return self->_label;
}

- (NSObject)data
{
  return self->_data;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
