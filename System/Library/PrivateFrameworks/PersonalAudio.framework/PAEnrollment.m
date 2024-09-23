@implementation PAEnrollment

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_enrollment;
}

void __30__PAEnrollment_sharedInstance__block_invoke()
{
  PAEnrollment *v0;
  void *v1;

  v0 = objc_alloc_init(PAEnrollment);
  v1 = (void *)sharedInstance_enrollment;
  sharedInstance_enrollment = (uint64_t)v0;

}

+ (id)enrollmentWithAudiogram:(id)a3
{
  id v3;
  PAEnrollment *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(PAEnrollment);
  +[PAAudiogramUtilities normalizedOffsetsFromAudiogram:](PAAudiogramUtilities, "normalizedOffsetsFromAudiogram:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PAConfiguration configurationWithAudiogram:](PAConfiguration, "configurationWithAudiogram:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAEnrollment setAudiogramPreset:](v4, "setAudiogramPreset:", v6);

  return v4;
}

- (PAEnrollment)init
{
  PAEnrollment *v2;
  PAEnrollment *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEnrollment;
  v2 = -[PAEnrollment init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PAEnrollment addHandlers](v2, "addHandlers");
  return v3;
}

- (void)addHandlers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id (*v6)(uint64_t);
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 0, 0, 0, &__block_literal_global_4);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__PAEnrollment_addHandlers__block_invoke_2;
  v11[3] = &unk_1EA902858;
  objc_copyWeak(&v12, &location);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 2, 0, 1, v11);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __27__PAEnrollment_addHandlers__block_invoke_3;
  v9[3] = &unk_1EA902858;
  objc_copyWeak(&v10, &location);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 2, 0, 2, v9);
  v4 = v3;
  v5 = 3221225472;
  v6 = __27__PAEnrollment_addHandlers__block_invoke_4;
  v7 = &unk_1EA902858;
  objc_copyWeak(&v8, &location);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 3, 0, 0, &v4);
  -[PAEnrollment addOffEnrollmentStepComparing:](self, "addOffEnrollmentStepComparing:", 3, v4, v5, v6, v7);
  -[PAEnrollment addOffEnrollmentStepComparing:](self, "addOffEnrollmentStepComparing:", 4);
  -[PAEnrollment addLevelEnrollmentStepsStartingWith:](self, "addLevelEnrollmentStepsStartingWith:", 3);
  -[PAEnrollment addLevelEnrollmentStepsStartingWith:](self, "addLevelEnrollmentStepsStartingWith:", 6);
  -[PAEnrollment addLevelEnrollmentStepsStartingWith:](self, "addLevelEnrollmentStepsStartingWith:", 9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __27__PAEnrollment_addHandlers__block_invoke()
{
  void *v0;

  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 2, 1, 0, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setIndex:", 1);
  return v0;
}

id __27__PAEnrollment_addHandlers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  if (objc_msgSend(a3, "type"))
  {
    +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 2, 2, 0, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 2;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setSelectedLevel:", 3);

    +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", 3, 3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 3;
  }
  objc_msgSend(v4, "setIndex:", v6);
  return v5;
}

id __27__PAEnrollment_addHandlers__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id WeakRetained;
  void *v6;

  if (objc_msgSend(a3, "type"))
    v4 = 9;
  else
    v4 = 6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSelectedLevel:", v4);

  +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", 3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndex:", 3);
  return v6;
}

id __27__PAEnrollment_addHandlers__block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "selectedLevel");

  if (v3 == 9)
  {
    v4 = 9;
    v5 = 9;
    v6 = 10;
  }
  else
  {
    v7 = objc_loadWeakRetained(v1);
    v8 = objc_msgSend(v7, "selectedLevel");

    if (v8 == 3)
    {
      v4 = 3;
      v5 = 0;
      v6 = 3;
    }
    else
    {
      v4 = 6;
      v5 = 6;
      v6 = 7;
    }
  }
  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 4, v4, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIndex:", 3);
  return v9;
}

- (void)addOffEnrollmentStepComparing:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PAEnrollment_addOffEnrollmentStepComparing___block_invoke;
  v3[3] = &__block_descriptor_40_e65___PAEnrollmentNode_24__0__PAEnrollmentNode_8__PAEnrollmentNode_16l;
  v3[4] = a3;
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 4, 0, a3, v3);
}

id __46__PAEnrollment_addOffEnrollmentStepComparing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "type") + 1;
  if (!objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v5, "type") == 4)
    {
      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPersonalMediaConfiguration:", 0);

      v7 = 7;
      +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", 7, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v10;
      goto LABEL_10;
    }
    v12 = *(_QWORD *)(a1 + 32) + 1;
    v11 = 0;
LABEL_8:
    +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 4, v12, v11, v12);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "type") != 5)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v11 + 1;
    goto LABEL_8;
  }
  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 6, 5, 5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 7;
LABEL_10:
  objc_msgSend(v8, "setIndex:", v7);

  return v8;
}

