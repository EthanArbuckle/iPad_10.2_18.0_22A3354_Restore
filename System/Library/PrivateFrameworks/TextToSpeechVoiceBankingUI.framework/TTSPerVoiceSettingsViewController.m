@implementation TTSPerVoiceSettingsViewController

- (TTSPerVoiceSettingsViewController)init
{
  TTSPerVoiceSettingsViewController *v2;
  TTSPVSettingsWrapper *v3;
  TTSPVSettingsWrapper *wrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTSPerVoiceSettingsViewController;
  v2 = -[TTSPerVoiceSettingsViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TTSPVSettingsWrapper);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;

  }
  return v2;
}

- (void)setDataDelegate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TTSPerVoiceSettingsViewController wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[TTSPerVoiceSettingsViewController wrapper](self, "wrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataDelegate:", v7);

    -[TTSPerVoiceSettingsViewController reloadView](self, "reloadView");
  }

}

- (void)setSpeechSource:(id)a3
{
  -[TTSPVSettingsWrapper setSpeechSource:](self->_wrapper, "setSpeechSource:", a3);
}

- (NSString)speechSource
{
  return -[TTSPVSettingsWrapper speechSource](self->_wrapper, "speechSource");
}

- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate
{
  void *v2;
  void *v3;

  -[TTSPerVoiceSettingsViewController wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTSPerVoiceSettingsViewControllerDelegate *)v3;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TTSPerVoiceSettingsViewController;
  -[TTSPerVoiceSettingsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[TTSPerVoiceSettingsViewController wrapper](self, "wrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addViewToParent:", self);

}

- (void)reloadView
{
  id v2;

  -[TTSPerVoiceSettingsViewController wrapper](self, "wrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadView");

}

- (TTSPVSettingsWrapper)wrapper
{
  return self->_wrapper;
}

- (void)setWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_wrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end
