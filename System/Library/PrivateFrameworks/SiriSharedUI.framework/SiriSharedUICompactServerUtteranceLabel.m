@implementation SiriSharedUICompactServerUtteranceLabel

- (SAUIAssistantUtteranceView)assistantUtteranceView
{
  return self->_assistantUtteranceView;
}

- (void)setAssistantUtteranceView:(id)a3
{
  objc_storeStrong((id *)&self->_assistantUtteranceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantUtteranceView, 0);
}

@end
