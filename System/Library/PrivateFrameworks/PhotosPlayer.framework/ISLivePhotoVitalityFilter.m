@implementation ISLivePhotoVitalityFilter

- (ISLivePhotoVitalityFilter)init
{
  return -[ISLivePhotoVitalityFilter initWithSettings:](self, "initWithSettings:", 0);
}

- (ISLivePhotoVitalityFilter)initWithSettings:(id)a3
{
  id v5;
  ISLivePhotoVitalityFilter *v6;
  ISLivePhotoVitalityFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISLivePhotoVitalityFilter;
  v6 = -[ISLivePhotoVitalityFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (void)setState:(int64_t)a3
{
  void *v4;
  void (**v5)(id, ISLivePhotoVitalityFilter *);

  if (self->_state != a3)
  {
    self->_state = a3;
    -[ISLivePhotoVitalityFilter outputChangeHandler](self, "outputChangeHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ISLivePhotoVitalityFilter outputChangeHandler](self, "outputChangeHandler");
      v5 = (void (**)(id, ISLivePhotoVitalityFilter *))objc_claimAutoreleasedReturnValue();
      v5[2](v5, self);

    }
  }
}

- (void)performInputChanges:(id)a3
{
  _BOOL8 v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = -[ISLivePhotoVitalityFilter isPerformingInputChanges](self, "isPerformingInputChanges");
  -[ISLivePhotoVitalityFilter _setPerformingInputChanges:](self, "_setPerformingInputChanges:", 1);
  if (v5)
    v5[2](v5);
  -[ISLivePhotoVitalityFilter _setPerformingInputChanges:](self, "_setPerformingInputChanges:", v4);
  if (!v4)
    -[ISLivePhotoVitalityFilter updateOutput](self, "updateOutput");

}

- (void)invalidateOutput
{
  -[ISLivePhotoVitalityFilter _setShouldUpdateOutput:](self, "_setShouldUpdateOutput:", 1);
}

- (void)updateOutput
{
  -[ISLivePhotoVitalityFilter _setShouldUpdateOutput:](self, "_setShouldUpdateOutput:", 0);
}

- (ISVitalitySettings)settings
{
  return self->_settings;
}

- (int64_t)state
{
  return self->_state;
}

- (id)outputChangeHandler
{
  return self->_outputChangeHandler;
}

- (void)setOutputChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isPerformingInputChanges
{
  return self->_isPerformingInputChanges;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->_isPerformingInputChanges = a3;
}

- (BOOL)_shouldUpdateOutput
{
  return self->__shouldUpdateOutput;
}

- (void)_setShouldUpdateOutput:(BOOL)a3
{
  self->__shouldUpdateOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputChangeHandler, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
