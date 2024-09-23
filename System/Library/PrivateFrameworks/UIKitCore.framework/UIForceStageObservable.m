@implementation UIForceStageObservable

- (void)receiveObservedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__UIForceStageObservable_receiveObservedValue___block_invoke;
    v9[3] = &unk_1E16DC448;
    v10 = v4;
    +[_UIForceMessage observe:](_UIForceMessage, "observe:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)UIForceStageObservable;
    -[UIForceStageObservable receiveObservedValue:](&v8, sel_receiveObservedValue_, v6);

    v7 = v10;
  }
  else
  {
    +[_UIForceMessage reset](_UIForceMessage, "reset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)UIForceStageObservable;
    -[UIForceStageObservable receiveObservedValue:](&v11, sel_receiveObservedValue_, v7);
  }

}

void __47__UIForceStageObservable_receiveObservedValue___block_invoke(uint64_t a1, void *a2)
{
  unint64_t TimeStamp;
  id v3;

  v3 = a2;
  IOHIDEventGetFloatValue();
  objc_msgSend(v3, "setTouchForce:");
  objc_msgSend(v3, "setStage:", IOHIDEventGetIntegerValue());
  TimeStamp = IOHIDEventGetTimeStamp();
  objc_msgSend(v3, "setTimestamp:", _UIMediaTimeForMachTime(TimeStamp));

}

@end
