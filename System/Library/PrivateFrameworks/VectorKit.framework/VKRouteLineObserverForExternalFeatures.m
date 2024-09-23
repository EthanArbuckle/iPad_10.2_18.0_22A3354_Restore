@implementation VKRouteLineObserverForExternalFeatures

- (VKRouteLineObserverForExternalFeatures)initWithRouteLineSupport:(void *)a3 andRouteLine:(id)a4
{
  id v6;
  VKRouteLineObserverForExternalFeatures *v7;
  VKRouteLineObserverForExternalFeatures *v8;
  id v9;
  VKRouteLineObserverForExternalFeatures *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKRouteLineObserverForExternalFeatures;
  v7 = -[VKRouteLineObserverForExternalFeatures init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_routeLineSupport = a3;
    v9 = objc_storeWeak((id *)&v7->_routeLine, v6);
    objc_msgSend(v6, "setObserver:", v8);

    v10 = v8;
  }

  return v8;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_routeLine);
  objc_msgSend(WeakRetained, "setObserver:", 0);

  v4.receiver = self;
  v4.super_class = (Class)VKRouteLineObserverForExternalFeatures;
  -[VKRouteLineObserverForExternalFeatures dealloc](&v4, sel_dealloc);
}

- (void)routeLineDidUpdateSections:(id)a3
{
  void *routeLineSupport;
  md::LabelManager *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  routeLineSupport = self->_routeLineSupport;
  v4 = (md::LabelManager *)*((_QWORD *)routeLineSupport + 1);
  v7[0] = &off_1E4279BA0;
  v7[1] = routeLineSupport;
  v8 = v7;
  md::LabelManager::queueCommand(v4, 71, 1, v7);
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
  objc_destroyWeak((id *)&self->_routeLine);
}

@end
