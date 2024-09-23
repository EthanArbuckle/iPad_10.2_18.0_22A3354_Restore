@implementation TVPPlayerItem

- (void)setMediaItemLoader:(id)a3
{
  objc_storeWeak((id *)&self->_mediaItemLoader, a3);
}

- (TVPMediaItemLoader)mediaItemLoader
{
  return (TVPMediaItemLoader *)objc_loadWeakRetained((id *)&self->_mediaItemLoader);
}

- (TVPPlayerItem)initWithAsset:(id)a3
{
  TVPPlayerItem *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerItem;
  result = -[TVPPlayerItem initWithAsset:](&v4, sel_initWithAsset_, a3);
  if (result)
    result->_audioSelectionIsAutomatic = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TVImageProxy cancel](self->_posterProxy, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)TVPPlayerItem;
  -[TVPPlayerItem dealloc](&v3, sel_dealloc);
}

- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v4 = a3;
  -[TVPPlayerItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[TVPPlayerItem muted](self, "muted");
    goto LABEL_5;
  }
  -[TVPPlayerItem setAudioSelectionIsAutomatic:](self, "setAudioSelectionIsAutomatic:", 1);
  if ((-[TVPPlayerItem muted](self, "muted") & v7) != 1)
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)TVPPlayerItem;
    -[TVPPlayerItem selectMediaOptionAutomaticallyInMediaSelectionGroup:](&v8, sel_selectMediaOptionAutomaticallyInMediaSelectionGroup_, v4);
    goto LABEL_6;
  }
  -[TVPPlayerItem setSavedManualAudioSelection:](self, "setSavedManualAudioSelection:", 0);
LABEL_6:

}

- (void)selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[TVPPlayerItem asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[TVPPlayerItem muted](self, "muted");
    goto LABEL_5;
  }
  -[TVPPlayerItem setAudioSelectionIsAutomatic:](self, "setAudioSelectionIsAutomatic:", 0);
  if ((-[TVPPlayerItem muted](self, "muted") & v10) != 1)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)TVPPlayerItem;
    -[TVPPlayerItem selectMediaOption:inMediaSelectionGroup:](&v11, sel_selectMediaOption_inMediaSelectionGroup_, v6, v7);
    goto LABEL_6;
  }
  -[TVPPlayerItem setSavedManualAudioSelection:](self, "setSavedManualAudioSelection:", v6);
LABEL_6:

}

- (void)setMuted:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  if (self->_muted != a3)
  {
    self->_muted = a3;
    -[TVPPlayerItem asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_muted)
    {
      if (!-[TVPPlayerItem audioSelectionIsAutomatic](self, "audioSelectionIsAutomatic"))
      {
        -[TVPPlayerItem currentMediaSelection](self, "currentMediaSelection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectedMediaOptionInMediaSelectionGroup:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPPlayerItem setSavedManualAudioSelection:](self, "setSavedManualAudioSelection:", v7);

      }
      v11.receiver = self;
      v11.super_class = (Class)TVPPlayerItem;
      -[TVPPlayerItem selectMediaOption:inMediaSelectionGroup:](&v11, sel_selectMediaOption_inMediaSelectionGroup_, 0, v5);
    }
    else
    {
      -[TVPPlayerItem savedManualAudioSelection](self, "savedManualAudioSelection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v10.receiver = self;
        v10.super_class = (Class)TVPPlayerItem;
        -[TVPPlayerItem selectMediaOption:inMediaSelectionGroup:](&v10, sel_selectMediaOption_inMediaSelectionGroup_, v8, v5);
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)TVPPlayerItem;
        -[TVPPlayerItem selectMediaOptionAutomaticallyInMediaSelectionGroup:](&v9, sel_selectMediaOptionAutomaticallyInMediaSelectionGroup_, v5);
      }
      -[TVPPlayerItem setSavedManualAudioSelection:](self, "setSavedManualAudioSelection:", 0);

    }
  }
}

- (BOOL)muted
{
  return self->_muted;
}

- (int64_t)previousStatus
{
  return self->_previousStatus;
}

- (void)setPreviousStatus:(int64_t)a3
{
  self->_previousStatus = a3;
}

- (TVImageProxy)posterProxy
{
  return self->_posterProxy;
}

- (void)setPosterProxy:(id)a3
{
  objc_storeStrong((id *)&self->_posterProxy, a3);
}

- (id)scrubImageLoader
{
  return self->_scrubImageLoader;
}

- (void)setScrubImageLoader:(id)a3
{
  objc_storeStrong(&self->_scrubImageLoader, a3);
}

- (BOOL)audioSelectionIsAutomatic
{
  return self->_audioSelectionIsAutomatic;
}

- (void)setAudioSelectionIsAutomatic:(BOOL)a3
{
  self->_audioSelectionIsAutomatic = a3;
}

- (AVMediaSelectionOption)savedManualAudioSelection
{
  return self->_savedManualAudioSelection;
}

- (void)setSavedManualAudioSelection:(id)a3
{
  objc_storeStrong((id *)&self->_savedManualAudioSelection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedManualAudioSelection, 0);
  objc_storeStrong(&self->_scrubImageLoader, 0);
  objc_storeStrong((id *)&self->_posterProxy, 0);
  objc_destroyWeak((id *)&self->_mediaItemLoader);
}

@end
