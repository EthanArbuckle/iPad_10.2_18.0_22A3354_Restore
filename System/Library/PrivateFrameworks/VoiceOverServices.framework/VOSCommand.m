@implementation VOSCommand

+ (VOSCommand)commandWithSiriShortcut:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[VOSCommand _initWithSiriShortcut:]([VOSCommand alloc], "_initWithSiriShortcut:", v3);

  return (VOSCommand *)v4;
}

- (id)_initWithSiriShortcut:(id)a3
{
  id v5;
  VOSCommand *v6;
  id *p_isa;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSCommand;
  v6 = -[VOSCommand init](&v9, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_commandType = 1;
    objc_storeStrong((id *)&v6->_siriShortcut, a3);
    objc_storeStrong(p_isa + 3, kVOTEventCommandRunSiriShortcut);
  }

  return p_isa;
}

- (id)_initBuiltInCommandWithRawValue:(id)a3 votEventCommandName:(id)a4
{
  id v7;
  id v8;
  VOSCommand *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSCommand;
  v9 = -[VOSCommand init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_commandType = 0;
    objc_storeStrong((id *)&v9->_rawValue, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[VOSCommand commandType](self, "commandType");
  v4 = CFSTR("Shortcut");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("Built-in");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSCommand localizedName](self, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>: %@: %@"), v8, self, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (VOSCommand)None
{
  if (None_onceToken != -1)
    dispatch_once(&None_onceToken, &__block_literal_global_9);
  return (VOSCommand *)(id)None__Command;
}

void __18__VOSCommand_None__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("None"), kVOTEventCommandNone);
  v2 = (void *)None__Command;
  None__Command = v1;

}

+ (VOSCommand)PrimaryActivate
{
  if (PrimaryActivate_onceToken != -1)
    dispatch_once(&PrimaryActivate_onceToken, &__block_literal_global_185);
  return (VOSCommand *)(id)PrimaryActivate__Command;
}

void __29__VOSCommand_PrimaryActivate__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PrimaryActivate"), kVOTEventCommandSimpleTap);
  v2 = (void *)PrimaryActivate__Command;
  PrimaryActivate__Command = v1;

}

+ (VOSCommand)SecondaryActivate
{
  if (SecondaryActivate_onceToken != -1)
    dispatch_once(&SecondaryActivate_onceToken, &__block_literal_global_188);
  return (VOSCommand *)(id)SecondaryActivate__Command;
}

void __31__VOSCommand_SecondaryActivate__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("SecondaryActivate"), kVOTEventCommandDoubleTap);
  v2 = (void *)SecondaryActivate__Command;
  SecondaryActivate__Command = v1;

}

+ (VOSCommand)PerformLongPress
{
  if (PerformLongPress_onceToken != -1)
    dispatch_once(&PerformLongPress_onceToken, &__block_literal_global_191);
  return (VOSCommand *)(id)PerformLongPress__Command;
}

void __30__VOSCommand_PerformLongPress__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PerformLongPress"), kVOTEventCommandSimulatedLongPress);
  v2 = (void *)PerformLongPress__Command;
  PerformLongPress__Command = v1;

}

+ (VOSCommand)MoveToPreviousElement
{
  if (MoveToPreviousElement_onceToken != -1)
    dispatch_once(&MoveToPreviousElement_onceToken, &__block_literal_global_194_0);
  return (VOSCommand *)(id)MoveToPreviousElement__Command;
}

void __35__VOSCommand_MoveToPreviousElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousElement"), kVOTEventCommandPreviousElement);
  v2 = (void *)MoveToPreviousElement__Command;
  MoveToPreviousElement__Command = v1;

}

+ (VOSCommand)MoveToNextElement
{
  if (MoveToNextElement_onceToken != -1)
    dispatch_once(&MoveToNextElement_onceToken, &__block_literal_global_197);
  return (VOSCommand *)(id)MoveToNextElement__Command;
}

void __31__VOSCommand_MoveToNextElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextElement"), kVOTEventCommandNextElement);
  v2 = (void *)MoveToNextElement__Command;
  MoveToNextElement__Command = v1;

}

+ (VOSCommand)MoveToFirstElement
{
  if (MoveToFirstElement_onceToken != -1)
    dispatch_once(&MoveToFirstElement_onceToken, &__block_literal_global_200);
  return (VOSCommand *)(id)MoveToFirstElement__Command;
}

void __32__VOSCommand_MoveToFirstElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToFirstElement"), kVOTEventCommandFirstElement);
  v2 = (void *)MoveToFirstElement__Command;
  MoveToFirstElement__Command = v1;

}

+ (VOSCommand)MoveToFirstWord
{
  if (MoveToFirstWord_onceToken != -1)
    dispatch_once(&MoveToFirstWord_onceToken, &__block_literal_global_203);
  return (VOSCommand *)(id)MoveToFirstWord__Command;
}

void __29__VOSCommand_MoveToFirstWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToFirstWord"), kVOTEventCommandFirstWord);
  v2 = (void *)MoveToFirstWord__Command;
  MoveToFirstWord__Command = v1;

}

+ (VOSCommand)MoveToLastElement
{
  if (MoveToLastElement_onceToken != -1)
    dispatch_once(&MoveToLastElement_onceToken, &__block_literal_global_206);
  return (VOSCommand *)(id)MoveToLastElement__Command;
}

void __31__VOSCommand_MoveToLastElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToLastElement"), kVOTEventCommandLastElement);
  v2 = (void *)MoveToLastElement__Command;
  MoveToLastElement__Command = v1;

}

+ (VOSCommand)MoveToCenterElement
{
  if (MoveToCenterElement_onceToken != -1)
    dispatch_once(&MoveToCenterElement_onceToken, &__block_literal_global_209);
  return (VOSCommand *)(id)MoveToCenterElement__Command;
}

void __33__VOSCommand_MoveToCenterElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToCenterElement"), kVOTEventCommandCenterElement);
  v2 = (void *)MoveToCenterElement__Command;
  MoveToCenterElement__Command = v1;

}

+ (VOSCommand)MoveToLastWord
{
  if (MoveToLastWord_onceToken != -1)
    dispatch_once(&MoveToLastWord_onceToken, &__block_literal_global_212);
  return (VOSCommand *)(id)MoveToLastWord__Command;
}

void __28__VOSCommand_MoveToLastWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToLastWord"), kVOTEventCommandLastWord);
  v2 = (void *)MoveToLastWord__Command;
  MoveToLastWord__Command = v1;

}

+ (VOSCommand)MoveToElementAbove
{
  if (MoveToElementAbove_onceToken != -1)
    dispatch_once(&MoveToElementAbove_onceToken, &__block_literal_global_215);
  return (VOSCommand *)(id)MoveToElementAbove__Command;
}

void __32__VOSCommand_MoveToElementAbove__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToElementAbove"), kVOTEventCommandElementAbove);
  v2 = (void *)MoveToElementAbove__Command;
  MoveToElementAbove__Command = v1;

}

+ (VOSCommand)MoveToElementBelow
{
  if (MoveToElementBelow_onceToken != -1)
    dispatch_once(&MoveToElementBelow_onceToken, &__block_literal_global_218);
  return (VOSCommand *)(id)MoveToElementBelow__Command;
}

void __32__VOSCommand_MoveToElementBelow__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToElementBelow"), kVOTEventCommandElementBelow);
  v2 = (void *)MoveToElementBelow__Command;
  MoveToElementBelow__Command = v1;

}

+ (VOSCommand)MoveToPreviousElementCommunity
{
  if (MoveToPreviousElementCommunity_onceToken != -1)
    dispatch_once(&MoveToPreviousElementCommunity_onceToken, &__block_literal_global_221);
  return (VOSCommand *)(id)MoveToPreviousElementCommunity__Command;
}

void __44__VOSCommand_MoveToPreviousElementCommunity__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousElementCommunity"), kVOTEventCommandLeftElementCommunity);
  v2 = (void *)MoveToPreviousElementCommunity__Command;
  MoveToPreviousElementCommunity__Command = v1;

}

+ (VOSCommand)MoveToNextElementCommunity
{
  if (MoveToNextElementCommunity_onceToken != -1)
    dispatch_once(&MoveToNextElementCommunity_onceToken, &__block_literal_global_224);
  return (VOSCommand *)(id)MoveToNextElementCommunity__Command;
}

void __40__VOSCommand_MoveToNextElementCommunity__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextElementCommunity"), kVOTEventCommandRightElementCommunity);
  v2 = (void *)MoveToNextElementCommunity__Command;
  MoveToNextElementCommunity__Command = v1;

}

+ (VOSCommand)MoveToPreviousContainer
{
  if (MoveToPreviousContainer_onceToken != -1)
    dispatch_once(&MoveToPreviousContainer_onceToken, &__block_literal_global_227);
  return (VOSCommand *)(id)MoveToPreviousContainer__Command;
}

void __37__VOSCommand_MoveToPreviousContainer__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousContainer"), kVOTEventCommandPreviousContainer);
  v2 = (void *)MoveToPreviousContainer__Command;
  MoveToPreviousContainer__Command = v1;

}

+ (VOSCommand)MoveToNextContainer
{
  if (MoveToNextContainer_onceToken != -1)
    dispatch_once(&MoveToNextContainer_onceToken, &__block_literal_global_230);
  return (VOSCommand *)(id)MoveToNextContainer__Command;
}

void __33__VOSCommand_MoveToNextContainer__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextContainer"), kVOTEventCommandNextContainer);
  v2 = (void *)MoveToNextContainer__Command;
  MoveToNextContainer__Command = v1;

}

+ (VOSCommand)MoveToTopOfCurrentContainer
{
  if (MoveToTopOfCurrentContainer_onceToken != -1)
    dispatch_once(&MoveToTopOfCurrentContainer_onceToken, &__block_literal_global_233);
  return (VOSCommand *)(id)MoveToTopOfCurrentContainer__Command;
}

void __41__VOSCommand_MoveToTopOfCurrentContainer__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToTopOfCurrentContainer"), kVOTEventCommandContainerTop);
  v2 = (void *)MoveToTopOfCurrentContainer__Command;
  MoveToTopOfCurrentContainer__Command = v1;

}

+ (VOSCommand)MoveToBottomOfCurrentContainer
{
  if (MoveToBottomOfCurrentContainer_onceToken != -1)
    dispatch_once(&MoveToBottomOfCurrentContainer_onceToken, &__block_literal_global_236);
  return (VOSCommand *)(id)MoveToBottomOfCurrentContainer__Command;
}

void __44__VOSCommand_MoveToBottomOfCurrentContainer__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToBottomOfCurrentContainer"), kVOTEventCommandContainerBottom);
  v2 = (void *)MoveToBottomOfCurrentContainer__Command;
  MoveToBottomOfCurrentContainer__Command = v1;

}

+ (VOSCommand)MoveToTopOfCurrentDocument
{
  if (MoveToTopOfCurrentDocument_onceToken != -1)
    dispatch_once(&MoveToTopOfCurrentDocument_onceToken, &__block_literal_global_239);
  return (VOSCommand *)(id)MoveToTopOfCurrentDocument__Command;
}

void __40__VOSCommand_MoveToTopOfCurrentDocument__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToTopOfCurrentDocument"), kVOTEventCommandDocumentTop);
  v2 = (void *)MoveToTopOfCurrentDocument__Command;
  MoveToTopOfCurrentDocument__Command = v1;

}

+ (VOSCommand)MoveToBottomOfCurrentDocument
{
  if (MoveToBottomOfCurrentDocument_onceToken != -1)
    dispatch_once(&MoveToBottomOfCurrentDocument_onceToken, &__block_literal_global_242);
  return (VOSCommand *)(id)MoveToBottomOfCurrentDocument__Command;
}

void __43__VOSCommand_MoveToBottomOfCurrentDocument__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToBottomOfCurrentDocument"), kVOTEventCommandDocumentBottom);
  v2 = (void *)MoveToBottomOfCurrentDocument__Command;
  MoveToBottomOfCurrentDocument__Command = v1;

}

+ (VOSCommand)MoveToPreviousCharacter
{
  if (MoveToPreviousCharacter_onceToken != -1)
    dispatch_once(&MoveToPreviousCharacter_onceToken, &__block_literal_global_245);
  return (VOSCommand *)(id)MoveToPreviousCharacter__Command;
}

void __37__VOSCommand_MoveToPreviousCharacter__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousCharacter"), kVOTEventCommandPreviousCharacter);
  v2 = (void *)MoveToPreviousCharacter__Command;
  MoveToPreviousCharacter__Command = v1;

}

+ (VOSCommand)MoveToNextCharacter
{
  if (MoveToNextCharacter_onceToken != -1)
    dispatch_once(&MoveToNextCharacter_onceToken, &__block_literal_global_248);
  return (VOSCommand *)(id)MoveToNextCharacter__Command;
}

void __33__VOSCommand_MoveToNextCharacter__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextCharacter"), kVOTEventCommandNextCharacter);
  v2 = (void *)MoveToNextCharacter__Command;
  MoveToNextCharacter__Command = v1;

}

+ (VOSCommand)MoveToPreviousWord
{
  if (MoveToPreviousWord_onceToken != -1)
    dispatch_once(&MoveToPreviousWord_onceToken, &__block_literal_global_251);
  return (VOSCommand *)(id)MoveToPreviousWord__Command;
}

void __32__VOSCommand_MoveToPreviousWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousWord"), kVOTEventCommandPreviousWord);
  v2 = (void *)MoveToPreviousWord__Command;
  MoveToPreviousWord__Command = v1;

}

+ (VOSCommand)MoveToNextWord
{
  if (MoveToNextWord_onceToken != -1)
    dispatch_once(&MoveToNextWord_onceToken, &__block_literal_global_254);
  return (VOSCommand *)(id)MoveToNextWord__Command;
}

void __28__VOSCommand_MoveToNextWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextWord"), kVOTEventCommandNextWord);
  v2 = (void *)MoveToNextWord__Command;
  MoveToNextWord__Command = v1;

}

+ (VOSCommand)MoveToPreviousSentence
{
  if (MoveToPreviousSentence_onceToken != -1)
    dispatch_once(&MoveToPreviousSentence_onceToken, &__block_literal_global_257);
  return (VOSCommand *)(id)MoveToPreviousSentence__Command;
}

void __36__VOSCommand_MoveToPreviousSentence__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousSentence"), kVOTEventCommandPreviousSentence);
  v2 = (void *)MoveToPreviousSentence__Command;
  MoveToPreviousSentence__Command = v1;

}

+ (VOSCommand)MoveToNextSentence
{
  if (MoveToNextSentence_onceToken != -1)
    dispatch_once(&MoveToNextSentence_onceToken, &__block_literal_global_260);
  return (VOSCommand *)(id)MoveToNextSentence__Command;
}

void __32__VOSCommand_MoveToNextSentence__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextSentence"), kVOTEventCommandNextSentence);
  v2 = (void *)MoveToNextSentence__Command;
  MoveToNextSentence__Command = v1;

}

+ (VOSCommand)MoveToPreviousParagraph
{
  if (MoveToPreviousParagraph_onceToken != -1)
    dispatch_once(&MoveToPreviousParagraph_onceToken, &__block_literal_global_263);
  return (VOSCommand *)(id)MoveToPreviousParagraph__Command;
}

void __37__VOSCommand_MoveToPreviousParagraph__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousParagraph"), kVOTEventCommandPreviousParagraph);
  v2 = (void *)MoveToPreviousParagraph__Command;
  MoveToPreviousParagraph__Command = v1;

}

