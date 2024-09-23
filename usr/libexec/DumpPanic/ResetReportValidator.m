@implementation ResetReportValidator

- (id)withURL:(id)a3
{
  id v4;
  void *v5;
  id result;
  uint64_t v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;

    -[ResetReportValidator setSourcePath:](self, "setSourcePath:", v5);
    return self;
  }
  else
  {
    v7 = _os_assert_log(0);
    result = (id)_os_crash(v7);
    __break(1u);
  }
  return result;
}

- (BOOL)validate_keys:(id)a3 expected:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allKeys"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
        {
          NSLog(CFSTR("missing key: %@"), v12);
          v13 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)validate_prologue:(id)a3
{
  return -[ResetReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100037C60);
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator sourcePath](self, "sourcePath"));
  NSLog(CFSTR("validating reset report: %@"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator sourcePath](self, "sourcePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
  v8 = objc_msgSend(v6, "rangeOfData:options:range:", v7, 0, 0, objc_msgSend(v6, "length"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, v8));
  v15 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 0, &v15));
  v11 = v15;
  v12 = v11;
  if (v11 || !v10)
  {
    NSLog(CFSTR("unable to decode prologue: %@"), v11);
    v13 = 0;
  }
  else
  {
    v13 = -[ResetReportValidator validate_prologue:](self, "validate_prologue:", v10);
  }

  return v13;
}

- (NSURL)sourcePath
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourcePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePath, 0);
}

+ (id)ValidatorWithURL:(id)a3
{
  id v3;
  ResetReportValidator *v4;
  void *v5;

  v3 = a3;
  v4 = [ResetReportValidator alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator withURL:](v4, "withURL:", v3));

  return v5;
}

@end
