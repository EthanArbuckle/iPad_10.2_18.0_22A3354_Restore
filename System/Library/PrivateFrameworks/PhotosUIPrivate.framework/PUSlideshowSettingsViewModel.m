@implementation PUSlideshowSettingsViewModel

- (id)newViewModelChange
{
  return objc_alloc_init(PUSlideshowSettingsViewModelChange);
}

- (id)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewModel;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewModel;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (PUSlideshowSettingsViewModel)initWithPropertyDictionary:(id)a3
{
  id v5;
  PUSlideshowSettingsViewModel *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v17;
  void *v18;
  uint64_t v19;
  OKProducerPreset *preset;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  uint64_t v25;
  OKProducerPreset *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  PUSlideshowMediaItem *mediaItem;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  PUSlideshowSettingsViewModel *result;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PUSlideshowSettingsViewModel;
  v6 = -[PUViewModel init](&v43, sel_init);
  if (!v6)
  {
LABEL_35:

    return v6;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("presetUniqueIdentifier"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_firstKeyWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_peripheryInsets");
  v13 = v12;
  if (v14 != *(double *)(MEMORY[0x1E0DC49E8] + 8)
    || v10 != *MEMORY[0x1E0DC49E8]
    || v11 != *(double *)(MEMORY[0x1E0DC49E8] + 24))
  {

LABEL_12:
    v7 = CFSTR("com.apple.mobileslideshow@phone-com.apple.opus.producer.marimba.origami-Origami");
LABEL_13:
    objc_msgSend(getOKProducerPresetsManagerClass_88303(), "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presetForUniqueIdentifier:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    preset = v6->_preset;
    v6->_preset = (OKProducerPreset *)v19;

    goto LABEL_14;
  }
  v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);

  if (v13 != v17)
    goto LABEL_12;
  v7 = 0;
LABEL_14:
  if (v6->_preset)
  {
LABEL_20:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaUniqueIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaType"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      v30 = v27;
    }
    else
    {
      -[OKProducerPreset uniqueIdentifier](v6->_preset, "uniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 2;
    }
    +[PUSlideshowMediaItem mediaItemForType:uniqueIdentifier:](PUSlideshowMediaItem, "mediaItemForType:uniqueIdentifier:", v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    mediaItem = v6->_mediaItem;
    v6->_mediaItem = (PUSlideshowMediaItem *)v31;

    if (!v27)
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldRepeat"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldRepeat"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_shouldRepeat = objc_msgSend(v34, "BOOLValue");

    }
    else
    {
      v6->_shouldRepeat = 0;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepDuration"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepDuration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_stepDuration = (double)objc_msgSend(v36, "integerValue");

    }
    else
    {
      v6->_stepDuration = 6.0;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("musicOn"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("musicOn"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_musicOn = objc_msgSend(v38, "BOOLValue");

    }
    else
    {
      v6->_musicOn = 0;
    }

    goto LABEL_35;
  }
  objc_msgSend(getOKProducerPresetsManagerClass_88303(), "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v22 = (id *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88304;
  v47 = getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88304;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88304)
  {
    v23 = SlideshowKitLibrary_88305();
    v22 = (id *)dlsym(v23, "kOKProducerPresetsFamilyPhotosPhone");
    v45[3] = (uint64_t)v22;
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_88304 = (uint64_t)v22;
  }
  _Block_object_dispose(&v44, 8);
  if (v22)
  {
    v24 = *v22;
    objc_msgSend(v21, "defaultPresetsForFamily:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v6->_preset;
    v6->_preset = (OKProducerPreset *)v25;

    if (!v6->_preset)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PUSlideshowSettingsViewModel.m"), 88, CFSTR("preset is invalid"));

    }
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkOKProducerPresetsFamilyPhotosPhone(void)");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PUSlideshowSettingsViewModel.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (NSDictionary)propertyDictionary
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  -[OKProducerPreset uniqueIdentifier](self->_preset, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSlideshowMediaItem uniqueIdentifier](self->_mediaItem, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUSlideshowMediaItem type](self->_mediaItem, "type");
  v12[0] = CFSTR("presetUniqueIdentifier");
  v12[1] = CFSTR("mediaUniqueIdentifier");
  v13[0] = v3;
  v13[1] = v4;
  v12[2] = CFSTR("mediaType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("shouldRepeat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldRepeat);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("stepDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stepDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("musicOn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_musicOn);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (void)setPreset:(id)a3
{
  OKProducerPreset *v5;
  OKProducerPreset *v6;
  char v7;
  void *v8;
  OKProducerPreset *v9;

  v5 = (OKProducerPreset *)a3;
  v6 = v5;
  if (self->_preset != v5)
  {
    v9 = v5;
    v7 = -[OKProducerPreset isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preset, a3);
      -[PUSlideshowSettingsViewModel currentChange](self, "currentChange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setPresetDidChange:", 1);

      v6 = v9;
    }
  }

}

- (void)setMediaItem:(id)a3
{
  PUSlideshowMediaItem *v5;
  PUSlideshowMediaItem *v6;
  BOOL v7;
  void *v8;
  PUSlideshowMediaItem *v9;

  v5 = (PUSlideshowMediaItem *)a3;
  v6 = v5;
  if (self->_mediaItem != v5)
  {
    v9 = v5;
    v7 = -[PUSlideshowMediaItem isEqual:](v5, "isEqual:");
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_mediaItem, a3);
      -[PUSlideshowSettingsViewModel currentChange](self, "currentChange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setMediaItemDidChange:", 1);

      v6 = v9;
    }
  }

}

- (void)setShouldRepeat:(BOOL)a3
{
  id v3;

  if (self->_shouldRepeat != a3)
  {
    self->_shouldRepeat = a3;
    -[PUSlideshowSettingsViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setRepeatDidChange:", 1);

  }
}

- (void)setStepDuration:(double)a3
{
  id v3;

  if (self->_stepDuration != a3)
  {
    self->_stepDuration = a3;
    -[PUSlideshowSettingsViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setStepDurationDidChange:", 1);

  }
}

- (void)setMusicOn:(BOOL)a3
{
  id v3;

  if (self->_musicOn != a3)
  {
    self->_musicOn = a3;
    -[PUSlideshowSettingsViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setMusicOnDidChange:", 1);

  }
}

- (BOOL)isEqual:(id)a3
{
  PUSlideshowSettingsViewModel *v4;
  PUSlideshowSettingsViewModel *v5;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  int v11;
  int shouldRepeat;
  double v13;
  double v14;
  double stepDuration;
  _BOOL4 v16;
  BOOL v17;

  v4 = (PUSlideshowSettingsViewModel *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PUSlideshowSettingsViewModel preset](v5, "preset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[OKProducerPreset isEqual:](self->_preset, "isEqual:", v6);
      -[PUSlideshowSettingsViewModel mediaItem](v5, "mediaItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 & 1) != 0)
      {
        v9 = -[PUSlideshowMediaItem isEqual:](self->_mediaItem, "isEqual:", v8);
        v10 = -[PUSlideshowSettingsViewModel shouldRepeat](v5, "shouldRepeat");
        if (v9)
        {
          v11 = v10;
          shouldRepeat = self->_shouldRepeat;
          -[PUSlideshowSettingsViewModel stepDuration](v5, "stepDuration");
          if (shouldRepeat == v11)
          {
            v14 = v13;
            stepDuration = self->_stepDuration;
            v16 = -[PUSlideshowSettingsViewModel isMusicOn](v5, "isMusicOn");
            if (stepDuration == v14)
            {
              v17 = self->_musicOn == v16;
LABEL_14:

              goto LABEL_15;
            }
LABEL_13:
            v17 = 0;
            goto LABEL_14;
          }
LABEL_12:
          -[PUSlideshowSettingsViewModel isMusicOn](v5, "isMusicOn");
          goto LABEL_13;
        }
      }
      else
      {
        -[PUSlideshowSettingsViewModel shouldRepeat](v5, "shouldRepeat");
      }
      -[PUSlideshowSettingsViewModel stepDuration](v5, "stepDuration");
      goto LABEL_12;
    }
    v17 = 0;
  }
LABEL_15:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUSlideshowSettingsViewModel *v4;
  PUSlideshowSettingsViewModel *v5;
  PUSlideshowSettingsViewModel *v6;
  _QWORD v8[4];
  PUSlideshowSettingsViewModel *v9;
  PUSlideshowSettingsViewModel *v10;

  v4 = objc_alloc_init(PUSlideshowSettingsViewModel);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PUSlideshowSettingsViewModel_copyWithZone___block_invoke;
  v8[3] = &unk_1E58ABCA8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  -[PUViewModel performChanges:](v5, "performChanges:", v8);
  v6 = v5;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[OKProducerPreset hash](self->_preset, "hash");
  v4 = -[PUSlideshowMediaItem hash](self->_mediaItem, "hash");
  v6 = 1231;
  if (self->_shouldRepeat)
    v7 = 1231;
  else
    v7 = 1237;
  v5 = (uint64_t)self->_stepDuration - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v8 = v7 - v5 + 32 * v5;
  if (!self->_musicOn)
    v6 = 1237;
  return v6 - v8 + 32 * v8 + 28629151;
}

- (double)stepDuration
{
  return self->_stepDuration;
}

- (OKProducerPreset)preset
{
  return self->_preset;
}

- (PUSlideshowMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (BOOL)isMusicOn
{
  return self->_musicOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_preset, 0);
}

uint64_t __45__PUSlideshowSettingsViewModel_copyWithZone___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreset:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
  objc_msgSend(*(id *)(a1 + 32), "setMediaItem:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  objc_msgSend(*(id *)(a1 + 32), "setShouldRepeat:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64));
  objc_msgSend(*(id *)(a1 + 32), "setStepDuration:", *(double *)(*(_QWORD *)(a1 + 40) + 72));
  return objc_msgSend(*(id *)(a1 + 32), "setMusicOn:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 65));
}

@end