+ (VOSCommand)MoveToNextParagraph
{
  if (MoveToNextParagraph_onceToken != -1)
    dispatch_once(&MoveToNextParagraph_onceToken, &__block_literal_global_266);
  return (VOSCommand *)(id)MoveToNextParagraph__Command;
}

void __33__VOSCommand_MoveToNextParagraph__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextParagraph"), kVOTEventCommandNextParagraph);
  v2 = (void *)MoveToNextParagraph__Command;
  MoveToNextParagraph__Command = v1;

}

+ (VOSCommand)MoveToStatusBar
{
  if (MoveToStatusBar_onceToken != -1)
    dispatch_once(&MoveToStatusBar_onceToken, &__block_literal_global_269);
  return (VOSCommand *)(id)MoveToStatusBar__Command;
}

void __29__VOSCommand_MoveToStatusBar__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToStatusBar"), kVOTEventCommandMoveToStatusBar);
  v2 = (void *)MoveToStatusBar__Command;
  MoveToStatusBar__Command = v1;

}

+ (VOSCommand)MoveToLinkedUI
{
  if (MoveToLinkedUI_onceToken != -1)
    dispatch_once(&MoveToLinkedUI_onceToken, &__block_literal_global_272);
  return (VOSCommand *)(id)MoveToLinkedUI__Command;
}

void __28__VOSCommand_MoveToLinkedUI__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToLinkedUI"), kVOTEventCommandMoveToLinkedUI);
  v2 = (void *)MoveToLinkedUI__Command;
  MoveToLinkedUI__Command = v1;

}

+ (VOSCommand)MoveToSystemFocusedElement
{
  if (MoveToSystemFocusedElement_onceToken != -1)
    dispatch_once(&MoveToSystemFocusedElement_onceToken, &__block_literal_global_275);
  return (VOSCommand *)(id)MoveToSystemFocusedElement__Command;
}

void __40__VOSCommand_MoveToSystemFocusedElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToSystemFocusedElement"), kVOTEventCommandMoveToNativeFocusedElement);
  v2 = (void *)MoveToSystemFocusedElement__Command;
  MoveToSystemFocusedElement__Command = v1;

}

+ (VOSCommand)MoveToNextGraphic
{
  if (MoveToNextGraphic_onceToken != -1)
    dispatch_once(&MoveToNextGraphic_onceToken, &__block_literal_global_278);
  return (VOSCommand *)(id)MoveToNextGraphic__Command;
}

void __31__VOSCommand_MoveToNextGraphic__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextGraphic"), kVOTEventCommandNextGraphic);
  v2 = (void *)MoveToNextGraphic__Command;
  MoveToNextGraphic__Command = v1;

}

+ (VOSCommand)MoveToPreviousGraphic
{
  if (MoveToPreviousGraphic_onceToken != -1)
    dispatch_once(&MoveToPreviousGraphic_onceToken, &__block_literal_global_281);
  return (VOSCommand *)(id)MoveToPreviousGraphic__Command;
}

void __35__VOSCommand_MoveToPreviousGraphic__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousGraphic"), kVOTEventCommandPreviousGraphic);
  v2 = (void *)MoveToPreviousGraphic__Command;
  MoveToPreviousGraphic__Command = v1;

}

+ (VOSCommand)MoveToNextHeading
{
  if (MoveToNextHeading_onceToken != -1)
    dispatch_once(&MoveToNextHeading_onceToken, &__block_literal_global_284);
  return (VOSCommand *)(id)MoveToNextHeading__Command;
}

void __31__VOSCommand_MoveToNextHeading__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextHeading"), kVOTEventCommandNextHeading);
  v2 = (void *)MoveToNextHeading__Command;
  MoveToNextHeading__Command = v1;

}

+ (VOSCommand)MoveToPreviousHeading
{
  if (MoveToPreviousHeading_onceToken != -1)
    dispatch_once(&MoveToPreviousHeading_onceToken, &__block_literal_global_287);
  return (VOSCommand *)(id)MoveToPreviousHeading__Command;
}

void __35__VOSCommand_MoveToPreviousHeading__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousHeading"), kVOTEventCommandPreviousHeading);
  v2 = (void *)MoveToPreviousHeading__Command;
  MoveToPreviousHeading__Command = v1;

}

+ (VOSCommand)MoveToNextTable
{
  if (MoveToNextTable_onceToken != -1)
    dispatch_once(&MoveToNextTable_onceToken, &__block_literal_global_290);
  return (VOSCommand *)(id)MoveToNextTable__Command;
}

void __29__VOSCommand_MoveToNextTable__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextTable"), kVOTEventCommandNextTable);
  v2 = (void *)MoveToNextTable__Command;
  MoveToNextTable__Command = v1;

}

+ (VOSCommand)MoveToPreviousTable
{
  if (MoveToPreviousTable_onceToken != -1)
    dispatch_once(&MoveToPreviousTable_onceToken, &__block_literal_global_293);
  return (VOSCommand *)(id)MoveToPreviousTable__Command;
}

void __33__VOSCommand_MoveToPreviousTable__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousTable"), kVOTEventCommandPreviousTable);
  v2 = (void *)MoveToPreviousTable__Command;
  MoveToPreviousTable__Command = v1;

}

+ (VOSCommand)MoveToNextList
{
  if (MoveToNextList_onceToken != -1)
    dispatch_once(&MoveToNextList_onceToken, &__block_literal_global_296);
  return (VOSCommand *)(id)MoveToNextList__Command;
}

void __28__VOSCommand_MoveToNextList__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextList"), kVOTEventCommandNextList);
  v2 = (void *)MoveToNextList__Command;
  MoveToNextList__Command = v1;

}

+ (VOSCommand)MoveToPreviousList
{
  if (MoveToPreviousList_onceToken != -1)
    dispatch_once(&MoveToPreviousList_onceToken, &__block_literal_global_299);
  return (VOSCommand *)(id)MoveToPreviousList__Command;
}

void __32__VOSCommand_MoveToPreviousList__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousList"), kVOTEventCommandPreviousList);
  v2 = (void *)MoveToPreviousList__Command;
  MoveToPreviousList__Command = v1;

}

+ (VOSCommand)MoveToNextSameElement
{
  if (MoveToNextSameElement_onceToken != -1)
    dispatch_once(&MoveToNextSameElement_onceToken, &__block_literal_global_302);
  return (VOSCommand *)(id)MoveToNextSameElement__Command;
}

void __35__VOSCommand_MoveToNextSameElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextSameElement"), kVOTEventCommandNextSameElement);
  v2 = (void *)MoveToNextSameElement__Command;
  MoveToNextSameElement__Command = v1;

}

+ (VOSCommand)MoveToPreviousSameElement
{
  if (MoveToPreviousSameElement_onceToken != -1)
    dispatch_once(&MoveToPreviousSameElement_onceToken, &__block_literal_global_305);
  return (VOSCommand *)(id)MoveToPreviousSameElement__Command;
}

void __39__VOSCommand_MoveToPreviousSameElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousSameElement"), kVOTEventCommandPreviousSameElement);
  v2 = (void *)MoveToPreviousSameElement__Command;
  MoveToPreviousSameElement__Command = v1;

}

+ (VOSCommand)MoveToNextControl
{
  if (MoveToNextControl_onceToken != -1)
    dispatch_once(&MoveToNextControl_onceToken, &__block_literal_global_308);
  return (VOSCommand *)(id)MoveToNextControl__Command;
}

void __31__VOSCommand_MoveToNextControl__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextControl"), kVOTEventCommandNextControl);
  v2 = (void *)MoveToNextControl__Command;
  MoveToNextControl__Command = v1;

}

+ (VOSCommand)MoveToPreviousControl
{
  if (MoveToPreviousControl_onceToken != -1)
    dispatch_once(&MoveToPreviousControl_onceToken, &__block_literal_global_311);
  return (VOSCommand *)(id)MoveToPreviousControl__Command;
}

void __35__VOSCommand_MoveToPreviousControl__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousControl"), kVOTEventCommandPreviousControl);
  v2 = (void *)MoveToPreviousControl__Command;
  MoveToPreviousControl__Command = v1;

}

+ (VOSCommand)MoveToNextLink
{
  if (MoveToNextLink_onceToken != -1)
    dispatch_once(&MoveToNextLink_onceToken, &__block_literal_global_314);
  return (VOSCommand *)(id)MoveToNextLink__Command;
}

void __28__VOSCommand_MoveToNextLink__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextLink"), kVOTEventCommandNextLink);
  v2 = (void *)MoveToNextLink__Command;
  MoveToNextLink__Command = v1;

}

+ (VOSCommand)MoveToPreviousLink
{
  if (MoveToPreviousLink_onceToken != -1)
    dispatch_once(&MoveToPreviousLink_onceToken, &__block_literal_global_317);
  return (VOSCommand *)(id)MoveToPreviousLink__Command;
}

void __32__VOSCommand_MoveToPreviousLink__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousLink"), kVOTEventCommandPreviousLink);
  v2 = (void *)MoveToPreviousLink__Command;
  MoveToPreviousLink__Command = v1;

}

+ (VOSCommand)MoveToNextBlockquote
{
  if (MoveToNextBlockquote_onceToken != -1)
    dispatch_once(&MoveToNextBlockquote_onceToken, &__block_literal_global_320);
  return (VOSCommand *)(id)MoveToNextBlockquote__Command;
}

void __34__VOSCommand_MoveToNextBlockquote__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextBlockquote"), kVOTEventCommandNextBlockquote);
  v2 = (void *)MoveToNextBlockquote__Command;
  MoveToNextBlockquote__Command = v1;

}

+ (VOSCommand)MoveToPreviousBlockquote
{
  if (MoveToPreviousBlockquote_onceToken != -1)
    dispatch_once(&MoveToPreviousBlockquote_onceToken, &__block_literal_global_323);
  return (VOSCommand *)(id)MoveToPreviousBlockquote__Command;
}

void __38__VOSCommand_MoveToPreviousBlockquote__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousBlockquote"), kVOTEventCommandPreviousBlockquote);
  v2 = (void *)MoveToPreviousBlockquote__Command;
  MoveToPreviousBlockquote__Command = v1;

}

+ (VOSCommand)MoveToNextSameBlockquote
{
  if (MoveToNextSameBlockquote_onceToken != -1)
    dispatch_once(&MoveToNextSameBlockquote_onceToken, &__block_literal_global_326);
  return (VOSCommand *)(id)MoveToNextSameBlockquote__Command;
}

void __38__VOSCommand_MoveToNextSameBlockquote__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextSameBlockquote"), kVOTEventCommandNextSameBlockquote);
  v2 = (void *)MoveToNextSameBlockquote__Command;
  MoveToNextSameBlockquote__Command = v1;

}

+ (VOSCommand)MoveToPreviousSameBlockquote
{
  if (MoveToPreviousSameBlockquote_onceToken != -1)
    dispatch_once(&MoveToPreviousSameBlockquote_onceToken, &__block_literal_global_329);
  return (VOSCommand *)(id)MoveToPreviousSameBlockquote__Command;
}

void __42__VOSCommand_MoveToPreviousSameBlockquote__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousSameBlockquote"), kVOTEventCommandPreviousSameBlockquote);
  v2 = (void *)MoveToPreviousSameBlockquote__Command;
  MoveToPreviousSameBlockquote__Command = v1;

}

+ (VOSCommand)MoveToNextVisitedLink
{
  if (MoveToNextVisitedLink_onceToken != -1)
    dispatch_once(&MoveToNextVisitedLink_onceToken, &__block_literal_global_332);
  return (VOSCommand *)(id)MoveToNextVisitedLink__Command;
}

void __35__VOSCommand_MoveToNextVisitedLink__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextVisitedLink"), kVOTEventCommandNextVisitedLink);
  v2 = (void *)MoveToNextVisitedLink__Command;
  MoveToNextVisitedLink__Command = v1;

}

+ (VOSCommand)MoveToPreviousVisitedLink
{
  if (MoveToPreviousVisitedLink_onceToken != -1)
    dispatch_once(&MoveToPreviousVisitedLink_onceToken, &__block_literal_global_335);
  return (VOSCommand *)(id)MoveToPreviousVisitedLink__Command;
}

void __39__VOSCommand_MoveToPreviousVisitedLink__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousVisitedLink"), kVOTEventCommandPreviousVisitedLink);
  v2 = (void *)MoveToPreviousVisitedLink__Command;
  MoveToPreviousVisitedLink__Command = v1;

}

+ (VOSCommand)MoveToNextSameHeading
{
  if (MoveToNextSameHeading_onceToken != -1)
    dispatch_once(&MoveToNextSameHeading_onceToken, &__block_literal_global_338);
  return (VOSCommand *)(id)MoveToNextSameHeading__Command;
}

void __35__VOSCommand_MoveToNextSameHeading__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextSameHeading"), kVOTEventCommandNextSameHeading);
  v2 = (void *)MoveToNextSameHeading__Command;
  MoveToNextSameHeading__Command = v1;

}

+ (VOSCommand)MoveToPreviousSameHeading
{
  if (MoveToPreviousSameHeading_onceToken != -1)
    dispatch_once(&MoveToPreviousSameHeading_onceToken, &__block_literal_global_341);
  return (VOSCommand *)(id)MoveToPreviousSameHeading__Command;
}

void __39__VOSCommand_MoveToPreviousSameHeading__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousSameHeading"), kVOTEventCommandPreviousSameHeading);
  v2 = (void *)MoveToPreviousSameHeading__Command;
  MoveToPreviousSameHeading__Command = v1;

}

+ (VOSCommand)MoveToNextBoldText
{
  if (MoveToNextBoldText_onceToken != -1)
    dispatch_once(&MoveToNextBoldText_onceToken, &__block_literal_global_344);
  return (VOSCommand *)(id)MoveToNextBoldText__Command;
}

void __32__VOSCommand_MoveToNextBoldText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextBoldText"), kVOTEventCommandNextBoldText);
  v2 = (void *)MoveToNextBoldText__Command;
  MoveToNextBoldText__Command = v1;

}

+ (VOSCommand)MoveToPreviousBoldText
{
  if (MoveToPreviousBoldText_onceToken != -1)
    dispatch_once(&MoveToPreviousBoldText_onceToken, &__block_literal_global_347);
  return (VOSCommand *)(id)MoveToPreviousBoldText__Command;
}

void __36__VOSCommand_MoveToPreviousBoldText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousBoldText"), kVOTEventCommandPreviousBoldText);
  v2 = (void *)MoveToPreviousBoldText__Command;
  MoveToPreviousBoldText__Command = v1;

}

+ (VOSCommand)MoveToNextMisspelledWord
{
  if (MoveToNextMisspelledWord_onceToken != -1)
    dispatch_once(&MoveToNextMisspelledWord_onceToken, &__block_literal_global_350);
  return (VOSCommand *)(id)MoveToNextMisspelledWord__Command;
}

void __38__VOSCommand_MoveToNextMisspelledWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextMisspelledWord"), kVOTEventCommandNextMisspelledWord);
  v2 = (void *)MoveToNextMisspelledWord__Command;
  MoveToNextMisspelledWord__Command = v1;

}

+ (VOSCommand)MoveToPreviousMisspelledWord
{
  if (MoveToPreviousMisspelledWord_onceToken != -1)
    dispatch_once(&MoveToPreviousMisspelledWord_onceToken, &__block_literal_global_353);
  return (VOSCommand *)(id)MoveToPreviousMisspelledWord__Command;
}

