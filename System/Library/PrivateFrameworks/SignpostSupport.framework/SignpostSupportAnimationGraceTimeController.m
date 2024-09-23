@implementation SignpostSupportAnimationGraceTimeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGraceTime, 0);
  objc_storeStrong((id *)&self->_userInitiatedGraceTime, 0);
  objc_storeStrong((id *)&self->_userInteractiveGraceTime, 0);
  objc_storeStrong((id *)&self->_subsystemGraceTimesDictionary, 0);
}

- (SignpostSupportAnimationGraceTimeController)init
{
  SignpostSupportAnimationGraceTimeController *v2;
  uint64_t v3;
  NSMutableDictionary *subsystemGraceTimesDictionary;
  SignpostSupportAnimationGraceTime *v5;
  SignpostSupportAnimationGraceTime *userInitiatedGraceTime;
  SignpostSupportAnimationGraceTime *v7;
  SignpostSupportAnimationGraceTime *userInteractiveGraceTime;
  SignpostSupportAnimationGraceTime *v9;
  SignpostSupportAnimationGraceTime *defaultGraceTime;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportAnimationGraceTimeController;
  v2 = -[SignpostSupportAnimationGraceTimeController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    subsystemGraceTimesDictionary = v2->_subsystemGraceTimesDictionary;
    v2->_subsystemGraceTimesDictionary = (NSMutableDictionary *)v3;

    v5 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 2, 50);
    userInitiatedGraceTime = v2->_userInitiatedGraceTime;
    v2->_userInitiatedGraceTime = v5;

    v7 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 1, 20);
    userInteractiveGraceTime = v2->_userInteractiveGraceTime;
    v2->_userInteractiveGraceTime = v7;

    v9 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 0, 0);
    defaultGraceTime = v2->_defaultGraceTime;
    v2->_defaultGraceTime = v9;

    -[SignpostSupportAnimationGraceTimeController setAnimationType:forSubsystem:category:name:](v2, "setAnimationType:forSubsystem:category:name:", 1, CFSTR("com.apple.UIKit"), CFSTR("ScrollView"), CFSTR("Scroll_Dragging"));
    -[SignpostSupportAnimationGraceTimeController setAnimationType:forSubsystem:category:name:](v2, "setAnimationType:forSubsystem:category:name:", 1, CFSTR("com.apple.UIKit"), CFSTR("ScrollView"), CFSTR("Scroll_DraggingAndDeceleration"));
  }
  return v2;
}

