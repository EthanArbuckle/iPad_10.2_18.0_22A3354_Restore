@implementation TransitSchedulesLineOptionsProviderViewModel

- (TransitSchedulesLineOptionsProviderViewModel)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TransitSchedulesLineOptionsProviderViewModel *v14;
  NSString *v15;
  NSString *titleString;
  NSString *v17;
  NSString *symbolName;
  id v19;
  id actionBlock;
  NSString *v21;
  NSString *axIdentifierForAction;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TransitSchedulesLineOptionsProviderViewModel;
  v14 = -[TransitSchedulesLineOptionsProviderViewModel init](&v24, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    titleString = v14->_titleString;
    v14->_titleString = v15;

    v17 = (NSString *)objc_msgSend(v11, "copy");
    symbolName = v14->_symbolName;
    v14->_symbolName = v17;

    v19 = objc_msgSend(v12, "copy");
    actionBlock = v14->_actionBlock;
    v14->_actionBlock = v19;

    v21 = (NSString *)objc_msgSend(v13, "copy");
    axIdentifierForAction = v14->_axIdentifierForAction;
    v14->_axIdentifierForAction = v21;

  }
  return v14;
}

- (void)loadSubtitleWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return 0;
}

- (id)accessibilityIdentifierForAction
{
  return self->_axIdentifierForAction;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)axIdentifierForAction
{
  return self->_axIdentifierForAction;
}

- (void)setAxIdentifierForAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifierForAction, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
