@implementation SXImageComponent

+ (id)typeString
{
  return CFSTR("image");
}

- (BOOL)shouldBeExposedToAssistiveTechnology
{
  void *v2;
  BOOL v3;

  -[SXImageComponent captionWithLocalizedRoleForSpeaking](self, "captionWithLocalizedRoleForSpeaking");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSAttributedString)captionWithLocalizedRoleForSpeaking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  -[SXComponent classification](self, "classification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityContextualLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[SXImageComponent accessibilityCaption](self, "accessibilityCaption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BDD1458]);
      -[SXImageComponent accessibilityCaption](self, "accessibilityCaption");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SXImageComponent caption](self, "caption");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (!v14)
      {
        v7 = 0;
        goto LABEL_12;
      }
      v10 = objc_alloc(MEMORY[0x24BDD1458]);
      -[SXImageComponent caption](self, "caption");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v11;
    v12 = objc_msgSend(v10, "initWithString:", v11);
    goto LABEL_10;
  }
  -[SXImageComponent caption](self, "caption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "sxaxLowPitchAttributedString");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v7 = (void *)v12;
    goto LABEL_11;
  }
  -[SXImageComponent caption](self, "caption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sxaxAttributedStringWithLowPitchPrefix:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_12:

  return (NSAttributedString *)v7;
}

- (unint64_t)traits
{
  return 8;
}

@end
