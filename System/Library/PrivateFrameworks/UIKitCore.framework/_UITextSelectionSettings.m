@implementation _UITextSelectionSettings

- (double)allowableSeparation
{
  return self->_allowableSeparation;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___UITextSelectionSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EDDAC8A0 != -1)
    dispatch_once(&qword_1EDDAC8A0, block);
  return (id)_MergedGlobals_12_0;
}

- (void)setDefaultValues
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[_UITextSelectionSettings setMinPinkWidth:](self, "setMinPinkWidth:", 10.0);
  -[_UITextSelectionSettings setMaxPinkWidth:](self, "setMaxPinkWidth:", 30.0);
  -[_UITextSelectionSettings setPinkWidthFactor:](self, "setPinkWidthFactor:", 0.3);
  -[_UITextSelectionSettings setLinear:](self, "setLinear:", 2.0);
  -[_UITextSelectionSettings setParabolic:](self, "setParabolic:", 5.0);
  -[_UITextSelectionSettings setGain:](self, "setGain:", 0.2);
  -[_UITextSelectionSettings setAllowableSeparation:](self, "setAllowableSeparation:", 300.0);
  -[_UITextSelectionSettings setAllowableForceMovement:](self, "setAllowableForceMovement:", 15.0);
  v3 = MEMORY[0x1E0C9AAB0];
  -[_UITextSelectionSettings setAllowExtendingSelections:](self, "setAllowExtendingSelections:", MEMORY[0x1E0C9AAB0]);
  -[_UITextSelectionSettings setShouldUseAcceleration:](self, "setShouldUseAcceleration:", v3);
  v4 = MEMORY[0x1E0C9AAA0];
  -[_UITextSelectionSettings setShouldPreferEndOfWord:](self, "setShouldPreferEndOfWord:", MEMORY[0x1E0C9AAA0]);
  -[_UITextSelectionSettings setEnableDeepPress:](self, "setEnableDeepPress:", v4);
}

- (void)setShouldUseAcceleration:(id)a3
{
  objc_storeStrong((id *)&self->_shouldUseAcceleration, a3);
}

- (void)setShouldPreferEndOfWord:(id)a3
{
  objc_storeStrong((id *)&self->_shouldPreferEndOfWord, a3);
}

- (void)setPinkWidthFactor:(double)a3
{
  self->_pinkWidthFactor = a3;
}

- (void)setParabolic:(double)a3
{
  self->_parabolic = a3;
}

- (void)setMinPinkWidth:(double)a3
{
  self->_minPinkWidth = a3;
}

- (void)setMaxPinkWidth:(double)a3
{
  self->_maxPinkWidth = a3;
}

- (void)setLinear:(double)a3
{
  self->_linear = a3;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (void)setEnableDeepPress:(id)a3
{
  objc_storeStrong((id *)&self->_enableDeepPress, a3);
}

- (void)setAllowableSeparation:(double)a3
{
  self->_allowableSeparation = a3;
}

- (void)setAllowableForceMovement:(double)a3
{
  self->_allowableForceMovement = a3;
}

- (void)setAllowExtendingSelections:(id)a3
{
  objc_storeStrong((id *)&self->_allowExtendingSelections, a3);
}

- (double)minPinkWidth
{
  return self->_minPinkWidth;
}

- (double)maxPinkWidth
{
  return self->_maxPinkWidth;
}

- (double)pinkWidthFactor
{
  return self->_pinkWidthFactor;
}

- (double)linear
{
  return self->_linear;
}

- (double)parabolic
{
  return self->_parabolic;
}

- (double)gain
{
  return self->_gain;
}

- (double)allowableForceMovement
{
  return self->_allowableForceMovement;
}

- (NSNumber)shouldUseAcceleration
{
  return self->_shouldUseAcceleration;
}

- (NSNumber)shouldPreferEndOfWord
{
  return self->_shouldPreferEndOfWord;
}

- (NSNumber)allowExtendingSelections
{
  return self->_allowExtendingSelections;
}

- (NSNumber)enableDeepPress
{
  return self->_enableDeepPress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableDeepPress, 0);
  objc_storeStrong((id *)&self->_allowExtendingSelections, 0);
  objc_storeStrong((id *)&self->_shouldPreferEndOfWord, 0);
  objc_storeStrong((id *)&self->_shouldUseAcceleration, 0);
}

@end
