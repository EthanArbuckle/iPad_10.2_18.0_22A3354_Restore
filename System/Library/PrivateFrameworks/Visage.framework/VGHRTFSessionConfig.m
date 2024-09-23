@implementation VGHRTFSessionConfig

- (void)overwriteWithDefaults
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *debugDataRootPath;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.visage"));
  objc_msgSend(v7, "objectForKey:", CFSTR("writeDebugDataHRTF"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    self->_writeDebugData = objc_msgSend(v7, "BOOLForKey:", CFSTR("writeDebugDataHRTF"));
  objc_msgSend(v7, "objectForKey:", CFSTR("debugDataRootPathHRTF"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "stringForKey:", CFSTR("debugDataRootPathHRTF"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    debugDataRootPath = self->_debugDataRootPath;
    self->_debugDataRootPath = v5;

  }
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_writeDebugData = a3;
}

- (NSString)modelsRootPath
{
  return self->_modelsRootPath;
}

- (void)setModelsRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_modelsRootPath, a3);
}

- (NSString)debugDataRootPath
{
  return self->_debugDataRootPath;
}

- (void)setDebugDataRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_debugDataRootPath, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (VGHRTFSessionUpdateDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_debugDataRootPath, 0);
  objc_storeStrong((id *)&self->_modelsRootPath, 0);
}

@end
