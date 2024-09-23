@implementation VKRouteContextObserverThunk

- (VKRouteContextObserverThunk)initWithRouteContext:(id)a3 transitSupport:(void *)a4
{
  id v6;
  VKRouteContextObserverThunk *v7;
  VKRouteContextObserverThunk *v8;
  VKRouteContext *v9;
  VKRouteContext *v10;
  VKRouteContext *v11;
  VKRouteContext *obj;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRouteContextObserverThunk;
  v7 = -[VKRouteContextObserverThunk init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_transitSupport = a4;
    v9 = (VKRouteContext *)v6;
    v10 = v9;
    if (v9)
      v11 = v9;
    obj = v8->_routeContext._obj;
    v8->_routeContext._obj = v10;

    -[VKRouteContext addObserver:withType:](v8->_routeContext._obj, "addObserver:withType:", v8, 0);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[VKRouteContext removeObserver:withType:](self->_routeContext._obj, "removeObserver:withType:", self, 0);
  v3.receiver = self;
  v3.super_class = (Class)VKRouteContextObserverThunk;
  -[VKRouteContextObserverThunk dealloc](&v3, sel_dealloc);
}

- (void)routeContextStateDidChange:(id)a3
{
  void *transitSupport;
  md::LabelManager *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  transitSupport = self->_transitSupport;
  v4 = (md::LabelManager *)*((_QWORD *)transitSupport + 2);
  v7[0] = &off_1E42CFE00;
  v7[1] = transitSupport;
  v8 = v7;
  md::LabelManager::queueCommand(v4, 44, 1, v7);
  v5 = v8;
  if (v8 == v7)
  {
    v6 = 4;
    v5 = v7;
  }
  else
  {
    if (!v8)
      return;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
}

- (void).cxx_destruct
{
  self->_routeContext._vptr$_retain_ptr = (void **)&off_1E42B4B90;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = &off_1E42B4B90;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
