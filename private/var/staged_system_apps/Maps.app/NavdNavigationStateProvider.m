@implementation NavdNavigationStateProvider

- (NavdNavigationStateProvider)initWithNavigationService:(id)a3 startNavigationDetails:(id)a4
{
  id v7;
  id v8;
  NavdNavigationStateProvider *v9;
  NavdNavigationStateProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavdNavigationStateProvider;
  v9 = -[NavdNavigationStateProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startNavigationDetails, a4);
    objc_storeStrong((id *)&v10->_navigationService, a3);
    -[MNNavigationService registerObserver:](v10->_navigationService, "registerObserver:", v10);
    -[MNNavigationService openForClient:](v10->_navigationService, "openForClient:", v10);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));
  objc_msgSend(v4, "closeForClient:", self);

  v5.receiver = self;
  v5.super_class = (Class)NavdNavigationStateProvider;
  -[NavdNavigationStateProvider dealloc](&v5, "dealloc");
}

- (void)setNavigationState:(unint64_t)a3
{
  void *v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  if (a3 == 1)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));
    objc_msgSend(v10, "stopNavigationWithReason:", 2);

  }
  else if (a3 == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider startNavigationDetails](self, "startNavigationDetails"));
    global_queue = dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10085B5D0;
    block[3] = &unk_1011AC8B0;
    v12 = v4;
    v13 = v5;
    v8 = v5;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

- (unint64_t)navigationState
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider navigationService](self, "navigationService"));
  v5 = -[NavdNavigationStateProvider _navigationStateForServiceState:](self, "_navigationStateForServiceState:", objc_msgSend(v4, "state"));

  return v5;
}

- (unint64_t)_navigationStateForServiceState:(unint64_t)a3
{
  int IsNavigating;
  int v5;

  IsNavigating = MNNavigationServiceStateIsNavigating(a3, a2);
  if (a3 == 3)
    v5 = 1;
  else
    v5 = IsNavigating;
  if (v5)
    return 2;
  else
    return 1;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v7 = -[NavdNavigationStateProvider _navigationStateForServiceState:](self, "_navigationStateForServiceState:", a4);
  v8 = -[NavdNavigationStateProvider _navigationStateForServiceState:](self, "_navigationStateForServiceState:", a5);
  if (v7 != v8)
  {
    v9 = v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NavdNavigationStateProvider delegate](self, "delegate"));
    objc_msgSend(v10, "navigationStateProvider:didChangeNavigationState:", self, v9);

  }
}

- (NavigationStateProviderDelegate)delegate
{
  return (NavigationStateProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MNStartNavigationDetails)startNavigationDetails
{
  return self->_startNavigationDetails;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_startNavigationDetails, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
