@implementation PGCommand

+ (id)commandForPlaybackAction:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc((Class)a1);
  v9 = &unk_1E62426C0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDictionary:", v6);

  return v7;
}

+ (id)commandForPlaybackAction:(int64_t)a3 associatedBoolValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v4 = a4;
  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1E62426C0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = &unk_1E62426D8;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithDictionary:", v9);

  return v10;
}

+ (id)commandForPlaybackAction:(int64_t)a3 associatedDoubleValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1E62426C0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = &unk_1E62426F0;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithDictionary:", v9);

  return v10;
}

+ (id)commandForSetMuted:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:associatedBoolValue:", 4, a3);
}

+ (id)commandForSetPlaying:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:associatedBoolValue:", 3, a3);
}

+ (id)commandForSetSuspended:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:associatedBoolValue:", 5, a3);
}

+ (id)commandForBeginInterruption
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:", 6);
}

+ (id)commandForEndInterruptionWithShouldResumeSuggestion:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:associatedBoolValue:", 7, a3);
}

+ (id)commandForSkipToLive
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:", 2);
}

+ (id)commandForSkipPreroll
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:", 8);
}

+ (id)commandForSkipByInterval:(double)a3
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:associatedDoubleValue:", 1, a3);
}

+ (id)commandForEndOrLeaveActivityRequested
{
  return (id)objc_msgSend(a1, "commandForPlaybackAction:", 9);
}

+ (id)commandForSystemAction:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PGCommand.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action != PGSystemActionSendToProxy"));

  }
  v5 = objc_alloc((Class)a1);
  v12 = &unk_1E6242708;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  return v8;
}

+ (id)commandForCancelPIP
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 3);
}

+ (id)commandForRestoreFromPIP
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 2);
}

+ (id)commandForToggleControlsVisibility
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 4);
}

+ (id)commandForSendActionButtonTapped
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 1);
}

+ (id)commandForToggleZoom
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 5);
}

+ (id)commandForStartPIP
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 6);
}

+ (id)commandForInvalidateFromProxy
{
  return (id)objc_msgSend(a1, "commandForSystemAction:", 7);
}

+ (id)commandForTestingAction:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PGCommand.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action != 0"));

  }
  v5 = objc_alloc((Class)a1);
  v12 = &unk_1E6242720;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  return v8;
}

+ (id)commandForTestStartPIP
{
  return (id)objc_msgSend(a1, "commandForTestingAction:", 1);
}

+ (id)commandForSetCameraEnabled:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForFaceTimeAction:associatedBoolValue:", 1, a3);
}

+ (id)commandForSetMicrophoneMuted:(BOOL)a3
{
  return (id)objc_msgSend(a1, "commandForFaceTimeAction:associatedBoolValue:", 2, a3);
}

+ (id)commandForSwitchCamera
{
  return (id)objc_msgSend(a1, "commandForFaceTimeAction:", 3);
}

+ (id)commandForMenuItemSelected:(int64_t)a3
{
  return (id)objc_msgSend(a1, "commandForFaceTimeAction:associatedIntegerValue:", 4, a3);
}

+ (id)commandForShowHUD
{
  return (id)objc_msgSend(a1, "commandForFaceTimeAction:", 5);
}

+ (id)commandForFaceTimeAction:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc((Class)a1);
  v9 = &unk_1E6242738;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDictionary:", v6);

  return v7;
}

+ (id)commandForFaceTimeAction:(int64_t)a3 associatedBoolValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v4 = a4;
  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1E6242738;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = &unk_1E62426D8;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithDictionary:", v9);

  return v10;
}

+ (id)commandForFaceTimeAction:(int64_t)a3 associatedIntegerValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc((Class)a1);
  v12[0] = &unk_1E6242738;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = &unk_1E6242750;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithDictionary:", v9);

  return v10;
}

- (PGCommand)initWithDictionary:(id)a3
{
  id v4;
  PGCommand *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGCommand;
  v5 = -[PGCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCommand dictionaryRepresentation](self, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)playbackAction
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E62426C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)systemAction
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E6242708);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)faceTimeAction
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E6242738);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)testingAction
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E6242720);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)associatedBoolValue
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E62426D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)associatedIntegerValue
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E6242750);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (double)associatedDoubleValue
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", &unk_1E62426F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)description
{
  return -[PGCommand descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PGCommand succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PGCommand descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5
{
  id v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a4;
  v7 = a5;
  switch(a3)
  {
    case 1:
      v8 = objc_msgSend(v16, "integerValue") - 1;
      if (v8 >= 9)
        v9 = CFSTR("invalid");
      else
        v9 = off_1E622FA40[v8];
      v12 = CFSTR("playbackAction");
      goto LABEL_21;
    case 2:
      v10 = objc_msgSend(v16, "integerValue") - 1;
      if (v10 >= 5)
        v9 = CFSTR("invalid");
      else
        v9 = off_1E622FA88[v10];
      v12 = CFSTR("faceTimeAction");
      goto LABEL_21;
    case 3:
      v11 = objc_msgSend(v16, "integerValue");
      if (v11 >= 8)
        v9 = CFSTR("invalid");
      else
        v9 = off_1E622FAB0[v11];
      v12 = CFSTR("systemAction");
      goto LABEL_21;
    case 4:
      if (objc_msgSend(v16, "integerValue") == 1)
        v9 = CFSTR("startPIP");
      else
        v9 = CFSTR("invalid");
      v12 = CFSTR("testingAction");
LABEL_21:
      objc_msgSend(v7, "appendString:withName:", v9, v12);
      break;
    case 5:
      v13 = (id)objc_msgSend(v7, "appendBool:withName:", objc_msgSend(v16, "BOOLValue"), CFSTR("associatedBoolValue"));
      break;
    case 6:
      objc_msgSend(v16, "doubleValue");
      v14 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", CFSTR("associatedDoubleValue"), 2);
      break;
    case 7:
      v15 = (id)objc_msgSend(v7, "appendInteger:withName:", objc_msgSend(v16, "integerValue"), CFSTR("associatedIntegerValue"));
      break;
    default:
      break;
  }

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v4 = a3;
  -[PGCommand succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PGCommand;
  -[PGCommand description](&v13, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E622F898;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", v6, v4, v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v4[3] = &unk_1E622FA20;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __51__PGCommand_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendDescriptionForKey:value:toBuilder:", objc_msgSend(a2, "integerValue"), v5, *(_QWORD *)(a1 + 40));

}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
