@implementation UIDictationInputModeOptions

+ (UIDictationInputModeOptions)dictationInputModeOptionsWithInvocationSource:(id)a3
{
  id v3;
  UIDictationInputModeOptions *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIDictationInputModeOptions);
  -[UIDictationInputModeOptions setInvocationSource:](v4, "setInvocationSource:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInputModeOptions)initWithCoder:(id)a3
{
  id v4;
  UIDictationInputModeOptions *v5;
  uint64_t v6;
  NSString *invocationSource;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v5 = -[UIDictationInputModeOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationSource"));
    v6 = objc_claimAutoreleasedReturnValue();
    invocationSource = v5->_invocationSource;
    v5->_invocationSource = (NSString *)v6;

    v5->_shouldStayInDictationInputModeIfAutoEndpointed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldStayIn"));
    v5->_shouldSupressShowingAlternativesAutomatically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressShowing"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *invocationSource;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  invocationSource = self->_invocationSource;
  v5 = v6;
  if (invocationSource)
  {
    objc_msgSend(v6, "encodeObject:forKey:", invocationSource, CFSTR("invocationSource"));
    v5 = v6;
  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldStayInDictationInputModeIfAutoEndpointed, CFSTR("shouldStayIn"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldSupressShowingAlternativesAutomatically, CFSTR("shouldSuppressShowing"));

}

- (NSString)invocationSource
{
  return self->_invocationSource;
}

- (void)setInvocationSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldStayInDictationInputModeIfAutoEndpointed
{
  return self->_shouldStayInDictationInputModeIfAutoEndpointed;
}

- (void)setShouldStayInDictationInputModeIfAutoEndpointed:(BOOL)a3
{
  self->_shouldStayInDictationInputModeIfAutoEndpointed = a3;
}

- (BOOL)shouldSupressShowingAlternativesAutomatically
{
  return self->_shouldSupressShowingAlternativesAutomatically;
}

- (void)setShouldSupressShowingAlternativesAutomatically:(BOOL)a3
{
  self->_shouldSupressShowingAlternativesAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationSource, 0);
}

@end
