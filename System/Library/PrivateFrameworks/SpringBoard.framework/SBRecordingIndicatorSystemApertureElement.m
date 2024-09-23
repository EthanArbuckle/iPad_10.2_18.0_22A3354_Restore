@implementation SBRecordingIndicatorSystemApertureElement

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (BOOL)hasIndicatorBehavior
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOtherElementsPresent
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)element:(id)a3 visibilityWillChange:(BOOL)a4
{
  id v4;

  -[SBRecordingIndicatorSystemApertureElement recordingIndicatorManager](self, "recordingIndicatorManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateRecordingIndicatorLocationIfNecessary");

}

- (void)setSuppressed:(BOOL)a3
{
  id v3;

  self->_suppressed = a3;
  -[SBRecordingIndicatorSystemApertureElement recordingIndicatorManager](self, "recordingIndicatorManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateRecordingIndicatorLocationIfNecessary");

}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  return (SBRecordingIndicatorManager *)objc_loadWeakRetained((id *)&self->_recordingIndicatorManager);
}

- (void)setPlatformElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_platformElementHost, a3);
}

- (void)pulse
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  objc_msgSend(WeakRetained, "elementRequestsDiscreteAnimationOfType:", 3);

}

- (SBRecordingIndicatorSystemApertureElement)initWithRecordingIndicatorView:(id)a3 recordingIndicatorManager:(id)a4
{
  id v8;
  id v9;
  SBRecordingIndicatorSystemApertureElement *v10;
  objc_class *v11;
  uint64_t v12;
  NSString *elementIdentifier;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRecordingIndicatorSystemApertureElement.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indicatorView"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBRecordingIndicatorSystemApertureElement;
  v10 = -[SBRecordingIndicatorSystemApertureElement init](&v16, sel_init);
  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    elementIdentifier = v10->_elementIdentifier;
    v10->_elementIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_indicatorView, a3);
    objc_storeWeak((id *)&v10->_recordingIndicatorManager, v9);
  }

  return v10;
}

- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalU
{
  return 0;
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  return (SBSystemAperturePlatformElementHosting *)objc_loadWeakRetained((id *)&self->_platformElementHost);
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setRecordingIndicatorManager:(id)a3
{
  objc_storeWeak((id *)&self->_recordingIndicatorManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingIndicatorManager);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_destroyWeak((id *)&self->_platformElementHost);
}

@end
