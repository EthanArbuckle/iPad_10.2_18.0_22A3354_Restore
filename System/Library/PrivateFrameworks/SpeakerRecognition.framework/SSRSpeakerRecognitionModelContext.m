@implementation SSRSpeakerRecognitionModelContext

- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4 withModelFilePathsExclave:(id)a5
{
  id v9;
  id v10;
  id v11;
  SSRSpeakerRecognitionModelContext *v12;
  SSRSpeakerRecognitionModelContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SSRSpeakerRecognitionModelContext;
  v12 = -[SSRSpeakerRecognitionModelContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configFilePath, a3);
    objc_storeStrong((id *)&v13->_voiceProfilesModelFilePaths, a4);
    objc_storeStrong((id *)&v13->_voiceProfilesModelFilePathsExclave, a5);
  }

  return v13;
}

- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4
{
  return -[SSRSpeakerRecognitionModelContext initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:](self, "initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:", a3, a4, 0);
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (NSDictionary)voiceProfilesModelFilePaths
{
  return self->_voiceProfilesModelFilePaths;
}

- (NSDictionary)voiceProfilesModelFilePathsExclave
{
  return self->_voiceProfilesModelFilePathsExclave;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePathsExclave, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
}

@end
