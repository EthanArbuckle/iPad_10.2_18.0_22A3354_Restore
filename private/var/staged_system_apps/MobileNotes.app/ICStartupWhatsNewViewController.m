@implementation ICStartupWhatsNewViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICStartupWhatsNewViewController;
  -[ICStartupWhatsNewViewController viewDidLoad](&v4, "viewDidLoad");
  -[ICStartupWhatsNewViewController addItems](self, "addItems");
  -[ICStartupWhatsNewViewController addButtons](self, "addButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupWhatsNewViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (unint64_t)audioRecordingSupport
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICModelAvailabilityManager sharedInstance](ICModelAvailabilityManager, "sharedInstance"));
  if (objc_msgSend(v2, "supportsGeneralASR"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (unint64_t)callRecordingSupport
{
  return 0;
}

- (void)addButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1005704B8, 0));
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v7, "setConfiguration:", v3);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "didTapContinueButton:", 0x2000);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupWhatsNewViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v6, "addButton:", v7);

}

- (void)addItems
{
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    -[ICStartupWhatsNewViewController addItemsForVision](self, "addItemsForVision");
  }
  else if (+[UIDevice ic_isiPad](UIDevice, "ic_isiPad"))
  {
    -[ICStartupWhatsNewViewController addItemsForiPad](self, "addItemsForiPad");
  }
  else
  {
    -[ICStartupWhatsNewViewController addItemsForiPhone](self, "addItemsForiPhone");
  }
}

- (void)addItemsForVision
{
  -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 1);
  -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 0);
  -[ICStartupWhatsNewViewController addCollapsibleSectionsItem](self, "addCollapsibleSectionsItem");
  -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 0, 0);
}

- (void)addItemsForiPad
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[ICStartupWhatsNewViewController audioRecordingSupport](self, "audioRecordingSupport");
  v4 = -[ICStartupWhatsNewViewController audioRecordingSupport](self, "audioRecordingSupport");
  v5 = -[ICStartupWhatsNewViewController callRecordingSupport](self, "callRecordingSupport");
  v6 = -[ICStartupWhatsNewViewController callRecordingSupport](self, "callRecordingSupport");
  if (v4 == 3 && v6 == 3)
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 1, 1);
    -[ICStartupWhatsNewViewController addHandwrittenNotesItem](self, "addHandwrittenNotesItem");
    -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 0);
    -[ICStartupWhatsNewViewController addLotsMoreItem](self, "addLotsMoreItem");
  }
  else if (v3 < 2)
  {
    if (v5 < 2)
    {
      -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 0);
      -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 0);
      -[ICStartupWhatsNewViewController addCollapsibleSectionsItem](self, "addCollapsibleSectionsItem");
    }
    else
    {
      -[ICStartupWhatsNewViewController addHandwrittenNotesItem](self, "addHandwrittenNotesItem");
      -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 0);
      -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 1);
    }
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 0, 0);
  }
  else
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 1, 0);
    -[ICStartupWhatsNewViewController addHandwrittenNotesItem](self, "addHandwrittenNotesItem");
    -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 0);
    -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 1);
  }
}

- (void)addItemsForiPhone
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  ICStartupWhatsNewViewController *v8;
  uint64_t v9;

  v3 = -[ICStartupWhatsNewViewController audioRecordingSupport](self, "audioRecordingSupport");
  v4 = -[ICStartupWhatsNewViewController audioRecordingSupport](self, "audioRecordingSupport");
  v5 = -[ICStartupWhatsNewViewController callRecordingSupport](self, "callRecordingSupport");
  v6 = -[ICStartupWhatsNewViewController callRecordingSupport](self, "callRecordingSupport");
  v7 = -[ICStartupWhatsNewViewController callRecordingSupport](self, "callRecordingSupport");
  if (v4 == 3 && v7 == 3)
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 1, 1);
    -[ICStartupWhatsNewViewController addCallItemWithTranscription:summarization:](self, "addCallItemWithTranscription:summarization:", 1, 1);
    -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 1);
    -[ICStartupWhatsNewViewController addLotsMoreItem](self, "addLotsMoreItem");
    return;
  }
  if (v3 >= 2)
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 1, 0);
    -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 1);
    -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 0);
    -[ICStartupWhatsNewViewController addCollapsibleSectionsItem](self, "addCollapsibleSectionsItem");
    return;
  }
  if (v6 >= 2)
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 0, 0);
    v8 = self;
    v9 = 1;
