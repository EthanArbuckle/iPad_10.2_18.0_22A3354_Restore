@implementation SKUIMetricsDOMChangeQueue

- (SKUIMetricsDOMChangeQueue)init
{
  SKUIMetricsDOMChangeQueue *v3;
  uint64_t v4;
  NSMutableArray *storage;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMetricsDOMChangeQueue init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMetricsDOMChangeQueue;
  v3 = -[SKUIMetricsDOMChangeQueue init](&v7, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    storage = v3->_storage;
    v3->_storage = (NSMutableArray *)v4;

  }
  return v3;
}

- (BOOL)isEmpty
{
  return -[NSMutableArray count](self->_storage, "count") == 0;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_storage, "count");
}

- (void)addPendingChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  NSMutableArray *storage;
  id v26;

  v26 = a3;
  if (-[SKUIMetricsDOMChangeQueue isEmpty](self, "isEmpty"))
    goto LABEL_34;
  -[NSMutableArray lastObject](self->_storage, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isFromDeferredMessage")
    || !objc_msgSend(v26, "isFromDeferredMessage"))
  {

LABEL_34:
    storage = self->_storage;
    v4 = (void *)objc_msgSend(v26, "copy");
    -[NSMutableArray addObject:](storage, "addObject:", v4);
    goto LABEL_35;
  }
  objc_msgSend(v4, "buildStartTime");
  v6 = v5;
  objc_msgSend(v26, "buildStartTime");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  if (v6 >= v7)
    v9 = v7;
  else
    v9 = v6;
  if (v7 < 2.22044605e-16 || v6 < 2.22044605e-16)
    v11 = v8;
  else
    v11 = v9;
  objc_msgSend(v4, "setBuildStartTime:", v11);
  objc_msgSend(v4, "buildEndTime");
  v13 = v12;
  objc_msgSend(v26, "buildEndTime");
  if (v13 >= v14)
    v14 = v13;
  objc_msgSend(v4, "setBuildEndTime:", v14);
  objc_msgSend(v4, "renderStartTime");
  v16 = v15;
  objc_msgSend(v26, "renderStartTime");
  if (v16 >= v17)
    v18 = v16;
  else
    v18 = v17;
  if (v16 >= v17)
    v19 = v17;
  else
    v19 = v16;
  if (v17 < 2.22044605e-16 || v16 < 2.22044605e-16)
    v21 = v18;
  else
    v21 = v19;
  objc_msgSend(v4, "setRenderStartTime:", v21);
  objc_msgSend(v4, "renderEndTime");
  v23 = v22;
  objc_msgSend(v26, "renderEndTime");
  if (v23 >= v24)
    v24 = v23;
  objc_msgSend(v4, "setRenderEndTime:", v24);
LABEL_35:

}

- (id)oldestPendingChange
{
  void *v3;

  if (-[NSMutableArray count](self->_storage, "count"))
  {
    -[NSMutableArray firstObject](self->_storage, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_storage, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMetricsDOMChangeQueue init]";
}

@end
