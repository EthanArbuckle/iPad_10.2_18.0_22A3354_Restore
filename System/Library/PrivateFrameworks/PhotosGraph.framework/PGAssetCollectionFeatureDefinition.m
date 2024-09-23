@implementation PGAssetCollectionFeatureDefinition

- (PGAssetCollectionFeatureDefinition)initWithAssetFilterByName:(id)a3
{
  id v4;
  PGAssetCollectionFeatureDefinition *v5;
  void *v6;
  uint64_t v7;
  PGSceneAssetFilter *sceneAssetFilter;
  void *v9;
  uint64_t v10;
  PGPeopleAssetFilter *peopleAssetFilter;
  void *v12;
  uint64_t v13;
  PGSocialGroupAssetFilter *socialGroupAssetFilter;
  void *v15;
  uint64_t v16;
  PGAudioAssetFilter *audioAssetFilter;
  void *v18;
  uint64_t v19;
  PGCustomFoodieAssetFilter *customAssetFilter;
  void *v21;
  uint64_t v22;
  PGCLIPQueryAssetFilter *CLIPQueryAssetFilter;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGAssetCollectionFeatureDefinition;
  v5 = -[PGAssetCollectionFeatureDefinition init](&v25, sel_init);
  if (v5)
  {
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    sceneAssetFilter = v5->_sceneAssetFilter;
    v5->_sceneAssetFilter = (PGSceneAssetFilter *)v7;

    +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    peopleAssetFilter = v5->_peopleAssetFilter;
    v5->_peopleAssetFilter = (PGPeopleAssetFilter *)v10;

    +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    socialGroupAssetFilter = v5->_socialGroupAssetFilter;
    v5->_socialGroupAssetFilter = (PGSocialGroupAssetFilter *)v13;

    +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    audioAssetFilter = v5->_audioAssetFilter;
    v5->_audioAssetFilter = (PGAudioAssetFilter *)v16;

    +[PGCustomFoodieAssetFilter name](PGCustomFoodieAssetFilter, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    customAssetFilter = v5->_customAssetFilter;
    v5->_customAssetFilter = (PGCustomFoodieAssetFilter *)v19;

    +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    CLIPQueryAssetFilter = v5->_CLIPQueryAssetFilter;
    v5->_CLIPQueryAssetFilter = (PGCLIPQueryAssetFilter *)v22;

  }
  return v5;
}

- (PGAssetCollectionFeatureDefinition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  PGAssetCollectionFeatureDefinition *v36;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsValueForKey:", v6);

  if (v7)
  {
    v8 = objc_opt_class();
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

  }
  +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "containsValueForKey:", v12);

  if (v13)
  {
    v14 = objc_opt_class();
    +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

  }
  +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "containsValueForKey:", v18);

  if (v19)
  {
    v20 = objc_opt_class();
    +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, v23);

  }
  +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "containsValueForKey:", v24);

  if (v25)
  {
    v26 = objc_opt_class();
    +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, v29);

  }
  +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v4, "containsValueForKey:", v30);

  if (v31)
  {
    v32 = objc_opt_class();
    +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, v35);

  }
  v36 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](self, "initWithAssetFilterByName:", v5);

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  PGSceneAssetFilter *sceneAssetFilter;
  void *v5;
  PGPeopleAssetFilter *peopleAssetFilter;
  void *v7;
  PGSocialGroupAssetFilter *socialGroupAssetFilter;
  void *v9;
  PGAudioAssetFilter *audioAssetFilter;
  void *v11;
  PGCLIPQueryAssetFilter *CLIPQueryAssetFilter;
  void *v13;
  id v14;

  v14 = a3;
  sceneAssetFilter = self->_sceneAssetFilter;
  if (sceneAssetFilter)
  {
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", sceneAssetFilter, v5);

  }
  peopleAssetFilter = self->_peopleAssetFilter;
  if (peopleAssetFilter)
  {
    +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", peopleAssetFilter, v7);

  }
  socialGroupAssetFilter = self->_socialGroupAssetFilter;
  if (socialGroupAssetFilter)
  {
    +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", socialGroupAssetFilter, v9);

  }
  audioAssetFilter = self->_audioAssetFilter;
  if (audioAssetFilter)
  {
    +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", audioAssetFilter, v11);

  }
  CLIPQueryAssetFilter = self->_CLIPQueryAssetFilter;
  if (CLIPQueryAssetFilter)
  {
    +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", CLIPQueryAssetFilter, v13);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v17.receiver = self;
  v17.super_class = (Class)PGAssetCollectionFeatureDefinition;
  -[PGAssetCollectionFeatureDefinition description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSceneAssetFilter description](self->_sceneAssetFilter, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), v6, v7);

  +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPeopleAssetFilter description](self->_peopleAssetFilter, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), v8, v9);

  +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSocialGroupAssetFilter description](self->_socialGroupAssetFilter, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), v10, v11);

  +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGAudioAssetFilter description](self->_audioAssetFilter, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), v12, v13);

  +[PGCLIPQueryAssetFilter name](PGCLIPQueryAssetFilter, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCLIPQueryAssetFilter description](self->_CLIPQueryAssetFilter, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@: %@"), v14, v15);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  PGAssetCollectionFeatureDefinition *v5;
  PGAssetCollectionFeatureDefinition *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGSceneAssetFilter *sceneAssetFilter;
  PGSceneAssetFilter *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  PGPeopleAssetFilter *peopleAssetFilter;
  PGPeopleAssetFilter *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  PGSocialGroupAssetFilter *socialGroupAssetFilter;
  PGSocialGroupAssetFilter *v20;
  void *v21;
  int v22;
  PGAudioAssetFilter *audioAssetFilter;
  PGAudioAssetFilter *v24;
  void *v25;
  int v26;
  PGCLIPQueryAssetFilter *CLIPQueryAssetFilter;
  PGCLIPQueryAssetFilter *v28;
  void *v29;

  v5 = (PGAssetCollectionFeatureDefinition *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = v6;
      sceneAssetFilter = self->_sceneAssetFilter;
      v9 = sceneAssetFilter;
      if (!sceneAssetFilter)
      {
        -[PGAssetCollectionFeatureDefinition sceneAssetFilter](v6, "sceneAssetFilter");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_12;
        v3 = (void *)v10;
        v9 = self->_sceneAssetFilter;
      }
      -[PGAssetCollectionFeatureDefinition sceneAssetFilter](v7, "sceneAssetFilter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PGSceneAssetFilter isEqual:](v9, "isEqual:", v11);

      if (sceneAssetFilter)
      {
        if (!v12)
          goto LABEL_39;
      }
      else
      {

        if (!v12)
          goto LABEL_39;
      }
LABEL_12:
      peopleAssetFilter = self->_peopleAssetFilter;
      v15 = peopleAssetFilter;
      if (!peopleAssetFilter)
      {
        -[PGAssetCollectionFeatureDefinition peopleAssetFilter](v7, "peopleAssetFilter");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v3 = (void *)v16;
        v15 = self->_peopleAssetFilter;
      }
      -[PGAssetCollectionFeatureDefinition peopleAssetFilter](v7, "peopleAssetFilter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PGPeopleAssetFilter isEqual:](v15, "isEqual:", v17);

      if (peopleAssetFilter)
      {
        if (!v18)
          goto LABEL_39;
      }
      else
      {

        if (!v18)
          goto LABEL_39;
      }
LABEL_19:
      socialGroupAssetFilter = self->_socialGroupAssetFilter;
      v20 = socialGroupAssetFilter;
      if (!socialGroupAssetFilter)
      {
        -[PGAssetCollectionFeatureDefinition socialGroupAssetFilter](v7, "socialGroupAssetFilter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v22 = 1;
          goto LABEL_26;
        }
        v20 = self->_socialGroupAssetFilter;
      }
      -[PGAssetCollectionFeatureDefinition socialGroupAssetFilter](v7, "socialGroupAssetFilter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PGSocialGroupAssetFilter isEqual:](v20, "isEqual:", v21);

      if (socialGroupAssetFilter)
      {
        if (!v22)
          goto LABEL_39;
        goto LABEL_27;
      }
LABEL_26:

      if (!v22)
        goto LABEL_39;
LABEL_27:
      audioAssetFilter = self->_audioAssetFilter;
      v24 = audioAssetFilter;
      if (!audioAssetFilter)
      {
        -[PGAssetCollectionFeatureDefinition audioAssetFilter](v7, "audioAssetFilter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v26 = 1;
          goto LABEL_38;
        }
        v24 = self->_audioAssetFilter;
      }
      -[PGAssetCollectionFeatureDefinition audioAssetFilter](v7, "audioAssetFilter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[PGAudioAssetFilter isEqual:](v24, "isEqual:", v25);

      if (audioAssetFilter)
      {
        if (v26)
          goto LABEL_32;
        goto LABEL_39;
      }
LABEL_38:

      if (v26)
      {
LABEL_32:
        CLIPQueryAssetFilter = self->_CLIPQueryAssetFilter;
        v28 = CLIPQueryAssetFilter;
        if (!CLIPQueryAssetFilter)
        {
          -[PGAssetCollectionFeatureDefinition CLIPQueryAssetFilter](v7, "CLIPQueryAssetFilter");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v13 = 1;
            goto LABEL_43;
          }
          v28 = self->_CLIPQueryAssetFilter;
        }
        -[PGAssetCollectionFeatureDefinition CLIPQueryAssetFilter](v7, "CLIPQueryAssetFilter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PGCLIPQueryAssetFilter isEqual:](v28, "isEqual:", v29);

        if (CLIPQueryAssetFilter)
        {
LABEL_40:

          goto LABEL_41;
        }
LABEL_43:

        goto LABEL_40;
      }
LABEL_39:
      v13 = 0;
      goto LABEL_40;
    }
    v13 = 0;
  }
LABEL_41:

  return v13;
}

- (PGSceneAssetFilter)sceneAssetFilter
{
  return self->_sceneAssetFilter;
}

- (PGPeopleAssetFilter)peopleAssetFilter
{
  return self->_peopleAssetFilter;
}

- (PGSocialGroupAssetFilter)socialGroupAssetFilter
{
  return self->_socialGroupAssetFilter;
}

- (PGAudioAssetFilter)audioAssetFilter
{
  return self->_audioAssetFilter;
}

- (PGCustomFoodieAssetFilter)customAssetFilter
{
  return self->_customAssetFilter;
}

- (PGCLIPQueryAssetFilter)CLIPQueryAssetFilter
{
  return self->_CLIPQueryAssetFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CLIPQueryAssetFilter, 0);
  objc_storeStrong((id *)&self->_customAssetFilter, 0);
  objc_storeStrong((id *)&self->_audioAssetFilter, 0);
  objc_storeStrong((id *)&self->_socialGroupAssetFilter, 0);
  objc_storeStrong((id *)&self->_peopleAssetFilter, 0);
  objc_storeStrong((id *)&self->_sceneAssetFilter, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
