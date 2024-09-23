@implementation _UIFeedbackBackBoardHIDPattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("BKSHID");
}

+ (id)feedbackPatternWithName:(id)a3 deviceType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:deviceType:senderID:powerSourceID:", v6, a4, 0, 0);

  return v7;
}

+ (id)feedbackPatternWithName:(id)a3 deviceType:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:deviceType:senderID:powerSourceID:", v8, a4, a5, 0);

  return v9;
}

- (_UIFeedbackBackBoardHIDPattern)initWithName:(id)a3 deviceType:(int64_t)a4 senderID:(unint64_t)a5 powerSourceID:(id)a6
{
  id v11;
  id v12;
  _UIFeedbackBackBoardHIDPattern *v13;
  _UIFeedbackBackBoardHIDPattern *v14;
  _UIFeedbackBackBoardHIDPattern *v15;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_UIFeedbackBackBoardHIDPattern;
  v13 = -[_UIFeedback init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_patternName, a3);
    v14->_deviceType = a4;
    v14->_senderID = a5;
    objc_storeStrong((id *)&v14->_powerSourceID, a6);
    v15 = v14;
  }

  return v14;
}

- (_UIFeedbackBackBoardHIDPattern)initWithName:(id)a3 deviceType:(int64_t)a4
{
  return -[_UIFeedbackBackBoardHIDPattern initWithName:deviceType:senderID:powerSourceID:](self, "initWithName:deviceType:senderID:powerSourceID:", a3, a4, 0, 0);
}

- (_UIFeedbackBackBoardHIDPattern)initWithName:(id)a3 deviceType:(int64_t)a4 senderID:(unint64_t)a5
{
  return -[_UIFeedbackBackBoardHIDPattern initWithName:deviceType:senderID:powerSourceID:](self, "initWithName:deviceType:senderID:powerSourceID:", a3, a4, a5, 0);
}

- (_UIFeedbackBackBoardHIDPattern)initWithName:(id)a3 deviceType:(int64_t)a4 powerSourceID:(id)a5
{
  return -[_UIFeedbackBackBoardHIDPattern initWithName:deviceType:senderID:powerSourceID:](self, "initWithName:deviceType:senderID:powerSourceID:", a3, a4, 0, a5);
}

- (id)completeFeedbackPatternWithSenderID:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:deviceType:senderID:powerSourceID:", self->_patternName, self->_deviceType, a3, 0);
}

- (id)completeFeedbackPatternWithPowerSourceID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:deviceType:senderID:powerSourceID:", self->_patternName, self->_deviceType, 0, v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackBackBoardHIDPattern;
  v5 = -[_UIFeedback copyWithZone:](&v9, sel_copyWithZone_);
  objc_storeStrong(v5 + 20, self->_patternName);
  v5[17] = (id)self->_deviceType;
  v5[18] = (id)self->_senderID;
  v6 = -[NSNumber copyWithZone:](self->_powerSourceID, "copyWithZone:", a3);
  v7 = v5[19];
  v5[19] = (id)v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  char v11;
  int v12;
  NSNumber *powerSourceID;
  void *v14;
  NSString *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIFeedbackBackBoardHIDPattern;
  if (-[_UIFeedback isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[20];
    v7 = self->_patternName;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {
        v11 = 0;
LABEL_9:

LABEL_20:
        goto LABEL_21;
      }
      v12 = -[NSString isEqual:](v7, "isEqual:", v8);

      if (!v12)
      {
LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
    }
    if (self->_deviceType == v5[17] && self->_senderID == v5[18])
    {
      powerSourceID = self->_powerSourceID;
      v14 = (void *)v5[19];
      v7 = powerSourceID;
      v15 = v14;
      if (v7 == v15)
      {
        v11 = 1;
        v9 = v7;
      }
      else
      {
        v9 = v15;
        v11 = 0;
        if (v7 && v15)
          v11 = -[NSString isEqual:](v7, "isEqual:", v15);
      }
      goto LABEL_9;
    }
    goto LABEL_19;
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (_UIFeedbackBackBoardHIDPattern)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedbackBackBoardHIDPattern *v5;
  uint64_t v6;
  NSString *patternName;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumber *powerSourceID;
  _UIFeedbackBackBoardHIDPattern *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIFeedbackBackBoardHIDPattern;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v14, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternName"));
    v6 = objc_claimAutoreleasedReturnValue();
    patternName = v5->_patternName;
    v5->_patternName = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceType = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_senderID = objc_msgSend(v9, "unsignedLongLongValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("powerSourceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    powerSourceID = v5->_powerSourceID;
    v5->_powerSourceID = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackBackBoardHIDPattern;
  -[_UIFeedback dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[BKSHIDHapticFeedbackRequest pattern](self->_hidRequest, "pattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("patternName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BKSHIDHapticFeedbackRequest deviceType](self->_hidRequest, "deviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BKSHIDHapticFeedbackRequest senderID](self->_hidRequest, "senderID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("senderID"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_powerSourceID, CFSTR("powerSourceID"));
  return v4;
}

- (id)_playableProtocol
{
  return &unk_1EDF1A0F0;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  int64_t deviceType;

  deviceType = self->_deviceType;
  if (deviceType)
    return 8 * (deviceType == 1);
  else
    return 4;
}

- (BKSHIDHapticFeedbackRequest)hidRequest
{
  int has_internal_diagnostics;
  int64_t deviceType;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  deviceType = self->_deviceType;
  if (has_internal_diagnostics)
  {
    if (deviceType < 0)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Attempted to use a HID pattern feedback without populating a device. This will not play.", buf, 2u);
      }

    }
  }
  else if (deviceType < 0)
  {
    v7 = hidRequest___s_category;
    if (!hidRequest___s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&hidRequest___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Attempted to use a HID pattern feedback without populating a device. This will not play.", buf, 2u);
    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44___UIFeedbackBackBoardHIDPattern_hidRequest__block_invoke;
  v9[3] = &unk_1E16C5710;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0D00D40], "build:", v9);
  return (BKSHIDHapticFeedbackRequest *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isHighPriority
{
  return 0;
}

- (NSString)patternName
{
  return self->_patternName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternName, 0);
  objc_storeStrong((id *)&self->_powerSourceID, 0);
  objc_storeStrong((id *)&self->_hidRequest, 0);
}

@end