void __42__VOSCommand_MoveToPreviousMisspelledWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousMisspelledWord"), kVOTEventCommandPreviousMisspelledWord);
  v2 = (void *)MoveToPreviousMisspelledWord__Command;
  MoveToPreviousMisspelledWord__Command = v1;

}

+ (VOSCommand)MoveToNextPlainText
{
  if (MoveToNextPlainText_onceToken != -1)
    dispatch_once(&MoveToNextPlainText_onceToken, &__block_literal_global_356);
  return (VOSCommand *)(id)MoveToNextPlainText__Command;
}

void __33__VOSCommand_MoveToNextPlainText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextPlainText"), kVOTEventCommandNextPlainText);
  v2 = (void *)MoveToNextPlainText__Command;
  MoveToNextPlainText__Command = v1;

}

+ (VOSCommand)MoveToPreviousPlainText
{
  if (MoveToPreviousPlainText_onceToken != -1)
    dispatch_once(&MoveToPreviousPlainText_onceToken, &__block_literal_global_359);
  return (VOSCommand *)(id)MoveToPreviousPlainText__Command;
}

void __37__VOSCommand_MoveToPreviousPlainText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousPlainText"), kVOTEventCommandPreviousPlainText);
  v2 = (void *)MoveToPreviousPlainText__Command;
  MoveToPreviousPlainText__Command = v1;

}

+ (VOSCommand)MoveToNextColorChange
{
  if (MoveToNextColorChange_onceToken != -1)
    dispatch_once(&MoveToNextColorChange_onceToken, &__block_literal_global_362);
  return (VOSCommand *)(id)MoveToNextColorChange__Command;
}

void __35__VOSCommand_MoveToNextColorChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextColorChange"), kVOTEventCommandNextColorChange);
  v2 = (void *)MoveToNextColorChange__Command;
  MoveToNextColorChange__Command = v1;

}

+ (VOSCommand)MoveToPreviousColorChange
{
  if (MoveToPreviousColorChange_onceToken != -1)
    dispatch_once(&MoveToPreviousColorChange_onceToken, &__block_literal_global_365);
  return (VOSCommand *)(id)MoveToPreviousColorChange__Command;
}

void __39__VOSCommand_MoveToPreviousColorChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousColorChange"), kVOTEventCommandPreviousColorChange);
  v2 = (void *)MoveToPreviousColorChange__Command;
  MoveToPreviousColorChange__Command = v1;

}

+ (VOSCommand)MoveToNextItalicText
{
  if (MoveToNextItalicText_onceToken != -1)
    dispatch_once(&MoveToNextItalicText_onceToken, &__block_literal_global_368);
  return (VOSCommand *)(id)MoveToNextItalicText__Command;
}

void __34__VOSCommand_MoveToNextItalicText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextItalicText"), kVOTEventCommandNextItalicText);
  v2 = (void *)MoveToNextItalicText__Command;
  MoveToNextItalicText__Command = v1;

}

+ (VOSCommand)MoveToPreviousItalicText
{
  if (MoveToPreviousItalicText_onceToken != -1)
    dispatch_once(&MoveToPreviousItalicText_onceToken, &__block_literal_global_371_0);
  return (VOSCommand *)(id)MoveToPreviousItalicText__Command;
}

void __38__VOSCommand_MoveToPreviousItalicText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousItalicText"), kVOTEventCommandPreviousItalicText);
  v2 = (void *)MoveToPreviousItalicText__Command;
  MoveToPreviousItalicText__Command = v1;

}

+ (VOSCommand)MoveToNextUnderlineText
{
  if (MoveToNextUnderlineText_onceToken != -1)
    dispatch_once(&MoveToNextUnderlineText_onceToken, &__block_literal_global_374_0);
  return (VOSCommand *)(id)MoveToNextUnderlineText__Command;
}

void __37__VOSCommand_MoveToNextUnderlineText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextUnderlineText"), kVOTEventCommandNextUnderlineText);
  v2 = (void *)MoveToNextUnderlineText__Command;
  MoveToNextUnderlineText__Command = v1;

}

+ (VOSCommand)MoveToPreviousUnderlineText
{
  if (MoveToPreviousUnderlineText_onceToken != -1)
    dispatch_once(&MoveToPreviousUnderlineText_onceToken, &__block_literal_global_377_0);
  return (VOSCommand *)(id)MoveToPreviousUnderlineText__Command;
}

void __41__VOSCommand_MoveToPreviousUnderlineText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousUnderlineText"), kVOTEventCommandPreviousUnderlineText);
  v2 = (void *)MoveToPreviousUnderlineText__Command;
  MoveToPreviousUnderlineText__Command = v1;

}

+ (VOSCommand)MoveToNextDifferentElement
{
  if (MoveToNextDifferentElement_onceToken != -1)
    dispatch_once(&MoveToNextDifferentElement_onceToken, &__block_literal_global_380);
  return (VOSCommand *)(id)MoveToNextDifferentElement__Command;
}

void __40__VOSCommand_MoveToNextDifferentElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextDifferentElement"), kVOTEventCommandNextDifferentElement);
  v2 = (void *)MoveToNextDifferentElement__Command;
  MoveToNextDifferentElement__Command = v1;

}

+ (VOSCommand)MoveToPreviousDifferentElement
{
  if (MoveToPreviousDifferentElement_onceToken != -1)
    dispatch_once(&MoveToPreviousDifferentElement_onceToken, &__block_literal_global_383);
  return (VOSCommand *)(id)MoveToPreviousDifferentElement__Command;
}

void __44__VOSCommand_MoveToPreviousDifferentElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousDifferentElement"), kVOTEventCommandPreviousDifferentElement);
  v2 = (void *)MoveToPreviousDifferentElement__Command;
  MoveToPreviousDifferentElement__Command = v1;

}

+ (VOSCommand)MoveToNextColumn
{
  if (MoveToNextColumn_onceToken != -1)
    dispatch_once(&MoveToNextColumn_onceToken, &__block_literal_global_386);
  return (VOSCommand *)(id)MoveToNextColumn__Command;
}

void __30__VOSCommand_MoveToNextColumn__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextColumn"), kVOTEventCommandNextColumn);
  v2 = (void *)MoveToNextColumn__Command;
  MoveToNextColumn__Command = v1;

}

+ (VOSCommand)MoveToPreviousColumn
{
  if (MoveToPreviousColumn_onceToken != -1)
    dispatch_once(&MoveToPreviousColumn_onceToken, &__block_literal_global_389);
  return (VOSCommand *)(id)MoveToPreviousColumn__Command;
}

void __34__VOSCommand_MoveToPreviousColumn__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousColumn"), kVOTEventCommandPreviousColumn);
  v2 = (void *)MoveToPreviousColumn__Command;
  MoveToPreviousColumn__Command = v1;

}

+ (VOSCommand)MoveToNextFontChange
{
  if (MoveToNextFontChange_onceToken != -1)
    dispatch_once(&MoveToNextFontChange_onceToken, &__block_literal_global_392);
  return (VOSCommand *)(id)MoveToNextFontChange__Command;
}

void __34__VOSCommand_MoveToNextFontChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextFontChange"), kVOTEventCommandNextFontChange);
  v2 = (void *)MoveToNextFontChange__Command;
  MoveToNextFontChange__Command = v1;

}

+ (VOSCommand)MoveToPreviousFontChange
{
  if (MoveToPreviousFontChange_onceToken != -1)
    dispatch_once(&MoveToPreviousFontChange_onceToken, &__block_literal_global_395);
  return (VOSCommand *)(id)MoveToPreviousFontChange__Command;
}

void __38__VOSCommand_MoveToPreviousFontChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousFontChange"), kVOTEventCommandPreviousFontChange);
  v2 = (void *)MoveToPreviousFontChange__Command;
  MoveToPreviousFontChange__Command = v1;

}

+ (VOSCommand)MoveToNextFrame
{
  if (MoveToNextFrame_onceToken != -1)
    dispatch_once(&MoveToNextFrame_onceToken, &__block_literal_global_398);
  return (VOSCommand *)(id)MoveToNextFrame__Command;
}

void __29__VOSCommand_MoveToNextFrame__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextFrame"), kVOTEventCommandNextFrame);
  v2 = (void *)MoveToNextFrame__Command;
  MoveToNextFrame__Command = v1;

}

+ (VOSCommand)MoveToPreviousFrame
{
  if (MoveToPreviousFrame_onceToken != -1)
    dispatch_once(&MoveToPreviousFrame_onceToken, &__block_literal_global_401);
  return (VOSCommand *)(id)MoveToPreviousFrame__Command;
}

void __33__VOSCommand_MoveToPreviousFrame__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousFrame"), kVOTEventCommandPreviousFrame);
  v2 = (void *)MoveToPreviousFrame__Command;
  MoveToPreviousFrame__Command = v1;

}

+ (VOSCommand)MoveToNextStyleChange
{
  if (MoveToNextStyleChange_onceToken != -1)
    dispatch_once(&MoveToNextStyleChange_onceToken, &__block_literal_global_404);
  return (VOSCommand *)(id)MoveToNextStyleChange__Command;
}

void __35__VOSCommand_MoveToNextStyleChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToNextStyleChange"), kVOTEventCommandNextStyleChange);
  v2 = (void *)MoveToNextStyleChange__Command;
  MoveToNextStyleChange__Command = v1;

}

+ (VOSCommand)MoveToPreviousStyleChange
{
  if (MoveToPreviousStyleChange_onceToken != -1)
    dispatch_once(&MoveToPreviousStyleChange_onceToken, &__block_literal_global_407);
  return (VOSCommand *)(id)MoveToPreviousStyleChange__Command;
}

void __39__VOSCommand_MoveToPreviousStyleChange__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveToPreviousStyleChange"), kVOTEventCommandPreviousStyleChange);
  v2 = (void *)MoveToPreviousStyleChange__Command;
  MoveToPreviousStyleChange__Command = v1;

}

+ (VOSCommand)FindElementWithTextSearch
{
  if (FindElementWithTextSearch_onceToken != -1)
    dispatch_once(&FindElementWithTextSearch_onceToken, &__block_literal_global_410);
  return (VOSCommand *)(id)FindElementWithTextSearch__Command;
}

void __39__VOSCommand_FindElementWithTextSearch__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("FindElementWithTextSearch"), kVOTEventCommandStartTextSearch);
  v2 = (void *)FindElementWithTextSearch__Command;
  FindElementWithTextSearch__Command = v1;

}

+ (VOSCommand)PreviousSearchResult
{
  if (PreviousSearchResult_onceToken != -1)
    dispatch_once(&PreviousSearchResult_onceToken, &__block_literal_global_413);
  return (VOSCommand *)(id)PreviousSearchResult__Command;
}

void __34__VOSCommand_PreviousSearchResult__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PreviousSearchResult"), kVOTEventCommandTextSearchBackward);
  v2 = (void *)PreviousSearchResult__Command;
  PreviousSearchResult__Command = v1;

}

+ (VOSCommand)NextSearchResult
{
  if (NextSearchResult_onceToken != -1)
    dispatch_once(&NextSearchResult_onceToken, &__block_literal_global_416);
  return (VOSCommand *)(id)NextSearchResult__Command;
}

void __30__VOSCommand_NextSearchResult__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("NextSearchResult"), kVOTEventCommandTextSearchForward);
  v2 = (void *)NextSearchResult__Command;
  NextSearchResult__Command = v1;

}

+ (VOSCommand)Copy
{
  if (Copy_onceToken != -1)
    dispatch_once(&Copy_onceToken, &__block_literal_global_419);
  return (VOSCommand *)(id)Copy__Command;
}

void __18__VOSCommand_Copy__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Copy"), kVOTEventCommandCopy);
  v2 = (void *)Copy__Command;
  Copy__Command = v1;

}

+ (VOSCommand)Cut
{
  if (Cut_onceToken != -1)
    dispatch_once(&Cut_onceToken, &__block_literal_global_422);
  return (VOSCommand *)(id)Cut__Command;
}

void __17__VOSCommand_Cut__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Cut"), kVOTEventCommandCut);
  v2 = (void *)Cut__Command;
  Cut__Command = v1;

}

+ (VOSCommand)Paste
{
  if (Paste_onceToken != -1)
    dispatch_once(&Paste_onceToken, &__block_literal_global_425);
  return (VOSCommand *)(id)Paste__Command;
}

void __19__VOSCommand_Paste__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Paste"), kVOTEventCommandPaste);
  v2 = (void *)Paste__Command;
  Paste__Command = v1;

}

+ (VOSCommand)Undo
{
  if (Undo_onceToken != -1)
    dispatch_once(&Undo_onceToken, &__block_literal_global_428);
  return (VOSCommand *)(id)Undo__Command;
}

void __18__VOSCommand_Undo__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Undo"), kVOTEventCommandUndo);
  v2 = (void *)Undo__Command;
  Undo__Command = v1;

}

+ (VOSCommand)Redo
{
  if (Redo_onceToken != -1)
    dispatch_once(&Redo_onceToken, &__block_literal_global_431);
  return (VOSCommand *)(id)Redo__Command;
}

void __18__VOSCommand_Redo__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Redo"), kVOTEventCommandRedo);
  v2 = (void *)Redo__Command;
  Redo__Command = v1;

}

+ (VOSCommand)ToggleTextSelection
{
  if (ToggleTextSelection_onceToken != -1)
    dispatch_once(&ToggleTextSelection_onceToken, &__block_literal_global_434);
  return (VOSCommand *)(id)ToggleTextSelection__Command;
}

void __33__VOSCommand_ToggleTextSelection__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleTextSelection"), kVOTEventCommandStartStopTextSelection);
  v2 = (void *)ToggleTextSelection__Command;
  ToggleTextSelection__Command = v1;

}

+ (VOSCommand)SummarizeElement
{
  if (SummarizeElement_onceToken != -1)
    dispatch_once(&SummarizeElement_onceToken, &__block_literal_global_437);
  return (VOSCommand *)(id)SummarizeElement__Command;
}

void __30__VOSCommand_SummarizeElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("SummarizeElement"), kVOTEventCommandOutputElementSummary);
  v2 = (void *)SummarizeElement__Command;
  SummarizeElement__Command = v1;

}

+ (VOSCommand)SummarizeSystemFocusedElement
{
  if (SummarizeSystemFocusedElement_onceToken != -1)
    dispatch_once(&SummarizeSystemFocusedElement_onceToken, &__block_literal_global_440);
  return (VOSCommand *)(id)SummarizeSystemFocusedElement__Command;
}

void __43__VOSCommand_SummarizeSystemFocusedElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("SummarizeSystemFocusedElement"), kVOTEventCommandOutputFocusedElementSummary);
  v2 = (void *)SummarizeSystemFocusedElement__Command;
  SummarizeSystemFocusedElement__Command = v1;

}

+ (VOSCommand)ReadSystemFocusedElementDetails
{
  if (ReadSystemFocusedElementDetails_onceToken != -1)
    dispatch_once(&ReadSystemFocusedElementDetails_onceToken, &__block_literal_global_443);
  return (VOSCommand *)(id)ReadSystemFocusedElementDetails__Command;
}

void __45__VOSCommand_ReadSystemFocusedElementDetails__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadSystemFocusedElementDetails"), kVOTEventCommandOutputDetailedFocusedElementSummary);
  v2 = (void *)ReadSystemFocusedElementDetails__Command;
  ReadSystemFocusedElementDetails__Command = v1;

}

