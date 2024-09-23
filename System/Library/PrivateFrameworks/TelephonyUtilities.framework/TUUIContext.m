@implementation TUUIContext

- (TUUIContext)initWithState:(unint64_t)a3
{
  TUUIContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUUIContext;
  result = -[TUUIContext init](&v5, sel_init);
  if (result)
    result->_inCallUIState = a3;
  return result;
}

- (BOOL)isMicIndicatorVisible
{
  return (-[TUUIContext inCallUIState](self, "inCallUIState") >> 1) & 1;
}

- (BOOL)isFullScreen
{
  return -[TUUIContext inCallUIState](self, "inCallUIState") & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUUIContext)initWithCoder:(id)a3
{
  id v4;
  TUUIContext *v5;

  v4 = a3;
  v5 = -[TUUIContext init](self, "init");
  if (v5)
    -[TUUIContext setInCallUIState:](v5, "setInCallUIState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inCallUIState")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUUIContext inCallUIState](self, "inCallUIState"), CFSTR("inCallUIState"));

}

- (unint64_t)inCallUIState
{
  return self->_inCallUIState;
}

- (void)setInCallUIState:(unint64_t)a3
{
  self->_inCallUIState = a3;
}

@end
