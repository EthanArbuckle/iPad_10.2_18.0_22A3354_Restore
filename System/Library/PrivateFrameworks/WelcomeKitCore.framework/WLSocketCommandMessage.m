@implementation WLSocketCommandMessage

- (WLSocketCommandMessage)initWithCommandString:(id)a3
{
  id v4;
  WLSocketCommandMessage *v5;
  WLSocketCommandMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLSocketCommandMessage;
  v5 = -[WLSocketMessage initWithType:](&v8, sel_initWithType_, 1);
  v6 = v5;
  if (v5)
    -[WLSocketCommandMessage setCommand:](v5, "setCommand:", v4);

  return v6;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
}

@end
