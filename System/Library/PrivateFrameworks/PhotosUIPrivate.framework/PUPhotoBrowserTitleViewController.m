@implementation PUPhotoBrowserTitleViewController

- (PUPhotoBrowserTitleViewController)init
{
  PUPhotoBrowserTitleViewController *v2;
  id v3;
  uint64_t v4;
  UIView *view;
  uint64_t v6;
  PLDateRangeFormatter *dayFormatter;
  uint64_t v8;
  PLDateRangeFormatter *timeFormatter;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUPhotoBrowserTitleViewController;
  v2 = -[PUPhotoBrowserTitleViewController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D7B630]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    view = v2->_view;
    v2->_view = (UIView *)v4;

    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    dayFormatter = v2->__dayFormatter;
    v2->__dayFormatter = (PLDateRangeFormatter *)v6;

    -[PLDateRangeFormatter setUseLocalDates:](v2->__dayFormatter, "setUseLocalDates:", 1);
    objc_msgSend(MEMORY[0x1E0D716B0], "autoupdatingFormatterWithPreset:", 7);
    v8 = objc_claimAutoreleasedReturnValue();
    timeFormatter = v2->__timeFormatter;
    v2->__timeFormatter = (PLDateRangeFormatter *)v8;

    -[PLDateRangeFormatter setUseLocalDates:](v2->__timeFormatter, "setUseLocalDates:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__dateFormatterChanged_, *MEMORY[0x1E0D71D98], 0);

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTapped = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setTappable:(BOOL)a3
{
  if (self->_tappable != a3)
  {
    self->_tappable = a3;
    -[PUPhotoBrowserTitleViewController _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
  }
}

- (NSString)title
{
  return (NSString *)-[UIView title](self->_view, "title");
}

- (NSString)subtitle
{
  return (NSString *)-[UIView subtitle](self->_view, "subtitle");
}

- (void)setUsingCompactTitleView:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUPhotoBrowserTitleViewController _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  if (self->_usingCompactTitleView != v3)
  {
    self->_usingCompactTitleView = v3;
    -[PUPhotoBrowserTitleViewController _invalidateLabels](self, "_invalidateLabels");
  }
}

- (void)setGeoDescription:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  -[PUPhotoBrowserTitleViewController _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  v5 = v7;
  if (self->_geoDescription != v7)
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->_geoDescription, a3);
      -[PUPhotoBrowserTitleViewController _invalidateLabels](self, "_invalidateLabels");
      v5 = v7;
    }
  }

}

- (void)setCreationDate:(id)a3
{
  NSDate *v5;
  char v6;
  NSDate *v7;

  v7 = (NSDate *)a3;
  -[PUPhotoBrowserTitleViewController _assertInsideChangeBlock](self, "_assertInsideChangeBlock");
  v5 = v7;
  if (self->_creationDate != v7)
  {
    v6 = -[NSDate isEqual:](v7, "isEqual:");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_creationDate, a3);
      -[PUPhotoBrowserTitleViewController _invalidateDayAndTimeDescriptions](self, "_invalidateDayAndTimeDescriptions");
      v5 = v7;
    }
  }

}

- (UIColor)titleTextColor
{
  return (UIColor *)-[UIView titleTextColor](self->_view, "titleTextColor");
}

- (void)setTitleTextColor:(id)a3
{
  -[UIView setTitleTextColor:](self->_view, "setTitleTextColor:", a3);
}

- (UIColor)subtitleTextColor
{
  return (UIColor *)-[UIView subtitleTextColor](self->_view, "subtitleTextColor");
}

- (void)setSubtitleTextColor:(id)a3
{
  -[UIView setSubtitleTextColor:](self->_view, "setSubtitleTextColor:", a3);
}

- (void)_setDayDescription:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  -[PUPhotoBrowserTitleViewController _assertInsideUpdate](self, "_assertInsideUpdate");
  v5 = v7;
  if (self->__dayDescription != v7)
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__dayDescription, a3);
      -[PUPhotoBrowserTitleViewController _invalidateLabels](self, "_invalidateLabels");
      v5 = v7;
    }
  }

}

- (void)_setTimeDescription:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;

  v7 = (NSString *)a3;
  -[PUPhotoBrowserTitleViewController _assertInsideUpdate](self, "_assertInsideUpdate");
  v5 = v7;
  if (self->__timeDescription != v7)
  {
    v6 = -[NSString isEqualToString:](v7, "isEqualToString:");
    v5 = v7;
    if (!v6)
    {
      objc_storeStrong((id *)&self->__timeDescription, a3);
      -[PUPhotoBrowserTitleViewController _invalidateLabels](self, "_invalidateLabels");
      v5 = v7;
    }
  }

}

- (void)_dateFormatterChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotoBrowserTitleViewController__dateFormatterChanged___block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUPhotoBrowserTitleViewController performChanges:](self, "performChanges:", v3);
}

