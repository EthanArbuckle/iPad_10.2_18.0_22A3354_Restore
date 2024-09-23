@implementation STWorkoutSetStateRequest

- (id)_initWithState:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWorkoutSetStateRequest;
  result = -[AFSiriRequest init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 5) = a3;
  return result;
}

- (int64_t)workoutState
{
  return self->_workoutState;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWorkoutSetStateRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutState, CFSTR("_workoutState"), v5.receiver, v5.super_class);

}

- (STWorkoutSetStateRequest)initWithCoder:(id)a3
{
  id v4;
  STWorkoutSetStateRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STWorkoutSetStateRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_workoutState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_workoutState"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