+ (VOSCommand)PreviewElementWith3DTouch
{
  if (PreviewElementWith3DTouch_onceToken != -1)
    dispatch_once(&PreviewElementWith3DTouch_onceToken, &__block_literal_global_446);
  return (VOSCommand *)(id)PreviewElementWith3DTouch__Command;
}

void __39__VOSCommand_PreviewElementWith3DTouch__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PreviewElementWith3DTouch"), kVOTEventCommandSimulatedForceTouch);
  v2 = (void *)PreviewElementWith3DTouch__Command;
  PreviewElementWith3DTouch__Command = v1;

}

+ (VOSCommand)AnalyzeElement
{
  if (AnalyzeElement_onceToken != -1)
    dispatch_once(&AnalyzeElement_onceToken, &__block_literal_global_449);
  return (VOSCommand *)(id)AnalyzeElement__Command;
}

void __28__VOSCommand_AnalyzeElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("AnalyzeElement"), kVOTEventCommandOutputElementComputerVisionAnalysisSummary);
  v2 = (void *)AnalyzeElement__Command;
  AnalyzeElement__Command = v1;

}

+ (VOSCommand)ReadAll
{
  if (ReadAll_onceToken != -1)
    dispatch_once(&ReadAll_onceToken, &__block_literal_global_452);
  return (VOSCommand *)(id)ReadAll__Command;
}

void __21__VOSCommand_ReadAll__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadAll"), kVOTEventCommandReadAll);
  v2 = (void *)ReadAll__Command;
  ReadAll__Command = v1;

}

+ (VOSCommand)ReadFromTop
{
  if (ReadFromTop_onceToken != -1)
    dispatch_once(&ReadFromTop_onceToken, &__block_literal_global_455);
  return (VOSCommand *)(id)ReadFromTop__Command;
}

void __25__VOSCommand_ReadFromTop__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadFromTop"), kVOTEventCommandReadFromTop);
  v2 = (void *)ReadFromTop__Command;
  ReadFromTop__Command = v1;

}

+ (VOSCommand)ReadLine
{
  if (ReadLine_onceToken != -1)
    dispatch_once(&ReadLine_onceToken, &__block_literal_global_458);
  return (VOSCommand *)(id)ReadLine__Command;
}

void __22__VOSCommand_ReadLine__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadLine"), kVOTEventCommandReadLine);
  v2 = (void *)ReadLine__Command;
  ReadLine__Command = v1;

}

+ (VOSCommand)ReadWord
{
  if (ReadWord_onceToken != -1)
    dispatch_once(&ReadWord_onceToken, &__block_literal_global_461);
  return (VOSCommand *)(id)ReadWord__Command;
}

void __22__VOSCommand_ReadWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadWord"), kVOTEventCommandReadWord);
  v2 = (void *)ReadWord__Command;
  ReadWord__Command = v1;

}

+ (VOSCommand)ReadHint
{
  if (ReadHint_onceToken != -1)
    dispatch_once(&ReadHint_onceToken, &__block_literal_global_464);
  return (VOSCommand *)(id)ReadHint__Command;
}

void __22__VOSCommand_ReadHint__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadHint"), kVOTEventCommandReadHint);
  v2 = (void *)ReadHint__Command;
  ReadHint__Command = v1;

}

+ (VOSCommand)ReadTextStyle
{
  if (ReadTextStyle_onceToken != -1)
    dispatch_once(&ReadTextStyle_onceToken, &__block_literal_global_467);
  return (VOSCommand *)(id)ReadTextStyle__Command;
}

void __27__VOSCommand_ReadTextStyle__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadTextStyle"), kVOTEventCommandOutputTextStyle);
  v2 = (void *)ReadTextStyle__Command;
  ReadTextStyle__Command = v1;

}

+ (VOSCommand)ReadURL
{
  if (ReadURL_onceToken != -1)
    dispatch_once(&ReadURL_onceToken, &__block_literal_global_470);
  return (VOSCommand *)(id)ReadURL__Command;
}

void __21__VOSCommand_ReadURL__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadURL"), kVOTEventCommandReadURL);
  v2 = (void *)ReadURL__Command;
  ReadURL__Command = v1;

}

+ (VOSCommand)ReadSelectedText
{
  if (ReadSelectedText_onceToken != -1)
    dispatch_once(&ReadSelectedText_onceToken, &__block_literal_global_473);
  return (VOSCommand *)(id)ReadSelectedText__Command;
}

void __30__VOSCommand_ReadSelectedText__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadSelectedText"), kVOTEventCommandOutputSelectedInformation);
  v2 = (void *)ReadSelectedText__Command;
  ReadSelectedText__Command = v1;

}

+ (VOSCommand)ReadCharacter
{
  if (ReadCharacter_onceToken != -1)
    dispatch_once(&ReadCharacter_onceToken, &__block_literal_global_476);
  return (VOSCommand *)(id)ReadCharacter__Command;
}

void __27__VOSCommand_ReadCharacter__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadCharacter"), kVOTEventCommandOutputCharacter);
  v2 = (void *)ReadCharacter__Command;
  ReadCharacter__Command = v1;

}

+ (VOSCommand)ReadCharacterPhonetically
{
  if (ReadCharacterPhonetically_onceToken != -1)
    dispatch_once(&ReadCharacterPhonetically_onceToken, &__block_literal_global_479);
  return (VOSCommand *)(id)ReadCharacterPhonetically__Command;
}

void __39__VOSCommand_ReadCharacterPhonetically__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadCharacterPhonetically"), kVOTEventCommandOutputCharacterPhonetically);
  v2 = (void *)ReadCharacterPhonetically__Command;
  ReadCharacterPhonetically__Command = v1;

}

+ (VOSCommand)ReadRowHeader
{
  if (ReadRowHeader_onceToken != -1)
    dispatch_once(&ReadRowHeader_onceToken, &__block_literal_global_482);
  return (VOSCommand *)(id)ReadRowHeader__Command;
}

void __27__VOSCommand_ReadRowHeader__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadRowHeader"), kVOTEventCommandOutputRowHeader);
  v2 = (void *)ReadRowHeader__Command;
  ReadRowHeader__Command = v1;

}

+ (VOSCommand)ReadRowContents
{
  if (ReadRowContents_onceToken != -1)
    dispatch_once(&ReadRowContents_onceToken, &__block_literal_global_485);
  return (VOSCommand *)(id)ReadRowContents__Command;
}

void __29__VOSCommand_ReadRowContents__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadRowContents"), kVOTEventCommandOutputContentsOfRow);
  v2 = (void *)ReadRowContents__Command;
  ReadRowContents__Command = v1;

}

+ (VOSCommand)ReadTableRowColumn
{
  if (ReadTableRowColumn_onceToken != -1)
    dispatch_once(&ReadTableRowColumn_onceToken, &__block_literal_global_488);
  return (VOSCommand *)(id)ReadTableRowColumn__Command;
}

void __32__VOSCommand_ReadTableRowColumn__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadTableRowColumn"), kVOTEventCommandOutputTableRowColumnInfo);
  v2 = (void *)ReadTableRowColumn__Command;
  ReadTableRowColumn__Command = v1;

}

+ (VOSCommand)ReadColumnHeader
{
  if (ReadColumnHeader_onceToken != -1)
    dispatch_once(&ReadColumnHeader_onceToken, &__block_literal_global_491);
  return (VOSCommand *)(id)ReadColumnHeader__Command;
}

void __30__VOSCommand_ReadColumnHeader__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadColumnHeader"), kVOTEventCommandOutputColumnHeader);
  v2 = (void *)ReadColumnHeader__Command;
  ReadColumnHeader__Command = v1;

}

+ (VOSCommand)ReadColumnContents
{
  if (ReadColumnContents_onceToken != -1)
    dispatch_once(&ReadColumnContents_onceToken, &__block_literal_global_494);
  return (VOSCommand *)(id)ReadColumnContents__Command;
}

void __32__VOSCommand_ReadColumnContents__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadColumnContents"), kVOTEventCommandOutputContentsOfColumn);
  v2 = (void *)ReadColumnContents__Command;
  ReadColumnContents__Command = v1;

}

+ (VOSCommand)ReadTableRowColumnCell
{
  if (ReadTableRowColumnCell_onceToken != -1)
    dispatch_once(&ReadTableRowColumnCell_onceToken, &__block_literal_global_497);
  return (VOSCommand *)(id)ReadTableRowColumnCell__Command;
}

void __36__VOSCommand_ReadTableRowColumnCell__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadTableRowColumnCell"), kVOTEventCommandOutputCellRowColumnInfo);
  v2 = (void *)ReadTableRowColumnCell__Command;
  ReadTableRowColumnCell__Command = v1;

}

+ (VOSCommand)ReadLineCount
{
  if (ReadLineCount_onceToken != -1)
    dispatch_once(&ReadLineCount_onceToken, &__block_literal_global_500);
  return (VOSCommand *)(id)ReadLineCount__Command;
}

void __27__VOSCommand_ReadLineCount__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ReadLineCount"), kVOTEventCommandOutputLineCount);
  v2 = (void *)ReadLineCount__Command;
  ReadLineCount__Command = v1;

}

+ (VOSCommand)ToggleSpeech
{
  if (ToggleSpeech_onceToken != -1)
    dispatch_once(&ToggleSpeech_onceToken, &__block_literal_global_503);
  return (VOSCommand *)(id)ToggleSpeech__Command;
}

void __26__VOSCommand_ToggleSpeech__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleSpeech"), kVOTEventCommandToggleSpeaking);
  v2 = (void *)ToggleSpeech__Command;
  ToggleSpeech__Command = v1;

}

+ (VOSCommand)ToggleMute
{
  if (ToggleMute_onceToken != -1)
    dispatch_once(&ToggleMute_onceToken, &__block_literal_global_506);
  return (VOSCommand *)(id)ToggleMute__Command;
}

void __24__VOSCommand_ToggleMute__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleMute"), kVOTEventCommandToggleMute);
  v2 = (void *)ToggleMute__Command;
  ToggleMute__Command = v1;

}

+ (VOSCommand)ToggleScreenCurtain
{
  if (ToggleScreenCurtain_onceToken != -1)
    dispatch_once(&ToggleScreenCurtain_onceToken, &__block_literal_global_509);
  return (VOSCommand *)(id)ToggleScreenCurtain__Command;
}

void __33__VOSCommand_ToggleScreenCurtain__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleScreenCurtain"), kVOTEventCommandToggleScreenCurtain);
  v2 = (void *)ToggleScreenCurtain__Command;
  ToggleScreenCurtain__Command = v1;

}

+ (VOSCommand)ToggleSoundCurtain
{
  if (ToggleSoundCurtain_onceToken != -1)
    dispatch_once(&ToggleSoundCurtain_onceToken, &__block_literal_global_512);
  return (VOSCommand *)(id)ToggleSoundCurtain__Command;
}

void __32__VOSCommand_ToggleSoundCurtain__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleSoundCurtain"), kVOTEventCommandToggleSoundCurtain);
  v2 = (void *)ToggleSoundCurtain__Command;
  ToggleSoundCurtain__Command = v1;

}

+ (VOSCommand)ShowItemChooser
{
  if (ShowItemChooser_onceToken != -1)
    dispatch_once(&ShowItemChooser_onceToken, &__block_literal_global_515);
  return (VOSCommand *)(id)ShowItemChooser__Command;
}

void __29__VOSCommand_ShowItemChooser__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ShowItemChooser"), kVOTEventCommandItemChooser);
  v2 = (void *)ShowItemChooser__Command;
  ShowItemChooser__Command = v1;

}

+ (VOSCommand)OpenVoiceOverSettings
{
  if (OpenVoiceOverSettings_onceToken != -1)
    dispatch_once(&OpenVoiceOverSettings_onceToken, &__block_literal_global_518);
  return (VOSCommand *)(id)OpenVoiceOverSettings__Command;
}

void __35__VOSCommand_OpenVoiceOverSettings__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("OpenVoiceOverSettings"), kVOTEventCommandOpenVoiceOverSettings);
  v2 = (void *)OpenVoiceOverSettings__Command;
  OpenVoiceOverSettings__Command = v1;

}

+ (VOSCommand)StartHelp
{
  if (StartHelp_onceToken != -1)
    dispatch_once(&StartHelp_onceToken, &__block_literal_global_521);
  return (VOSCommand *)(id)StartHelp__Command;
}

void __23__VOSCommand_StartHelp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("StartHelp"), kVOTEventCommandStartHelp);
  v2 = (void *)StartHelp__Command;
  StartHelp__Command = v1;

}

+ (VOSCommand)MagicTap
{
  if (MagicTap_onceToken != -1)
    dispatch_once(&MagicTap_onceToken, &__block_literal_global_524);
  return (VOSCommand *)(id)MagicTap__Command;
}

void __22__VOSCommand_MagicTap__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MagicTap"), kVOTEventCommandStartStopToggle);
  v2 = (void *)MagicTap__Command;
  MagicTap__Command = v1;

}

+ (VOSCommand)Escape
{
  if (Escape_onceToken != -1)
    dispatch_once(&Escape_onceToken, &__block_literal_global_527);
  return (VOSCommand *)(id)Escape__Command;
}

void __20__VOSCommand_Escape__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Escape"), kVOTEventCommandEscape);
  v2 = (void *)Escape__Command;
  Escape__Command = v1;

}

+ (VOSCommand)ScrollUp
{
  if (ScrollUp_onceToken != -1)
    dispatch_once(&ScrollUp_onceToken, &__block_literal_global_530);
  return (VOSCommand *)(id)ScrollUp__Command;
}

void __22__VOSCommand_ScrollUp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollUp"), kVOTEventCommandScrollUpPage);
  v2 = (void *)ScrollUp__Command;
  ScrollUp__Command = v1;

}

+ (VOSCommand)ScrollDown
{
  if (ScrollDown_onceToken != -1)
    dispatch_once(&ScrollDown_onceToken, &__block_literal_global_533);
  return (VOSCommand *)(id)ScrollDown__Command;
}

void __24__VOSCommand_ScrollDown__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollDown"), kVOTEventCommandScrollDownPage);
  v2 = (void *)ScrollDown__Command;
  ScrollDown__Command = v1;

}

+ (VOSCommand)ScrollLeft
{
  if (ScrollLeft_onceToken != -1)
    dispatch_once(&ScrollLeft_onceToken, &__block_literal_global_536);
  return (VOSCommand *)(id)ScrollLeft__Command;
}

void __24__VOSCommand_ScrollLeft__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollLeft"), kVOTEventCommandScrollLeftPage);
  v2 = (void *)ScrollLeft__Command;
  ScrollLeft__Command = v1;

}

+ (VOSCommand)ScrollRight
{
  if (ScrollRight_onceToken != -1)
    dispatch_once(&ScrollRight_onceToken, &__block_literal_global_539);
  return (VOSCommand *)(id)ScrollRight__Command;
}

void __25__VOSCommand_ScrollRight__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollRight"), kVOTEventCommandScrollRightPage);
  v2 = (void *)ScrollRight__Command;
  ScrollRight__Command = v1;

}

+ (VOSCommand)ScrollToTop
{
  if (ScrollToTop_onceToken != -1)
    dispatch_once(&ScrollToTop_onceToken, &__block_literal_global_542);
  return (VOSCommand *)(id)ScrollToTop__Command;
}

void __25__VOSCommand_ScrollToTop__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollToTop"), kVOTEventCommandScrollToTop);
  v2 = (void *)ScrollToTop__Command;
  ScrollToTop__Command = v1;

}

+ (VOSCommand)ScrollToBottom
{
  if (ScrollToBottom_onceToken != -1)
    dispatch_once(&ScrollToBottom_onceToken, &__block_literal_global_545);
  return (VOSCommand *)(id)ScrollToBottom__Command;
}

