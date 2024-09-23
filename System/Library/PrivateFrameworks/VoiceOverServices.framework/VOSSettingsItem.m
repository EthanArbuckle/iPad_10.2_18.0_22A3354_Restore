@implementation VOSSettingsItem

- (id)_initWithIdentifier:(id)a3 itemType:(int64_t)a4
{
  id v6;
  VOSSettingsItem *v7;
  VOSSettingsItem *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VOSSettingsItem;
  v7 = -[VOSSettingsItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[VOSSettingsItem setIdentifier:](v7, "setIdentifier:", v6);
    -[VOSSettingsItem setItemType:](v8, "setItemType:", a4);
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[VOSSettingsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("VOSSettingsItem '%@'"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VOSSettingsItem identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VOSSettingsItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (VOSSettingsItem)Sounds
{
  if (Sounds_onceToken != -1)
    dispatch_once(&Sounds_onceToken, &__block_literal_global_6);
  return (VOSSettingsItem *)(id)Sounds__SettingsItem;
}

void __25__VOSSettingsItem_Sounds__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Sounds"), 0);
  v1 = (void *)Sounds__SettingsItem;
  Sounds__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)AudioDucking
{
  if (AudioDucking_onceToken != -1)
    dispatch_once(&AudioDucking_onceToken, &__block_literal_global_181_0);
  return (VOSSettingsItem *)(id)AudioDucking__SettingsItem;
}

void __31__VOSSettingsItem_AudioDucking__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("AudioDucking"), 2);
  v1 = (void *)AudioDucking__SettingsItem;
  AudioDucking__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Volume
{
  if (Volume_onceToken != -1)
    dispatch_once(&Volume_onceToken, &__block_literal_global_184_0);
  return (VOSSettingsItem *)(id)Volume__SettingsItem;
}

void __25__VOSSettingsItem_Volume__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Volume"), 1);
  v1 = (void *)Volume__SettingsItem;
  Volume__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Pitch
{
  if (Pitch_onceToken != -1)
    dispatch_once(&Pitch_onceToken, &__block_literal_global_187_0);
  return (VOSSettingsItem *)(id)Pitch__SettingsItem;
}

void __24__VOSSettingsItem_Pitch__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Pitch"), 0);
  v1 = (void *)Pitch__SettingsItem;
  Pitch__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)PhoneticFeedback
{
  if (PhoneticFeedback_onceToken != -1)
    dispatch_once(&PhoneticFeedback_onceToken, &__block_literal_global_190_0);
  return (VOSSettingsItem *)(id)PhoneticFeedback__SettingsItem;
}

void __35__VOSSettingsItem_PhoneticFeedback__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("PhoneticFeedback"), 2);
  v1 = (void *)PhoneticFeedback__SettingsItem;
  PhoneticFeedback__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SendToHDMI
{
  if (SendToHDMI_onceToken != -1)
    dispatch_once(&SendToHDMI_onceToken, &__block_literal_global_193);
  return (VOSSettingsItem *)(id)SendToHDMI__SettingsItem;
}

void __29__VOSSettingsItem_SendToHDMI__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SendToHDMI"), 0);
  v1 = (void *)SendToHDMI__SettingsItem;
  SendToHDMI__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SpeakNotifications
{
  if (SpeakNotifications_onceToken != -1)
    dispatch_once(&SpeakNotifications_onceToken, &__block_literal_global_196);
  return (VOSSettingsItem *)(id)SpeakNotifications__SettingsItem;
}

void __37__VOSSettingsItem_SpeakNotifications__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SpeakNotifications"), 0);
  v1 = (void *)SpeakNotifications__SettingsItem;
  SpeakNotifications__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SoundCurtain
{
  if (SoundCurtain_onceToken != -1)
    dispatch_once(&SoundCurtain_onceToken, &__block_literal_global_199);
  return (VOSSettingsItem *)(id)SoundCurtain__SettingsItem;
}

void __31__VOSSettingsItem_SoundCurtain__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SoundCurtain"), 0);
  v1 = (void *)SoundCurtain__SettingsItem;
  SoundCurtain__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SpeakingRate
{
  if (SpeakingRate_onceToken != -1)
    dispatch_once(&SpeakingRate_onceToken, &__block_literal_global_202);
  return (VOSSettingsItem *)(id)SpeakingRate__SettingsItem;
}

void __31__VOSSettingsItem_SpeakingRate__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SpeakingRate"), 1);
  v1 = (void *)SpeakingRate__SettingsItem;
  SpeakingRate__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Voice
{
  if (Voice_onceToken != -1)
    dispatch_once(&Voice_onceToken, &__block_literal_global_205);
  return (VOSSettingsItem *)(id)Voice__SettingsItem;
}