- (void)addLevelEnrollmentStepsStartingWith:(unint64_t)a3
{
  unint64_t v5;
  _QWORD v6[5];

  v5 = a3 + 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke;
  v6[3] = &__block_descriptor_40_e65___PAEnrollmentNode_24__0__PAEnrollmentNode_8__PAEnrollmentNode_16l;
  v6[4] = a3;
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 4, a3, a3 + 1, v6);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 4, v5, a3 + 2, &__block_literal_global_7);
  -[PAEnrollment addEnrollmentStepForSection:comparing:withOption:andBlock:](self, "addEnrollmentStepForSection:comparing:withOption:andBlock:", 4, a3, a3 + 2, &__block_literal_global_8_0);
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "type");

  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 4, v5, v6, *(_QWORD *)(a1 + 32) + 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_QWORD *)(a1 + 32) == 3)
    v9 = 5;
  else
    v9 = 4;
  objc_msgSend(v7, "setIndex:", v9);
  return v8;
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(v3, "type");

  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 6, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndex:", 7);
  return v6;
}

id __52__PAEnrollment_addLevelEnrollmentStepsStartingWith___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  v5 = objc_msgSend(v3, "type");

  +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 6, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndex:", 7);
  return v6;
}

- (void)addEnrollmentStepForSection:(unint64_t)a3 comparing:(unint64_t)a4 withOption:(unint64_t)a5 andBlock:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a6;
  -[PAEnrollment enrollmentHandlers](self, "enrollmentHandlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAEnrollment setEnrollmentHandlers:](self, "setEnrollmentHandlers:", v10);
  }
  v11 = (void *)MEMORY[0x1DF0EBCEC](v13);
  paKeyFromNodeParameters(a3, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, v12);

}

- (id)enrollmentNodeAfter:(id)a3 withSelectedNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  PAConfiguration *audiogramPreset;
  void *v25;

  v6 = a3;
  v7 = a4;
  -[PAEnrollment enrollmentHandlers](self, "enrollmentHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "section");
  objc_msgSend(v6, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_audiogramPreset && v11 <= 4)
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPersonalMediaConfiguration:", self->_audiogramPreset);

    +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 6, 12, 12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConfiguration:", self->_audiogramPreset);

    objc_msgSend(v14, "setConfiguration:", self->_audiogramPreset);
    v17 = v14;
LABEL_4:
    v18 = 7;
    goto LABEL_5;
  }
  if (v11 == 6)
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "personalMediaEnabled") & 1) != 0)
    {
      v22 = paCurrentRouteSupportsTransparencyAccommodations();

      if (v22)
      {
        +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 5, objc_msgSend(v6, "type"), objc_msgSend(v6, "type"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setConfiguration:", v12);
        v17 = v14;
        v18 = 6;
        goto LABEL_5;
      }
    }
    else
    {

    }
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "personalMediaEnabled"))
    {

    }
    else
    {
      audiogramPreset = self->_audiogramPreset;

      if (!audiogramPreset)
      {
        +[PAEnrollmentNode nodeWithSection:type:andConfiguration:](PAEnrollmentNode, "nodeWithSection:type:andConfiguration:", 8, objc_msgSend(v6, "type"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v17;
        goto LABEL_4;
      }
    }
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  if (v11 > 4)
    goto LABEL_23;
  if (!v10)
  {
    +[PAEnrollmentNode nodeWithSection:andType:comparing:with:](PAEnrollmentNode, "nodeWithSection:andType:comparing:with:", 2, 1, 0, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    v18 = 1;
LABEL_5:
    objc_msgSend(v17, "setIndex:", v18);
    if (v14)
      goto LABEL_6;
LABEL_24:
    v20 = 1;
    goto LABEL_25;
  }
  ((void (**)(_QWORD, id, id))v10)[2](v10, v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_24;
LABEL_6:
  v19 = objc_msgSend(v14, "index");
  if ((unint64_t)(v19 - 1) >= 2)
  {
    if ((unint64_t)(v19 - 2) >= 4)
      v20 = 1;
    else
      v20 = 3;
  }
  else
  {
    v20 = 2;
  }
LABEL_25:
  -[PAEnrollment setProgress:](self, "setProgress:", v20);
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCurrentEnrollmentProgress:", v20);

  return v14;
}

- (unint64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(unint64_t)a3
{
  self->_progress = a3;
}

- (PAConfiguration)audiogramPreset
{
  return self->_audiogramPreset;
}

- (void)setAudiogramPreset:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramPreset, a3);
}

- (NSMutableDictionary)enrollmentHandlers
{
  return self->_enrollmentHandlers;
}

- (void)setEnrollmentHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentHandlers, a3);
}

- (unint64_t)selectedLevel
{
  return self->_selectedLevel;
}

- (void)setSelectedLevel:(unint64_t)a3
{
  self->_selectedLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentHandlers, 0);
  objc_storeStrong((id *)&self->_audiogramPreset, 0);
}

@end
