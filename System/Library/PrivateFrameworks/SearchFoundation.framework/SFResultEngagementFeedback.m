@implementation SFResultEngagementFeedback

- (SFResultEngagementFeedback)initWithResult:(id)a3 actionEngaged:(BOOL)a4 triggerEvent:(unint64_t)a5 destination:(unint64_t)a6
{
  return -[SFResultEngagementFeedback initWithResult:triggerEvent:destination:](self, "initWithResult:triggerEvent:destination:", a3, a5, a6);
}

- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5
{
  SFResultEngagementFeedback *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFResultEngagementFeedback;
  result = -[SFResultFeedback initWithResult:](&v8, sel_initWithResult_, a3);
  if (result)
  {
    result->_actionEngaged = 0;
    result->_triggerEvent = a4;
    result->_destination = a5;
    result->_actionTarget = 0;
  }
  return result;
}

- (SFResultEngagementFeedback)initWithResult:(id)a3 triggerEvent:(unint64_t)a4 destination:(unint64_t)a5 actionTarget:(unint64_t)a6
{
  SFResultEngagementFeedback *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFResultEngagementFeedback;
  result = -[SFResultFeedback initWithResult:](&v10, sel_initWithResult_, a3);
  if (result)
  {
    result->_actionEngaged = 1;
    result->_triggerEvent = a4;
    result->_destination = a5;
    result->_actionTarget = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFResultEngagementFeedback;
  v4 = -[SFResultFeedback copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[5] = -[SFResultEngagementFeedback triggerEvent](self, "triggerEvent");
  v4[6] = -[SFResultEngagementFeedback destination](self, "destination");
  v4[7] = -[SFResultEngagementFeedback actionTarget](self, "actionTarget");
  *((_BYTE *)v4 + 32) = -[SFResultEngagementFeedback actionEngaged](self, "actionEngaged");
  *((_BYTE *)v4 + 33) = -[SFResultEngagementFeedback matchesUnengagedSuggestion](self, "matchesUnengagedSuggestion");
  return v4;
}

- (SFResultEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFResultEngagementFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFResultEngagementFeedback;
  v5 = -[SFResultFeedback initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_actionEngaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("action_engaged"));
    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trigger_event"));
    v5->_destination = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_destination"));
    v5->_actionTarget = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_actionTarget"));
    v5->_matchesUnengagedSuggestion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_matchesUnengagedSuggestion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFResultEngagementFeedback;
  v4 = a3;
  -[SFResultFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_actionEngaged, CFSTR("action_engaged"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("trigger_event"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_destination, CFSTR("_destination"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_actionTarget, CFSTR("_actionTarget"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_matchesUnengagedSuggestion, CFSTR("_matchesUnengagedSuggestion"));

}

- (BOOL)actionEngaged
{
  return self->_actionEngaged;
}

- (BOOL)matchesUnengagedSuggestion
{
  return self->_matchesUnengagedSuggestion;
}

- (void)setMatchesUnengagedSuggestion:(BOOL)a3
{
  self->_matchesUnengagedSuggestion = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (unint64_t)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(unint64_t)a3
{
  self->_actionTarget = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
