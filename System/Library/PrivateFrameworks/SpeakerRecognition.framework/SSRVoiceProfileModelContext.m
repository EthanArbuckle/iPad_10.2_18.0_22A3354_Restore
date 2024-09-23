@implementation SSRVoiceProfileModelContext

- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withCompareModelFilePaths:(id)a5
{
  return -[SSRVoiceProfileModelContext initWithConfigFilePath:withModelPath:withModelPathExclave:withCompareModelFilePaths:](self, "initWithConfigFilePath:withModelPath:withModelPathExclave:withCompareModelFilePaths:", a3, a4, 0, a5);
}

- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withModelPathExclave:(id)a5 withCompareModelFilePaths:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SSRVoiceProfileModelContext *v15;
  SSRVoiceProfileModelContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SSRVoiceProfileModelContext;
  v15 = -[SSRVoiceProfileModelContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configFilePath, a3);
    objc_storeStrong((id *)&v16->_compareModelFilePaths, a6);
    objc_storeStrong((id *)&v16->_voiceProfileModelFilePath, a4);
    objc_storeStrong((id *)&v16->_secureProfileModelFilePath, a5);
  }

  return v16;
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (NSURL)voiceProfileModelFilePath
{
  return self->_voiceProfileModelFilePath;
}

- (NSURL)secureProfileModelFilePath
{
  return self->_secureProfileModelFilePath;
}

- (NSDictionary)compareModelFilePaths
{
  return self->_compareModelFilePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compareModelFilePaths, 0);
  objc_storeStrong((id *)&self->_secureProfileModelFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfileModelFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
}

@end
