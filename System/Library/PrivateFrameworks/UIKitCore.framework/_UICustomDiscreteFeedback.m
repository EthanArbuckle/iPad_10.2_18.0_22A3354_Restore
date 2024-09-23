@implementation _UICustomDiscreteFeedback

+ (id)customDiscreteFeedbackWithEventType:(unint64_t)a3 systemSoundID:(unsigned int)a4
{
  uint64_t v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____UICustomDiscreteFeedback;
  objc_msgSendSuper2(&v8, sel_discreteFeedbackForType_, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 152) = a3;
  *(_DWORD *)(v6 + 144) = a4;
  return (id)v6;
}

- (_UICustomDiscreteFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UICustomDiscreteFeedback *v5;
  void *v6;
  void *v7;
  _UICustomDiscreteFeedback *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UICustomDiscreteFeedback;
  v5 = -[_UIDiscreteFeedback initWithDictionaryRepresentation:](&v10, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventType = (int)objc_msgSend(v6, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemSoundID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_systemSoundID = objc_msgSend(v7, "intValue");

    v8 = v5;
  }

  return v5;
}

+ (id)type
{
  return CFSTR("custom");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICustomDiscreteFeedback;
  result = -[_UIDiscreteFeedback copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 19) = self->_eventType;
  *((_DWORD *)result + 36) = self->_systemSoundID;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UICustomDiscreteFeedback;
  v5 = -[_UIDiscreteFeedback isEqual:](&v7, sel_isEqual_, v4)
    && self->_eventType == v4[19]
    && self->_systemSoundID == *((_DWORD *)v4 + 36);

  return v5;
}

- (unint64_t)_effectiveEventType
{
  unint64_t result;
  objc_super v4;

  result = self->_eventType;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICustomDiscreteFeedback;
    return -[_UIDiscreteFeedback _effectiveEventType](&v4, sel__effectiveEventType);
  }
  return result;
}

- (unsigned)_effectiveSystemSoundID
{
  unsigned int result;
  objc_super v4;

  result = self->_systemSoundID;
  if (result == _UISystemSoundIDNone)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICustomDiscreteFeedback;
    return -[_UIDiscreteFeedback _effectiveSystemSoundID](&v4, sel__effectiveSystemSoundID);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UICustomDiscreteFeedback;
  -[_UIDiscreteFeedback dictionaryRepresentation](&v9, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("systemSoundID");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_systemSoundID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  return v4;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

@end
