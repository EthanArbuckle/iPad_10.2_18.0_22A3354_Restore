@implementation SBHarmonySettings

- (NSString)whitePointAdaptationInteractiveUpdateTimingFunctionName
{
  return self->_whitePointAdaptationInteractiveUpdateTimingFunctionName;
}

- (float)whitePointAdaptationUpdateDefaultDuration
{
  return self->_whitePointAdaptationUpdateDefaultDuration;
}

- (void)setDefaultValues
{
  double v3;
  id v4;

  +[SBHarmonyController sharedInstance](SBHarmonyController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whitePointAdaptationStrengthForWhitePointAdaptivityStyle:", 0);
  -[SBHarmonySettings setWhitePointAdaptationStrengthStandard:](self, "setWhitePointAdaptationStrengthStandard:");
  objc_msgSend(v4, "whitePointAdaptationStrengthForWhitePointAdaptivityStyle:", 1);
  -[SBHarmonySettings setWhitePointAdaptationStrengthReading:](self, "setWhitePointAdaptationStrengthReading:");
  objc_msgSend(v4, "whitePointAdaptationStrengthForWhitePointAdaptivityStyle:", 2);
  -[SBHarmonySettings setWhitePointAdaptationStrengthPhoto:](self, "setWhitePointAdaptationStrengthPhoto:");
  objc_msgSend(v4, "whitePointAdaptationStrengthForWhitePointAdaptivityStyle:", 3);
  -[SBHarmonySettings setWhitePointAdaptationStrengthVideo:](self, "setWhitePointAdaptationStrengthVideo:");
  objc_msgSend(v4, "whitePointAdaptationStrengthForWhitePointAdaptivityStyle:", 4);
  -[SBHarmonySettings setWhitePointAdaptationStrengthGame:](self, "setWhitePointAdaptationStrengthGame:");
  LODWORD(v3) = 2.0;
  -[SBHarmonySettings setWhitePointAdaptationUpdateDefaultDuration:](self, "setWhitePointAdaptationUpdateDefaultDuration:", v3);
  -[SBHarmonySettings setWhitePointAdaptationInteractiveUpdateEnabled:](self, "setWhitePointAdaptationInteractiveUpdateEnabled:", 1);
  -[SBHarmonySettings setWhitePointAdaptationInteractiveUpdateTimingFunctionName:](self, "setWhitePointAdaptationInteractiveUpdateTimingFunctionName:", *MEMORY[0x1E0CD3048]);

}

- (float)whitePointAdaptationStrengthStandard
{
  return self->_whitePointAdaptationStrengthStandard;
}

- (void)setWhitePointAdaptationStrengthStandard:(float)a3
{
  self->_whitePointAdaptationStrengthStandard = a3;
}

- (float)whitePointAdaptationStrengthReading
{
  return self->_whitePointAdaptationStrengthReading;
}

- (void)setWhitePointAdaptationStrengthReading:(float)a3
{
  self->_whitePointAdaptationStrengthReading = a3;
}

- (float)whitePointAdaptationStrengthPhoto
{
  return self->_whitePointAdaptationStrengthPhoto;
}

- (void)setWhitePointAdaptationStrengthPhoto:(float)a3
{
  self->_whitePointAdaptationStrengthPhoto = a3;
}

- (float)whitePointAdaptationStrengthVideo
{
  return self->_whitePointAdaptationStrengthVideo;
}

- (void)setWhitePointAdaptationStrengthVideo:(float)a3
{
  self->_whitePointAdaptationStrengthVideo = a3;
}

- (float)whitePointAdaptationStrengthGame
{
  return self->_whitePointAdaptationStrengthGame;
}

- (void)setWhitePointAdaptationStrengthGame:(float)a3
{
  self->_whitePointAdaptationStrengthGame = a3;
}

- (void)setWhitePointAdaptationUpdateDefaultDuration:(float)a3
{
  self->_whitePointAdaptationUpdateDefaultDuration = a3;
}

- (BOOL)whitePointAdaptationInteractiveUpdateEnabled
{
  return self->_whitePointAdaptationInteractiveUpdateEnabled;
}

- (void)setWhitePointAdaptationInteractiveUpdateEnabled:(BOOL)a3
{
  self->_whitePointAdaptationInteractiveUpdateEnabled = a3;
}

- (void)setWhitePointAdaptationInteractiveUpdateTimingFunctionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitePointAdaptationInteractiveUpdateTimingFunctionName, 0);
}

@end
