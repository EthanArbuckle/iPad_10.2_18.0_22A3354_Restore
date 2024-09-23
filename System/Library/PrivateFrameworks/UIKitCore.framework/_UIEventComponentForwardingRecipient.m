@implementation _UIEventComponentForwardingRecipient

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  int64_t recordedPhase;
  int64_t autocompletedPhase;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  id WeakRetained;
  id v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)_UIEventComponentForwardingRecipient;
  -[_UIEventComponentForwardingRecipient description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("moved");
  v6 = CFSTR("cancelled");
  recordedPhase = self->recordedPhase;
  autocompletedPhase = self->autocompletedPhase;
  if (recordedPhase == 3)
    v9 = CFSTR("ended");
  else
    v9 = CFSTR("cancelled");
  if (recordedPhase != 1)
    v5 = v9;
  if (recordedPhase)
    v10 = v5;
  else
    v10 = CFSTR("began");
  if (autocompletedPhase == 3)
    v6 = CFSTR("ended");
  if (autocompletedPhase == 1)
    v6 = CFSTR("moved");
  if (autocompletedPhase)
    v11 = v6;
  else
    v11 = CFSTR("began");
  WeakRetained = objc_loadWeakRetained((id *)&self->responder);
  v13 = objc_loadWeakRetained((id *)&self->fromResponder);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - recorded phase = %@, autocompleted phase = %@, to responder: %@, from responder: %@"), v4, v10, v11, WeakRetained, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (UIResponder)responder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->responder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->responder);
  objc_destroyWeak((id *)&self->fromResponder);
}

@end
