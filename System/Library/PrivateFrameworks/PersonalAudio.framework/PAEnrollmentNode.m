@implementation PAEnrollmentNode

+ (id)nodeWithSection:(unint64_t)a3 type:(unint64_t)a4 andConfiguration:(id)a5
{
  id v7;
  PAEnrollmentNode *v8;

  v7 = a5;
  v8 = objc_alloc_init(PAEnrollmentNode);
  -[PAEnrollmentNode setStimuli:](v8, "setStimuli:", MEMORY[0x1E0C9AA60]);
  -[PAEnrollmentNode setHeading:](v8, "setHeading:", &stru_1EA902C20);
  -[PAEnrollmentNode setInstructions:](v8, "setInstructions:", &stru_1EA902C20);
  -[PAEnrollmentNode setSection:](v8, "setSection:", a3);
  -[PAEnrollmentNode setType:](v8, "setType:", a4);
  -[PAEnrollmentNode setTotalSteps:](v8, "setTotalSteps:", 6);
  -[PAEnrollmentNode setConfiguration:](v8, "setConfiguration:", v7);

  -[PAEnrollmentNode setTuningDescription:](v8, "setTuningDescription:", &stru_1EA902C20);
  return v8;
}

+ (id)nodeWithSection:(unint64_t)a3 andType:(unint64_t)a4 comparing:(unint64_t)a5 with:(unint64_t)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  +[PAConfiguration configurationFromType:](PAConfiguration, "configurationFromType:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", a3, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 != a6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAConfiguration configurationFromType:](PAConfiguration, "configurationFromType:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", a3, a5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hcSafeAddObject:", v14);

    +[PAConfiguration configurationFromType:](PAConfiguration, "configurationFromType:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", a3, a6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hcSafeAddObject:", v16);

    objc_msgSend(v11, "setOptions:", v12);
  }
  paLocString(CFSTR("PersonalAudioOptionA"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  paLocString(CFSTR("PersonalAudioOptionB"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v19 = CFSTR("PersonalAudioOptionNo");
    v20 = CFSTR("PersonalAudioOptionYes");
  }
  else
  {
    if (a3 != 6)
      goto LABEL_8;
    v19 = CFSTR("PersonalAudioStandard");
    v20 = CFSTR("PersonalAudioCustom");
  }
  paLocString(v20);
  v21 = objc_claimAutoreleasedReturnValue();

  paLocString(v19);
  v22 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v22;
  v17 = (void *)v21;
LABEL_8:
  objc_msgSend(v11, "options");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "section") != 2)
    objc_msgSend(v24, "setSelected:", 1);
  objc_msgSend(v24, "setName:", v17);
  objc_msgSend(v26, "setName:", v18);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PAEnrollmentNode section](self, "section");
    if (v6 != objc_msgSend(v5, "section"))
      goto LABEL_18;
    v7 = -[PAEnrollmentNode type](self, "type");
    if (v7 != objc_msgSend(v5, "type"))
      goto LABEL_18;
    v8 = -[PAEnrollmentNode index](self, "index");
    if (v8 != objc_msgSend(v5, "index"))
      goto LABEL_18;
    v9 = -[PAEnrollmentNode totalSteps](self, "totalSteps");
    if (v9 != objc_msgSend(v5, "totalSteps"))
      goto LABEL_18;
    -[PAEnrollmentNode heading](self, "heading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 == 0) == (v11 != 0))
    {
      -[PAEnrollmentNode heading](self, "heading");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "heading");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if (!v16)
        goto LABEL_18;
    }
    else
    {

    }
    -[PAEnrollmentNode instructions](self, "instructions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v17 == 0) == (v18 != 0))
    {
      -[PAEnrollmentNode instructions](self, "instructions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instructions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      if (!v22)
        goto LABEL_18;
    }
    else
    {

    }
    -[PAEnrollmentNode configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v23 == 0) == (v24 != 0))
    {
      -[PAEnrollmentNode configuration](self, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configuration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_18;
    }
    else
    {

    }
    -[PAEnrollmentNode options](self, "options");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    objc_msgSend(v5, "options");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v30 == v32)
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 1;
      -[PAEnrollmentNode options](self, "options");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __28__PAEnrollmentNode_isEqual___block_invoke;
      v35[3] = &unk_1EA902338;
      v36 = v5;
      v37 = &v38;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v35);

      v13 = *((_BYTE *)v39 + 24) != 0;
      _Block_object_dispose(&v38, 8);
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

void __28__PAEnrollmentNode_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (NSArray)stimuli
{
  unint64_t section;
  void *v4;
  void **v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  section = self->_section;
  if (section == 6 || section == 4)
  {
    +[PAStimulus musicStimulus](PAStimulus, "musicStimulus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v5 = &v8;
  }
  else
  {
    if (section != 2)
      return (NSArray *)0;
    if (self->_index == 2)
    {
      +[PAStimulus louderSinStimulus](PAStimulus, "louderSinStimulus");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      v5 = &v10;
    }
    else
    {
      +[PAStimulus sinStimulus](PAStimulus, "sinStimulus");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v4;
      v5 = &v9;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1, v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSString)instructions
{
  __CFString *v2;
  unint64_t v3;
  __CFString *v5;
  unint64_t v6;
  __CFString **v7;

  v2 = &stru_1EA902C20;
  v3 = self->_section - 1;
  v5 = CFSTR("PersonalAudioSpeechIntoInstructions");
  switch(v3)
  {
    case 0uLL:
      goto LABEL_11;
    case 2uLL:
      v6 = self->_type - 3;
      if (v6 < 7)
      {
        v7 = off_1EA902358;
        goto LABEL_6;
      }
      v5 = CFSTR("PersonalAudioMediaIntro");
      goto LABEL_11;
    case 3uLL:
      v6 = self->_index - 3;
      if (v6 >= 3)
        return (NSString *)&stru_1EA902C20;
      v7 = off_1EA902390;
LABEL_6:
      v5 = v7[v6];
LABEL_11:
      paLocString(v5);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v2;
    case 4uLL:
      v5 = CFSTR("PersonalAudioSetupTransparencyInstructions");
      goto LABEL_11;
    case 6uLL:
      v5 = CFSTR("PersonalAudioCompleteInstructionsOff");
      goto LABEL_11;
    case 7uLL:
      v5 = CFSTR("PersonalAudioCompleteInstructionsOffConfirmation");
      goto LABEL_11;
    default:
      return (NSString *)v2;
  }
}

- (NSString)heading
{
  __CFString *v3;
  unint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  uint64_t v9;

  if (-[PAEnrollmentNode section](self, "section") == 1)
  {
    v3 = CFSTR("PersonalAudioSpeechIntoTitle");
LABEL_13:
    paLocString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v5;
  }
  if (-[PAEnrollmentNode section](self, "section") == 3)
  {
    v3 = CFSTR("PersonalAudioMusicHeading");
    goto LABEL_13;
  }
  if (-[PAEnrollmentNode section](self, "section") == 5)
  {
    v3 = CFSTR("PersonalAudioSetupTransparencyTitle");
    goto LABEL_13;
  }
  if (-[PAEnrollmentNode section](self, "section") == 8)
  {
    v3 = CFSTR("PersonalAudioCompleteTitleOffConfirmation");
    goto LABEL_13;
  }
  v4 = -[PAEnrollmentNode index](self, "index");
  v5 = 0;
  switch(v4)
  {
    case 1uLL:
      v3 = CFSTR("PersonalAudioSpeechTitle");
      goto LABEL_13;
    case 2uLL:
      v3 = CFSTR("PersonalAudioSpeechTitle2");
      goto LABEL_13;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v3 = CFSTR("PersonalAudioMediaTitle");
      goto LABEL_13;
    case 7uLL:
      paLocString(CFSTR("PersonalAudioSetupComplete"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "personalMediaConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        paLocString(CFSTR("PersonalAudioSetupCompleteOff"));
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v9;
      }
      break;
    default:
      return (NSString *)v5;
  }
  return (NSString *)v5;
}

- (NSString)tuningDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;

  -[PAEnrollmentNode configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "level");

  -[PAEnrollmentNode configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shape");

  switch(v6)
  {
    case 3:
      v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        v8 = off_1EA9023D8;
        goto LABEL_10;
      }
      goto LABEL_11;
    case 2:
      v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        v8 = off_1EA9023C0;
        goto LABEL_10;
      }
LABEL_11:
      v10 = 0;
      return (NSString *)v10;
    case 1:
      v7 = v4 - 1;
      if ((unint64_t)(v4 - 1) < 3)
      {
        v8 = off_1EA9023A8;
LABEL_10:
        v9 = v8[v7];
LABEL_15:
        paLocString(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        return (NSString *)v10;
      }
      goto LABEL_11;
  }
  v10 = 0;
  if (v6 == 12 && v4 == 12)
  {
    v9 = CFSTR("PersonalAudioResultAudiogram");
    goto LABEL_15;
  }
  return (NSString *)v10;
}

- (id)key
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[PAEnrollmentNode options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[PAEnrollmentNode section](self, "section");
  v6 = v5;
  if (v4 == 2)
  {
    -[PAEnrollmentNode options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");
    -[PAEnrollmentNode options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    paKeyFromNodeParameters(v6, v9, objc_msgSend(v11, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    paKeyFromNodeParameters(v5, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)progressDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  paLocString(CFSTR("PersonalAudioStepTemplate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAEnrollmentNode index](self, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAEnrollmentNode totalSteps](self, "totalSteps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PAEnrollmentNode;
  -[PAEnrollmentNode description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PAEnrollmentNode section](self, "section");
  v6 = -[PAEnrollmentNode type](self, "type");
  -[PAEnrollmentNode configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "level");
  -[PAEnrollmentNode configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %lu, %lu [%lu, %lu]"), v4, v5, v6, v8, objc_msgSend(v9, "shape"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)totalSteps
{
  return self->_totalSteps;
}

- (void)setTotalSteps:(unint64_t)a3
{
  self->_totalSteps = a3;
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_section = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hideVisualizer
{
  return self->_hideVisualizer;
}

- (void)setHideVisualizer:(BOOL)a3
{
  self->_hideVisualizer = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void)setStimuli:(id)a3
{
  objc_storeStrong((id *)&self->_stimuli, a3);
}

- (void)setHeading:(id)a3
{
  objc_storeStrong((id *)&self->_heading, a3);
}

- (void)setInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (PAConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)setTuningDescription:(id)a3
{
  objc_storeStrong((id *)&self->_tuningDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_stimuli, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
