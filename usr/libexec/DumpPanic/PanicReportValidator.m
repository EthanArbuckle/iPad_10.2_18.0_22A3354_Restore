@implementation PanicReportValidator

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

    -[PanicReportValidator setSourcePath:](self, "setSourcePath:", v5);
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

- (id)get_paniclog_json
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
  v6 = (unint64_t)objc_msgSend(v4, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v4, "length"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", v6 + 1, (char *)objc_msgSend(v4, "length") + ~v6));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, &v13));
  v9 = v13;
  v10 = v9;
  if (v9 || !v8)
  {
    NSLog(CFSTR("unable to decode paniclog: %@"), v9);
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (BOOL)validate_key_in_log:(id)a3 present:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator get_paniclog_json](self, "get_paniclog_json"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));
    v10 = v9 == 0;

    v11 = v10 ^ a4;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)validate_ext_paniclog:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator get_paniclog_json](self, "get_paniclog_json"));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("ExtensiblePaniclog")));
    v11 = v10;
    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v7));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v7));
      v14 = objc_msgSend(v12, "count");
      if (v14 == objc_msgSend(v13, "count"))
      {
        if (objc_msgSend(v12, "count"))
        {
          v15 = 0;
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v15));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v15));
            v18 = objc_msgSend(v16, "isEqualToDictionary:", v17);

            if ((v18 & 1) == 0)
              break;
            ++v15;
          }
          while ((unint64_t)objc_msgSend(v12, "count") > v15);
        }
        else
        {
          v18 = 1;
        }
      }
      else
      {
        NSLog(CFSTR("Array count does not match"));
        v18 = 0;
      }

    }
    else
    {
      v18 = objc_msgSend(v10, "isEqualToDictionary:", v6);
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)validate_prologue:(id)a3
{
  return -[PanicReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100037C30);
}

- (BOOL)validate_paniclog:(id)a3
{
  return -[PanicReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100037C48);
}

- (BOOL)validate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  NSLog(CFSTR("validating panic report: %@"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
  v8 = (unint64_t)objc_msgSend(v6, "rangeOfData:options:range:", v7, 0, 0, objc_msgSend(v6, "length"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v8 + 1, (char *)objc_msgSend(v6, "length") + ~v8));
  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 0, &v19));
  v12 = v19;
  v13 = v12;
  if (!v12 && v11)
  {
    v18 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 0, &v18));
    v15 = v18;
    v13 = v15;
    if (v15 || !v14)
    {
      NSLog(CFSTR("unable to decode paniclog: %@"), v15);
    }
    else if (-[PanicReportValidator validate_prologue:](self, "validate_prologue:", v11))
    {
      v16 = -[PanicReportValidator validate_paniclog:](self, "validate_paniclog:", v14);
LABEL_10:

      goto LABEL_11;
    }
    v16 = 0;
    goto LABEL_10;
  }
  NSLog(CFSTR("unable to decode prologue: %@"), v12);
  v16 = 0;
LABEL_11:

  return v16;
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
  PanicReportValidator *v4;
  void *v5;

  v3 = a3;
  v4 = [PanicReportValidator alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator withURL:](v4, "withURL:", v3));

  return v5;
}

@end
