@implementation SFSearchViewAppearFeedback

- (SFSearchViewAppearFeedback)initWithEvent:(unint64_t)a3
{
  SFSearchViewAppearFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewAppearFeedback;
  result = -[SFFeedback init](&v5, sel_init);
  if (result)
    result->_viewAppearEvent = a3;
  return result;
}

- (void)setIsUsingLoweredSearchBar:(BOOL)a3
{
  self->_isUsingLoweredSearchBar = a3;
}

- (void)setPreexistingInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (void)setReaderTextAvailable:(BOOL)a3
{
  self->_readerTextAvailable = a3;
}

- (BOOL)readerTextAvailable
{
  return self->_readerTextAvailable;
}

- (NSString)preexistingInput
{
  return self->_preexistingInput;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (BOOL)isUsingLoweredSearchBar
{
  return self->_isUsingLoweredSearchBar;
}

- (BOOL)isOverApp
{
  return self->_isOverApp;
}

- (BOOL)isOnLockScreen
{
  return self->_isOnLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingApp, 0);
  objc_storeStrong((id *)&self->_preexistingInput, 0);
}

- (SFSearchViewAppearFeedback)initWithCoder:(id)a3
{
  id v4;
  SFSearchViewAppearFeedback *v5;
  uint64_t v6;
  NSString *preexistingInput;
  uint64_t v8;
  NSString *originatingApp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFSearchViewAppearFeedback;
  v5 = -[SFFeedback initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_viewAppearEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("viewAppearEvent"));
    v5->_isOnLockScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isOnLockScreen"));
    v5->_isOverApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isOverApp"));
    v5->_readerTextAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_readerTextAvailable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preexistingInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    preexistingInput = v5->_preexistingInput;
    v5->_preexistingInput = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originatingApp"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatingApp = v5->_originatingApp;
    v5->_originatingApp = (NSString *)v8;

    v5->_isUsingLoweredSearchBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isUsingLoweredSearchBar"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewAppearFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_viewAppearEvent, CFSTR("viewAppearEvent"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isOnLockScreen, CFSTR("_isOnLockScreen"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isOverApp, CFSTR("_isOverApp"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_readerTextAvailable, CFSTR("_readerTextAvailable"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preexistingInput, CFSTR("_preexistingInput"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingApp, CFSTR("_originatingApp"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isUsingLoweredSearchBar, CFSTR("_isUsingLoweredSearchBar"));

}

- (void)setViewAppearEvent:(unint64_t)a3
{
  self->_viewAppearEvent = a3;
}

- (void)setIsOnLockScreen:(BOOL)a3
{
  self->_isOnLockScreen = a3;
}

- (void)setIsOverApp:(BOOL)a3
{
  self->_isOverApp = a3;
}

- (void)setOriginatingApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
