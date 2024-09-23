@implementation VKCustomFeatureDataSourceObserverThunk

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = &off_1E42B5590;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[VKCustomFeatureDataSourceObserverThunk clearObserver](self, "clearObserver");
  v3.receiver = self;
  v3.super_class = (Class)VKCustomFeatureDataSourceObserverThunk;
  -[VKCustomFeatureDataSourceObserverThunk dealloc](&v3, sel_dealloc);
}

- (void)clearObserver
{
  VKCustomFeatureDataSource *obj;

  -[VKCustomFeatureDataSource removeObserver:](self->_dataSource._obj, "removeObserver:", self);
  obj = self->_dataSource._obj;
  if (obj)
  {
    self->_dataSource._obj = 0;

  }
  self->_observer = 0;
}

- (void).cxx_destruct
{
  self->_dataSource._vptr$_retain_ptr = (void **)&off_1E42B5590;

}

- (VKCustomFeatureDataSourceObserverThunk)initWithDataSource:(id)a3 observer:(void *)a4
{
  id v6;
  VKCustomFeatureDataSourceObserverThunk *v7;
  VKCustomFeatureDataSourceObserverThunk *v8;
  VKCustomFeatureDataSource *v9;
  VKCustomFeatureDataSource *v10;
  VKCustomFeatureDataSource *v11;
  VKCustomFeatureDataSource *obj;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKCustomFeatureDataSourceObserverThunk;
  v7 = -[VKCustomFeatureDataSourceObserverThunk init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_observer = a4;
    v9 = (VKCustomFeatureDataSource *)v6;
    v10 = v9;
    if (v9)
      v11 = v9;
    obj = v8->_dataSource._obj;
    v8->_dataSource._obj = v10;

    -[VKCustomFeatureDataSource addObserver:](v8->_dataSource._obj, "addObserver:", v8);
  }

  return v8;
}

- (void)dataSource:(id)a3 featuresDidChangeForRect:(id)a4
{
  void *observer;
  double var1;
  double var0;
  double v7;
  double v8;
  double *v9;
  double *v10;
  uint64_t v11;
  _QWORD v12[3];
  double *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  observer = self->_observer;
  if (observer)
  {
    var1 = a4.var1.var1;
    var0 = a4.var1.var0;
    v7 = a4.var0.var1;
    v8 = a4.var0.var0;
    v9 = (double *)operator new(0x30uLL);
    *(_QWORD *)v9 = &off_1E42D2FC8;
    *((_QWORD *)v9 + 1) = observer;
    v9[2] = v8;
    v9[3] = v7;
    v9[4] = var0;
    v9[5] = var1;
    v13 = v9;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 0, v12);
    v10 = v13;
    if (v13 == (double *)v12)
    {
      v11 = 4;
      v10 = (double *)v12;
    }
    else
    {
      if (!v13)
        return;
      v11 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
  }
}

- (void)globalFeaturesDidChangeForDataSource:(id)a3
{
  void *observer;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  observer = self->_observer;
  if (observer)
  {
    v6[0] = &off_1E42D2F80;
    v6[1] = observer;
    v7 = v6;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 1, v6);
    v4 = v7;
    if (v7 == v6)
    {
      v5 = 4;
      v4 = v6;
    }
    else
    {
      if (!v7)
        return;
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
}

- (void)dataSource:(id)a3 didChangeSceneState:(unsigned __int8)a4
{
  void *observer;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  observer = self->_observer;
  if (observer)
  {
    v7[0] = &off_1E42D2F38;
    v7[1] = observer;
    v7[2] = a4;
    v8 = v7;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 2, v7);
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
}

- (void)dataSource:(id)a3 didChangeSceneID:(unsigned __int8)a4
{
  void *observer;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  observer = self->_observer;
  if (observer)
  {
    v7[0] = &off_1E42D2EF0;
    v7[1] = observer;
    v7[2] = a4;
    v8 = v7;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 3, v7);
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
}

@end