void __24__VOSSettingsItem_Voice__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Voice"), 2);
  v1 = (void *)Voice__SettingsItem;
  Voice__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Hints
{
  if (Hints_onceToken != -1)
    dispatch_once(&Hints_onceToken, &__block_literal_global_208);
  return (VOSSettingsItem *)(id)Hints__SettingsItem;
}

void __24__VOSSettingsItem_Hints__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Hints"), 0);
  v1 = (void *)Hints__SettingsItem;
  Hints__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)MediaDescriptions
{
  if (MediaDescriptions_onceToken != -1)
    dispatch_once(&MediaDescriptions_onceToken, &__block_literal_global_211_0);
  return (VOSSettingsItem *)(id)MediaDescriptions__SettingsItem;
}

void __36__VOSSettingsItem_MediaDescriptions__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("MediaDescriptions"), 2);
  v1 = (void *)MediaDescriptions__SettingsItem;
  MediaDescriptions__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)RotorActionConfirmation
{
  if (RotorActionConfirmation_onceToken != -1)
    dispatch_once(&RotorActionConfirmation_onceToken, &__block_literal_global_214);
  return (VOSSettingsItem *)(id)RotorActionConfirmation__SettingsItem;
}

void __42__VOSSettingsItem_RotorActionConfirmation__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("RotorActionConfirmation"), 0);
  v1 = (void *)RotorActionConfirmation__SettingsItem;
  RotorActionConfirmation__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Activities
{
  if (Activities_onceToken != -1)
    dispatch_once(&Activities_onceToken, &__block_literal_global_217);
  return (VOSSettingsItem *)(id)Activities__SettingsItem;
}

void __29__VOSSettingsItem_Activities__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Activities"), 2);
  v1 = (void *)Activities__SettingsItem;
  Activities__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)Punctuation
{
  if (Punctuation_onceToken != -1)
    dispatch_once(&Punctuation_onceToken, &__block_literal_global_220);
  return (VOSSettingsItem *)(id)Punctuation__SettingsItem;
}

void __30__VOSSettingsItem_Punctuation__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("Punctuation"), 2);
  v1 = (void *)Punctuation__SettingsItem;
  Punctuation__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)ScreenRecognition
{
  if (ScreenRecognition_onceToken != -1)
    dispatch_once(&ScreenRecognition_onceToken, &__block_literal_global_223);
  return (VOSSettingsItem *)(id)ScreenRecognition__SettingsItem;
}

void __36__VOSSettingsItem_ScreenRecognition__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("ScreenRecognition"), 0);
  v1 = (void *)ScreenRecognition__SettingsItem;
  ScreenRecognition__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)ImageDescriptions
{
  if (ImageDescriptions_onceToken != -1)
    dispatch_once(&ImageDescriptions_onceToken, &__block_literal_global_226);
  return (VOSSettingsItem *)(id)ImageDescriptions__SettingsItem;
}

void __36__VOSSettingsItem_ImageDescriptions__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("ImageDescriptions"), 0);
  v1 = (void *)ImageDescriptions__SettingsItem;
  ImageDescriptions__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)DirectTouch
{
  if (DirectTouch_onceToken != -1)
    dispatch_once(&DirectTouch_onceToken, &__block_literal_global_229);
  return (VOSSettingsItem *)(id)DirectTouch__SettingsItem;
}

void __30__VOSSettingsItem_DirectTouch__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("DirectTouch"), 0);
  v1 = (void *)DirectTouch__SettingsItem;
  DirectTouch__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)NavigationStyle
{
  if (NavigationStyle_onceToken != -1)
    dispatch_once(&NavigationStyle_onceToken, &__block_literal_global_232);
  return (VOSSettingsItem *)(id)NavigationStyle__SettingsItem;
}

void __34__VOSSettingsItem_NavigationStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("NavigationStyle"), 2);
  v1 = (void *)NavigationStyle__SettingsItem;
  NavigationStyle__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)NavigateImages
{
  if (NavigateImages_onceToken != -1)
    dispatch_once(&NavigateImages_onceToken, &__block_literal_global_235);
  return (VOSSettingsItem *)(id)NavigateImages__SettingsItem;
}

void __33__VOSSettingsItem_NavigateImages__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("NavigateImages"), 2);
  v1 = (void *)NavigateImages__SettingsItem;
  NavigateImages__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)GestureDirection
{
  if (GestureDirection_onceToken != -1)
    dispatch_once(&GestureDirection_onceToken, &__block_literal_global_238);
  return (VOSSettingsItem *)(id)GestureDirection__SettingsItem;
}