void __28__VOSCommand_ScrollToBottom__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ScrollToBottom"), kVOTEventCommandScrollToBottom);
  v2 = (void *)ScrollToBottom__Command;
  ScrollToBottom__Command = v1;

}

+ (VOSCommand)PreviousRotor
{
  if (PreviousRotor_onceToken != -1)
    dispatch_once(&PreviousRotor_onceToken, &__block_literal_global_548);
  return (VOSCommand *)(id)PreviousRotor__Command;
}

void __27__VOSCommand_PreviousRotor__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PreviousRotor"), kVOTEventCommandSearchRotorLeft);
  v2 = (void *)PreviousRotor__Command;
  PreviousRotor__Command = v1;

}

+ (VOSCommand)NextRotor
{
  if (NextRotor_onceToken != -1)
    dispatch_once(&NextRotor_onceToken, &__block_literal_global_551);
  return (VOSCommand *)(id)NextRotor__Command;
}

void __23__VOSCommand_NextRotor__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("NextRotor"), kVOTEventCommandSearchRotorRight);
  v2 = (void *)NextRotor__Command;
  NextRotor__Command = v1;

}

+ (VOSCommand)PreviousRotorItem
{
  if (PreviousRotorItem_onceToken != -1)
    dispatch_once(&PreviousRotorItem_onceToken, &__block_literal_global_554);
  return (VOSCommand *)(id)PreviousRotorItem__Command;
}

void __31__VOSCommand_PreviousRotorItem__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PreviousRotorItem"), kVOTEventCommandSearchRotorUp);
  v2 = (void *)PreviousRotorItem__Command;
  PreviousRotorItem__Command = v1;

}

+ (VOSCommand)NextRotorItem
{
  if (NextRotorItem_onceToken != -1)
    dispatch_once(&NextRotorItem_onceToken, &__block_literal_global_557);
  return (VOSCommand *)(id)NextRotorItem__Command;
}

void __27__VOSCommand_NextRotorItem__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("NextRotorItem"), kVOTEventCommandSearchRotorDown);
  v2 = (void *)NextRotorItem__Command;
  NextRotorItem__Command = v1;

}

+ (VOSCommand)CopySpeechToClipboard
{
  if (CopySpeechToClipboard_onceToken != -1)
    dispatch_once(&CopySpeechToClipboard_onceToken, &__block_literal_global_560);
  return (VOSCommand *)(id)CopySpeechToClipboard__Command;
}

void __35__VOSCommand_CopySpeechToClipboard__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("CopySpeechToClipboard"), kVOTEventCommandCopySpeechToClipboard);
  v2 = (void *)CopySpeechToClipboard__Command;
  CopySpeechToClipboard__Command = v1;

}

+ (VOSCommand)ToggleCaptionPanel
{
  if (ToggleCaptionPanel_onceToken != -1)
    dispatch_once(&ToggleCaptionPanel_onceToken, &__block_literal_global_563);
  return (VOSCommand *)(id)ToggleCaptionPanel__Command;
}

void __32__VOSCommand_ToggleCaptionPanel__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleCaptionPanel"), kVOTEventCommandToggleCaptionPanel);
  v2 = (void *)ToggleCaptionPanel__Command;
  ToggleCaptionPanel__Command = v1;

}

+ (VOSCommand)LabelElement
{
  if (LabelElement_onceToken != -1)
    dispatch_once(&LabelElement_onceToken, &__block_literal_global_566);
  return (VOSCommand *)(id)LabelElement__Command;
}

void __26__VOSCommand_LabelElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("LabelElement"), kVOTEventCommandLabelElement);
  v2 = (void *)LabelElement__Command;
  LabelElement__Command = v1;

}

+ (VOSCommand)DescribeImage
{
  if (DescribeImage_onceToken != -1)
    dispatch_once(&DescribeImage_onceToken, &__block_literal_global_569);
  return (VOSCommand *)(id)DescribeImage__Command;
}

void __27__VOSCommand_DescribeImage__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("DescribeImage"), kVOTEventCommandDescribeImage);
  v2 = (void *)DescribeImage__Command;
  DescribeImage__Command = v1;

}

+ (VOSCommand)LaunchPeopleDetection
{
  if (LaunchPeopleDetection_onceToken != -1)
    dispatch_once(&LaunchPeopleDetection_onceToken, &__block_literal_global_572);
  return (VOSCommand *)(id)LaunchPeopleDetection__Command;
}

void __35__VOSCommand_LaunchPeopleDetection__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("LaunchPeopleDetection"), kVOTEventCommandLaunchDetectionMode);
  v2 = (void *)LaunchPeopleDetection__Command;
  LaunchPeopleDetection__Command = v1;

}

+ (VOSCommand)MonitorElement
{
  if (MonitorElement_onceToken != -1)
    dispatch_once(&MonitorElement_onceToken, &__block_literal_global_575);
  return (VOSCommand *)(id)MonitorElement__Command;
}

void __28__VOSCommand_MonitorElement__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MonitorElement"), kVOTEventCommandMonitorElement);
  v2 = (void *)MonitorElement__Command;
  MonitorElement__Command = v1;

}

+ (VOSCommand)ActivateBrailleScreenInput
{
  if (ActivateBrailleScreenInput_onceToken != -1)
    dispatch_once(&ActivateBrailleScreenInput_onceToken, &__block_literal_global_578);
  return (VOSCommand *)(id)ActivateBrailleScreenInput__Command;
}

void __40__VOSCommand_ActivateBrailleScreenInput__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateBrailleScreenInput"), kVOTEventCommandActivateBrailleScreenInput);
  v2 = (void *)ActivateBrailleScreenInput__Command;
  ActivateBrailleScreenInput__Command = v1;

}

+ (VOSCommand)ActivateBrailleScreenInputCommand
{
  if (ActivateBrailleScreenInputCommand_onceToken != -1)
    dispatch_once(&ActivateBrailleScreenInputCommand_onceToken, &__block_literal_global_581);
  return (VOSCommand *)(id)ActivateBrailleScreenInputCommand__Command;
}

void __47__VOSCommand_ActivateBrailleScreenInputCommand__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateBrailleScreenInputCommand"), kVOTEventCommandActivateBrailleScreenInputCommand);
  v2 = (void *)ActivateBrailleScreenInputCommand__Command;
  ActivateBrailleScreenInputCommand__Command = v1;

}

+ (VOSCommand)ToggleSingleLetterQuickNav
{
  if (ToggleSingleLetterQuickNav_onceToken != -1)
    dispatch_once(&ToggleSingleLetterQuickNav_onceToken, &__block_literal_global_584);
  return (VOSCommand *)(id)ToggleSingleLetterQuickNav__Command;
}

void __40__VOSCommand_ToggleSingleLetterQuickNav__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleSingleLetterQuickNav"), kVOTEventCommandToggleSingleLetterQuickNav);
  v2 = (void *)ToggleSingleLetterQuickNav__Command;
  ToggleSingleLetterQuickNav__Command = v1;

}

+ (VOSCommand)ToggleQuickNav
{
  if (ToggleQuickNav_onceToken != -1)
    dispatch_once(&ToggleQuickNav_onceToken, &__block_literal_global_587);
  return (VOSCommand *)(id)ToggleQuickNav__Command;
}

void __28__VOSCommand_ToggleQuickNav__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleQuickNav"), kVOTEventCommandToggleQuickNav);
  v2 = (void *)ToggleQuickNav__Command;
  ToggleQuickNav__Command = v1;

}

+ (VOSCommand)ToggleLockModifierKeys
{
  if (ToggleLockModifierKeys_onceToken != -1)
    dispatch_once(&ToggleLockModifierKeys_onceToken, &__block_literal_global_590);
  return (VOSCommand *)(id)ToggleLockModifierKeys__Command;
}

void __36__VOSCommand_ToggleLockModifierKeys__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleLockModifierKeys"), kVOTEventCommandLockVOKeyboardKeys);
  v2 = (void *)ToggleLockModifierKeys__Command;
  ToggleLockModifierKeys__Command = v1;

}

+ (VOSCommand)ChangeAudioDuckingMode
{
  if (ChangeAudioDuckingMode_onceToken != -1)
    dispatch_once(&ChangeAudioDuckingMode_onceToken, &__block_literal_global_593);
  return (VOSCommand *)(id)ChangeAudioDuckingMode__Command;
}

void __36__VOSCommand_ChangeAudioDuckingMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ChangeAudioDuckingMode"), kVOTEventCommandChangeAudioDuckingMode);
  v2 = (void *)ChangeAudioDuckingMode__Command;
  ChangeAudioDuckingMode__Command = v1;

}

+ (VOSCommand)ToggleNavigationStyle
{
  if (ToggleNavigationStyle_onceToken != -1)
    dispatch_once(&ToggleNavigationStyle_onceToken, &__block_literal_global_596);
  return (VOSCommand *)(id)ToggleNavigationStyle__Command;
}

void __35__VOSCommand_ToggleNavigationStyle__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleNavigationStyle"), kVOTEventCommandToggleNavigationStyle);
  v2 = (void *)ToggleNavigationStyle__Command;
  ToggleNavigationStyle__Command = v1;

}

+ (VOSCommand)ToggleSyncNativeAndExploreFocus
{
  if (ToggleSyncNativeAndExploreFocus_onceToken != -1)
    dispatch_once(&ToggleSyncNativeAndExploreFocus_onceToken, &__block_literal_global_599);
  return (VOSCommand *)(id)ToggleSyncNativeAndExploreFocus__Command;
}

void __45__VOSCommand_ToggleSyncNativeAndExploreFocus__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleSyncNativeAndExploreFocus"), kVOTEventCommandToggleSyncNativeAndExploreFocus);
  v2 = (void *)ToggleSyncNativeAndExploreFocus__Command;
  ToggleSyncNativeAndExploreFocus__Command = v1;

}

+ (VOSCommand)ToggleAutomaticAccessibility
{
  if (ToggleAutomaticAccessibility_onceToken != -1)
    dispatch_once(&ToggleAutomaticAccessibility_onceToken, &__block_literal_global_602);
  return (VOSCommand *)(id)ToggleAutomaticAccessibility__Command;
}

void __42__VOSCommand_ToggleAutomaticAccessibility__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleAutomaticAccessibility"), kVOTEventCommandToggleAutomaticAccessibility);
  v2 = (void *)ToggleAutomaticAccessibility__Command;
  ToggleAutomaticAccessibility__Command = v1;

}

+ (VOSCommand)VolumeUp
{
  if (VolumeUp_onceToken != -1)
    dispatch_once(&VolumeUp_onceToken, &__block_literal_global_605);
  return (VOSCommand *)(id)VolumeUp__Command;
}

void __22__VOSCommand_VolumeUp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("VolumeUp"), kVOTEventCommandVolumeUpButtonPress);
  v2 = (void *)VolumeUp__Command;
  VolumeUp__Command = v1;

}

+ (VOSCommand)VolumeDown
{
  if (VolumeDown_onceToken != -1)
    dispatch_once(&VolumeDown_onceToken, &__block_literal_global_608);
  return (VOSCommand *)(id)VolumeDown__Command;
}

void __24__VOSCommand_VolumeDown__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("VolumeDown"), kVOTEventCommandVolumeDownButtonPress);
  v2 = (void *)VolumeDown__Command;
  VolumeDown__Command = v1;

}

+ (VOSCommand)ToggleLiveRegions
{
  if (ToggleLiveRegions_onceToken != -1)
    dispatch_once(&ToggleLiveRegions_onceToken, &__block_literal_global_611);
  return (VOSCommand *)(id)ToggleLiveRegions__Command;
}

void __31__VOSCommand_ToggleLiveRegions__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleLiveRegions"), kVOTEventCommandToggleLiveRegions);
  v2 = (void *)ToggleLiveRegions__Command;
  ToggleLiveRegions__Command = v1;

}

+ (VOSCommand)ShowNotificationCenter
{
  if (ShowNotificationCenter_onceToken != -1)
    dispatch_once(&ShowNotificationCenter_onceToken, &__block_literal_global_614);
  return (VOSCommand *)(id)ShowNotificationCenter__Command;
}

void __36__VOSCommand_ShowNotificationCenter__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ShowNotificationCenter"), kVOTEventCommandSystemShowNotificationCenter);
  v2 = (void *)ShowNotificationCenter__Command;
  ShowNotificationCenter__Command = v1;

}

+ (VOSCommand)ShowControlCenter
{
  if (ShowControlCenter_onceToken != -1)
    dispatch_once(&ShowControlCenter_onceToken, &__block_literal_global_617);
  return (VOSCommand *)(id)ShowControlCenter__Command;
}

void __31__VOSCommand_ShowControlCenter__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ShowControlCenter"), kVOTEventCommandSystemShowControlCenter);
  v2 = (void *)ShowControlCenter__Command;
  ShowControlCenter__Command = v1;

}

+ (VOSCommand)ActivateSpeakScreen
{
  if (ActivateSpeakScreen_onceToken != -1)
    dispatch_once(&ActivateSpeakScreen_onceToken, &__block_literal_global_620);
  return (VOSCommand *)(id)ActivateSpeakScreen__Command;
}

void __33__VOSCommand_ActivateSpeakScreen__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateSpeakScreen"), kVOTEventCommandSystemActivateSpeakScreen);
  v2 = (void *)ActivateSpeakScreen__Command;
  ActivateSpeakScreen__Command = v1;

}

+ (VOSCommand)ActivateHomeButton
{
  if (ActivateHomeButton_onceToken != -1)
    dispatch_once(&ActivateHomeButton_onceToken, &__block_literal_global_623);
  return (VOSCommand *)(id)ActivateHomeButton__Command;
}

void __32__VOSCommand_ActivateHomeButton__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateHomeButton"), kVOTEventCommandHomeButtonPress);
  v2 = (void *)ActivateHomeButton__Command;
  ActivateHomeButton__Command = v1;

}

+ (VOSCommand)ToggleDock
{
  if (ToggleDock_onceToken != -1)
    dispatch_once(&ToggleDock_onceToken, &__block_literal_global_626);
  return (VOSCommand *)(id)ToggleDock__Command;
}

void __24__VOSCommand_ToggleDock__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleDock"), kVOTEventCommandSystemToggleDock);
  v2 = (void *)ToggleDock__Command;
  ToggleDock__Command = v1;

}

+ (VOSCommand)ToggleAppSwitcher
{
  if (ToggleAppSwitcher_onceToken != -1)
    dispatch_once(&ToggleAppSwitcher_onceToken, &__block_literal_global_629);
  return (VOSCommand *)(id)ToggleAppSwitcher__Command;
}

void __31__VOSCommand_ToggleAppSwitcher__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleAppSwitcher"), kVOTEventCommandSystemToggleAppSwitcher);
  v2 = (void *)ToggleAppSwitcher__Command;
  ToggleAppSwitcher__Command = v1;

}

+ (VOSCommand)ActivateLockButton
{
  if (ActivateLockButton_onceToken != -1)
    dispatch_once(&ActivateLockButton_onceToken, &__block_literal_global_632);
  return (VOSCommand *)(id)ActivateLockButton__Command;
}

void __32__VOSCommand_ActivateLockButton__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateLockButton"), kVOTEventCommandSystemActivateLockButton);
  v2 = (void *)ActivateLockButton__Command;
  ActivateLockButton__Command = v1;

}

