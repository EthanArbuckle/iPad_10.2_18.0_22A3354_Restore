@implementation SBSSystemNotesTakeScreenshotAction

- (SBSSystemNotesTakeScreenshotAction)initWithDisplaysToScreenshot:(id)a3 responder:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  SBSSystemNotesTakeScreenshotAction *v11;
  objc_super v13;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D017D0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  if (v6)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D018A8]), "initWithArray:", v6);
    objc_msgSend(v9, "setObject:forSetting:", v10, 0);

  }
  v13.receiver = self;
  v13.super_class = (Class)SBSSystemNotesTakeScreenshotAction;
  v11 = -[SBSSystemNotesTakeScreenshotAction initWithInfo:responder:](&v13, sel_initWithInfo_responder_, v9, v8);

  return v11;
}

- (BSXPCCodingArray)displaysToScreenshot
{
  void *v2;
  void *v3;

  -[SBSSystemNotesTakeScreenshotAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSXPCCodingArray *)v3;
}

@end
