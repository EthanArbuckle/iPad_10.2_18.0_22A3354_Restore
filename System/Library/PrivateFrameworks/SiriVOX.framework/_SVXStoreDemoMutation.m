@implementation _SVXStoreDemoMutation

- (_SVXStoreDemoMutation)init
{
  return -[_SVXStoreDemoMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXStoreDemoMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXStoreDemoMutation *v6;
  _SVXStoreDemoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXStoreDemoMutation;
  v6 = -[_SVXStoreDemoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setTranscriptID:(int64_t)a3
{
  self->_transcriptID = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setOutputVolume:(float)a3
{
  self->_outputVolume = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)generate
{
  SVXStoreDemo *baseModel;
  uint64_t v4;
  SVXStoreDemo *v5;
  double v6;
  SVXStoreDemo *v7;
  int64_t transcriptID;
  NSString *v9;
  NSString *v10;
  int64_t gender;
  float outputVolume;
  float v13;
  SVXStoreDemo *v14;
  double v15;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXStoreDemo alloc];
    *(float *)&v6 = self->_outputVolume;
    v4 = -[SVXStoreDemo initWithTranscriptID:languageCode:gender:outputVolume:](v5, "initWithTranscriptID:languageCode:gender:outputVolume:", self->_transcriptID, self->_languageCode, self->_gender, v6);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      transcriptID = self->_transcriptID;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_8;
    }
    else
    {
      transcriptID = -[SVXStoreDemo transcriptID](baseModel, "transcriptID");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v9 = self->_languageCode;
        goto LABEL_11;
      }
    }
    -[SVXStoreDemo languageCode](self->_baseModel, "languageCode");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = v9;
    if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    {
      gender = self->_gender;
      if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
        goto LABEL_13;
    }
    else
    {
      gender = -[SVXStoreDemo gender](self->_baseModel, "gender");
      if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
      {
LABEL_13:
        outputVolume = self->_outputVolume;
LABEL_16:
        v14 = [SVXStoreDemo alloc];
        *(float *)&v15 = outputVolume;
        v7 = -[SVXStoreDemo initWithTranscriptID:languageCode:gender:outputVolume:](v14, "initWithTranscriptID:languageCode:gender:outputVolume:", transcriptID, v10, gender, v15);

        return v7;
      }
    }
    -[SVXStoreDemo outputVolume](self->_baseModel, "outputVolume");
    outputVolume = v13;
    goto LABEL_16;
  }
  v4 = -[SVXStoreDemo copy](baseModel, "copy");
LABEL_5:
  v7 = (SVXStoreDemo *)v4;
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
