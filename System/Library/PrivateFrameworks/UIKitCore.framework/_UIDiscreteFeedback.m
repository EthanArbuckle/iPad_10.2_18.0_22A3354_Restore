@implementation _UIDiscreteFeedback

+ (id)discreteFeedbackForType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setType:", a3);
  return v4;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDiscreteFeedback;
  result = -[_UIFeedback copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 17) = self->_type;
  return result;
}

- (_UIDiscreteFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIDiscreteFeedback *v5;
  void *v6;
  _UIDiscreteFeedback *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiscreteFeedback;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v9, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedbackType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = (int)objc_msgSend(v6, "intValue");

    v7 = v5;
  }

  return v5;
}

- (unint64_t)_effectiveEventType
{
  int64_t type;
  unint64_t result;

  type = self->_type;
  switch(type)
  {
    case 1:
      result = 14167;
      break;
    case 2:
      result = 20311;
      break;
    case 3:
      result = 29527;
      break;
    case 4:
      result = 11094;
      break;
    case 5:
      result = 17238;
      break;
    case 6:
      result = 26454;
      break;
    case 7:
      goto LABEL_5;
    case 8:
      result = 17237;
      break;
    case 9:
      result = 26453;
      break;
    case 10:
      result = 8022;
      break;
    case 11:
      result = 29525;
      break;
    default:
      if (type == 1000)
      {
        result = 8021;
      }
      else if (type == 1002)
      {
LABEL_5:
        result = 11093;
      }
      else
      {
        result = 0;
      }
      break;
  }
  return result;
}

- (unsigned)_effectiveSystemSoundID
{
  int64_t type;

  type = self->_type;
  if (type == 1001)
    return 1519;
  if (type == 1002)
    return 1520;
  return _UISystemSoundIDNone;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("discrete");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDiscreteFeedback;
  if (-[_UIFeedback isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_type == v4[17];
  else
    v5 = 0;

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIDiscreteFeedback;
  -[_UIFeedback dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v9 = CFSTR("feedbackType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  return v4;
}

- (id)_playableProtocol
{
  return &unk_1EDF1A0F0;
}

- (BOOL)isPlaying
{
  void *v2;
  BOOL v3;

  -[_UIFeedback _player](self, "_player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_debugDictionary
{
  int64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("feedbackType");
  v3 = -[_UIDiscreteFeedback type](self, "type");
  if ((unint64_t)(v3 - 1) > 8)
    v4 = CFSTR("Unknown");
  else
    v4 = off_1E16C5748[v3 - 1];
  v10[0] = v4;
  v9[1] = CFSTR("effectiveEventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_UIDiscreteFeedback _effectiveEventType](self, "_effectiveEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("effectiveSystemSoundID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_UIDiscreteFeedback _effectiveSystemSoundID](self, "_effectiveSystemSoundID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (int64_t)type
{
  return self->_type;
}

@end
