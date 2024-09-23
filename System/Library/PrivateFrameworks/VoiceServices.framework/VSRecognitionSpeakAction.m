@implementation VSRecognitionSpeakAction

- (VSRecognitionSpeakAction)initWithSpokenFeedbackString:(id)a3 willTerminate:(BOOL)a4
{
  VSRecognitionSpeakAction *v6;
  VSRecognitionSpeakAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSRecognitionSpeakAction;
  v6 = -[VSRecognitionSpeakAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[VSRecognitionAction setSpokenFeedbackString:](v6, "setSpokenFeedbackString:", a3);
    *((_BYTE *)&v7->super + 41) = a4;
  }
  return v7;
}

- (int)completionType
{
  return *((_BYTE *)&self->super + 41) == 0;
}

- (id)perform
{
  -[VSRecognitionAction completeWithNextAction:error:](self, "completeWithNextAction:error:", 0, 0);
  return 0;
}

@end
