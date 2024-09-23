@implementation SiriSharedUIFeedbackModel

- (NSData)imageRepresentationOfSnippet
{
  return self->_imageRepresentationOfSnippet;
}

- (void)setImageRepresentationOfSnippet:(id)a3
{
  objc_storeStrong((id *)&self->_imageRepresentationOfSnippet, a3);
}

- (int64_t)feedbackDomain
{
  return self->_feedbackDomain;
}

- (void)setFeedbackDomain:(int64_t)a3
{
  self->_feedbackDomain = a3;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)setUserInput:(id)a3
{
  objc_storeStrong((id *)&self->_userInput, a3);
}

- (NSString)siriDialog
{
  return self->_siriDialog;
}

- (void)setSiriDialog:(id)a3
{
  objc_storeStrong((id *)&self->_siriDialog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDialog, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_imageRepresentationOfSnippet, 0);
}

@end
