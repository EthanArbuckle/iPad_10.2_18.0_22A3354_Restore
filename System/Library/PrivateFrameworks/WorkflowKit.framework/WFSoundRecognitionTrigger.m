@implementation WFSoundRecognitionTrigger

- (BOOL)hasValidConfiguration
{
  void *v2;
  BOOL v3;

  -[WFSoundRecognitionTrigger soundDetectionTypes](self, "soundDetectionTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (WFSoundRecognitionTrigger)init
{
  WFSoundRecognitionTrigger *v2;
  uint64_t v3;
  NSSet *soundDetectionTypes;
  WFSoundRecognitionTrigger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSoundRecognitionTrigger;
  v2 = -[WFTrigger init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    soundDetectionTypes = v2->_soundDetectionTypes;
    v2->_soundDetectionTypes = (NSSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSoundRecognitionTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSoundRecognitionTrigger soundDetectionTypes](self, "soundDetectionTypes", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("soundDetectionTypes"));

}

- (WFSoundRecognitionTrigger)initWithCoder:(id)a3
{
  id v4;
  WFSoundRecognitionTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *soundDetectionTypes;
  WFSoundRecognitionTrigger *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSoundRecognitionTrigger;
  v5 = -[WFTrigger initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("soundDetectionTypes"));
    v9 = objc_claimAutoreleasedReturnValue();
    soundDetectionTypes = v5->_soundDetectionTypes;
    v5->_soundDetectionTypes = (NSSet *)v9;

    v11 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSoundRecognitionTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFSoundRecognitionTrigger soundDetectionTypes](self, "soundDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSoundDetectionTypes:", v6);

  return v4;
}

- (NSSet)soundDetectionTypes
{
  return self->_soundDetectionTypes;
}

- (void)setSoundDetectionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundDetectionTypes, 0);
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Sound Recognition"));
}

+ (id)localizedDisplayExplanation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Ex. “When my %@ recognizes a doorbell sound”"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayGlyph
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("SoundRecognitionTriggerIcon"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)displayGlyphCornerRadius
{
  return 6.525;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
