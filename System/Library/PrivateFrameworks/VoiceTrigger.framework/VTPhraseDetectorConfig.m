@implementation VTPhraseDetectorConfig

- (VTPhraseDetectorConfig)initWithResourcePath:(id)a3 configPathNDAPI:(id)a4 useRecognizerCombination:(BOOL)a5 configPathRecognizer:(id)a6 useKeywordSpotting:(BOOL)a7 phraseConfigs:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  VTPhraseDetectorConfig *v18;
  VTPhraseDetectorConfig *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)VTPhraseDetectorConfig;
  v18 = -[VTPhraseDetectorConfig init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resourcePath, a3);
    objc_storeStrong((id *)&v19->_configPathNDAPI, a4);
    v19->_useRecognizerCombination = a5;
    objc_storeStrong((id *)&v19->_configPathRecognizer, a6);
    v19->_useKeywordSpotting = a7;
    objc_storeStrong((id *)&v19->_phraseConfigs, a8);
  }

  return v19;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSString)configPathNDAPI
{
  return self->_configPathNDAPI;
}

- (BOOL)useRecognizerCombination
{
  return self->_useRecognizerCombination;
}

- (NSString)configPathRecognizer
{
  return self->_configPathRecognizer;
}

- (BOOL)useKeywordSpotting
{
  return self->_useKeywordSpotting;
}

- (NSArray)phraseConfigs
{
  return self->_phraseConfigs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseConfigs, 0);
  objc_storeStrong((id *)&self->_configPathRecognizer, 0);
  objc_storeStrong((id *)&self->_configPathNDAPI, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