void __35__VOSSettingsItem_GestureDirection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("GestureDirection"), 2);
  v1 = (void *)GestureDirection__SettingsItem;
  GestureDirection__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)TypingStyle
{
  if (TypingStyle_onceToken != -1)
    dispatch_once(&TypingStyle_onceToken, &__block_literal_global_241);
  return (VOSSettingsItem *)(id)TypingStyle__SettingsItem;
}

void __30__VOSSettingsItem_TypingStyle__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("TypingStyle"), 2);
  v1 = (void *)TypingStyle__SettingsItem;
  TypingStyle__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SoftwareTypingFeedback
{
  if (SoftwareTypingFeedback_onceToken != -1)
    dispatch_once(&SoftwareTypingFeedback_onceToken, &__block_literal_global_244);
  return (VOSSettingsItem *)(id)SoftwareTypingFeedback__SettingsItem;
}

void __41__VOSSettingsItem_SoftwareTypingFeedback__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SoftwareTypingFeedback"), 2);
  v1 = (void *)SoftwareTypingFeedback__SettingsItem;
  SoftwareTypingFeedback__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)HardwareTypingFeedback
{
  if (HardwareTypingFeedback_onceToken != -1)
    dispatch_once(&HardwareTypingFeedback_onceToken, &__block_literal_global_247);
  return (VOSSettingsItem *)(id)HardwareTypingFeedback__SettingsItem;
}

void __41__VOSSettingsItem_HardwareTypingFeedback__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("HardwareTypingFeedback"), 2);
  v1 = (void *)HardwareTypingFeedback__SettingsItem;
  HardwareTypingFeedback__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)SlideToType
{
  if (SlideToType_onceToken != -1)
    dispatch_once(&SlideToType_onceToken, &__block_literal_global_250);
  return (VOSSettingsItem *)(id)SlideToType__SettingsItem;
}

void __30__VOSSettingsItem_SlideToType__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("SlideToType"), 0);
  v1 = (void *)SlideToType__SettingsItem;
  SlideToType__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)CaptionPanel
{
  if (CaptionPanel_onceToken != -1)
    dispatch_once(&CaptionPanel_onceToken, &__block_literal_global_253);
  return (VOSSettingsItem *)(id)CaptionPanel__SettingsItem;
}

void __31__VOSSettingsItem_CaptionPanel__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("CaptionPanel"), 0);
  v1 = (void *)CaptionPanel__SettingsItem;
  CaptionPanel__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)LargeCursor
{
  if (LargeCursor_onceToken != -1)
    dispatch_once(&LargeCursor_onceToken, &__block_literal_global_256);
  return (VOSSettingsItem *)(id)LargeCursor__SettingsItem;
}

void __30__VOSSettingsItem_LargeCursor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("LargeCursor"), 0);
  v1 = (void *)LargeCursor__SettingsItem;
  LargeCursor__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)BrailleAlerts
{
  if (BrailleAlerts_onceToken != -1)
    dispatch_once(&BrailleAlerts_onceToken, &__block_literal_global_259);
  return (VOSSettingsItem *)(id)BrailleAlerts__SettingsItem;
}

void __32__VOSSettingsItem_BrailleAlerts__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("BrailleAlerts"), 0);
  v1 = (void *)BrailleAlerts__SettingsItem;
  BrailleAlerts__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)BrailleFormatting
{
  if (BrailleFormatting_onceToken != -1)
    dispatch_once(&BrailleFormatting_onceToken, &__block_literal_global_262);
  return (VOSSettingsItem *)(id)BrailleFormatting__SettingsItem;
}

void __36__VOSSettingsItem_BrailleFormatting__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("BrailleFormatting"), 0);
  v1 = (void *)BrailleFormatting__SettingsItem;
  BrailleFormatting__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)BrailleAutoAdvanceDuration
{
  if (BrailleAutoAdvanceDuration_onceToken != -1)
    dispatch_once(&BrailleAutoAdvanceDuration_onceToken, &__block_literal_global_265);
  return (VOSSettingsItem *)(id)BrailleAutoAdvanceDuration__SettingsItem;
}

void __45__VOSSettingsItem_BrailleAutoAdvanceDuration__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("BrailleAutoAdvanceDuration"), 1);
  v1 = (void *)BrailleAutoAdvanceDuration__SettingsItem;
  BrailleAutoAdvanceDuration__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)BrailleOutput
{
  if (BrailleOutput_onceToken != -1)
    dispatch_once(&BrailleOutput_onceToken, &__block_literal_global_268);
  return (VOSSettingsItem *)(id)BrailleOutput__SettingsItem;
}

void __32__VOSSettingsItem_BrailleOutput__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("BrailleOutput"), 2);
  v1 = (void *)BrailleOutput__SettingsItem;
  BrailleOutput__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)BrailleInput
{
  if (BrailleInput_onceToken != -1)
    dispatch_once(&BrailleInput_onceToken, &__block_literal_global_271);
  return (VOSSettingsItem *)(id)BrailleInput__SettingsItem;
}

