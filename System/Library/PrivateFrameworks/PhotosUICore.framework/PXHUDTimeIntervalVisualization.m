@implementation PXHUDTimeIntervalVisualization

- (void)setTimeInterval:(id)a3
{
  PXTimeInterval *v5;
  PXTimeInterval *timeInterval;
  PXTimeInterval *v7;
  void *v8;
  id stateTransitionHandlerToken;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v5 = (PXTimeInterval *)a3;
  timeInterval = self->_timeInterval;
  if (timeInterval != v5)
  {
    -[PXTimeInterval removeStateTransitionHandler:](timeInterval, "removeStateTransitionHandler:", self->_stateTransitionHandlerToken);
    objc_storeStrong((id *)&self->_timeInterval, a3);
    objc_initWeak(&location, self);
    v7 = self->_timeInterval;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__PXHUDTimeIntervalVisualization_setTimeInterval___block_invoke;
    v13 = &unk_1E5146F40;
    objc_copyWeak(&v14, &location);
    -[PXTimeInterval addStateTransitionHandler:](v7, "addStateTransitionHandler:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    stateTransitionHandlerToken = self->_stateTransitionHandlerToken;
    self->_stateTransitionHandlerToken = v8;

    -[PXHUDVisualization _notifyDelegateVisualizationDidChange](self, "_notifyDelegateVisualizationDidChange", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (PXTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
  objc_storeStrong(&self->_stateTransitionHandlerToken, 0);
}

void __50__PXHUDTimeIntervalVisualization_setTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyDelegateVisualizationDidChange");

}

+ (PXHUDTimeIntervalVisualization)visualizationWithTimeInterval:(id)a3
{
  id v3;
  PXHUDTimeIntervalVisualization *v4;

  v3 = a3;
  v4 = objc_alloc_init(PXHUDTimeIntervalVisualization);
  -[PXHUDTimeIntervalVisualization setTimeInterval:](v4, "setTimeInterval:", v3);

  return v4;
}

@end
