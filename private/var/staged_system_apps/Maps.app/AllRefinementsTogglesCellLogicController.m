@implementation AllRefinementsTogglesCellLogicController

- (void)toggleValueDidChange:(id)a3 newValue:(BOOL)a4 selectionSequenceNumber:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "setIsSelected:", v5);
  objc_msgSend(v8, "setSelectionSequenceNumber:", v7);

}

@end
