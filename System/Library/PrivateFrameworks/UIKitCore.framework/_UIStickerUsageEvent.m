@implementation _UIStickerUsageEvent

+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return qword_1866846B8[a3 - 1];
}

+ (BOOL)isPreferredRepresentationAnimated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.stickers.role.animated"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)effectTypeForSticker:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "representations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_UIStickerUsageEvent isPreferredRepresentationAnimated:](_UIStickerUsageEvent, "isPreferredRepresentationAnimated:", v4);

  if (v5)
    v6 = 5;
  else
    v6 = +[_UIStickerUsageEvent effectTypeFromVKCStickerEffectType:](_UIStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", objc_msgSend(v3, "effectType"));

  return v6;
}

- (_UIStickerUsageEvent)initWithSuggestedSticker:(id)a3
{
  id v4;
  _UIStickerUsageEvent *v5;
  _UIStickerUsageEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIStickerUsageEvent;
  v5 = -[_UIStickerUsageEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIStickerUsageEvent setStickerType:](v5, "setStickerType:", 0);
    -[_UIStickerUsageEvent setSourceType:](v6, "setSourceType:", 2);
    -[_UIStickerUsageEvent setEffectType:](v6, "setEffectType:", +[_UIStickerUsageEvent effectTypeForSticker:](_UIStickerUsageEvent, "effectTypeForSticker:", v4));
  }

  return v6;
}

- (id)initForEmojiKeyboardUsage
{
  _UIStickerUsageEvent *v2;
  _UIStickerUsageEvent *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStickerUsageEvent;
  v2 = -[_UIStickerUsageEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIStickerUsageEvent setEffectType:](v2, "setEffectType:", 0);
    -[_UIStickerUsageEvent setStickerType:](v3, "setStickerType:", 2);
    if (_UIApplicationIsFirstPartyStickers())
      v4 = 0;
    else
      v4 = 3;
    -[_UIStickerUsageEvent setSourceType:](v3, "setSourceType:", v4);
  }
  return v3;
}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("usageSource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStickerUsageEvent sourceType](self, "sourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("stickerType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStickerUsageEvent stickerType](self, "stickerType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("usageType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStickerUsageEvent usageType](self, "usageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("effectType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStickerUsageEvent effectType](self, "effectType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(int64_t)a3
{
  self->_usageType = a3;
}

- (int64_t)stickerType
{
  return self->_stickerType;
}

- (void)setStickerType:(int64_t)a3
{
  self->_stickerType = a3;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

@end
