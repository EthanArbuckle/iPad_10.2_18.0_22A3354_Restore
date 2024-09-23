@implementation SUCoreRestoreVersion

- (void)setParsedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_parsedVersion, a3);
}

- (void)setBuildGroup:(int64_t)a3
{
  self->_buildGroup = a3;
}

- (NSString)restoreVersionString
{
  return self->_restoreVersionString;
}

- (NSArray)parsedVersion
{
  return self->_parsedVersion;
}

- (BOOL)isComparable:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (v5 = -[SUCoreRestoreVersion buildGroup](self, "buildGroup"), v5 == objc_msgSend(v4, "buildGroup")))
  {
    -[SUCoreRestoreVersion parsedVersion](self, "parsedVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 5)
    {
      objc_msgSend(v4, "parsedVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") == 5;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  if (+[SUCoreRestoreVersion _enableVerboseLogging](SUCoreRestoreVersion, "_enableVerboseLogging"))
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreRestoreVersion summary](self, "summary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "summary");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("NO");
      v16 = 138543874;
      v17 = v11;
      v18 = 2114;
      if (v8)
        v14 = CFSTR("YES");
      v19 = v12;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[RestoreVersion] Comparable: self=%{public}@ to=%{public}@ | valid=%{public}@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v8;
}

- (SUCoreRestoreVersion)initWithRestoreVersion:(id)a3
{
  id v5;
  SUCoreRestoreVersion *v6;
  NSArray *parsedVersion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUCoreRestoreVersion *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SUCoreRestoreVersion initWithRestoreVersion:].cold.1(v15);
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)SUCoreRestoreVersion;
  v6 = -[SUCoreRestoreVersion init](&v18, sel_init);
  self = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_restoreVersionString, a3);
    -[SUCoreRestoreVersion _parseRestoreVersionString](self, "_parseRestoreVersionString");
    parsedVersion = self->_parsedVersion;
    if (parsedVersion && -[NSArray count](parsedVersion, "count") == 5)
    {
      -[NSArray objectAtIndexedSubscript:](self->_parsedVersion, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_majorVersion = objc_msgSend(v8, "integerValue");

      -[NSArray objectAtIndexedSubscript:](self->_parsedVersion, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_minorVersion = objc_msgSend(v9, "integerValue");

      -[NSArray objectAtIndexedSubscript:](self->_parsedVersion, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_buildVersion = objc_msgSend(v10, "integerValue");

      -[NSArray objectAtIndexedSubscript:](self->_parsedVersion, "objectAtIndexedSubscript:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_syncedVersion = objc_msgSend(v11, "integerValue");

      -[NSArray objectAtIndexedSubscript:](self->_parsedVersion, "objectAtIndexedSubscript:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_suffixVersion = objc_msgSend(v12, "integerValue");

      goto LABEL_6;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SUCoreRestoreVersion initWithRestoreVersion:].cold.2();
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
LABEL_6:
  self = self;
  v13 = self;
LABEL_12:

  return v13;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreRestoreVersion isComparable:](self, "isComparable:", v4))
  {
    v5 = 0;
    do
    {
      -[SUCoreRestoreVersion parsedVersion](self, "parsedVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parsedVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "compare:", v9);

      if (v10)
        break;
    }
    while (v5++ != 4);
    if (+[SUCoreRestoreVersion _enableVerboseLogging](SUCoreRestoreVersion, "_enableVerboseLogging"))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreRestoreVersion summary](self, "summary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "summary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreRestoreVersion _stringForNSComparisonResult:](SUCoreRestoreVersion, "_stringForNSComparisonResult:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v14;
        v21 = 2114;
        v22 = v15;
        v23 = 2114;
        v24 = v16;
        _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[RestoreVersion] Compare: self=%{public}@ to=%{public}@ | result=%{public}@", (uint8_t *)&v19, 0x20u);

      }
    }
  }
  else
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", CFSTR("RestoreVersion"), CFSTR("Compare called on restore version when other version is not compatible"), 8116, 0);

    v10 = 0;
  }

  return v10;
}

- (int64_t)buildGroup
{
  return self->_buildGroup;
}

- (void)_parseRestoreVersionString
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v0, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B05B8000, v2, v3, "[RestoreVersion] (%{public}@) Parse: invalid build group found: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (BOOL)_isStringOnlyNumbers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersionString, 0);
}

+ (BOOL)_enableVerboseLogging
{
  if (_enableVerboseLogging_restoreVersionEnableVerboseLoggingOnceToken != -1)
    dispatch_once(&_enableVerboseLogging_restoreVersionEnableVerboseLoggingOnceToken, &__block_literal_global_3);
  return _enableVerboseLogging___verboseLoggingEnabled;
}

+ (id)_stringForNSComparisonResult:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
    return 0;
  else
    return off_1E611C6D8[a3 + 1];
}

- (BOOL)isEqual:(id)a3
{
  SUCoreRestoreVersion *v4;
  SUCoreRestoreVersion *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (SUCoreRestoreVersion *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUCoreRestoreVersion restoreVersionString](self, "restoreVersionString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreRestoreVersion restoreVersionString](v5, "restoreVersionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)summary
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreRestoreVersion restoreVersionString](self, "restoreVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreRestoreVersion restoreVersionString](self, "restoreVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRestoreVersion parsedVersion](self, "parsedVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreRestoreVersion(restoreVersionString:%@|parsedVersion:%@|buildGroup:%ld)"), v4, v6, -[SUCoreRestoreVersion buildGroup](self, "buildGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRestoreVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SUCoreRestoreVersion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RestoreVersionString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SUCoreRestoreVersion initWithRestoreVersion:](self, "initWithRestoreVersion:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreRestoreVersion restoreVersionString](self, "restoreVersionString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("RestoreVersionString"));

}

void __45__SUCoreRestoreVersion__enableVerboseLogging__block_invoke()
{
  SUCoreConfig *v0;

  v0 = -[SUCoreConfig initWithProjectName:]([SUCoreConfig alloc], "initWithProjectName:", CFSTR("SoftwareUpdateCore"));
  _enableVerboseLogging___verboseLoggingEnabled = -[SUCoreConfig getBoolConfigForKey:](v0, "getBoolConfigForKey:", CFSTR("VerboseLogging"));

}

- (void)setRestoreVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersionString, a3);
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)syncedVersion
{
  return self->_syncedVersion;
}

- (int64_t)suffixVersion
{
  return self->_suffixVersion;
}

- (void)initWithRestoreVersion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B05B8000, log, OS_LOG_TYPE_ERROR, "[RestoreVersion] Init: failed to create restore version when no version string was provided", v1, 2u);
}

- (void)initWithRestoreVersion:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v0, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B05B8000, v2, v3, "[RestoreVersion] (%{public}@) Init: failed to create a valid parsed restore version from string %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
