@implementation _VOSProfileGesture

+ (id)profileGestureWithGesture:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[_VOSProfileGesture _initWithGesture:]([_VOSProfileGesture alloc], "_initWithGesture:", v3);

  return v4;
}

+ (id)profileGestureWithStringValue:(id)a3
{
  void *v4;
  void *v5;

  +[VOSGesture gestureWithStringValue:](VOSGesture, "gestureWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "profileGestureWithGesture:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_initWithGesture:(id)a3
{
  id v5;
  _VOSProfileGesture *v6;
  _VOSProfileGesture *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VOSProfileGesture;
  v6 = -[_VOSProfileGesture init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gesture, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VOSProfileGesture gesture](self, "gesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: rawValue '%@'"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[VOSGesture hash](self->_gesture, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "gesture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_VOSProfileGesture gesture](self, "gesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_VOSProfileGesture)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _VOSProfileGesture *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gesture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VOSGesture gestureWithStringValue:](VOSGesture, "gestureWithStringValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[VOSGesture Invalid](VOSGesture, "Invalid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[_VOSProfileGesture _initWithGesture:](self, "_initWithGesture:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  VOSGesture *gesture;
  id v4;
  id v5;

  gesture = self->_gesture;
  v4 = a3;
  -[VOSGesture rawValue](gesture, "rawValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("gesture"));

}

- (VOSGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
  objc_storeStrong((id *)&self->_gesture, a3);
}

- (_VOSProfileCommand)command
{
  return (_VOSProfileCommand *)objc_loadWeakRetained((id *)&self->_command);
}

- (void)setCommand:(id)a3
{
  objc_storeWeak((id *)&self->_command, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_command);
  objc_storeStrong((id *)&self->_gesture, 0);
}

@end
