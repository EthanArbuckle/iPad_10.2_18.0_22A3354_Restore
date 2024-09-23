@implementation _SBSATimerAndDescriptionRecord

- (_SBSATimerAndDescriptionRecord)initWithTimerDescription:(id)a3
{
  id v4;
  _SBSATimerAndDescriptionRecord *v5;
  _SBSATimerAndDescriptionRecord *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BSContinuousMachTimer *timer;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SBSATimerAndDescriptionRecord;
  v5 = -[_SBSATimerAndDescriptionRecord init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_SBSATimerAndDescriptionRecord setTimerDescription:](v5, "setTimerDescription:", v4);
    v7 = objc_alloc(MEMORY[0x1E0D01720]);
    objc_msgSend(v4, "timerDescriptionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithIdentifier:", v9);
    timer = v6->_timer;
    v6->_timer = (BSContinuousMachTimer *)v10;

  }
  return v6;
}

- (BOOL)isTimerDescriptionElapsed
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_SBSATimerAndDescriptionRecord timerDescription](self, "timerDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[_SBSATimerAndDescriptionRecord timerDescription](self, "timerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isElapsed");

  return v6;
}

- (void)schedule:(id)a3
{
  id v4;
  BSContinuousMachTimer *timer;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  if (!-[_SBSATimerAndDescriptionRecord isTimerDescriptionElapsed](self, "isTimerDescriptionElapsed"))
  {
    objc_initWeak(&location, self);
    timer = self->_timer;
    -[_SBSATimerAndDescriptionRecord timerDescription](self, "timerDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeInterval");
    v8 = v7;
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43___SBSATimerAndDescriptionRecord_schedule___block_invoke;
    v11[3] = &unk_1E8EB0010;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](timer, "scheduleWithFireInterval:leewayInterval:queue:handler:", v9, v11, v8, 0.0);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (SBSATimerDescription)timerDescription
{
  return self->_timerDescription;
}

- (void)setTimerDescription:(id)a3
{
  objc_storeStrong((id *)&self->_timerDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDescription, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