void __31__VOSSettingsItem_BrailleInput__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("BrailleInput"), 2);
  v1 = (void *)BrailleInput__SettingsItem;
  BrailleInput__SettingsItem = (uint64_t)v0;

}

+ (VOSSettingsItem)LiveRegions
{
  if (LiveRegions_onceToken != -1)
    dispatch_once(&LiveRegions_onceToken, &__block_literal_global_274);
  return (VOSSettingsItem *)(id)LiveRegions__SettingsItem;
}

void __30__VOSSettingsItem_LiveRegions__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsItem _initWithIdentifier:itemType:]([VOSSettingsItem alloc], "_initWithIdentifier:itemType:", CFSTR("LiveRegions"), 0);
  v1 = (void *)LiveRegions__SettingsItem;
  LiveRegions__SettingsItem = (uint64_t)v0;

}

+ (NSArray)allSettingsItems
{
  if (allSettingsItems_onceToken != -1)
    dispatch_once(&allSettingsItems_onceToken, &__block_literal_global_277);
  return (NSArray *)(id)allSettingsItems_FinalList;
}

void __35__VOSSettingsItem_allSettingsItems__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[35];

  v39[33] = *MEMORY[0x24BDAC8D0];
  +[VOSSettingsItem Sounds](VOSSettingsItem, "Sounds");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v38;
  +[VOSSettingsItem AudioDucking](VOSSettingsItem, "AudioDucking");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v37;
  +[VOSSettingsItem Volume](VOSSettingsItem, "Volume");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v36;
  +[VOSSettingsItem Pitch](VOSSettingsItem, "Pitch");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v35;
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v34;
  +[VOSSettingsItem SendToHDMI](VOSSettingsItem, "SendToHDMI");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v33;
  +[VOSSettingsItem SpeakNotifications](VOSSettingsItem, "SpeakNotifications");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v32;
  +[VOSSettingsItem SoundCurtain](VOSSettingsItem, "SoundCurtain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v31;
  +[VOSSettingsItem SpeakingRate](VOSSettingsItem, "SpeakingRate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v30;
  +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v29;
  +[VOSSettingsItem Hints](VOSSettingsItem, "Hints");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v28;
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v27;
  +[VOSSettingsItem RotorActionConfirmation](VOSSettingsItem, "RotorActionConfirmation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v26;
  +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v25;
  +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v24;
  +[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v23;
  +[VOSSettingsItem ImageDescriptions](VOSSettingsItem, "ImageDescriptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v22;
  +[VOSSettingsItem DirectTouch](VOSSettingsItem, "DirectTouch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v21;
  +[VOSSettingsItem NavigationStyle](VOSSettingsItem, "NavigationStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v20;
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[19] = v19;
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[20] = v18;
  +[VOSSettingsItem TypingStyle](VOSSettingsItem, "TypingStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[21] = v17;
  +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[22] = v15;
  +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[23] = v14;
  +[VOSSettingsItem SlideToType](VOSSettingsItem, "SlideToType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v39[24] = v0;
  +[VOSSettingsItem CaptionPanel](VOSSettingsItem, "CaptionPanel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v39[25] = v1;
  +[VOSSettingsItem LargeCursor](VOSSettingsItem, "LargeCursor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[26] = v2;
  +[VOSSettingsItem BrailleAlerts](VOSSettingsItem, "BrailleAlerts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39[27] = v3;
  +[VOSSettingsItem BrailleFormatting](VOSSettingsItem, "BrailleFormatting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[28] = v4;
  +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[29] = v5;
  +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[30] = v6;
  +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[31] = v7;
  +[VOSSettingsItem LiveRegions](VOSSettingsItem, "LiveRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[32] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v16, "ax_filteredArrayUsingBlock:", &__block_literal_global_280);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allSettingsItems_FinalList;
  allSettingsItems_FinalList = v10;

  objc_msgSend((id)allSettingsItems_FinalList, "sortedArrayUsingComparator:", &__block_literal_global_283);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)allSettingsItems_FinalList;
  allSettingsItems_FinalList = v12;

}

uint64_t __35__VOSSettingsItem_allSettingsItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isItemSupported:", v2);

  return v4;
}

uint64_t __35__VOSSettingsItem_allSettingsItems__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a2;
  +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameForItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameForItem:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);
  return v10;
}

+ (id)settingsIDtoItemMap:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[VOSSettingsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("VOSSettingsItem.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VOSLocString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (AXQuickSettingsData)settingsData
{
  return self->_settingsData;
}

- (void)setSettingsData:(id)a3
{
  objc_storeStrong((id *)&self->_settingsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
