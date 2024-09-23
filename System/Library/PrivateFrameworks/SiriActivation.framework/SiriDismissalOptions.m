@implementation SiriDismissalOptions

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:](self, "initWithDeactivationOptions:animated:requestCancellationReason:", a3, 1, 0);
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:](self, "initWithDeactivationOptions:animated:requestCancellationReason:", a3, a4, 0);
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 dismissalReason:(int64_t)a5
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:](self, "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", a3, a4, SASDismissalReasonGetCancellationReason(a5), a5, 0);
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:](self, "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", a3, a4, a5, 0, 0);
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:](self, "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", a3, a4, a5, a6, 0);
}

- (SiriDismissalOptions)initWithDeactivationOptions:(unint64_t)a3 animated:(BOOL)a4 requestCancellationReason:(int64_t)a5 dismissalReason:(int64_t)a6 shouldTurnScreenOff:(BOOL)a7
{
  SiriDismissalOptions *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriDismissalOptions;
  result = -[SiriDismissalOptions init](&v13, sel_init);
  if (result)
  {
    result->_animated = a4;
    result->_deactivationOptions = a3;
    result->_reason = a5;
    result->_dismissalReason = a6;
    result->_shouldTurnScreenOff = a7;
  }
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SiriDismissalOptions deactivationOptions](self, "deactivationOptions");
  -[SiriDismissalOptions animated](self, "animated");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SiriDismissalOptions reason](self, "reason");
  SASDismissalReasonGetName(-[SiriDismissalOptions dismissalReason](self, "dismissalReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDismissalOptions shouldTurnScreenOff](self, "shouldTurnScreenOff");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("deactivationOptions:%lu, animated:%@, request cancellation reason %ld, dismissal reason %@, shouldTurnScreenOff %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SiriDismissalOptions initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:]([SiriDismissalOptions alloc], "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", self->_deactivationOptions, self->_animated, self->_reason, self->_dismissalReason, self->_shouldTurnScreenOff);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriDismissalOptions)initWithCoder:(id)a3
{
  id v4;
  SiriDismissalOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriDismissalOptions;
  v5 = -[SiriDismissalOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_deactivationOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deactivationOptions"));
    v5->_animated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("animated"));
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestCancellationReason"));
    v5->_dismissalReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dismissalReason"));
    v5->_shouldTurnScreenOff = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldTurnScreenOff"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions deactivationOptions](self, "deactivationOptions"), CFSTR("deactivationOptions"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriDismissalOptions animated](self, "animated"), CFSTR("animated"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions reason](self, "reason"), CFSTR("requestCancellationReason"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriDismissalOptions dismissalReason](self, "dismissalReason"), CFSTR("dismissalReason"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SiriDismissalOptions shouldTurnScreenOff](self, "shouldTurnScreenOff"), CFSTR("shouldTurnScreenOff"));

}

- (unint64_t)deactivationOptions
{
  return self->_deactivationOptions;
}

- (BOOL)animated
{
  return self->_animated;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)shouldTurnScreenOff
{
  return self->_shouldTurnScreenOff;
}

@end