+ (VOSCommand)ShowSpotlight
{
  if (ShowSpotlight_onceToken != -1)
    dispatch_once(&ShowSpotlight_onceToken, &__block_literal_global_635);
  return (VOSCommand *)(id)ShowSpotlight__Command;
}

void __27__VOSCommand_ShowSpotlight__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ShowSpotlight"), kVOTEventCommandSystemShowSpotlight);
  v2 = (void *)ShowSpotlight__Command;
  ShowSpotlight__Command = v1;

}

+ (VOSCommand)ActivateAccessibilityShortcut
{
  if (ActivateAccessibilityShortcut_onceToken != -1)
    dispatch_once(&ActivateAccessibilityShortcut_onceToken, &__block_literal_global_638);
  return (VOSCommand *)(id)ActivateAccessibilityShortcut__Command;
}

void __43__VOSCommand_ActivateAccessibilityShortcut__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ActivateAccessibilityShortcut"), kVOTEventCommandSystemActivateAccessibilityShortcut);
  v2 = (void *)ActivateAccessibilityShortcut__Command;
  ActivateAccessibilityShortcut__Command = v1;

}

+ (VOSCommand)ToggleReachability
{
  if (ToggleReachability_onceToken != -1)
    dispatch_once(&ToggleReachability_onceToken, &__block_literal_global_641);
  return (VOSCommand *)(id)ToggleReachability__Command;
}

void __32__VOSCommand_ToggleReachability__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleReachability"), kVOTEventCommandSystemToggleReachability);
  v2 = (void *)ToggleReachability__Command;
  ToggleReachability__Command = v1;

}

+ (VOSCommand)TakeScreenshot
{
  if (TakeScreenshot_onceToken != -1)
    dispatch_once(&TakeScreenshot_onceToken, &__block_literal_global_644);
  return (VOSCommand *)(id)TakeScreenshot__Command;
}

void __28__VOSCommand_TakeScreenshot__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("TakeScreenshot"), kVOTEventCommandSystemTakeScreenshot);
  v2 = (void *)TakeScreenshot__Command;
  TakeScreenshot__Command = v1;

}

+ (VOSCommand)SwitchToPreviousApp
{
  if (SwitchToPreviousApp_onceToken != -1)
    dispatch_once(&SwitchToPreviousApp_onceToken, &__block_literal_global_647);
  return (VOSCommand *)(id)SwitchToPreviousApp__Command;
}

void __33__VOSCommand_SwitchToPreviousApp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("SwitchToPreviousApp"), kVOTEventCommandSystemSwitchToPreviousApp);
  v2 = (void *)SwitchToPreviousApp__Command;
  SwitchToPreviousApp__Command = v1;

}

+ (VOSCommand)SwitchToNextApp
{
  if (SwitchToNextApp_onceToken != -1)
    dispatch_once(&SwitchToNextApp_onceToken, &__block_literal_global_650);
  return (VOSCommand *)(id)SwitchToNextApp__Command;
}

void __29__VOSCommand_SwitchToNextApp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("SwitchToNextApp"), kVOTEventCommandSystemSwitchToNextApp);
  v2 = (void *)SwitchToNextApp__Command;
  SwitchToNextApp__Command = v1;

}

+ (VOSCommand)ToggleQuickNote
{
  if (ToggleQuickNote_onceToken != -1)
    dispatch_once(&ToggleQuickNote_onceToken, &__block_literal_global_653);
  return (VOSCommand *)(id)ToggleQuickNote__Command;
}

void __29__VOSCommand_ToggleQuickNote__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleQuickNote"), kVOTEventCommandSystemToggleQuickNote);
  v2 = (void *)ToggleQuickNote__Command;
  ToggleQuickNote__Command = v1;

}

+ (VOSCommand)PreviousHandwritingCharacterMode
{
  if (PreviousHandwritingCharacterMode_onceToken != -1)
    dispatch_once(&PreviousHandwritingCharacterMode_onceToken, &__block_literal_global_656);
  return (VOSCommand *)(id)PreviousHandwritingCharacterMode__Command;
}

void __46__VOSCommand_PreviousHandwritingCharacterMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("PreviousHandwritingCharacterMode"), kVOTEventCommandHandwritingPreviousActiveCharacterSet);
  v2 = (void *)PreviousHandwritingCharacterMode__Command;
  PreviousHandwritingCharacterMode__Command = v1;

}

+ (VOSCommand)NextHandwritingCharacterMode
{
  if (NextHandwritingCharacterMode_onceToken != -1)
    dispatch_once(&NextHandwritingCharacterMode_onceToken, &__block_literal_global_659);
  return (VOSCommand *)(id)NextHandwritingCharacterMode__Command;
}

void __42__VOSCommand_NextHandwritingCharacterMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("NextHandwritingCharacterMode"), kVOTEventCommandHandwritingNextActiveCharacterSet);
  v2 = (void *)NextHandwritingCharacterMode__Command;
  NextHandwritingCharacterMode__Command = v1;

}

+ (VOSCommand)AnnounceHandwritingCharacterMode
{
  if (AnnounceHandwritingCharacterMode_onceToken != -1)
    dispatch_once(&AnnounceHandwritingCharacterMode_onceToken, &__block_literal_global_662);
  return (VOSCommand *)(id)AnnounceHandwritingCharacterMode__Command;
}

void __46__VOSCommand_AnnounceHandwritingCharacterMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("AnnounceHandwritingCharacterMode"), kVOTEventCommandHandwritingAnnounceActiveCharacterSet);
  v2 = (void *)AnnounceHandwritingCharacterMode__Command;
  AnnounceHandwritingCharacterMode__Command = v1;

}

+ (VOSCommand)BSIPreviousBrailleMode
{
  if (BSIPreviousBrailleMode_onceToken != -1)
    dispatch_once(&BSIPreviousBrailleMode_onceToken, &__block_literal_global_665);
  return (VOSCommand *)(id)BSIPreviousBrailleMode__Command;
}

void __36__VOSCommand_BSIPreviousBrailleMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIPreviousBrailleMode"), kVOTEventCommandBSIPreviousBrailleMode);
  v2 = (void *)BSIPreviousBrailleMode__Command;
  BSIPreviousBrailleMode__Command = v1;

}

+ (VOSCommand)BSINextBrailleMode
{
  if (BSINextBrailleMode_onceToken != -1)
    dispatch_once(&BSINextBrailleMode_onceToken, &__block_literal_global_668);
  return (VOSCommand *)(id)BSINextBrailleMode__Command;
}

void __32__VOSCommand_BSINextBrailleMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSINextBrailleMode"), kVOTEventCommandBSINextBrailleMode);
  v2 = (void *)BSINextBrailleMode__Command;
  BSINextBrailleMode__Command = v1;

}

+ (VOSCommand)BSIPreviousUsage
{
  if (BSIPreviousUsage_onceToken != -1)
    dispatch_once(&BSIPreviousUsage_onceToken, &__block_literal_global_671);
  return (VOSCommand *)(id)BSIPreviousUsage__Command;
}

void __30__VOSCommand_BSIPreviousUsage__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIPreviousUsage"), kVOTEventCommandBSIPreviousUsage);
  v2 = (void *)BSIPreviousUsage__Command;
  BSIPreviousUsage__Command = v1;

}

+ (VOSCommand)BSINextUsage
{
  if (BSINextUsage_onceToken != -1)
    dispatch_once(&BSINextUsage_onceToken, &__block_literal_global_674);
  return (VOSCommand *)(id)BSINextUsage__Command;
}

void __26__VOSCommand_BSINextUsage__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSINextUsage"), kVOTEventCommandBSINextUsage);
  v2 = (void *)BSINextUsage__Command;
  BSINextUsage__Command = v1;

}

+ (VOSCommand)BSITranslateImmediately
{
  if (BSITranslateImmediately_onceToken != -1)
    dispatch_once(&BSITranslateImmediately_onceToken, &__block_literal_global_677);
  return (VOSCommand *)(id)BSITranslateImmediately__Command;
}

void __37__VOSCommand_BSITranslateImmediately__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSITranslateImmediately"), kVOTEventCommandBSITranslateImmediately);
  v2 = (void *)BSITranslateImmediately__Command;
  BSITranslateImmediately__Command = v1;

}

+ (VOSCommand)BSIOrientationLock
{
  if (BSIOrientationLock_onceToken != -1)
    dispatch_once(&BSIOrientationLock_onceToken, &__block_literal_global_680);
  return (VOSCommand *)(id)BSIOrientationLock__Command;
}

void __32__VOSCommand_BSIOrientationLock__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIOrientationLock"), kVOTEventCommandBSIOrientationLock);
  v2 = (void *)BSIOrientationLock__Command;
  BSIOrientationLock__Command = v1;

}

+ (VOSCommand)BSIQuickAction
{
  if (BSIQuickAction_onceToken != -1)
    dispatch_once(&BSIQuickAction_onceToken, &__block_literal_global_683);
  return (VOSCommand *)(id)BSIQuickAction__Command;
}

void __28__VOSCommand_BSIQuickAction__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIQuickAction"), kVOTEventCommandBSIQuickAction);
  v2 = (void *)BSIQuickAction__Command;
  BSIQuickAction__Command = v1;

}

+ (VOSCommand)BSIExit
{
  if (BSIExit_onceToken != -1)
    dispatch_once(&BSIExit_onceToken, &__block_literal_global_686);
  return (VOSCommand *)(id)BSIExit__Command;
}

void __21__VOSCommand_BSIExit__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIExit"), kVOTEventCommandBSIExit);
  v2 = (void *)BSIExit__Command;
  BSIExit__Command = v1;

}

+ (VOSCommand)BSIPreviousRotor
{
  if (BSIPreviousRotor_onceToken != -1)
    dispatch_once(&BSIPreviousRotor_onceToken, &__block_literal_global_689);
  return (VOSCommand *)(id)BSIPreviousRotor__Command;
}

void __30__VOSCommand_BSIPreviousRotor__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIPreviousRotor"), kVOTEventCommandBSIPreviousRotor);
  v2 = (void *)BSIPreviousRotor__Command;
  BSIPreviousRotor__Command = v1;

}

+ (VOSCommand)BSINextRotor
{
  if (BSINextRotor_onceToken != -1)
    dispatch_once(&BSINextRotor_onceToken, &__block_literal_global_692);
  return (VOSCommand *)(id)BSINextRotor__Command;
}

void __26__VOSCommand_BSINextRotor__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSINextRotor"), kVOTEventCommandBSINextRotor);
  v2 = (void *)BSINextRotor__Command;
  BSINextRotor__Command = v1;

}

+ (VOSCommand)BSIEscape
{
  if (BSIEscape_onceToken != -1)
    dispatch_once(&BSIEscape_onceToken, &__block_literal_global_695);
  return (VOSCommand *)(id)BSIEscape__Command;
}

void __23__VOSCommand_BSIEscape__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIEscape"), kVOTEventCommandBSIEscape);
  v2 = (void *)BSIEscape__Command;
  BSIEscape__Command = v1;

}

+ (VOSCommand)BSIPreviousTextSegment
{
  if (BSIPreviousTextSegment_onceToken != -1)
    dispatch_once(&BSIPreviousTextSegment_onceToken, &__block_literal_global_698);
  return (VOSCommand *)(id)BSIPreviousTextSegment__Command;
}

void __36__VOSCommand_BSIPreviousTextSegment__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIPreviousTextSegment"), kVOTEventCommandPreviousTextSegment);
  v2 = (void *)BSIPreviousTextSegment__Command;
  BSIPreviousTextSegment__Command = v1;

}

+ (VOSCommand)BSINextTextSegment
{
  if (BSINextTextSegment_onceToken != -1)
    dispatch_once(&BSINextTextSegment_onceToken, &__block_literal_global_701);
  return (VOSCommand *)(id)BSINextTextSegment__Command;
}

void __32__VOSCommand_BSINextTextSegment__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSINextTextSegment"), kVOTEventCommandNextTextSegment);
  v2 = (void *)BSINextTextSegment__Command;
  BSINextTextSegment__Command = v1;

}

+ (VOSCommand)BSISelectPreviousTextSegment
{
  if (BSISelectPreviousTextSegment_onceToken != -1)
    dispatch_once(&BSISelectPreviousTextSegment_onceToken, &__block_literal_global_704);
  return (VOSCommand *)(id)BSISelectPreviousTextSegment__Command;
}

void __42__VOSCommand_BSISelectPreviousTextSegment__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSISelectPreviousTextSegment"), kVOTEventCommandSelectLeft);
  v2 = (void *)BSISelectPreviousTextSegment__Command;
  BSISelectPreviousTextSegment__Command = v1;

}

+ (VOSCommand)BSISelectNextTextSegment
{
  if (BSISelectNextTextSegment_onceToken != -1)
    dispatch_once(&BSISelectNextTextSegment_onceToken, &__block_literal_global_707);
  return (VOSCommand *)(id)BSISelectNextTextSegment__Command;
}

void __38__VOSCommand_BSISelectNextTextSegment__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSISelectNextTextSegment"), kVOTEventCommandSelectRight);
  v2 = (void *)BSISelectNextTextSegment__Command;
  BSISelectNextTextSegment__Command = v1;

}

+ (VOSCommand)BSIPreviousTextSegmentType
{
  if (BSIPreviousTextSegmentType_onceToken != -1)
    dispatch_once(&BSIPreviousTextSegmentType_onceToken, &__block_literal_global_710);
  return (VOSCommand *)(id)BSIPreviousTextSegmentType__Command;
}

void __40__VOSCommand_BSIPreviousTextSegmentType__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSIPreviousTextSegmentType"), kVOTEventCommandPreviousTextSegmentType);
  v2 = (void *)BSIPreviousTextSegmentType__Command;
  BSIPreviousTextSegmentType__Command = v1;

}

+ (VOSCommand)BSINextTextSegmentType
{
  if (BSINextTextSegmentType_onceToken != -1)
    dispatch_once(&BSINextTextSegmentType_onceToken, &__block_literal_global_713);
  return (VOSCommand *)(id)BSINextTextSegmentType__Command;
}

void __36__VOSCommand_BSINextTextSegmentType__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BSINextTextSegmentType"), kVOTEventCommandNextTextSegmentType);
  v2 = (void *)BSINextTextSegmentType__Command;
  BSINextTextSegmentType__Command = v1;

}

+ (VOSCommand)BraillePanLeft
{
  if (BraillePanLeft_onceToken != -1)
    dispatch_once(&BraillePanLeft_onceToken, &__block_literal_global_716);
  return (VOSCommand *)(id)BraillePanLeft__Command;
}

void __28__VOSCommand_BraillePanLeft__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BraillePanLeft"), kVOTEventCommandBraillePanLeft);
  v2 = (void *)BraillePanLeft__Command;
  BraillePanLeft__Command = v1;

}

+ (VOSCommand)BraillePanRight
{
  if (BraillePanRight_onceToken != -1)
    dispatch_once(&BraillePanRight_onceToken, &__block_literal_global_719);
  return (VOSCommand *)(id)BraillePanRight__Command;
}

void __29__VOSCommand_BraillePanRight__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BraillePanRight"), kVOTEventCommandBraillePanRight);
  v2 = (void *)BraillePanRight__Command;
  BraillePanRight__Command = v1;

}

+ (VOSCommand)BrailleNextInputTable
{
  if (BrailleNextInputTable_onceToken != -1)
    dispatch_once(&BrailleNextInputTable_onceToken, &__block_literal_global_722);
  return (VOSCommand *)(id)BrailleNextInputTable__Command;
}

void __35__VOSCommand_BrailleNextInputTable__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleNextInputTable"), kVOTEventCommandBrailleNextInputTable);
  v2 = (void *)BrailleNextInputTable__Command;
  BrailleNextInputTable__Command = v1;

}

