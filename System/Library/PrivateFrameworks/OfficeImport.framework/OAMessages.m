@implementation OAMessages

+ (void)initialize
{
  TCTaggedMessage *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  TCTaggedMessage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TCTaggedMessage *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  TCTaggedMessage *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  TCTaggedMessage *v18;
  uint64_t v19;
  void *v20;
  TCTaggedMessage *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  TCTaggedMessage *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Some shape, image, graphic content was unreadable."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", v3);
    v5 = (void *)OABadFormat;
    OABadFormat = v4;

    v6 = [TCTaggedMessage alloc];
    TCBundle();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MathType equations in unsupported formats were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TCTaggedMessage initWithMessageText:](v6, "initWithMessageText:", v7);
    v9 = (void *)OARemovedMathTypeEquations;
    OARemovedMathTypeEquations = v8;

    v10 = [TCTaggedMessage alloc];
    TCBundle();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Equations requiring unsupported MathML elements were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TCTaggedMessage initWithMessageText:](v10, "initWithMessageText:", v11);
    v13 = (void *)OAUnsupportedMathMLDropped;
    OAUnsupportedMathMLDropped = v12;

    v14 = [TCTaggedMessage alloc];
    TCBundle();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Objects positioned far away from slides were moved closer to slides."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TCTaggedMessage initWithMessageText:](v14, "initWithMessageText:", v15);
    v17 = (void *)OADrawableBoundsOutOfRange;
    OADrawableBoundsOutOfRange = v16;

    v18 = [TCTaggedMessage alloc];
    v19 = -[TCTaggedMessage initWithMessageText:](v18, "initWithMessageText:", kWarningMessageUnsupportedMediaTypes);
    v20 = (void *)OAUnsupportedMediaType;
    OAUnsupportedMediaType = v19;

    v21 = [TCTaggedMessage alloc];
    TCBundle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("URL-based movies and audio files were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TCTaggedMessage initWithMessageText:](v21, "initWithMessageText:", v22);
    v24 = (void *)OARemovedUrlMedia;
    OARemovedUrlMedia = v23;

    v25 = [TCTaggedMessage alloc];
    TCBundle();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Movies and audio files weren\\U2019t exported."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[TCTaggedMessage initWithMessageText:](v25, "initWithMessageText:", v26);
    v28 = (void *)OAMediaNotExported;
    OAMediaNotExported = v27;

  }
}

@end
