@implementation WBSContentAvailabilityDisplayController

- (WBSContentAvailabilityDisplayController)initWithPresenter:(id)a3
{
  id v3;
  WBSContentAvailabilityDisplayController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSContentAvailabilityDisplayController;
  v3 = a3;
  v4 = -[WBSContentAvailabilityDisplayController init](&v6, sel_init);
  objc_storeWeak((id *)&v4->_presenter, v3);

  v4->_labelDisplayDuration = 1.55;
  return v4;
}

- (void)setLabelDisplayDuration:(double)a3
{
  self->_labelDisplayDuration = a3;
}

- (void)updateToContentOptions:(unint64_t)a3
{
  _BOOL4 v5;
  WBSBrowsingAssistantAvailabilityLabels *availabilityLabels;
  id WeakRetained;
  WBSBrowsingAssistantAvailabilityLabels *v8;
  WBSBrowsingAssistantAvailabilityLabels *v9;
  id v10;

  if (a3
    && !-[WBSBrowsingAssistantAvailabilityLabels representsSupersetOfContentOptions:](self->_availabilityLabels, "representsSupersetOfContentOptions:"))
  {
    self->_cumulativeOptions |= a3;
    v5 = -[WBSContentAvailabilityDisplayController isDisplaying](self, "isDisplaying");
    availabilityLabels = self->_availabilityLabels;
    if (availabilityLabels)
      -[WBSBrowsingAssistantAvailabilityLabels possibleLabelsByIncorporatingContentOptions:intoLabelsAfterIndex:](availabilityLabels, "possibleLabelsByIncorporatingContentOptions:intoLabelsAfterIndex:", a3, self->_displayedIndex);
    else
      +[WBSBrowsingAssistantAvailabilityLabels possibleLabelsForContentOptions:](WBSBrowsingAssistantAvailabilityLabels, "possibleLabelsForContentOptions:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    if ((unint64_t)objc_msgSend(v10, "count") >= 2 && WeakRetained)
    {
      objc_msgSend(WeakRetained, "availabilityDisplayController:determineBestLabelsForPresentation:", self, v10);
      v8 = (WBSBrowsingAssistantAvailabilityLabels *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v8 = (WBSBrowsingAssistantAvailabilityLabels *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_availabilityLabels;
    self->_availabilityLabels = v8;

    self->_displayedIndex = 0;
    -[WBSContentAvailabilityDisplayController scheduleDisplayTimerIfNeeded]((uint64_t)self);
    objc_msgSend(WeakRetained, "availabilityDisplayController:didUpdateWithState:", self, v5);

  }
}

- (void)scheduleDisplayTimerIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "invalidate");
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (objc_msgSend((id)a1, "isDisplaying"))
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel_displayTimerDidFire_, 0, 0, *(double *)(a1 + 40));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v3;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addTimer:forMode:", *(_QWORD *)(a1 + 16), *MEMORY[0x1E0C99860]);

    }
  }
}

- (void)resetDisplay
{
  _BOOL4 v3;
  WBSBrowsingAssistantAvailabilityLabels *availabilityLabels;
  NSTimer *displayTimer;
  id WeakRetained;

  v3 = -[WBSContentAvailabilityDisplayController isDisplaying](self, "isDisplaying");
  self->_cumulativeOptions = 0;
  availabilityLabels = self->_availabilityLabels;
  self->_availabilityLabels = 0;

  self->_displayedIndex = 0;
  -[NSTimer invalidate](self->_displayTimer, "invalidate");
  displayTimer = self->_displayTimer;
  self->_displayTimer = 0;

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "availabilityDisplayController:didUpdateWithState:", self, 2);

  }
}

- (BOOL)isDisplaying
{
  WBSBrowsingAssistantAvailabilityLabels *availabilityLabels;
  unint64_t displayedIndex;

  availabilityLabels = self->_availabilityLabels;
  if (availabilityLabels)
  {
    displayedIndex = self->_displayedIndex;
    LOBYTE(availabilityLabels) = displayedIndex < -[WBSBrowsingAssistantAvailabilityLabels count](availabilityLabels, "count");
  }
  return (char)availabilityLabels;
}

- (NSString)currentLabel
{
  void *v3;

  if (-[WBSContentAvailabilityDisplayController isDisplaying](self, "isDisplaying"))
  {
    -[WBSBrowsingAssistantAvailabilityLabels textForOptionsAtIndex:](self->_availabilityLabels, "textForOptionsAtIndex:", self->_displayedIndex);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)currentOptions
{
  if (-[WBSContentAvailabilityDisplayController isDisplaying](self, "isDisplaying"))
    return -[WBSBrowsingAssistantAvailabilityLabels representedOptionsAtIndex:](self->_availabilityLabels, "representedOptionsAtIndex:", self->_displayedIndex);
  else
    return 0;
}

- (void)displayTimerDidFire:(id)a3
{
  id WeakRetained;
  uint64_t v5;

  ++self->_displayedIndex;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (-[WBSContentAvailabilityDisplayController isDisplaying](self, "isDisplaying"))
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(WeakRetained, "availabilityDisplayController:didUpdateWithState:", self, v5);

  -[WBSContentAvailabilityDisplayController scheduleDisplayTimerIfNeeded]((uint64_t)self);
}

- (WBSContentAvailabilityDisplayPresenting)presenter
{
  return (WBSContentAvailabilityDisplayPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (double)labelDisplayDuration
{
  return self->_labelDisplayDuration;
}

- (unint64_t)cumulativeOptions
{
  return self->_cumulativeOptions;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_displayTimer, 0);
  objc_storeStrong((id *)&self->_availabilityLabels, 0);
}

@end