- (void)setAnimationType:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = a6;
  if (a3)
  {
    if (a3 == 1)
    {
      -[SignpostSupportAnimationGraceTimeController userInteractiveGraceTime](self, "userInteractiveGraceTime");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
        goto LABEL_9;
      -[SignpostSupportAnimationGraceTimeController userInitiatedGraceTime](self, "userInitiatedGraceTime");
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[SignpostSupportAnimationGraceTimeController defaultGraceTime](self, "defaultGraceTime");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  if (v12)
  {
    -[SignpostSupportAnimationGraceTimeController _setFirstFrameGraceTime:forSubsystem:category:name:](self, "_setFirstFrameGraceTime:forSubsystem:category:name:", v12, v14, v10, v11);

  }
LABEL_9:

}

- (SignpostSupportAnimationGraceTime)userInteractiveGraceTime
{
  return self->_userInteractiveGraceTime;
}

- (id)gracetimeForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SignpostSupportAnimationGraceTimeController subsystemGraceTimesDictionary](self, "subsystemGraceTimesDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_13;
  if (!v8)
  {
    objc_msgSend(v12, "defaultGraceTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_13;
    goto LABEL_14;
  }
  objc_msgSend(v12, "overrides");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v14 = v12;
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend(v14, "defaultGraceTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v14, "overrides");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = v15;
  objc_msgSend(v17, "defaultGraceTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  if (!v19)
  {
LABEL_13:
    -[SignpostSupportAnimationGraceTimeController defaultGraceTime](self, "defaultGraceTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v19;
}

- (void)_setFirstFrameGraceTime:(id)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SignpostSupportGraceTimeOverrideEntry *v14;
  void *v15;
  void *v16;
  SignpostSupportGraceTimeOverrideEntry *v17;
  void *v18;
  void *v19;
  SignpostSupportGraceTimeOverrideEntry *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[SignpostSupportAnimationGraceTimeController subsystemGraceTimesDictionary](self, "subsystemGraceTimesDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (SignpostSupportGraceTimeOverrideEntry *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = -[SignpostSupportGraceTimeOverrideEntry initWithEntryLevel:]([SignpostSupportGraceTimeOverrideEntry alloc], "initWithEntryLevel:", 0);
    -[SignpostSupportAnimationGraceTimeController subsystemGraceTimesDictionary](self, "subsystemGraceTimesDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v10);

  }
  if (v11)
  {
    -[SignpostSupportGraceTimeOverrideEntry overrides](v14, "overrides");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v17 = (SignpostSupportGraceTimeOverrideEntry *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v17 = -[SignpostSupportGraceTimeOverrideEntry initWithEntryLevel:]([SignpostSupportGraceTimeOverrideEntry alloc], "initWithEntryLevel:", 1);
      -[SignpostSupportGraceTimeOverrideEntry overrides](v14, "overrides");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v11);

    }
    if (v12)
    {
      -[SignpostSupportGraceTimeOverrideEntry overrides](v17, "overrides");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v12);
      v20 = (SignpostSupportGraceTimeOverrideEntry *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v20 = -[SignpostSupportGraceTimeOverrideEntry initWithEntryLevel:]([SignpostSupportGraceTimeOverrideEntry alloc], "initWithEntryLevel:", 2);
        -[SignpostSupportGraceTimeOverrideEntry overrides](v17, "overrides");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v12);

      }
      -[SignpostSupportGraceTimeOverrideEntry setDefaultGraceTime:](v20, "setDefaultGraceTime:", v22);

    }
    else
    {
      -[SignpostSupportGraceTimeOverrideEntry setDefaultGraceTime:](v17, "setDefaultGraceTime:", v22);
    }

  }
  else
  {
    -[SignpostSupportGraceTimeOverrideEntry setDefaultGraceTime:](v14, "setDefaultGraceTime:", v22);
  }

}

- (NSMutableDictionary)subsystemGraceTimesDictionary
{
  return self->_subsystemGraceTimesDictionary;
}

- (SignpostSupportAnimationGraceTime)defaultGraceTime
{
  return self->_defaultGraceTime;
}

- (unint64_t)userInitiatedGraceTimeMs
{
  void *v2;
  unint64_t v3;

  -[SignpostSupportAnimationGraceTimeController userInitiatedGraceTime](self, "userInitiatedGraceTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstFrameGraceTimeMs");

  return v3;
}

- (void)setUserInitiatedGraceTimeMs:(unint64_t)a3
{
  id v4;

  -[SignpostSupportAnimationGraceTimeController userInitiatedGraceTime](self, "userInitiatedGraceTime");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstFrameGraceTimeMs:", a3);

}

- (unint64_t)userInteractiveGraceTimeMs
{
  void *v2;
  unint64_t v3;

  -[SignpostSupportAnimationGraceTimeController userInteractiveGraceTime](self, "userInteractiveGraceTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstFrameGraceTimeMs");

  return v3;
}

- (void)setUserInteractiveGraceTimeMs:(unint64_t)a3
{
  id v4;

  -[SignpostSupportAnimationGraceTimeController userInteractiveGraceTime](self, "userInteractiveGraceTime");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstFrameGraceTimeMs:", a3);

}

- (unint64_t)defaultGraceTimeMs
{
  void *v2;
  unint64_t v3;

  -[SignpostSupportAnimationGraceTimeController defaultGraceTime](self, "defaultGraceTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstFrameGraceTimeMs");

  return v3;
}

- (void)setDefaultGraceTimeMs:(unint64_t)a3
{
  id v4;

  -[SignpostSupportAnimationGraceTimeController defaultGraceTime](self, "defaultGraceTime");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstFrameGraceTimeMs:", a3);

}

- (void)setFirstFrameGraceTimeMs:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id v12;
  SignpostSupportAnimationGraceTime *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 3, a3);
  -[SignpostSupportAnimationGraceTimeController _setFirstFrameGraceTime:forSubsystem:category:name:](self, "_setFirstFrameGraceTime:forSubsystem:category:name:", v13, v12, v11, v10);

}

- (unint64_t)gracetimeMsForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  void *v5;
  unint64_t v6;

  -[SignpostSupportAnimationGraceTimeController gracetimeForSubsystem:category:name:](self, "gracetimeForSubsystem:category:name:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "firstFrameGraceTimeMs");

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;

  v3 = (void *)objc_msgSend(&stru_1E4610268, "mutableCopy");
  -[SignpostSupportAnimationGraceTimeController subsystemGraceTimesDictionary](self, "subsystemGraceTimesDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__SignpostSupportAnimationGraceTimeController_debugDescription__block_invoke;
  v15 = &unk_1E4600F78;
  v16 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[SignpostSupportAnimationGraceTimeController userInteractiveGraceTimeMs](self, "userInteractiveGraceTimeMs");
  v8 = -[SignpostSupportAnimationGraceTimeController userInitiatedGraceTimeMs](self, "userInitiatedGraceTimeMs");
  v9 = -[SignpostSupportAnimationGraceTimeController defaultGraceTimeMs](self, "defaultGraceTimeMs");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ \nuserInteractiveGraceTimeMs: %llu \nuserInitiatedGraceTimeMs: %llu \ndefaultGraceTimeMs: %llu \noverrides: {%@\n}"), self, v7, v8, v9, v5, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__SignpostSupportAnimationGraceTimeController_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(a3, "debugDescriptionWithWhitespacePrefix:", CFSTR("    "));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\n  %@: \n%@"), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendString:", v7);
}

- (SignpostSupportAnimationGraceTime)userInitiatedGraceTime
{
  return self->_userInitiatedGraceTime;
}

@end
