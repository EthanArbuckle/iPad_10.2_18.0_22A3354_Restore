@implementation WFSiriUIPresenterLocalConnection

- (WFSiriUIPresenterLocalConnection)initWithPresenter:(id)a3
{
  id v5;
  WFSiriUIPresenterLocalConnection *v6;
  WFSiriUIPresenterLocalConnection *v7;
  WFSiriUIPresenterLocalConnection *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriUIPresenterLocalConnection;
  v6 = -[WFSiriUIPresenterLocalConnection init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = v7;
  }

  return v7;
}

- (WFExternalUIPresenterInterface)presenter
{
  return self->_presenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
