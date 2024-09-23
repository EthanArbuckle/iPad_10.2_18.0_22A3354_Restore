@implementation wspContext

- (wspContext)init
{
  wspContext *v2;
  wspContext *v3;
  NSString *serverName;
  NSString *serverAddress;
  NSString *userName;
  NSString *clientMachineName;
  NSString *searchPath;
  NSString *contentPattern;
  uint64_t v10;
  NSMutableArray *fnamePatterns;
  uint64_t v12;
  NSMutableArray *fextPatterns;
  NSDate *modDate;
  pidMapper *pidMap;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)wspContext;
  v2 = -[wspContext init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    serverName = v2->_serverName;
    v2->_serverName = 0;

    serverAddress = v3->_serverAddress;
    v3->_serverAddress = 0;

    userName = v3->_userName;
    v3->_userName = 0;

    clientMachineName = v3->_clientMachineName;
    v3->_clientMachineName = 0;

    searchPath = v3->_searchPath;
    v3->_searchPath = 0;

    v3->_queryType = 0;
    contentPattern = v3->_contentPattern;
    v3->_contentPattern = 0;

    v10 = objc_opt_new();
    fnamePatterns = v3->_fnamePatterns;
    v3->_fnamePatterns = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    fextPatterns = v3->_fextPatterns;
    v3->_fextPatterns = (NSMutableArray *)v12;

    modDate = v3->_modDate;
    v3->_modDate = 0;

    v3->_serverVersion = 0;
    v3->_supports64BitOffsets = 0;
    pidMap = v3->_pidMap;
    v3->_pidMap = 0;

    *(_QWORD *)&v3->_cursor = 0;
    *(_QWORD *)&v3->_trueSequential = 0;
    *(_QWORD *)&v3->_seekBookmarkOffset = 4294967292;
    v3->_rowsSoFar = 0;
  }
  return v3;
}

- (void)setContentSearch:(id)a3
{
  self->_queryType |= 1u;
  objc_storeStrong((id *)&self->_contentPattern, a3);
}

- (void)setFilenameSearch:(id)a3
{
  self->_queryType |= 2u;
  objc_storeStrong((id *)&self->_fnamePatterns, a3);
}

- (void)setFileExtSearch:(id)a3
{
  self->_queryType |= 4u;
  objc_storeStrong((id *)&self->_fextPatterns, a3);
}

- (void)setModDateSearch:(id)a3
{
  id v5;
  double v6;
  double v7;

  self->_queryType |= 8u;
  objc_storeStrong((id *)&self->_modDate, a3);
  v5 = a3;
  self->_modDateSpec.tv_nsec = 0;
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  self->_modDateSpec.tv_sec = (uint64_t)v7;
}

- (void)setServerVersion:(unsigned int)a3
{
  self->_serverVersion = a3;
  self->_supports64BitOffsets = (a3 & 0xFFFF0000) != 0;
}

- (BOOL)serverSupports64BitOffsets
{
  return self->_supports64BitOffsets;
}

- (void)logContents
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "wspContext:\n", v0, 2u);
  OUTLINED_FUNCTION_2();
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)serverAddress
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServerAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)clientMachineName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClientMachineName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)searchPath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSearchPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int)queryType
{
  return self->_queryType;
}

- (void)setQueryType:(int)a3
{
  self->_queryType = a3;
}

- (timespec)modDateSpec
{
  __darwin_time_t v2;
  uint64_t v3;
  _QWORD v4[2];
  timespec result;

  objc_copyStruct(v4, &self->_modDateSpec, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setModDateSpec:(timespec)a3
{
  timespec v3;

  v3 = a3;
  objc_copyStruct(&self->_modDateSpec, &v3, 16, 1, 0);
}

- (NSString)contentPattern
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setContentPattern:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableArray)fnamePatterns
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFnamePatterns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)fextPatterns
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFextPatterns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)modDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setModDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (pidMapper)pidMap
{
  return (pidMapper *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPidMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unsigned)serverVersion
{
  return self->_serverVersion;
}

- (BOOL)supports64BitOffsets
{
  return self->_supports64BitOffsets;
}

- (unsigned)trueSequential
{
  return self->_trueSequential;
}

- (void)setTrueSequential:(unsigned int)a3
{
  self->_trueSequential = a3;
}

- (unsigned)workID
{
  return self->_workID;
}

- (void)setWorkID:(unsigned int)a3
{
  self->_workID = a3;
}

- (unsigned)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unsigned int)a3
{
  self->_cursor = a3;
}

- (unsigned)whereID
{
  return self->_whereID;
}

- (void)setWhereID:(unsigned int)a3
{
  self->_whereID = a3;
}

- (unsigned)seekBookmarkOffset
{
  return self->_seekBookmarkOffset;
}

- (void)setSeekBookmarkOffset:(unsigned int)a3
{
  self->_seekBookmarkOffset = a3;
}

- (unsigned)seekSkip
{
  return self->_seekSkip;
}

- (void)setSeekSkip:(unsigned int)a3
{
  self->_seekSkip = a3;
}

- (unsigned)rowsSoFar
{
  return self->_rowsSoFar;
}

- (void)setRowsSoFar:(unsigned int)a3
{
  self->_rowsSoFar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidMap, 0);
  objc_storeStrong((id *)&self->_modDate, 0);
  objc_storeStrong((id *)&self->_fextPatterns, 0);
  objc_storeStrong((id *)&self->_fnamePatterns, 0);
  objc_storeStrong((id *)&self->_contentPattern, 0);
  objc_storeStrong((id *)&self->_searchPath, 0);
  objc_storeStrong((id *)&self->_clientMachineName, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
}

@end