LABEL_10:
    -[ICStartupWhatsNewViewController addCallItemWithTranscription:summarization:](v8, "addCallItemWithTranscription:summarization:", v9, 0);
    -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 1);
    -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 1);
    return;
  }
  if (v5 == 1)
  {
    -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 0, 0);
    v8 = self;
    v9 = 0;
    goto LABEL_10;
  }
  -[ICStartupWhatsNewViewController addMathNotesItemCompact:](self, "addMathNotesItemCompact:", 1);
  -[ICStartupWhatsNewViewController addHighlightItemWithCollapseText:](self, "addHighlightItemWithCollapseText:", 0);
  -[ICStartupWhatsNewViewController addCollapsibleSectionsItem](self, "addCollapsibleSectionsItem");
  -[ICStartupWhatsNewViewController addAudioItemWithTranscription:summarization:](self, "addAudioItemWithTranscription:summarization:", 0, 0);
}

- (void)addAudioItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (a3)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Audio Transcripts"), &stru_1005704B8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (v4)
      v11 = CFSTR("Record and transcribe audio, and have your device summarize the recording.");
    else
      v11 = CFSTR("Record and transcribe audio in your note.");
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Audio Recording"), &stru_1005704B8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Record audio directly in Notes.");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1005704B8, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("waveform")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v14, v12, v13);

}

- (void)addCallItemWithTranscription:(BOOL)a3 summarization:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (a3)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Call Transcripts"), &stru_1005704B8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (v4)
      v11 = CFSTR("Capture a phone conversation as text and audio, then view a summary of the call.");
    else
      v11 = CFSTR("Capture a phone conversation as text and audio.");
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Call Recording"), &stru_1005704B8, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Start a recording while you’re on a call.");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1005704B8, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("phone.badge.waveform.fill")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v14, v12, v13);

}

- (void)addCollapsibleSectionsItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Collapsible Sections"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Collapse text under a header to simplify your note’s appearance."), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("chevron.forward")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v7, v5, v6);

}

- (void)addHandwrittenNotesItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Beautiful, Handwritten Notes"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Your handwriting is refined automatically and reflows when you add and delete words, just like with typed text."), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("pencil.and.outline")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v7, v5, v6);

}

- (void)addHighlightItemWithCollapseText:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (a3)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Highlight and Collapse Text"), &stru_1005704B8, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Highlight text to emphasize it, or collapse text under a header to simplify your note’s appearance.");
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Highlighting"), &stru_1005704B8, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Highlight text to emphasize it with color.");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1005704B8, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("highlighter")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v12, v10, v11);

}

- (void)addLotsMoreItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("And Lots More…"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Collapse text under headers, highlight text, and create images with the new Image Wand tool."), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("surprisebox")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v7, v5, v6);

}

- (void)addMathNotesItemCompact:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Math in Notes"), &stru_1005704B8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v3)
    v8 = CFSTR("Type an expression into your note to have it solve automatically.");
  else
    v8 = CFSTR("Type an expression into your note to have it solve automatically. You can also find notes you created in the Calculator app in the new Math Notes folder.");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1005704B8, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("math.operators")));
  -[ICStartupWhatsNewViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v11, v9, v10);

}

- (id)startupNavigationController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(ICStartupNavigationController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupWhatsNewViewController navigationController](self, "navigationController"));
  v5 = ICCheckedDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)didTapContinueButton:(id)a3
{
  id v4;

  +[ICStartupController setLastShownStartupWelcomeScreenVersionToCurrentVersion](ICStartupController, "setLastShownStartupWelcomeScreenVersionToCurrentVersion", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupWhatsNewViewController startupNavigationController](self, "startupNavigationController"));
  objc_msgSend(v4, "dismiss");

}

@end