+ (VOSCommand)BrailleNextOutputTable
{
  if (BrailleNextOutputTable_onceToken != -1)
    dispatch_once(&BrailleNextOutputTable_onceToken, &__block_literal_global_725);
  return (VOSCommand *)(id)BrailleNextOutputTable__Command;
}

void __36__VOSCommand_BrailleNextOutputTable__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleNextOutputTable"), kVOTEventCommandBrailleNextOutputTable);
  v2 = (void *)BrailleNextOutputTable__Command;
  BrailleNextOutputTable__Command = v1;

}

+ (VOSCommand)BrailleAnnouncementMode
{
  if (BrailleAnnouncementMode_onceToken != -1)
    dispatch_once(&BrailleAnnouncementMode_onceToken, &__block_literal_global_728);
  return (VOSCommand *)(id)BrailleAnnouncementMode__Command;
}

void __37__VOSCommand_BrailleAnnouncementMode__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleAnnouncementMode"), kVOTEventCommandBrailleAnnouncementModeOn);
  v2 = (void *)BrailleAnnouncementMode__Command;
  BrailleAnnouncementMode__Command = v1;

}

+ (VOSCommand)BrailleTranslate
{
  if (BrailleTranslate_onceToken != -1)
    dispatch_once(&BrailleTranslate_onceToken, &__block_literal_global_731);
  return (VOSCommand *)(id)BrailleTranslate__Command;
}

void __30__VOSCommand_BrailleTranslate__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleTranslate"), kVOTEventCommandBrailleTranslate);
  v2 = (void *)BrailleTranslate__Command;
  BrailleTranslate__Command = v1;

}

+ (VOSCommand)BrailleToggleWordWrap
{
  if (BrailleToggleWordWrap_onceToken != -1)
    dispatch_once(&BrailleToggleWordWrap_onceToken, &__block_literal_global_734);
  return (VOSCommand *)(id)BrailleToggleWordWrap__Command;
}

void __35__VOSCommand_BrailleToggleWordWrap__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleToggleWordWrap"), kVOTEventCommandBrailleToggleWordWrap);
  v2 = (void *)BrailleToggleWordWrap__Command;
  BrailleToggleWordWrap__Command = v1;

}

+ (VOSCommand)BrailleTranslateToClipboard
{
  if (BrailleTranslateToClipboard_onceToken != -1)
    dispatch_once(&BrailleTranslateToClipboard_onceToken, &__block_literal_global_737);
  return (VOSCommand *)(id)BrailleTranslateToClipboard__Command;
}

void __41__VOSCommand_BrailleTranslateToClipboard__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleTranslateToClipboard"), kVOTEventCommandBrailleTranslateBrailleToClipboard);
  v2 = (void *)BrailleTranslateToClipboard__Command;
  BrailleTranslateToClipboard__Command = v1;

}

+ (VOSCommand)BrailleEnableAutoAdvance
{
  if (BrailleEnableAutoAdvance_onceToken != -1)
    dispatch_once(&BrailleEnableAutoAdvance_onceToken, &__block_literal_global_740);
  return (VOSCommand *)(id)BrailleEnableAutoAdvance__Command;
}

void __38__VOSCommand_BrailleEnableAutoAdvance__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleEnableAutoAdvance"), kVOTEventCommandBrailleEnableAutoAdvance);
  v2 = (void *)BrailleEnableAutoAdvance__Command;
  BrailleEnableAutoAdvance__Command = v1;

}

+ (VOSCommand)BrailleIncreaseAutoAdvance
{
  if (BrailleIncreaseAutoAdvance_onceToken != -1)
    dispatch_once(&BrailleIncreaseAutoAdvance_onceToken, &__block_literal_global_743);
  return (VOSCommand *)(id)BrailleIncreaseAutoAdvance__Command;
}

void __40__VOSCommand_BrailleIncreaseAutoAdvance__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleIncreaseAutoAdvance"), kVOTEventCommandBrailleIncreaseAutoAdvanceSpeed);
  v2 = (void *)BrailleIncreaseAutoAdvance__Command;
  BrailleIncreaseAutoAdvance__Command = v1;

}

+ (VOSCommand)BrailleDecreaseAutoAdvance
{
  if (BrailleDecreaseAutoAdvance_onceToken != -1)
    dispatch_once(&BrailleDecreaseAutoAdvance_onceToken, &__block_literal_global_746);
  return (VOSCommand *)(id)BrailleDecreaseAutoAdvance__Command;
}

void __40__VOSCommand_BrailleDecreaseAutoAdvance__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleDecreaseAutoAdvance"), kVOTEventCommandBrailleDecreaseAutoAdvanceSpeed);
  v2 = (void *)BrailleDecreaseAutoAdvance__Command;
  BrailleDecreaseAutoAdvance__Command = v1;

}

+ (VOSCommand)BrailleReconnectBrailleDisplays
{
  if (BrailleReconnectBrailleDisplays_onceToken != -1)
    dispatch_once(&BrailleReconnectBrailleDisplays_onceToken, &__block_literal_global_749);
  return (VOSCommand *)(id)BrailleReconnectBrailleDisplays__Command;
}

void __45__VOSCommand_BrailleReconnectBrailleDisplays__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("BrailleReconnectBrailleDisplays"), kVOTEventCommandReconnectBrailleDisplays);
  v2 = (void *)BrailleReconnectBrailleDisplays__Command;
  BrailleReconnectBrailleDisplays__Command = v1;

}

+ (VOSCommand)GesturedTextInputInsertSpace
{
  if (GesturedTextInputInsertSpace_onceToken != -1)
    dispatch_once(&GesturedTextInputInsertSpace_onceToken, &__block_literal_global_752);
  return (VOSCommand *)(id)GesturedTextInputInsertSpace__Command;
}

void __42__VOSCommand_GesturedTextInputInsertSpace__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputInsertSpace"), kVOTEventCommandGesturedTextInputInsertSpace);
  v2 = (void *)GesturedTextInputInsertSpace__Command;
  GesturedTextInputInsertSpace__Command = v1;

}

+ (VOSCommand)GesturedTextInputBackspace
{
  if (GesturedTextInputBackspace_onceToken != -1)
    dispatch_once(&GesturedTextInputBackspace_onceToken, &__block_literal_global_755);
  return (VOSCommand *)(id)GesturedTextInputBackspace__Command;
}

void __40__VOSCommand_GesturedTextInputBackspace__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputBackspace"), kVOTEventCommandGesturedTextInputBackspace);
  v2 = (void *)GesturedTextInputBackspace__Command;
  GesturedTextInputBackspace__Command = v1;

}

+ (VOSCommand)GesturedTextInputDeleteWord
{
  if (GesturedTextInputDeleteWord_onceToken != -1)
    dispatch_once(&GesturedTextInputDeleteWord_onceToken, &__block_literal_global_758);
  return (VOSCommand *)(id)GesturedTextInputDeleteWord__Command;
}

void __41__VOSCommand_GesturedTextInputDeleteWord__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputDeleteWord"), kVOTEventCommandGesturedTextInputDeleteWord);
  v2 = (void *)GesturedTextInputDeleteWord__Command;
  GesturedTextInputDeleteWord__Command = v1;

}

+ (VOSCommand)GesturedTextInputPerformReturnEquivalent
{
  if (GesturedTextInputPerformReturnEquivalent_onceToken != -1)
    dispatch_once(&GesturedTextInputPerformReturnEquivalent_onceToken, &__block_literal_global_761);
  return (VOSCommand *)(id)GesturedTextInputPerformReturnEquivalent__Command;
}

void __54__VOSCommand_GesturedTextInputPerformReturnEquivalent__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputPerformReturnEquivalent"), kVOTEventCommandGesturedTextInputPerformReturnEquivalent);
  v2 = (void *)GesturedTextInputPerformReturnEquivalent__Command;
  GesturedTextInputPerformReturnEquivalent__Command = v1;

}

+ (VOSCommand)GesturedTextInputPreviousSuggestion
{
  if (GesturedTextInputPreviousSuggestion_onceToken != -1)
    dispatch_once(&GesturedTextInputPreviousSuggestion_onceToken, &__block_literal_global_764);
  return (VOSCommand *)(id)GesturedTextInputPreviousSuggestion__Command;
}

void __49__VOSCommand_GesturedTextInputPreviousSuggestion__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputPreviousSuggestion"), kVOTEventCommandGesturedTextInputPreviousSuggestion);
  v2 = (void *)GesturedTextInputPreviousSuggestion__Command;
  GesturedTextInputPreviousSuggestion__Command = v1;

}

+ (VOSCommand)GesturedTextInputNextSuggestion
{
  if (GesturedTextInputNextSuggestion_onceToken != -1)
    dispatch_once(&GesturedTextInputNextSuggestion_onceToken, &__block_literal_global_767);
  return (VOSCommand *)(id)GesturedTextInputNextSuggestion__Command;
}

void __45__VOSCommand_GesturedTextInputNextSuggestion__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputNextSuggestion"), kVOTEventCommandGesturedTextInputNextSuggestion);
  v2 = (void *)GesturedTextInputNextSuggestion__Command;
  GesturedTextInputNextSuggestion__Command = v1;

}

+ (VOSCommand)GesturedTextInputLaunchApp
{
  if (GesturedTextInputLaunchApp_onceToken != -1)
    dispatch_once(&GesturedTextInputLaunchApp_onceToken, &__block_literal_global_770);
  return (VOSCommand *)(id)GesturedTextInputLaunchApp__Command;
}

void __40__VOSCommand_GesturedTextInputLaunchApp__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputLaunchApp"), kVOTEventCommandGesturedTextInputLaunchApp);
  v2 = (void *)GesturedTextInputLaunchApp__Command;
  GesturedTextInputLaunchApp__Command = v1;

}

+ (VOSCommand)GesturedTextInputNextKeyboardLanguage
{
  if (GesturedTextInputNextKeyboardLanguage_onceToken != -1)
    dispatch_once(&GesturedTextInputNextKeyboardLanguage_onceToken, &__block_literal_global_773);
  return (VOSCommand *)(id)GesturedTextInputNextKeyboardLanguage__Command;
}

void __51__VOSCommand_GesturedTextInputNextKeyboardLanguage__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputNextKeyboardLanguage"), kVOTEventCommandGesturedTextInputNextKeyboardLanguage);
  v2 = (void *)GesturedTextInputNextKeyboardLanguage__Command;
  GesturedTextInputNextKeyboardLanguage__Command = v1;

}

+ (VOSCommand)GesturedTextInputNextBrailleTable
{
  if (GesturedTextInputNextBrailleTable_onceToken != -1)
    dispatch_once(&GesturedTextInputNextBrailleTable_onceToken, &__block_literal_global_776);
  return (VOSCommand *)(id)GesturedTextInputNextBrailleTable__Command;
}

void __47__VOSCommand_GesturedTextInputNextBrailleTable__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("GesturedTextInputNextBrailleTable"), kVOTEventCommandGesturedTextInputNextBrailleTable);
  v2 = (void *)GesturedTextInputNextBrailleTable__Command;
  GesturedTextInputNextBrailleTable__Command = v1;

}

+ (VOSCommand)DescribeCameraScene
{
  if (DescribeCameraScene_onceToken != -1)
    dispatch_once(&DescribeCameraScene_onceToken, &__block_literal_global_779);
  return (VOSCommand *)(id)DescribeCameraScene__Command;
}

void __33__VOSCommand_DescribeCameraScene__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("DescribeCameraScene"), kVOTEventCommandDescribeCameraScene);
  v2 = (void *)DescribeCameraScene__Command;
  DescribeCameraScene__Command = v1;

}

+ (VOSCommand)MoveIn
{
  if (MoveIn_onceToken != -1)
    dispatch_once(&MoveIn_onceToken, &__block_literal_global_782);
  return (VOSCommand *)(id)MoveIn__Command;
}

void __20__VOSCommand_MoveIn__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveIn"), kVOTEventCommandMoveIn);
  v2 = (void *)MoveIn__Command;
  MoveIn__Command = v1;

}

+ (VOSCommand)MoveOut
{
  if (MoveOut_onceToken != -1)
    dispatch_once(&MoveOut_onceToken, &__block_literal_global_785);
  return (VOSCommand *)(id)MoveOut__Command;
}

void __21__VOSCommand_MoveOut__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("MoveOut"), kVOTEventCommandMoveOut);
  v2 = (void *)MoveOut__Command;
  MoveOut__Command = v1;

}

+ (VOSCommand)ToggleSettingsHUD
{
  if (ToggleSettingsHUD_onceToken != -1)
    dispatch_once(&ToggleSettingsHUD_onceToken, &__block_literal_global_788);
  return (VOSCommand *)(id)ToggleSettingsHUD__Command;
}

void __31__VOSCommand_ToggleSettingsHUD__block_invoke()
{
  VOSCommand *v0;
  uint64_t v1;
  void *v2;

  v0 = [VOSCommand alloc];
  v1 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:](v0, "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("ToggleSettingsHUD"), kVOTEventCommandToggleSettingsHUD);
  v2 = (void *)ToggleSettingsHUD__Command;
  ToggleSettingsHUD__Command = v1;

}

+ (VOSCommand)Invalid
{
  if (Invalid_onceToken_1 != -1)
    dispatch_once(&Invalid_onceToken_1, &__block_literal_global_791);
  return (VOSCommand *)(id)Invalid__Command;
}

void __21__VOSCommand_Invalid__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSCommand _initBuiltInCommandWithRawValue:votEventCommandName:]([VOSCommand alloc], "_initBuiltInCommandWithRawValue:votEventCommandName:", CFSTR("Invalid"), 0);
  v1 = (void *)Invalid__Command;
  Invalid__Command = (uint64_t)v0;

}

+ (NSSet)allBuiltInCommands
{
  if (allBuiltInCommands_onceToken != -1)
    dispatch_once(&allBuiltInCommands_onceToken, &__block_literal_global_794);
  return (NSSet *)(id)allBuiltInCommands__AllCommands;
}