- (void)_assertInsideChangeBlock
{
  id v4;

  if (!-[PUPhotoBrowserTitleViewController _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoBrowserTitleViewController.m"), 156, CFSTR("not within a change block"));

  }
}

- (void)_assertInsideUpdate
{
  id v4;

  if (!-[PUPhotoBrowserTitleViewController _isUpdating](self, "_isUpdating"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoBrowserTitleViewController.m"), 161, CFSTR("not withing update"));

  }
}

- (void)performChanges:(id)a3
{
  _BOOL8 v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoBrowserTitleViewController.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != changeBlock"));

  }
  v5 = -[PUPhotoBrowserTitleViewController _isPerformingChanges](self, "_isPerformingChanges");
  -[PUPhotoBrowserTitleViewController _setPerformingChanges:](self, "_setPerformingChanges:", 1);
  v7[2]();
  -[PUPhotoBrowserTitleViewController _setPerformingChanges:](self, "_setPerformingChanges:", v5);
  if (!v5)
    -[PUPhotoBrowserTitleViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_updateIfNeeded
{
  _BOOL8 v4;
  id v5;

  if (-[PUPhotoBrowserTitleViewController _needsUpdate](self, "_needsUpdate"))
  {
    v4 = -[PUPhotoBrowserTitleViewController _isUpdating](self, "_isUpdating");
    -[PUPhotoBrowserTitleViewController _setUpdating:](self, "_setUpdating:", 1);
    -[PUPhotoBrowserTitleViewController _updateDayAndTimeDescriptionsIfNeeded](self, "_updateDayAndTimeDescriptionsIfNeeded");
    -[PUPhotoBrowserTitleViewController _updateLabelsIfNeeded](self, "_updateLabelsIfNeeded");
    -[PUPhotoBrowserTitleViewController _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
    -[PUPhotoBrowserTitleViewController _setUpdating:](self, "_setUpdating:", v4);
    if (-[PUPhotoBrowserTitleViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoBrowserTitleViewController.m"), 190, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUPhotoBrowserTitleViewController _needsUpdateDayAndTimeDescriptions](self, "_needsUpdateDayAndTimeDescriptions")|| -[PUPhotoBrowserTitleViewController _needsUpdateLabels](self, "_needsUpdateLabels")|| -[PUPhotoBrowserTitleViewController _needsUpdateGestureRecognizers](self, "_needsUpdateGestureRecognizers");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!-[PUPhotoBrowserTitleViewController _isUpdating](self, "_isUpdating")
    && !-[PUPhotoBrowserTitleViewController _isPerformingChanges](self, "_isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoBrowserTitleViewController.m"), 202, CFSTR("not within a change block or update"));

  }
}

- (void)_invalidateDayAndTimeDescriptions
{
  -[PUPhotoBrowserTitleViewController _setNeedsUpdateDayAndTimeDescriptions:](self, "_setNeedsUpdateDayAndTimeDescriptions:", 1);
  -[PUPhotoBrowserTitleViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateDayAndTimeDescriptionsIfNeeded
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  id v7;

  if (-[PUPhotoBrowserTitleViewController _needsUpdateDayAndTimeDescriptions](self, "_needsUpdateDayAndTimeDescriptions"))
  {
    -[PUPhotoBrowserTitleViewController _setNeedsUpdateDayAndTimeDescriptions:](self, "_setNeedsUpdateDayAndTimeDescriptions:", 0);
    -[PUPhotoBrowserTitleViewController creationDate](self, "creationDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PUPhotoBrowserTitleViewController _dayFormatter](self, "_dayFormatter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringFromDate:", v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[PUPhotoBrowserTitleViewController _timeFormatter](self, "_timeFormatter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromDate:", v7);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = &stru_1E58AD278;
      v4 = &stru_1E58AD278;
    }
    -[PUPhotoBrowserTitleViewController _setDayDescription:](self, "_setDayDescription:", v4);
    -[PUPhotoBrowserTitleViewController _setTimeDescription:](self, "_setTimeDescription:", v6);

  }
}

- (void)_invalidateLabels
{
  -[PUPhotoBrowserTitleViewController _setNeedsUpdateLabels:](self, "_setNeedsUpdateLabels:", 1);
  -[PUPhotoBrowserTitleViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateLabelsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  _BOOL4 usingCompactTitleView;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  UIView *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  UIView *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  UIView *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  PUPhotoBrowserTitleViewController *v34;
  _QWORD aBlock[4];
  id v36;
  id v37;

  if (-[PUPhotoBrowserTitleViewController _needsUpdateLabels](self, "_needsUpdateLabels"))
  {
    -[PUPhotoBrowserTitleViewController _setNeedsUpdateLabels:](self, "_setNeedsUpdateLabels:", 0);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoBrowserPhotoPrimaryTitleFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoBrowserPhotoSubtitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoBrowserTitleViewController geoDescription](self, "geoDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoBrowserTitleViewController _dayDescription](self, "_dayDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoBrowserTitleViewController _timeDescription](self, "_timeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E58A3E98;
    v10 = v7;
    v36 = v10;
    v11 = v8;
    v37 = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    usingCompactTitleView = self->_usingCompactTitleView;
    v14 = objc_msgSend(v6, "length");
    v26 = v6;
    v27 = v10;
    if (usingCompactTitleView)
    {
      if (v14)
      {
        v15 = v6;
        v16 = 0;
      }
      else
      {
        v12[2](v12);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "photoBrowserTimeTitleFont");
        v18 = v9;
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = 0;
        v4 = (void *)v19;
        v9 = v18;
      }
    }
    else
    {
      if (v14)
      {
        v15 = v6;
        v12[2](v12);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v10;
        v17 = v11;
      }
      v16 = v17;
    }
    v20 = self->_view;
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke_2;
    v28[3] = &unk_1E58A45E8;
    v29 = v20;
    v30 = v15;
    v31 = v16;
    v32 = v4;
    v33 = v5;
    v34 = self;
    v21 = v5;
    v22 = v4;
    v23 = v16;
    v24 = v15;
    v25 = v20;
    -[UIView performChanges:](v25, "performChanges:", v28);

  }
}

- (void)_invalidateGestureRecognizers
{
  -[PUPhotoBrowserTitleViewController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 1);
  -[PUPhotoBrowserTitleViewController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGestureRecognizersIfNeeded
{
  id v3;
  id v4;
  id v5;
  id v6;

  if (-[PUPhotoBrowserTitleViewController _needsUpdateGestureRecognizers](self, "_needsUpdateGestureRecognizers"))
  {
    -[PUPhotoBrowserTitleViewController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 0);
    -[PUPhotoBrowserTitleViewController _tapGestureRecognizer](self, "_tapGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PUPhotoBrowserTitleViewController isTappable](self, "isTappable"))
    {
      v3 = v4;
      if (!v4)
      {
        v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
        -[UIView addGestureRecognizer:](self->_view, "addGestureRecognizer:", v5);
        v3 = v5;
      }
    }
    else
    {
      v3 = v4;
      if (v4)
      {
        -[UIView removeGestureRecognizer:](self->_view, "removeGestureRecognizer:", v4);

        v3 = 0;
      }
    }
    v6 = v3;
    -[PUPhotoBrowserTitleViewController _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v3);

  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3 && self->_delegateFlags.respondsToTapped)
  {
    -[PUPhotoBrowserTitleViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoBrowserTitleViewControllerTapped:", self);

  }
}

- (UIView)view
{
  return self->_view;
}

- (PUPhotoBrowserTitleViewControllerDelegate)delegate
{
  return (PUPhotoBrowserTitleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isTappable
{
  return self->_tappable;
}

- (BOOL)isUsingCompactTitleView
{
  return self->_usingCompactTitleView;
}

- (NSString)geoDescription
{
  return self->_geoDescription;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)_isPerformingChanges
{
  return self->__isPerformingChanges;
}

- (void)_setPerformingChanges:(BOOL)a3
{
  self->__isPerformingChanges = a3;
}

- (BOOL)_isUpdating
{
  return self->__isUpdating;
}

- (void)_setUpdating:(BOOL)a3
{
  self->__isUpdating = a3;
}

- (BOOL)_needsUpdateDayAndTimeDescriptions
{
  return self->__needsUpdateDayAndTimeDescriptions;
}

- (void)_setNeedsUpdateDayAndTimeDescriptions:(BOOL)a3
{
  self->__needsUpdateDayAndTimeDescriptions = a3;
}

- (BOOL)_needsUpdateLabels
{
  return self->__needsUpdateLabels;
}

- (void)_setNeedsUpdateLabels:(BOOL)a3
{
  self->__needsUpdateLabels = a3;
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (PLDateRangeFormatter)_dayFormatter
{
  return self->__dayFormatter;
}

- (PLDateRangeFormatter)_timeFormatter
{
  return self->__timeFormatter;
}

- (NSString)_dayDescription
{
  return self->__dayDescription;
}

- (NSString)_timeDescription
{
  return self->__timeDescription;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__timeDescription, 0);
  objc_storeStrong((id *)&self->__dayDescription, 0);
  objc_storeStrong((id *)&self->__timeFormatter, 0);
  objc_storeStrong((id *)&self->__dayFormatter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_geoDescription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
}

id __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = *(void **)(a1 + 40);
  if (!v2)
  {
    v6 = v3;
LABEL_6:
    v5 = v6;
    return v5;
  }
  if (!objc_msgSend(v3, "length"))
  {
    v6 = *(id *)(a1 + 32);
    goto LABEL_6;
  }
  PULocalizedString(CFSTR("PUPHOTOBROWSER_TITLE_LONG_DATE_FORMAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__PUPhotoBrowserTitleViewController__updateLabelsIfNeeded__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setTitleFont:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setSubtitleFont:", *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setVerticalSizeClass:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 72) + 10));
}

uint64_t __59__PUPhotoBrowserTitleViewController__dateFormatterChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDayAndTimeDescriptions");
}

@end