void __32__VOSCommand_allBuiltInCommands__block_invoke()
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
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;

  v12 = (void *)MEMORY[0x24BDBCF20];
  +[VOSCommand None](VOSCommand, "None");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PrimaryActivate](VOSCommand, "PrimaryActivate");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SecondaryActivate](VOSCommand, "SecondaryActivate");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PerformLongPress](VOSCommand, "PerformLongPress");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousElement](VOSCommand, "MoveToPreviousElement");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextElement](VOSCommand, "MoveToNextElement");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToFirstElement](VOSCommand, "MoveToFirstElement");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToFirstWord](VOSCommand, "MoveToFirstWord");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToLastElement](VOSCommand, "MoveToLastElement");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToCenterElement](VOSCommand, "MoveToCenterElement");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToLastWord](VOSCommand, "MoveToLastWord");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToElementAbove](VOSCommand, "MoveToElementAbove");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToElementBelow](VOSCommand, "MoveToElementBelow");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousElementCommunity](VOSCommand, "MoveToPreviousElementCommunity");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextElementCommunity](VOSCommand, "MoveToNextElementCommunity");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousContainer](VOSCommand, "MoveToPreviousContainer");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextContainer](VOSCommand, "MoveToNextContainer");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToTopOfCurrentContainer](VOSCommand, "MoveToTopOfCurrentContainer");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToBottomOfCurrentContainer](VOSCommand, "MoveToBottomOfCurrentContainer");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToTopOfCurrentDocument](VOSCommand, "MoveToTopOfCurrentDocument");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToBottomOfCurrentDocument](VOSCommand, "MoveToBottomOfCurrentDocument");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousCharacter](VOSCommand, "MoveToPreviousCharacter");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextCharacter](VOSCommand, "MoveToNextCharacter");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousWord](VOSCommand, "MoveToPreviousWord");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextWord](VOSCommand, "MoveToNextWord");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousSentence](VOSCommand, "MoveToPreviousSentence");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextSentence](VOSCommand, "MoveToNextSentence");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousParagraph](VOSCommand, "MoveToPreviousParagraph");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextParagraph](VOSCommand, "MoveToNextParagraph");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToStatusBar](VOSCommand, "MoveToStatusBar");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToLinkedUI](VOSCommand, "MoveToLinkedUI");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToSystemFocusedElement](VOSCommand, "MoveToSystemFocusedElement");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextGraphic](VOSCommand, "MoveToNextGraphic");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousGraphic](VOSCommand, "MoveToPreviousGraphic");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextHeading](VOSCommand, "MoveToNextHeading");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousHeading](VOSCommand, "MoveToPreviousHeading");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextTable](VOSCommand, "MoveToNextTable");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousTable](VOSCommand, "MoveToPreviousTable");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextList](VOSCommand, "MoveToNextList");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousList](VOSCommand, "MoveToPreviousList");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextSameElement](VOSCommand, "MoveToNextSameElement");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousSameElement](VOSCommand, "MoveToPreviousSameElement");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextControl](VOSCommand, "MoveToNextControl");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousControl](VOSCommand, "MoveToPreviousControl");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextLink](VOSCommand, "MoveToNextLink");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousLink](VOSCommand, "MoveToPreviousLink");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextBlockquote](VOSCommand, "MoveToNextBlockquote");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousBlockquote](VOSCommand, "MoveToPreviousBlockquote");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextSameBlockquote](VOSCommand, "MoveToNextSameBlockquote");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousSameBlockquote](VOSCommand, "MoveToPreviousSameBlockquote");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextVisitedLink](VOSCommand, "MoveToNextVisitedLink");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousVisitedLink](VOSCommand, "MoveToPreviousVisitedLink");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextSameHeading](VOSCommand, "MoveToNextSameHeading");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousSameHeading](VOSCommand, "MoveToPreviousSameHeading");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextBoldText](VOSCommand, "MoveToNextBoldText");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousBoldText](VOSCommand, "MoveToPreviousBoldText");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextMisspelledWord](VOSCommand, "MoveToNextMisspelledWord");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousMisspelledWord](VOSCommand, "MoveToPreviousMisspelledWord");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextPlainText](VOSCommand, "MoveToNextPlainText");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousPlainText](VOSCommand, "MoveToPreviousPlainText");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextColorChange](VOSCommand, "MoveToNextColorChange");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousColorChange](VOSCommand, "MoveToPreviousColorChange");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextItalicText](VOSCommand, "MoveToNextItalicText");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousItalicText](VOSCommand, "MoveToPreviousItalicText");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextUnderlineText](VOSCommand, "MoveToNextUnderlineText");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousUnderlineText](VOSCommand, "MoveToPreviousUnderlineText");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextDifferentElement](VOSCommand, "MoveToNextDifferentElement");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousDifferentElement](VOSCommand, "MoveToPreviousDifferentElement");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextColumn](VOSCommand, "MoveToNextColumn");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousColumn](VOSCommand, "MoveToPreviousColumn");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextFontChange](VOSCommand, "MoveToNextFontChange");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousFontChange](VOSCommand, "MoveToPreviousFontChange");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextFrame](VOSCommand, "MoveToNextFrame");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousFrame](VOSCommand, "MoveToPreviousFrame");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToNextStyleChange](VOSCommand, "MoveToNextStyleChange");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveToPreviousStyleChange](VOSCommand, "MoveToPreviousStyleChange");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand FindElementWithTextSearch](VOSCommand, "FindElementWithTextSearch");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PreviousSearchResult](VOSCommand, "PreviousSearchResult");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand NextSearchResult](VOSCommand, "NextSearchResult");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Copy](VOSCommand, "Copy");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Cut](VOSCommand, "Cut");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Paste](VOSCommand, "Paste");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Undo](VOSCommand, "Undo");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Redo](VOSCommand, "Redo");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleTextSelection](VOSCommand, "ToggleTextSelection");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SummarizeElement](VOSCommand, "SummarizeElement");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SummarizeSystemFocusedElement](VOSCommand, "SummarizeSystemFocusedElement");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadSystemFocusedElementDetails](VOSCommand, "ReadSystemFocusedElementDetails");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PreviewElementWith3DTouch](VOSCommand, "PreviewElementWith3DTouch");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand AnalyzeElement](VOSCommand, "AnalyzeElement");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadAll](VOSCommand, "ReadAll");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadFromTop](VOSCommand, "ReadFromTop");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadLine](VOSCommand, "ReadLine");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadWord](VOSCommand, "ReadWord");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadHint](VOSCommand, "ReadHint");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadTextStyle](VOSCommand, "ReadTextStyle");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadURL](VOSCommand, "ReadURL");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadSelectedText](VOSCommand, "ReadSelectedText");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadCharacter](VOSCommand, "ReadCharacter");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadCharacterPhonetically](VOSCommand, "ReadCharacterPhonetically");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadRowHeader](VOSCommand, "ReadRowHeader");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadRowContents](VOSCommand, "ReadRowContents");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadTableRowColumn](VOSCommand, "ReadTableRowColumn");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadColumnHeader](VOSCommand, "ReadColumnHeader");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadColumnContents](VOSCommand, "ReadColumnContents");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadTableRowColumnCell](VOSCommand, "ReadTableRowColumnCell");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ReadLineCount](VOSCommand, "ReadLineCount");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSpeech](VOSCommand, "ToggleSpeech");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleMute](VOSCommand, "ToggleMute");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleScreenCurtain](VOSCommand, "ToggleScreenCurtain");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSoundCurtain](VOSCommand, "ToggleSoundCurtain");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ShowItemChooser](VOSCommand, "ShowItemChooser");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand OpenVoiceOverSettings](VOSCommand, "OpenVoiceOverSettings");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand StartHelp](VOSCommand, "StartHelp");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MagicTap](VOSCommand, "MagicTap");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand Escape](VOSCommand, "Escape");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollUp](VOSCommand, "ScrollUp");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollDown](VOSCommand, "ScrollDown");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollLeft](VOSCommand, "ScrollLeft");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollRight](VOSCommand, "ScrollRight");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollToTop](VOSCommand, "ScrollToTop");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ScrollToBottom](VOSCommand, "ScrollToBottom");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PreviousRotor](VOSCommand, "PreviousRotor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand NextRotor](VOSCommand, "NextRotor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PreviousRotorItem](VOSCommand, "PreviousRotorItem");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand NextRotorItem](VOSCommand, "NextRotorItem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand CopySpeechToClipboard](VOSCommand, "CopySpeechToClipboard");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleCaptionPanel](VOSCommand, "ToggleCaptionPanel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand LabelElement](VOSCommand, "LabelElement");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand DescribeImage](VOSCommand, "DescribeImage");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand LaunchPeopleDetection](VOSCommand, "LaunchPeopleDetection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MonitorElement](VOSCommand, "MonitorElement");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateBrailleScreenInput](VOSCommand, "ActivateBrailleScreenInput");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateBrailleScreenInputCommand](VOSCommand, "ActivateBrailleScreenInputCommand");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSingleLetterQuickNav](VOSCommand, "ToggleSingleLetterQuickNav");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleQuickNav](VOSCommand, "ToggleQuickNav");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleLockModifierKeys](VOSCommand, "ToggleLockModifierKeys");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ChangeAudioDuckingMode](VOSCommand, "ChangeAudioDuckingMode");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleNavigationStyle](VOSCommand, "ToggleNavigationStyle");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSyncNativeAndExploreFocus](VOSCommand, "ToggleSyncNativeAndExploreFocus");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleAutomaticAccessibility](VOSCommand, "ToggleAutomaticAccessibility");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand VolumeUp](VOSCommand, "VolumeUp");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand VolumeDown](VOSCommand, "VolumeDown");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleLiveRegions](VOSCommand, "ToggleLiveRegions");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ShowNotificationCenter](VOSCommand, "ShowNotificationCenter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ShowControlCenter](VOSCommand, "ShowControlCenter");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateSpeakScreen](VOSCommand, "ActivateSpeakScreen");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateHomeButton](VOSCommand, "ActivateHomeButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleDock](VOSCommand, "ToggleDock");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleAppSwitcher](VOSCommand, "ToggleAppSwitcher");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateLockButton](VOSCommand, "ActivateLockButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ShowSpotlight](VOSCommand, "ShowSpotlight");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ActivateAccessibilityShortcut](VOSCommand, "ActivateAccessibilityShortcut");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleReachability](VOSCommand, "ToggleReachability");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand TakeScreenshot](VOSCommand, "TakeScreenshot");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SwitchToPreviousApp](VOSCommand, "SwitchToPreviousApp");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand SwitchToNextApp](VOSCommand, "SwitchToNextApp");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleQuickNote](VOSCommand, "ToggleQuickNote");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand PreviousHandwritingCharacterMode](VOSCommand, "PreviousHandwritingCharacterMode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand NextHandwritingCharacterMode](VOSCommand, "NextHandwritingCharacterMode");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand AnnounceHandwritingCharacterMode](VOSCommand, "AnnounceHandwritingCharacterMode");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIPreviousBrailleMode](VOSCommand, "BSIPreviousBrailleMode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSINextBrailleMode](VOSCommand, "BSINextBrailleMode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIPreviousUsage](VOSCommand, "BSIPreviousUsage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSINextUsage](VOSCommand, "BSINextUsage");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSITranslateImmediately](VOSCommand, "BSITranslateImmediately");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIOrientationLock](VOSCommand, "BSIOrientationLock");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIQuickAction](VOSCommand, "BSIQuickAction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIExit](VOSCommand, "BSIExit");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIPreviousRotor](VOSCommand, "BSIPreviousRotor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSINextRotor](VOSCommand, "BSINextRotor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIEscape](VOSCommand, "BSIEscape");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIPreviousTextSegment](VOSCommand, "BSIPreviousTextSegment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSINextTextSegment](VOSCommand, "BSINextTextSegment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSISelectPreviousTextSegment](VOSCommand, "BSISelectPreviousTextSegment");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSISelectNextTextSegment](VOSCommand, "BSISelectNextTextSegment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSIPreviousTextSegmentType](VOSCommand, "BSIPreviousTextSegmentType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BSINextTextSegmentType](VOSCommand, "BSINextTextSegmentType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BraillePanLeft](VOSCommand, "BraillePanLeft");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BraillePanRight](VOSCommand, "BraillePanRight");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleNextInputTable](VOSCommand, "BrailleNextInputTable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleNextOutputTable](VOSCommand, "BrailleNextOutputTable");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleAnnouncementMode](VOSCommand, "BrailleAnnouncementMode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleTranslate](VOSCommand, "BrailleTranslate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleToggleWordWrap](VOSCommand, "BrailleToggleWordWrap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleTranslateToClipboard](VOSCommand, "BrailleTranslateToClipboard");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleEnableAutoAdvance](VOSCommand, "BrailleEnableAutoAdvance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleIncreaseAutoAdvance](VOSCommand, "BrailleIncreaseAutoAdvance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleDecreaseAutoAdvance](VOSCommand, "BrailleDecreaseAutoAdvance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand BrailleReconnectBrailleDisplays](VOSCommand, "BrailleReconnectBrailleDisplays");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputInsertSpace](VOSCommand, "GesturedTextInputInsertSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputBackspace](VOSCommand, "GesturedTextInputBackspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputDeleteWord](VOSCommand, "GesturedTextInputDeleteWord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputPerformReturnEquivalent](VOSCommand, "GesturedTextInputPerformReturnEquivalent");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputPreviousSuggestion](VOSCommand, "GesturedTextInputPreviousSuggestion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputNextSuggestion](VOSCommand, "GesturedTextInputNextSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputLaunchApp](VOSCommand, "GesturedTextInputLaunchApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputNextKeyboardLanguage](VOSCommand, "GesturedTextInputNextKeyboardLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand GesturedTextInputNextBrailleTable](VOSCommand, "GesturedTextInputNextBrailleTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand DescribeCameraScene](VOSCommand, "DescribeCameraScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand ToggleSettingsHUD](VOSCommand, "ToggleSettingsHUD");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveIn](VOSCommand, "MoveIn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSCommand MoveOut](VOSCommand, "MoveOut");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObjects:", v205, v204, v203, v202, v201, v200, v199, v198, v197, v196, v195, v194, v193, v192, v191, v190, v189,
    v188,
    v187,
    v186,
    v185,
    v184,
    v183,
    v182,
    v181,
    v180,
    v179,
    v178,
    v177,
    v176,
    v175,
    v174,
    v173,
    v172,
    v171,
    v170,
    v169,
    v168,
    v167,
    v166,
    v165,
    v164,
    v163,
    v162,
    v161,
    v160,
    v159,
    v158,
    v157,
    v156,
    v155,
    v154,
    v153,
    v152,
    v151,
    v150,
    v149,
    v148,
    v147,
    v146,
    v145);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)allBuiltInCommands__AllCommands;
  allBuiltInCommands__AllCommands = v9;

}

+ (id)builtInCommandWithStringValue:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id *i;
  id *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allBuiltInCommands", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9[1], "isEqualToString:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)commandForVOSEventCommand:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    +[VOSCommand allBuiltInCommands](VOSCommand, "allBuiltInCommands", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "votEventCommandName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", v3);

          if ((v10 & 1) != 0)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[VOSCommand commandType](self, "commandType") || objc_msgSend(v5, "commandType"))
    {
      if (-[VOSCommand commandType](self, "commandType") != 1 || objc_msgSend(v5, "commandType") != 1)
      {
        v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      -[VOSCommand siriShortcut](self, "siriShortcut");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriShortcut");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqual:", v9);

    }
    else
    {
      -[VOSCommand rawValue](self, "rawValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rawValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v7);
    }

    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = -[VOSCommand commandType](self, "commandType");
  if (v3 == 1)
  {
    -[VOSCommand siriShortcut](self, "siriShortcut");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hash");

  }
  else
  {
    if (v3)
      return 0;
    -[VOSCommand rawValue](self, "rawValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
  }

  return v5;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (AXSiriShortcut)siriShortcut
{
  return self->_siriShortcut;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;
  int64_t commandType;
  void *v7;

  if (!-[NSString hasPrefix:](self->_rawValue, "hasPrefix:", CFSTR("Braille"))
    || (v3 = (void *)objc_opt_new(),
        -[VOSCommand votEventCommandName](self, "votEventCommandName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "localizedNameForCommand:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    commandType = self->_commandType;
    if (commandType == 1)
    {
      -[AXSiriShortcut shortcutName](self->_siriShortcut, "shortcutName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (commandType)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VOSCommand.%@"), self->_rawValue);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      VOSLocString(v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v5;
}

- (NSString)votEventCommandName
{
  return self->_votEventCommandName;
}

- (void)setVotEventCommandName:(id)a3
{
  objc_storeStrong((id *)&self->_votEventCommandName, a3);
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int64_t)a3
{
  self->_commandType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_votEventCommandName, 0);
  objc_storeStrong((id *)&self->_siriShortcut, 0);
  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end
